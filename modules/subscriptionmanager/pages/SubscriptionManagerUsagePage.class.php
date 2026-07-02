<?php
require_once BASE_PATH . "modules/subscriptionmanager/pages/SubscriptionManagerAdminPage.class.php";

class SubscriptionManagerUsagePage extends SubscriptionManagerAdminPage {
	function action( $action_name ) {
		switch ( $action_name ) {
			case "subscriptionmanager_usage_record":
				$this->recordUsage();
				break;
			default:
				parent::action( $action_name );
		}
	}

	function init() {
		parent::init();
		$this->smarty->assign( "subscriptions", $this->rows(
				"select s.id, s.accountid, p.name as planname, " .
				"case when a.type='Individual Account' then a.contactname else a.businessname end as account_name " .
				"from subscriptionmanager_subscription s " .
				"left join account a on a.id=s.accountid " .
				"left join subscriptionmanager_plan p on p.id=s.planid where s.status in ('trialing','active','past_due') " .
				"order by s.id desc" ) );
		$this->smarty->assign( "usageRecords", $this->rows(
				"select u.*, p.name as planname from subscriptionmanager_usage u " .
				"left join subscriptionmanager_subscription s on s.id=u.subscriptionid " .
				"left join subscriptionmanager_plan p on p.id=s.planid order by u.id desc limit 50" ) );
	}

	function recordUsage() {
		$DB = $this->db();
		$sql = $DB->build_insert_sql( "subscriptionmanager_usage",
				array( "subscriptionid" => intval( $this->post['subscriptionid'] ),
				"usage_date" => $this->datetimeValue( $this->post['usage_date'] ),
				"quantity" => $this->post['quantity'],
				"description" => $this->post['description'] ) );
		$this->execute( $sql );

		$this->setMessage( array( "type" => "[SUBSCRIPTION_MANAGER_USAGE_RECORDED]" ) );
		$this->reload();
	}
}
?>
