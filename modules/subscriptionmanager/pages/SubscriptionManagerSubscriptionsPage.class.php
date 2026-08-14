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
			case "subscriptionmanager_subscription_product_map_create":
				$this->createProductMap();
				break;
			case "subscriptionmanager_subscription_product_map_update":
				$this->updateProductMap();
				break;
			case "subscriptionmanager_subscription_product_map_delete":
				$this->deleteProductMap();
				break;
			default:
				parent::action( $action_name );
		}
	}

	function init() {
		parent::init();
		$this->ensureProductMapTable();
		$this->smarty->assign( "accounts", $this->rows(
				"select id, case when type='Individual Account' then contactname else businessname end as account_name, " .
				"contactname, businessname from account order by account_name, id" ) );
		$this->smarty->assign( "products", $this->rows(
				"select id, name from product order by name" ) );
		$this->smarty->assign( "planChoices", $this->rows(
				"select id, name from subscriptionmanager_plan where status = 'active' order by name, id" ) );
		$this->smarty->assign( "priceChoices", $this->rows(
				"select p.id as planid, p.name as plan_name, pr.id as priceid, " .
				"pr.billing_cycle, pr.amount from subscriptionmanager_plan p " .
				"join subscriptionmanager_price pr on pr.planid = p.id " .
				"where p.status = 'active' order by p.name, pr.billing_cycle, pr.id" ) );
		$this->smarty->assign( "plans", $this->rows(
				"select p.id, p.name, pr.id as priceid, pr.billing_cycle, pr.amount " .
				"from subscriptionmanager_plan p join subscriptionmanager_price pr on pr.planid = p.id " .
				"where p.status='active' order by p.name" ) );
		$this->smarty->assign( "productMaps", $this->productMaps() );
		$this->smarty->assign( "subscriptions", $this->rows(
				"select s.*, p.name as planname, pr.billing_cycle, pr.amount, " .
				"case when a.type='Individual Account' then a.contactname else a.businessname end as account_name " .
				"from subscriptionmanager_subscription s " .
				"left join subscriptionmanager_plan p on p.id=s.planid " .
				"left join account a on a.id=s.accountid " .
				"left join subscriptionmanager_price pr on pr.id=s.priceid order by s.id desc" ) );
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

	function tableExists( $table ) {
		$row = $this->row( "show tables like " . $this->quote( $table ) );
		return $row ? true : false;
	}

	function productMaps() {
		$inventoryFields = "null as inventory_items";
		$inventoryJoin = "";
		if ( $this->tableExists( "inventorymanager_product_map" ) && $this->tableExists( "inventorymanager_item" ) ) {
			$inventoryFields = "inv.inventory_items";
			$inventoryJoin = "left join (" .
					"select im.productid, group_concat(concat('#', im.itemid, ' ', ii.sku, ' ', ii.name, ' x', im.quantity) separator ', ') as inventory_items " .
					"from inventorymanager_product_map im " .
					"left join inventorymanager_item ii on ii.id = im.itemid " .
					"group by im.productid" .
					") inv on inv.productid = m.productid ";
		}

		return $this->rows(
				"select m.*, p.name as product_name, sp.name as plan_name, pr.billing_cycle, pr.amount, " .
				$inventoryFields . " " .
				"from subscriptionmanager_product_map m " .
				"left join product p on p.id = m.productid " .
				"left join subscriptionmanager_plan sp on sp.id = m.planid " .
				"left join subscriptionmanager_price pr on pr.id = m.priceid " .
				$inventoryJoin .
				"order by m.id desc" );
	}

	function createSubscription() {
		$DB = $this->db();
		$price = $this->row( "select * from subscriptionmanager_price where id=" . intval( $this->post['priceid'] ) .
				" and planid=" . intval( $this->post['planid'] ) );
		if ( !$price ) {
			throw new SWUserException( "Subscription price was not found." );
		}

		$account = $this->row( "select id from account where id=" . intval( $this->post['accountid'] ) );
		if ( !$account || intval( $this->post['quantity'] ) < 1 ) {
			throw new SWUserException( "A valid account and positive quantity are required." );
		}
		$orderStart = $this->dateValue( $this->post['start_date'] );
		$trialEnd = intval( $price['trial_days'] ) > 0 ?
				date( "Y-m-d", strtotime( "+" . intval( $price['trial_days'] ) . " day", strtotime( $orderStart ) ) ) :
				null;
		$start = $trialEnd ? $trialEnd : $orderStart;
		$periodEnd = $this->service()->nextCycleDate( $start, $price['billing_cycle'], $price['cycle_interval'] );
		$nextBillingDate = $start;
		$now = DBConnection::format_datetime( time() );

		$subscription = array( "accountid" => intval( $this->post['accountid'] ),
				"planid" => intval( $this->post['planid'] ),
				"priceid" => intval( $this->post['priceid'] ),
				"status" => $trialEnd ? "trialing" : $this->post['status'],
				"quantity" => intval( $this->post['quantity'] ),
				"current_period_start" => $this->datetimeValue( $start ),
				"current_period_end" => $this->datetimeValue( $periodEnd ),
					"intro_cycles_remaining" => intval( $price['intro_cycles'] ),
					"billing_type" => $price['billing_type'],
					"billing_cycle" => $price['billing_cycle'],
					"cycle_interval" => intval( $price['cycle_interval'] ),
					"amount" => $price['amount'],
					"included_quantity" => $price['included_quantity'],
					"unit_amount" => $price['unit_amount'],
					"taxable" => $price['taxable'],
				"nextbillingdate" => $this->dateValue( $nextBillingDate ),
				"created" => $now,
				"updated" => $now );

		if ( $trialEnd ) {
			$subscription['trial_end'] = $this->datetimeValue( $trialEnd );
		}
		if ( $price['intro_amount'] !== null ) {
			$subscription['intro_amount'] = $price['intro_amount'];
		}

		$sql = $DB->build_insert_sql( "subscriptionmanager_subscription", $subscription );
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
				"select * from subscriptionmanager_price where id = " . $priceID .
				" and planid = " . $planID );
		if ( !$price ) {
			throw new SWUserException( "Subscription price was not found for this plan." );
		}
		if ( intval( $this->post['quantity'] ) < 1 ) {
			throw new SWUserException( "Subscription quantity must be at least one." );
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
					"billing_type" => $price['billing_type'],
					"billing_cycle" => $price['billing_cycle'],
					"cycle_interval" => intval( $price['cycle_interval'] ),
					"amount" => $price['amount'],
					"included_quantity" => $price['included_quantity'],
					"unit_amount" => $price['unit_amount'],
					"intro_amount" => $price['intro_amount'],
					"taxable" => $price['taxable'],
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
		$this->execute( $DB->build_delete_sql( "subscriptionmanager_billing_period",
				"subscriptionid = " . $subscriptionID ) );
		$this->execute( $DB->build_delete_sql( "subscriptionmanager_subscription",
				"id = " . $subscriptionID ) );
		$this->setMessage( array( "type" => "Subscription deleted." ) );
		$this->reload();
	}

	function createProductMap() {
		$DB = $this->db();
		$productID = intval( $this->post['productid'] );
		$planID = intval( $this->post['planid'] );
		$priceID = intval( $this->post['priceid'] );
		if ( intval( $this->post['quantity'] ) < 1 ) {
			throw new SWUserException( "Subscription mapping quantity must be at least one." );
		}

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

	function updateProductMap() {
		$DB = $this->db();
		$mapID = intval( $this->post['mapid'] );
		$productID = intval( $this->post['productid'] );
		$planID = intval( $this->post['planid'] );
		$priceID = intval( $this->post['priceid'] );
		if ( intval( $this->post['quantity'] ) < 1 ) {
			throw new SWUserException( "Subscription mapping quantity must be at least one." );
		}

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

		$this->execute( $DB->build_update_sql( "subscriptionmanager_product_map",
				"id = " . $mapID,
				array( "productid" => $productID,
				"planid" => $planID,
				"priceid" => $priceID,
				"quantity" => intval( $this->post['quantity'] ) ) ) );
		$this->syncProductPrice( $productID, $price );
		$this->setMessage( array( "type" => "Product subscription link updated." ) );
		$this->reload();
	}

	function deleteProductMap() {
		$this->execute( $this->db()->build_delete_sql( "subscriptionmanager_product_map",
				"id = " . intval( $this->post['mapid'] ) ) );
		$this->setMessage( array( "type" => "Product subscription link deleted." ) );
		$this->reload();
	}

	function syncProductPrice( $productID, $price ) {
		$DB = $this->db();
		$type = "Onetime";
		$termLength = 0;
		$checkoutAmount = intval( $price['trial_days'] ) > 0 ? 0.00 :
				( $price['intro_amount'] !== null && intval( $price['intro_cycles'] ) > 0 ?
				$price['intro_amount'] : $price['amount'] );

		$exists = $this->row(
				"select productid from productprice where productid = " . intval( $productID ) .
				" and type = " . $this->quote( $type ) .
				" and termlength = " . intval( $termLength ) );
		if ( $exists ) {
			$sql = $DB->build_update_sql( "productprice",
					"productid = " . intval( $productID ) .
					" and type = " . $this->quote( $type ) .
					" and termlength = " . intval( $termLength ),
					array( "price" => $checkoutAmount,
					"taxable" => $price['taxable'] ) );
		}
		else {
			$sql = $DB->build_insert_sql( "productprice",
					array( "productid" => intval( $productID ),
					"type" => $type,
					"termlength" => $termLength,
					"price" => $checkoutAmount,
					"taxable" => $price['taxable'] ) );
		}
		$this->execute( $sql );
	}
}
?>
