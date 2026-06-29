<?php
require_once BASE_PATH . "modules/inventorymanager/pages/InventoryManagerAdminPage.class.php";

class InventoryManagerItemsPage extends InventoryManagerAdminPage {
	function action( $action_name ) {
		if ( $action_name == "inventorymanager_item_create" ) {
			$this->createItem();
			return;
		}
		parent::action( $action_name );
	}

	function init() {
		parent::init();
		$this->smarty->assign( "items", $this->rows(
				"select i.*, coalesce(sum(s.quantity),0) as total_quantity " .
				"from inventorymanager_item i left join inventorymanager_stock s on s.itemid = i.id " .
				"group by i.id order by i.id desc" ) );
	}

	function createItem() {
		$DB = $this->db();
		$parent = strlen( trim( $this->post['parent_itemid'] ) ) ? intval( $this->post['parent_itemid'] ) : null;
		$sql = $DB->build_insert_sql( "inventorymanager_item", array(
				"sku" => $this->post['sku'],
				"name" => $this->post['name'],
				"description" => $this->post['description'],
				"item_type" => $this->post['item_type'],
				"parent_itemid" => $parent,
				"reorder_threshold" => intval( $this->post['reorder_threshold'] ),
				"status" => "active",
				"created" => DBConnection::format_datetime( time() ) ) );
		$this->execute( $sql );
		$this->setMessage( array( "type" => "[INVENTORY_MANAGER_ITEM_CREATED]" ) );
		$this->reload();
	}
}
?>
