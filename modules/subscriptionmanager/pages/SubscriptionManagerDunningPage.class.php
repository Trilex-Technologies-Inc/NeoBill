<?php
require_once BASE_PATH . "modules/subscriptionmanager/pages/SubscriptionManagerAdminPage.class.php";

class SubscriptionManagerDunningPage extends SubscriptionManagerAdminPage {
	function action( $action_name ) {
		switch ( $action_name ) {
			case "subscriptionmanager_schedule_dunning":
				$this->scheduleDunning();
				break;
			case "subscriptionmanager_dunning_update":
				$this->updateDunning();
				break;
			case "subscriptionmanager_dunning_delete":
				$this->deleteDunning();
				break;
			default:
				parent::action( $action_name );
		}
	}

	function init() {
		parent::init();
		$this->smarty->assign( "subscriptions", $this->rows(
				"select s.id, s.accountid, s.status, p.name as planname, " .
				"case when a.type='Individual Account' then a.contactname else a.businessname end as account_name " .
				"from subscriptionmanager_subscription s " .
				"left join subscriptionmanager_plan p on p.id=s.planid " .
				"left join account a on a.id=s.accountid " .
				"where s.status in ('trialing','active','past_due') order by s.id desc" ) );
		$this->smarty->assign( "invoices", $this->rows(
				"select i.id, i.accountid, i.date, i.periodend, " .
				"case when a.type='Individual Account' then a.contactname else a.businessname end as account_name " .
				"from invoice i left join account a on a.id=i.accountid order by i.id desc limit 200" ) );
		$this->smarty->assign( "attempts", $this->rows(
				"select d.*, p.name as planname from subscriptionmanager_dunning_attempt d " .
				"left join subscriptionmanager_subscription s on s.id=d.subscriptionid " .
				"left join subscriptionmanager_plan p on p.id=s.planid order by d.scheduled_at asc, d.id desc" ) );
	}

	function scheduleDunning() {
		$DB = $this->db();
		$now = DBConnection::format_datetime( time() );
		$scheduledAt = $this->service()->nextRetryDate( $now, 1 );
		if ( $scheduledAt == null ) {
			$scheduledAt = $now;
		}

		$sql = $DB->build_insert_sql( "subscriptionmanager_dunning_attempt",
				array( "subscriptionid" => intval( $this->post['subscriptionid'] ),
				"invoiceid" => intval( $this->post['invoiceid'] ),
				"attempt_number" => 1,
				"status" => "scheduled",
				"scheduled_at" => $scheduledAt,
				"message" => "Manual dunning schedule" ) );
		$this->execute( $sql );

		$statusSql = $DB->build_update_sql( "subscriptionmanager_subscription",
				"id=" . intval( $this->post['subscriptionid'] ),
				array( "status" => "past_due",
				"updated" => $now ) );
		$this->execute( $statusSql );

		$this->setMessage( array( "type" => "[SUBSCRIPTION_MANAGER_DUNNING_SCHEDULED]" ) );
		$this->reload();
	}

	function updateDunning() {
		$DB = $this->db();
		$this->execute( $DB->build_update_sql( "subscriptionmanager_dunning_attempt",
				"id = " . intval( $this->post['attemptid'] ),
				array( "subscriptionid" => intval( $this->post['subscriptionid'] ),
				"invoiceid" => intval( $this->post['invoiceid'] ),
				"attempt_number" => intval( $this->post['attempt_number'] ),
				"status" => $this->post['status'],
				"scheduled_at" => $this->datetimeValue( $this->post['scheduled_at'] ),
				"message" => $this->post['message'] ) ) );
		$this->setMessage( array( "type" => "Dunning attempt updated." ) );
		$this->reload();
	}

	function deleteDunning() {
		$this->execute( $this->db()->build_delete_sql( "subscriptionmanager_dunning_attempt",
				"id = " . intval( $this->post['attemptid'] ) ) );
		$this->setMessage( array( "type" => "Dunning attempt deleted." ) );
		$this->reload();
	}
}
?>
