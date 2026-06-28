<?php
require_once BASE_PATH . "modules/subscriptionmanager/pages/SubscriptionManagerAdminPage.class.php";

class SubscriptionManagerSubscriptionsPage extends SubscriptionManagerAdminPage {
	function action( $action_name ) {
		switch ( $action_name ) {
			case "subscriptionmanager_subscription_create":
				$this->createSubscription();
				break;
			default:
				parent::action( $action_name );
		}
	}

	function init() {
		parent::init();
		$this->smarty->assign( "plans", $this->rows(
				"select p.id, p.name, pr.id as priceid, pr.billing_cycle, pr.amount " .
				"from subscriptionmanager_plan p join subscriptionmanager_price pr on pr.planid = p.id " .
				"where p.status='active' order by p.name" ) );
		$this->smarty->assign( "subscriptions", $this->rows(
				"select s.*, p.name as planname, pr.billing_cycle, pr.amount " .
				"from subscriptionmanager_subscription s " .
				"left join subscriptionmanager_plan p on p.id=s.planid " .
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
}
?>
