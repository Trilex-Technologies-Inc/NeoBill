<?php
/**
 * Public order page for subscription plan purchases.
 */

require_once dirname(__FILE__) . '/../../config/config.inc.php';
require_once BASE_PATH . "include/SolidStatePage.class.php";

class PurchaseSubscriptionPage extends SolidStatePage {
	public function action( $action_name ) {
		switch ( $action_name ) {
			case "purchasesubscription":
				if ( isset( $this->post['continue'] ) ) {
					$this->process();
				}
				elseif ( isset( $this->post['cancel'] ) ) {
					$this->goback();
				}
				break;

			default:
				parent::action( $action_name );
				break;
		}
	}

	public function init() {
		parent::init();

		if ( !isset( $_SESSION['order'] ) ) {
			$_SESSION['order'] = new OrderDBO();
		}

		$options = $this->subscriptionOptions();
		if ( empty( $options ) ) {
			throw new SWUserException( "There are no active subscription plans configured." );
		}

		$selectedPriceID = isset( $this->post['priceid'] ) ? intval( $this->post['priceid'] ) : intval( $options[0]['priceid'] );

		$this->smarty->assign( "orderDBO", $_SESSION['order'] );
		$this->smarty->assign( "subscriptionOptions", $options );
		$this->smarty->assign( "selectedPriceID", $selectedPriceID );
	}

	protected function db() {
		return DBConnection::getDBConnection();
	}

	protected function query( $sql ) {
		$DB = $this->db();
		if ( !( $result = mysql_query( $sql, $DB->handle() ) ) ) {
			throw new DBException( mysql_error( $DB->handle() ) );
		}
		return $result;
	}

	protected function row( $sql ) {
		$result = $this->query( $sql );
		return mysql_fetch_assoc( $result );
	}

	protected function execute( $sql ) {
		$DB = $this->db();
		if ( !mysql_query( $sql, $DB->handle() ) ) {
			throw new DBException( mysql_error( $DB->handle() ) );
		}
		return mysql_insert_id( $DB->handle() );
	}

	protected function rows( $sql ) {
		$result = $this->query( $sql );
		$rows = array();
		while ( $row = mysql_fetch_assoc( $result ) ) {
			$rows[] = $row;
		}
		return $rows;
	}

	protected function tableExists( $table ) {
		$DB = $this->db();
		$result = $this->query( "show tables like " . $DB->quote_smart( $table ) );
		return mysql_num_rows( $result ) > 0;
	}

	protected function subscriptionOptions() {
		if ( !$this->tableExists( "subscriptionmanager_plan" ) ||
				!$this->tableExists( "subscriptionmanager_price" ) ) {
			return array();
		}

		return $this->rows(
				"select sp.id as planid, pr.id as priceid, 1 as quantity, " .
				"sp.name as plan_name, sp.description as plan_description, " .
				"pr.billing_type, pr.billing_cycle, pr.cycle_interval, pr.amount, pr.included_quantity, " .
				"pr.unit_amount, pr.trial_days, pr.intro_amount, pr.intro_cycles, pr.taxable " .
				"from subscriptionmanager_plan sp " .
				"join subscriptionmanager_price pr on pr.planid = sp.id " .
				"where sp.status = 'active' " .
				"order by sp.name, pr.billing_cycle, pr.amount" );
	}

	protected function selectedPrice( $priceID ) {
		$row = $this->row(
				"select sp.id as planid, pr.id as priceid, sp.name as plan_name, sp.description as plan_description, " .
				"pr.billing_type, pr.billing_cycle, pr.cycle_interval, pr.amount, pr.included_quantity, " .
				"pr.unit_amount, pr.trial_days, pr.intro_amount, pr.intro_cycles, pr.taxable " .
				"from subscriptionmanager_plan sp " .
				"join subscriptionmanager_price pr on pr.planid = sp.id " .
				"where sp.status = 'active' and pr.id = " . intval( $priceID ) .
				" limit 1" );
		if ( !$row ) {
			throw new SWUserException( "Selected subscription plan was not found." );
		}

		return $row;
	}

	protected function ensureProductMapTable() {
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

	protected function productTerm( $productID ) {
		$row = $this->row(
				"select termlength from productprice where productid = " . intval( $productID ) .
				" and type = 'Recurring' order by termlength asc limit 1" );
		return $row ? intval( $row['termlength'] ) : null;
	}

	protected function ensureBackingProduct( $price ) {
		$this->ensureProductMapTable();

		$map = $this->row(
				"select * from subscriptionmanager_product_map where planid = " . intval( $price['planid'] ) .
				" and priceid = " . intval( $price['priceid'] ) .
				" order by id asc limit 1" );
		if ( $map ) {
			$this->syncProductPrice( intval( $map['productid'] ), $price );
			return intval( $map['productid'] );
		}

		$DB = $this->db();
		$productName = "Subscription - " . $price['plan_name'] . " (" . $price['billing_cycle'] . ")";
		$productID = $this->execute( $DB->build_insert_sql( "product", array(
				"name" => $productName,
				"description" => $price['plan_description'],
				"public" => "No" ) ) );
		if ( $productID === false || intval( $productID ) < 1 ) {
			throw new DBException( "Failed to create subscription product." );
		}

		$this->syncProductPrice( intval( $productID ), $price );
		$this->execute( $DB->build_insert_sql( "subscriptionmanager_product_map", array(
				"productid" => intval( $productID ),
				"planid" => intval( $price['planid'] ),
				"priceid" => intval( $price['priceid'] ),
				"quantity" => 1 ) ) );

		return intval( $productID );
	}

	protected function syncProductPrice( $productID, $price ) {
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
				" and type = " . $DB->quote_smart( $type ) .
				" and termlength = " . intval( $termLength ) );
		if ( $exists ) {
			$sql = $DB->build_update_sql( "productprice",
					"productid = " . intval( $productID ) .
					" and type = " . $DB->quote_smart( $type ) .
					" and termlength = " . intval( $termLength ),
					array( "price" => $price['amount'],
					"taxable" => $price['taxable'] ) );
		}
		else {
			$sql = $DB->build_insert_sql( "productprice", array(
					"productid" => intval( $productID ),
					"type" => $type,
					"termlength" => $termLength,
					"price" => $price['amount'],
					"taxable" => $price['taxable'] ) );
		}
		$this->execute( $sql );
	}

	protected function process() {
		$price = $this->selectedPrice( $this->post['priceid'] );
		$productID = $this->ensureBackingProduct( $price );
		$productDBO = load_ProductDBO( $productID );

		$productItem = new OrderProductDBO();
		$productItem->setPurchasable( $productDBO );
		$productItem->setStatus( "Accepted" );

		$term = $this->productTerm( $productDBO->getID() );
		if ( $term !== null ) {
			$productItem->setTerm( $term );
		}

		$_SESSION['order']->addItem( $productItem );
		$this->gotoPage( "cart" );
	}
}
?>
