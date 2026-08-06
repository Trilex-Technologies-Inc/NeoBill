<?php
class InventoryService {
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

	function syncInvoiceItem( $itemID, $quantity, $locationID = null, $referenceType = "invoice", $referenceID = null ) {
		$this->decrementStock( $itemID, $quantity, $locationID, $referenceType, $referenceID, "Invoiced item" );
	}

	function syncSubscriptionProvision( $itemID, $quantity, $locationID = null, $referenceType = "subscription", $referenceID = null ) {
		$this->decrementStock( $itemID, $quantity, $locationID, $referenceType, $referenceID, "Provisioned subscription" );
	}

	function decrementStock( $itemID, $quantity, $locationID = null, $referenceType = "manual", $referenceID = null, $note = "" ) {
		$quantity = abs( intval( $quantity ) );
		if ( $quantity < 1 ) {
			return;
		}

		$item = $this->row( "select * from inventorymanager_item where id = " . intval( $itemID ) );
		if ( !$item ) {
			throw new SWUserException( "Inventory item was not found." );
		}
		if ( $item['status'] != "active" ) {
			throw new SWUserException( "Archived inventory item " . $item['sku'] . " cannot be fulfilled." );
		}

		if ( $item['item_type'] == "bundle" ) {
			$components = $this->query( "select * from inventorymanager_bundle_component where bundle_itemid = " . intval( $itemID ) );
			while ( $component = mysql_fetch_assoc( $components ) ) {
				$this->decrementStock(
						$component['component_itemid'],
						$quantity * intval( $component['quantity'] ),
						$locationID,
						$referenceType,
						$referenceID,
						"Bundle component for " . $item['sku'] );
			}
			return;
		}

		$this->adjustStock( $itemID, $locationID, -1 * $quantity, $referenceType, $referenceID, $note );
	}

	function adjustStock( $itemID, $locationID, $quantityChange, $referenceType = "manual", $referenceID = null, $note = "" ) {
		$DB = $this->db();
		$itemID = intval( $itemID );
		$locationID = $locationID ? intval( $locationID ) : $this->defaultLocationID();
		$quantityChange = intval( $quantityChange );
		if ( $quantityChange == 0 ) {
			return;
		}
		$location = $this->row( "select status from inventorymanager_location where id = " . $locationID );
		if ( !$location || $location['status'] != "active" ) {
			throw new SWUserException( "An active inventory location is required." );
		}
		$current = $this->row(
				"select * from inventorymanager_stock where itemid = " . $itemID .
				" and locationid = " . $locationID );
		if ( $current ) {
			$result = $this->query(
					"update inventorymanager_stock set quantity = quantity + " . $quantityChange .
					", updated = " . $this->quote( DBConnection::format_datetime( time() ) ) .
					" where itemid = " . $itemID . " and locationid = " . $locationID .
					" and quantity + " . $quantityChange . " >= 0" );
			if ( mysql_affected_rows( $DB->handle() ) == 0 ) {
				throw new SWUserException( "Insufficient inventory stock for item #" . $itemID . "." );
			}
		}
		else {
			if ( $quantityChange < 0 ) {
				throw new SWUserException( "Insufficient inventory stock for item #" . $itemID . "." );
			}
			$sql = $DB->build_insert_sql( "inventorymanager_stock", array(
					"itemid" => $itemID,
					"locationid" => $locationID,
					"quantity" => $quantityChange,
					"updated" => DBConnection::format_datetime( time() ) ) );
			$this->query( $sql );
		}

		$sql = $DB->build_insert_sql( "inventorymanager_movement", array(
				"itemid" => $itemID,
				"locationid" => $locationID,
				"quantity_change" => $quantityChange,
				"reference_type" => $referenceType,
				"reference_id" => $referenceID,
				"note" => $note,
				"created" => DBConnection::format_datetime( time() ) ) );
		$this->query( $sql );
	}

	function defaultLocationID() {
		$row = $this->row( "select id from inventorymanager_location order by id asc limit 1" );
		if ( $row ) {
			return intval( $row['id'] );
		}

		$DB = $this->db();
		$sql = $DB->build_insert_sql( "inventorymanager_location", array(
				"name" => "Default",
				"location_type" => "warehouse",
				"status" => "active",
				"created" => DBConnection::format_datetime( time() ) ) );
		$this->query( $sql );
		return mysql_insert_id( $DB->handle() );
	}
}
?>
