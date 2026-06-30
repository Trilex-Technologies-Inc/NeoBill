<?php
require_once BASE_PATH . "modules/subscriptionmanager/pages/SubscriptionManagerAdminPage.class.php";

class SubscriptionManagerPlansPage extends SubscriptionManagerAdminPage {
	function action( $action_name ) {
		switch ( $action_name ) {
			case "subscriptionmanager_plan_create":
				$this->createPlan();
				break;
			case "subscriptionmanager_plan_update":
				$this->updatePlan();
				break;
			case "subscriptionmanager_plan_delete":
				$this->deletePlan();
				break;
			default:
				parent::action( $action_name );
		}
	}

	function init() {
		parent::init();
		$this->smarty->assign( "plans", $this->rows(
				"select p.*, pr.id as priceid, pr.billing_type, pr.billing_cycle, pr.cycle_interval, " .
				"pr.amount, pr.included_quantity, pr.unit_amount, pr.trial_days, pr.intro_amount, " .
				"pr.intro_cycles, pr.taxable from subscriptionmanager_plan p " .
				"left join subscriptionmanager_price pr on pr.planid = p.id order by p.id desc" ) );
	}

	function createPlan() {
		$DB = $this->db();
		$now = DBConnection::format_datetime( time() );
		$planSql = $DB->build_insert_sql( "subscriptionmanager_plan",
				array( "name" => $this->post['name'],
				"description" => $this->post['description'],
				"status" => "active",
				"created" => $now ) );
		$planID = $this->execute( $planSql );

		$introAmount = strlen( trim( $this->post['intro_amount'] ) ) ?
				$this->post['intro_amount'] : null;
		$priceSql = $DB->build_insert_sql( "subscriptionmanager_price",
				array( "planid" => intval( $planID ),
				"billing_type" => $this->post['billing_type'],
				"billing_cycle" => $this->post['billing_cycle'],
				"cycle_interval" => intval( $this->post['cycle_interval'] ),
				"amount" => $this->post['amount'],
				"included_quantity" => $this->post['included_quantity'],
				"unit_amount" => $this->post['unit_amount'],
				"trial_days" => intval( $this->post['trial_days'] ),
				"intro_amount" => $introAmount,
				"intro_cycles" => intval( $this->post['intro_cycles'] ),
				"taxable" => $this->post['taxable'] ) );
		$this->execute( $priceSql );

		$this->setMessage( array( "type" => "[SUBSCRIPTION_MANAGER_PLAN_CREATED]" ) );
		$this->reload();
	}

	function updatePlan() {
		$DB = $this->db();
		$planID = intval( $this->post['planid'] );
		$priceID = intval( $this->post['priceid'] );

		$this->execute( $DB->build_update_sql( "subscriptionmanager_plan",
				"id = " . $planID,
				array( "name" => $this->post['name'],
				"description" => $this->post['description'],
				"status" => $this->post['status'] ) ) );

		$introAmount = strlen( trim( $this->post['intro_amount'] ) ) ?
				$this->post['intro_amount'] : null;
		$this->execute( $DB->build_update_sql( "subscriptionmanager_price",
				"id = " . $priceID . " and planid = " . $planID,
				array( "billing_type" => $this->post['billing_type'],
				"billing_cycle" => $this->post['billing_cycle'],
				"cycle_interval" => intval( $this->post['cycle_interval'] ),
				"amount" => $this->post['amount'],
				"included_quantity" => $this->post['included_quantity'],
				"unit_amount" => $this->post['unit_amount'],
				"trial_days" => intval( $this->post['trial_days'] ),
				"intro_amount" => $introAmount,
				"intro_cycles" => intval( $this->post['intro_cycles'] ),
				"taxable" => $this->post['taxable'] ) ) );

		$this->setMessage( array( "type" => "[SUBSCRIPTION_MANAGER_PLAN_UPDATED]" ) );
		$this->reload();
	}

	function deletePlan() {
		$DB = $this->db();
		$planID = intval( $this->post['planid'] );

		$subscriptions = $this->row( "select count(*) as total from subscriptionmanager_subscription " .
				"where planid = " . $planID );
		if ( $subscriptions && intval( $subscriptions['total'] ) > 0 ) {
			throw new SWUserException( "[SUBSCRIPTION_MANAGER_PLAN_DELETE_IN_USE]" );
		}

		$this->execute( $DB->build_delete_sql( "subscriptionmanager_price", "planid = " . $planID ) );
		$this->execute( $DB->build_delete_sql( "subscriptionmanager_plan", "id = " . $planID ) );

		$this->setMessage( array( "type" => "[SUBSCRIPTION_MANAGER_PLAN_DELETED]" ) );
		$this->reload();
	}
}
?>
