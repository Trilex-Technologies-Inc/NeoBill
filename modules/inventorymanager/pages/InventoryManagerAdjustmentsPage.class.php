<?php
require_once BASE_PATH . "modules/inventorymanager/pages/InventoryManagerAdminPage.class.php";

class InventoryManagerAdjustmentsPage extends InventoryManagerAdminPage {
	function action( $action_name ) {
		switch ( $action_name ) {
			case "inventorymanager_stock_adjust":
				$this->adjustStock();
				return;
			case "inventorymanager_stock_update":
				$this->updateStock();
				return;
			case "inventorymanager_stock_delete":
				$this->deleteStock();
				return;
			case "inventorymanager_movement_update":
				$this->updateMovement();
				return;
			case "inventorymanager_movement_delete":
				$this->deleteMovement();
				return;
		}
		parent::action( $action_name );
	}

	function init() {
		parent::init();
		$this->smarty->assign( "stock", $this->rows(
				"select s.*, i.sku, i.name as item_name, i.reorder_threshold, l.name as location_name " .
				"from inventorymanager_stock s join inventorymanager_item i on i.id = s.itemid " .
				"join inventorymanager_location l on l.id = s.locationid order by i.sku, l.name" ) );
		$this->smarty->assign( "movements", $this->rows(
				"select m.*, i.sku, i.name as item_name, l.name as location_name " .
				"from inventorymanager_movement m join inventorymanager_item i on i.id = m.itemid " .
				"join inventorymanager_location l on l.id = m.locationid order by m.id desc limit 50" ) );
	}

	function adjustStock() {
		$this->service()->adjustStock(
				$this->post['itemid'],
				$this->post['locationid'],
				$this->post['quantity_change'],
				"manual",
				null,
				$this->post['note'] );
		$this->setMessage( array( "type" => "[INVENTORY_MANAGER_STOCK_ADJUSTED]" ) );
		$this->reload();
	}

	function updateStock() {
		$DB = $this->db();
		$stockID = intval( $this->post['stockid'] );
		$itemID = intval( $this->post['itemid'] );
		$locationID = intval( $this->post['locationid'] );
		$this->validateItemLocation( $itemID, $locationID );

		$this->execute( $DB->build_update_sql( "inventorymanager_stock",
				"id = " . $stockID,
				array( "itemid" => $itemID,
				"locationid" => $locationID,
				"quantity" => intval( $this->post['quantity'] ),
				"updated" => DBConnection::format_datetime( time() ) ) ) );

		$this->setMessage( array( "type" => "Inventory stock updated." ) );
		$this->reload();
	}

	function deleteStock() {
		$DB = $this->db();
		$stockID = intval( $this->post['stockid'] );

		$this->execute( $DB->build_delete_sql( "inventorymanager_stock", "id = " . $stockID ) );
		$this->setMessage( array( "type" => "Inventory stock deleted." ) );
		$this->reload();
	}

	function updateMovement() {
		$movementID = intval( $this->post['movementid'] );
		$itemID = intval( $this->post['itemid'] );
		$locationID = intval( $this->post['locationid'] );
		$referenceID = strlen( trim( $this->post['reference_id'] ) ) ? intval( $this->post['reference_id'] ) : null;
		$this->validateItemLocation( $itemID, $locationID );

		$this->execute(
				"update inventorymanager_movement set " .
				"itemid = " . $itemID . ", " .
				"locationid = " . $locationID . ", " .
				"quantity_change = " . intval( $this->post['quantity_change'] ) . ", " .
				"reference_type = " . $this->quote( $this->post['reference_type'] ) . ", " .
				"reference_id = " . $this->nullableIntSQL( $referenceID ) . ", " .
				"note = " . $this->quote( $this->post['note'] ) . " " .
				"where id = " . $movementID );

		$this->setMessage( array( "type" => "Inventory movement updated." ) );
		$this->reload();
	}

	function deleteMovement() {
		$DB = $this->db();
		$movementID = intval( $this->post['movementid'] );

		$this->execute( $DB->build_delete_sql( "inventorymanager_movement", "id = " . $movementID ) );
		$this->setMessage( array( "type" => "Inventory movement deleted." ) );
		$this->reload();
	}

	function validateItemLocation( $itemID, $locationID ) {
		$item = $this->row( "select id from inventorymanager_item where id = " . intval( $itemID ) );
		if ( !$item ) {
			throw new SWUserException( "Inventory item was not found." );
		}

		$location = $this->row( "select id from inventorymanager_location where id = " . intval( $locationID ) );
		if ( !$location ) {
			throw new SWUserException( "Inventory location was not found." );
		}
	}

	function nullableIntSQL( $value ) {
		return $value === null ? "null" : intval( $value );
	}
}
?>
