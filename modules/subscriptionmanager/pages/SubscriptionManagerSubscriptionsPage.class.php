<?php
require_once BASE_PATH . "modules/subscriptionmanager/pages/SubscriptionManagerAdminPage.class.php";

class SubscriptionManagerSubscriptionsPage extends SubscriptionManagerAdminPage {
	function action( $action_name ) {
		switch ( $action_name ) {
			case "subscriptionmanager_subscription_create":
				$this->createSubscription();
				break;
			case "subscriptionmanager_subscription_update":
				$this->updateSubscription();
				break;
			case "subscriptionmanager_subscription_delete":
				$this->deleteSubscription();
				break;
			default:
				parent::action( $action_name );
		}
	}

	function init() {
		parent::init();
		$this->smarty->assign( "accounts", $this->rows(
				"select id, case when type='Individual Account' then contactname else businessname end as account_name, " .
				"contactname, businessname from account order by account_name, id" ) );
		$this->smarty->assign( "planChoices", $this->rows(
				"select id, name from subscriptionmanager_plan where status = 'active' order by name, id" ) );
		$this->smarty->assign( "plans", $this->rows(
				"select p.id, p.name, pr.id as priceid, pr.billing_cycle, pr.amount " .
				"from subscriptionmanager_plan p join subscriptionmanager_price pr on pr.planid = p.id " .
				"where p.status='active' order by p.name" ) );
		$this->smarty->assign( "subscriptions", $this->rows(
				"select s.*, p.name as planname, pr.billing_cycle, pr.amount, " .
				"case when a.type='Individual Account' then a.contactname else a.businessname end as account_name " .
				"from subscriptionmanager_subscription s " .
				"left join subscriptionmanager_plan p on p.id=s.planid " .
				"left join account a on a.id=s.accountid " .
				"left join subscriptionmanager_price pr on pr.id=s.priceid order by s.id desc" ) );
	}

	function createSubscription() {
		$DB = $this->db();
		$price = $this->row( "select * from subscriptionmanager_price where id=" . intval( $this->post['priceid'] ) );
		if ( !$price ) {
			throw new SWUserException( "Subscription price was not found." );
		}

		$start = $this->dateValue( $this->post['start_date'] );
		$periodEnd = $this->service()->nextCycleDate( $start, $price['billing_cycle'], $price['cycle_interval'] );
		$trialEnd = intval( $price['trial_days'] ) > 0 ?
				date( "Y-m-d", strtotime( "+" . intval( $price['trial_days'] ) . " day", strtotime( $start ) ) ) :
				null;
		$nextBillingDate = $trialEnd ? $trialEnd : $start;
		$now = DBConnection::format_datetime( time() );

		$sql = $DB->build_insert_sql( "subscriptionmanager_subscription",
				array( "accountid" => intval( $this->post['accountid'] ),
				"planid" => intval( $this->post['planid'] ),
				"priceid" => intval( $this->post['priceid'] ),
				"status" => $trialEnd ? "trialing" : $this->post['status'],
				"quantity" => intval( $this->post['quantity'] ),
				"current_period_start" => $this->datetimeValue( $start ),
				"current_period_end" => $this->datetimeValue( $periodEnd ),
				"trial_end" => $trialEnd ? $this->datetimeValue( $trialEnd ) : null,
				"intro_cycles_remaining" => intval( $price['intro_cycles'] ),
				"nextbillingdate" => $this->dateValue( $nextBillingDate ),
				"created" => $now,
				"updated" => $now ) );
		$this->execute( $sql );

		$this->setMessage( array( "type" => "[SUBSCRIPTION_MANAGER_SUBSCRIPTION_CREATED]" ) );
		$this->reload();
	}

	function updateSubscription() {
		$DB = $this->db();
		$subscriptionID = intval( $this->post['subscriptionid'] );
		$planID = intval( $this->post['planid'] );
		$priceID = intval( $this->post['priceid'] );

		$price = $this->row(
				"select id from subscriptionmanager_price where id = " . $priceID .
				" and planid = " . $planID );
		if ( !$price ) {
			throw new SWUserException( "Subscription price was not found for this plan." );
		}

		$nextBillingDate = strlen( trim( $this->post['nextbillingdate'] ) ) ?
				$this->dateValue( $this->post['nextbillingdate'] ) : null;

		$this->execute( $DB->build_update_sql( "subscriptionmanager_subscription",
				"id = " . $subscriptionID,
				array( "accountid" => intval( $this->post['accountid'] ),
				"planid" => $planID,
				"priceid" => $priceID,
				"status" => $this->post['status'],
				"quantity" => intval( $this->post['quantity'] ),
				"current_period_start" => $this->datetimeValue( $this->post['current_period_start'] ),
				"current_period_end" => $this->datetimeValue( $this->post['current_period_end'] ),
				"nextbillingdate" => $nextBillingDate,
				"updated" => DBConnection::format_datetime( time() ) ) ) );
		$this->setMessage( array( "type" => "Subscription updated." ) );
		$this->reload();
	}

	function deleteSubscription() {
		$DB = $this->db();
		$subscriptionID = intval( $this->post['subscriptionid'] );
		$this->execute( $DB->build_delete_sql( "subscriptionmanager_usage",
				"subscriptionid = " . $subscriptionID ) );
		$this->execute( $DB->build_delete_sql( "subscriptionmanager_dunning_attempt",
				"subscriptionid = " . $subscriptionID ) );
		$this->execute( $DB->build_delete_sql( "subscriptionmanager_change",
				"subscriptionid = " . $subscriptionID ) );
		$this->execute( $DB->build_delete_sql( "subscriptionmanager_discount",
				"subscriptionid = " . $subscriptionID ) );
		$this->execute( $DB->build_delete_sql( "subscriptionmanager_subscription",
				"id = " . $subscriptionID ) );
		$this->setMessage( array( "type" => "Subscription deleted." ) );
		$this->reload();
	}
}
?>
