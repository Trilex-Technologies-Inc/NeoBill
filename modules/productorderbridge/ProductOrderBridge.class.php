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

	function hasSubscriptionMapping( $productID ) {
		if ( !$this->tableExists( "subscriptionmanager_product_map" ) ) {
			return false;
		}

		$row = $this->row(
				"select id from subscriptionmanager_product_map where productid = " . intval( $productID ) .
				" limit 1" );
		return $row ? true : false;
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
		$referenceID = intval( $purchaseDBO->getID() );
		while ( $row = mysql_fetch_assoc( $result ) ) {
			$locationID = $row['locationid'] === null ? null : intval( $row['locationid'] );
			$service->decrementStock(
					intval( $row['itemid'] ),
					intval( $row['quantity'] ),
					$locationID,
					"productpurchase",
						$referenceID,
						"Product order #" . $referenceID );
		}
	}

	function fulfillSubscriptionMapping( $productID, AccountDBO $accountDBO, ProductPurchaseDBO $purchaseDBO ) {
		$existing = $this->row(
				"select id from subscriptionmanager_subscription where sourcepurchaseid = " .
				intval( $purchaseDBO->getID() ) . " limit 1" );
		if ( $existing ) {
			return;
		}
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

		$orderDate = DBConnection::format_date( time() );
		$trialEnd = intval( $price['trial_days'] ) > 0 ?
				date( "Y-m-d", strtotime( "+" . intval( $price['trial_days'] ) . " day", strtotime( $orderDate ) ) ) :
				null;
		$start = $trialEnd ? $trialEnd : $orderDate;
		$periodEnd = $this->nextCycleDate( $start, $price['billing_cycle'], $price['cycle_interval'] );
		// Checkout owns the first paid period. Trial checkouts are free and bill at trial end.
		$nextBillingDate = $trialEnd ? $trialEnd : $periodEnd;
		$now = DBConnection::format_datetime( time() );

		$subscription = array( "accountid" => intval( $accountDBO->getID() ),
				"planid" => intval( $map['planid'] ),
				"priceid" => intval( $map['priceid'] ),
				"status" => $trialEnd ? "trialing" : "active",
				"quantity" => intval( $map['quantity'] ),
				"current_period_start" => DBConnection::format_datetime( strtotime( $start ) ),
				"current_period_end" => DBConnection::format_datetime( strtotime( $periodEnd ) ),
					"intro_cycles_remaining" => $trialEnd ? intval( $price['intro_cycles'] ) :
						max( 0, intval( $price['intro_cycles'] ) - 1 ),
				"nextbillingdate" => $nextBillingDate,
					"previnvoiceid" => $purchaseDBO->getPrevInvoiceID(),
					"sourcepurchaseid" => intval( $purchaseDBO->getID() ),
					"billing_type" => $price['billing_type'],
					"billing_cycle" => $price['billing_cycle'],
					"cycle_interval" => intval( $price['cycle_interval'] ),
					"amount" => $price['amount'],
					"included_quantity" => $price['included_quantity'],
					"unit_amount" => $price['unit_amount'],
					"taxable" => $price['taxable'],
				"created" => $now,
				"updated" => $now );

		if ( $trialEnd ) {
			$subscription['trial_end'] = DBConnection::format_datetime( strtotime( $trialEnd ) );
		}
		if ( $price['intro_amount'] !== null ) {
			$subscription['intro_amount'] = $price['intro_amount'];
		}

		$sql = $this->db()->build_insert_sql( "subscriptionmanager_subscription", $subscription );
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
