<?php
require_once BASE_PATH . "modules/inventorymanager/pages/InventoryManagerAdminPage.class.php";

class InventoryManagerAdjustmentsPage extends InventoryManagerAdminPage {
	function action( $action_name ) {
		if ( $action_name == "inventorymanager_stock_adjust" ) {
			$this->adjustStock();
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
}
?>
