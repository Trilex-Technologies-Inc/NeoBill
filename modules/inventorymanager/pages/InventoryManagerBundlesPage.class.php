<?php
require_once BASE_PATH . "modules/inventorymanager/pages/InventoryManagerAdminPage.class.php";

class InventoryManagerBundlesPage extends InventoryManagerAdminPage {
	function action( $action_name ) {
		if ( $action_name == "inventorymanager_bundle_component_create" ) {
			$this->createComponent();
			return;
		}
		parent::action( $action_name );
	}

	function init() {
		parent::init();
		$this->smarty->assign( "items", $this->rows( "select id, sku, name, item_type from inventorymanager_item order by sku" ) );
		$this->smarty->assign( "components", $this->rows(
				"select bc.*, b.sku as bundle_sku, b.name as bundle_name, c.sku as component_sku, c.name as component_name " .
				"from inventorymanager_bundle_component bc " .
				"join inventorymanager_item b on b.id = bc.bundle_itemid " .
				"join inventorymanager_item c on c.id = bc.component_itemid order by bc.id desc" ) );
	}

	function createComponent() {
		$DB = $this->db();
		$sql = $DB->build_insert_sql( "inventorymanager_bundle_component", array(
				"bundle_itemid" => intval( $this->post['bundle_itemid'] ),
				"component_itemid" => intval( $this->post['component_itemid'] ),
				"quantity" => intval( $this->post['quantity'] ) ) );
		$this->execute( $sql );
		$this->setMessage( array( "type" => "[INVENTORY_MANAGER_COMPONENT_CREATED]" ) );
		$this->reload();
	}
}
?>
