<?php
/**
 * Product order bridge.
 *
 * Links normal NeoBill products to optional module-side fulfillment actions.
 */
class ProductOrderBridge {
	function db() {
		return DBConnection::getDBConnection();
	}

	function query( $sql ) {
		$DB = $this->db();
		if ( !( $result = mysql_query( $sql, $DB->handle() ) ) ) {
			throw new DBException( mysql_error( $DB->handle() ) );
		}
		return $result;
	}

	function row( $sql ) {
		$result = $this->query( $sql );
		return mysql_fetch_assoc( $result );
	}

	function quote( $value ) {
		return $this->db()->quote_smart( $value );
	}

	function tableExists( $table ) {
		$result = $this->query( "show tables like " . $this->quote( $table ) );
		return mysql_num_rows( $result ) > 0;
	}

	function fulfillProductOrder( OrderProductDBO $orderItemDBO, AccountDBO $accountDBO, ProductPurchaseDBO $purchaseDBO ) {
		$productID = intval( $orderItemDBO->getProductID() );

		if ( $this->tableExists( "inventorymanager_product_map" ) ) {
			$this->fulfillInventoryMappings( $productID, $purchaseDBO );
		}

		if ( $this->tableExists( "subscriptionmanager_product_map" ) ) {
			$this->fulfillSubscriptionMapping( $productID, $accountDBO, $purchaseDBO );
		}
	}

	function fulfillInventoryMappings( $productID, ProductPurchaseDBO $purchaseDBO ) {
		$serviceFile = BASE_PATH . "modules/inventorymanager/lib/InventoryService.class.php";
		if ( !file_exists( $serviceFile ) ) {
			return;
		}
		require_once $serviceFile;

		$result = $this->query(
				"select * from inventorymanager_product_map where productid = " . intval( $productID ) );
		$service = new InventoryService();
		while ( $row = mysql_fetch_assoc( $result ) ) {
			$locationID = $row['locationid'] === null ? null : intval( $row['locationid'] );
			$service->decrementStock(
					intval( $row['itemid'] ),
					intval( $row['quantity'] ),
					$locationID,
					"productpurchase",
					$purchaseDBO->getID(),
					"Product order #" . $purchaseDBO->getID() );
		}
	}

	function fulfillSubscriptionMapping( $productID, AccountDBO $accountDBO, ProductPurchaseDBO $purchaseDBO ) {
		$map = $this->row(
				"select * from subscriptionmanager_product_map where productid = " . intval( $productID ) .
				" order by id asc limit 1" );
		if ( !$map ) {
			return;
		}

		$price = $this->row(
				"select * from subscriptionmanager_price where id = " . intval( $map['priceid'] ) .
				" and planid = " . intval( $map['planid'] ) );
		if ( !$price ) {
			return;
		}

		$start = DBConnection::format_date( time() );
		$periodEnd = $this->nextCycleDate( $start, $price['billing_cycle'], $price['cycle_interval'] );
		$trialEnd = intval( $price['trial_days'] ) > 0 ?
				date( "Y-m-d", strtotime( "+" . intval( $price['trial_days'] ) . " day", strtotime( $start ) ) ) :
				null;
		$nextBillingDate = $trialEnd ? $trialEnd : $start;
		$now = DBConnection::format_datetime( time() );

		$sql = $this->db()->build_insert_sql( "subscriptionmanager_subscription",
				array( "accountid" => intval( $accountDBO->getID() ),
				"planid" => intval( $map['planid'] ),
				"priceid" => intval( $map['priceid'] ),
				"status" => $trialEnd ? "trialing" : "active",
				"quantity" => intval( $map['quantity'] ),
				"current_period_start" => DBConnection::format_datetime( strtotime( $start ) ),
				"current_period_end" => DBConnection::format_datetime( strtotime( $periodEnd ) ),
				"trial_end" => $trialEnd ? DBConnection::format_datetime( strtotime( $trialEnd ) ) : null,
				"intro_cycles_remaining" => intval( $price['intro_cycles'] ),
				"nextbillingdate" => $nextBillingDate,
				"previnvoiceid" => $purchaseDBO->getPrevInvoiceID(),
				"created" => $now,
				"updated" => $now ) );
		$this->query( $sql );
	}

	function nextCycleDate( $date, $cycle, $interval = 1 ) {
		$time = strtotime( $date );
		$interval = max( 1, intval( $interval ) );

		switch ( $cycle ) {
			case "daily":
				return date( "Y-m-d", strtotime( "+" . $interval . " day", $time ) );
			case "weekly":
				return date( "Y-m-d", strtotime( "+" . $interval . " week", $time ) );
			case "monthly":
				return date( "Y-m-d", strtotime( "+" . $interval . " month", $time ) );
			case "annually":
				return date( "Y-m-d", strtotime( "+" . $interval . " year", $time ) );
		}

		return date( "Y-m-d", strtotime( "+1 month", $time ) );
	}
}
?>
