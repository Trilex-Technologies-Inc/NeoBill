<?php
require_once BASE_PATH . "modules/subscriptionmanager/pages/SubscriptionManagerAdminPage.class.php";

class SubscriptionManagerDunningPage extends SubscriptionManagerAdminPage {
	function action( $action_name ) {
		switch ( $action_name ) {
			case "subscriptionmanager_schedule_dunning":
				$this->scheduleDunning();
				break;
			default:
				parent::action( $action_name );
		}
	}

	function init() {
		parent::init();
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
}
?>
