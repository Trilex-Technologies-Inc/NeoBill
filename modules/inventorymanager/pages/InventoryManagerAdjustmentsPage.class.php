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
		$this->smarty->assign( "itemChoices", $this->rows( "select id, sku, name from inventorymanager_item order by sku, name" ) );
		$this->smarty->assign( "locations", $this->rows( "select id, name from inventorymanager_location order by name" ) );
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

		$current = $this->row( "select * from inventorymanager_stock where id = " . $stockID );
		if ( !$current || intval( $current['itemid'] ) != $itemID || intval( $current['locationid'] ) != $locationID ) {
			throw new SWUserException( "Move stock between items or locations with separate adjustments." );
		}
		$this->service()->adjustStock( $itemID, $locationID,
				intval( $this->post['quantity'] ) - intval( $current['quantity'] ),
				"manual", null, "Manager corrected stock total" );

		$this->setMessage( array( "type" => "Inventory stock updated." ) );
		$this->reload();
	}

	function deleteStock() {
		$DB = $this->db();
		$stockID = intval( $this->post['stockid'] );

		$current = $this->row( "select * from inventorymanager_stock where id = " . $stockID );
		if ( $current && intval( $current['quantity'] ) != 0 ) {
			$this->service()->adjustStock( $current['itemid'], $current['locationid'],
					-1 * intval( $current['quantity'] ), "manual", null, "Manager cleared stock total" );
		}
		$this->setMessage( array( "type" => "Inventory stock cleared with an audit movement." ) );
		$this->reload();
	}

	function updateMovement() {
		throw new SWUserException( "Inventory movements are immutable. Create a correcting adjustment instead." );
	}

	function deleteMovement() {
		throw new SWUserException( "Inventory movements are immutable. Create a correcting adjustment instead." );
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
