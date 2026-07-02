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
			case "subscriptionmanager_product_map_create":
				$this->createProductMap();
				break;
			default:
				parent::action( $action_name );
		}
	}

	function init() {
		parent::init();
		$this->ensureProductMapTable();
		$this->smarty->assign( "plans", $this->rows(
				"select p.*, pr.id as priceid, pr.billing_type, pr.billing_cycle, pr.cycle_interval, " .
				"pr.amount, pr.included_quantity, pr.unit_amount, pr.trial_days, pr.intro_amount, " .
				"pr.intro_cycles, pr.taxable from subscriptionmanager_plan p " .
				"left join subscriptionmanager_price pr on pr.planid = p.id order by p.id desc" ) );
		$this->smarty->assign( "products", $this->rows(
				"select id, name from product order by name" ) );
		$this->smarty->assign( "planChoices", $this->rows(
				"select id, name from subscriptionmanager_plan where status = 'active' order by name, id" ) );
		$this->smarty->assign( "priceChoices", $this->rows(
				"select p.id as planid, p.name as plan_name, pr.id as priceid, " .
				"pr.billing_cycle, pr.amount from subscriptionmanager_plan p " .
				"join subscriptionmanager_price pr on pr.planid = p.id " .
				"where p.status = 'active' order by p.name, pr.billing_cycle, pr.id" ) );
		$this->smarty->assign( "productMaps", $this->rows(
				"select m.*, p.name as product_name, sp.name as plan_name, pr.billing_cycle, pr.amount " .
				"from subscriptionmanager_product_map m " .
				"left join product p on p.id = m.productid " .
				"left join subscriptionmanager_plan sp on sp.id = m.planid " .
				"left join subscriptionmanager_price pr on pr.id = m.priceid " .
				"order by m.id desc" ) );
	}

	function ensureProductMapTable() {
		$this->execute(
				"create table if not exists `subscriptionmanager_product_map` (" .
				"`id` int(11) not null auto_increment," .
				"`productid` int(11) not null default '0'," .
				"`planid` int(11) not null default '0'," .
				"`priceid` int(11) not null default '0'," .
				"`quantity` int(11) not null default '1'," .
				"primary key (`id`)," .
				"unique key `productid` (`productid`)," .
				"key `planid` (`planid`)," .
				"key `priceid` (`priceid`)" .
				") default charset=utf8" );
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

	function createProductMap() {
		$DB = $this->db();
		$productID = intval( $this->post['productid'] );
		$planID = intval( $this->post['planid'] );
		$priceID = intval( $this->post['priceid'] );

		$product = $this->row( "select id from product where id = " . $productID );
		if ( !$product ) {
			throw new SWUserException( "Product was not found." );
		}

		$price = $this->row(
				"select * from subscriptionmanager_price where id = " . $priceID .
				" and planid = " . $planID );
		if ( !$price ) {
			throw new SWUserException( "Subscription price was not found for this plan." );
		}

		$existing = $this->row(
				"select id from subscriptionmanager_product_map where productid = " . $productID );
		if ( $existing ) {
			$sql = $DB->build_update_sql( "subscriptionmanager_product_map",
					"productid = " . $productID,
					array( "planid" => $planID,
					"priceid" => $priceID,
					"quantity" => intval( $this->post['quantity'] ) ) );
		}
		else {
			$sql = $DB->build_insert_sql( "subscriptionmanager_product_map",
					array( "productid" => $productID,
					"planid" => $planID,
					"priceid" => $priceID,
					"quantity" => intval( $this->post['quantity'] ) ) );
		}
		$this->execute( $sql );
		$this->syncProductPrice( $productID, $price );
		$this->setMessage( array( "type" => "Product subscription link saved." ) );
		$this->reload();
	}

	function syncProductPrice( $productID, $price ) {
		$DB = $this->db();
		$type = "Onetime";
		$termLength = 0;

		if ( $price['billing_cycle'] == "monthly" ) {
			$type = "Recurring";
			$termLength = max( 1, intval( $price['cycle_interval'] ) );
		}
		elseif ( $price['billing_cycle'] == "annually" ) {
			$type = "Recurring";
			$termLength = 12 * max( 1, intval( $price['cycle_interval'] ) );
		}

		$exists = $this->row(
				"select productid from productprice where productid = " . intval( $productID ) .
				" and type = " . $this->quote( $type ) .
				" and termlength = " . intval( $termLength ) );
		if ( $exists ) {
			$sql = $DB->build_update_sql( "productprice",
					"productid = " . intval( $productID ) .
					" and type = " . $this->quote( $type ) .
					" and termlength = " . intval( $termLength ),
					array( "price" => $price['amount'],
					"taxable" => $price['taxable'] ) );
		}
		else {
			$sql = $DB->build_insert_sql( "productprice",
					array( "productid" => intval( $productID ),
					"type" => $type,
					"termlength" => $termLength,
					"price" => $price['amount'],
					"taxable" => $price['taxable'] ) );
		}
		$this->execute( $sql );
	}
}
?>
