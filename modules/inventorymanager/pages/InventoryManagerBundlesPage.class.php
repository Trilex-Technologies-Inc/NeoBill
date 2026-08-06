<?php
require_once BASE_PATH . "modules/inventorymanager/pages/InventoryManagerAdminPage.class.php";

class InventoryManagerBundlesPage extends InventoryManagerAdminPage {
	function action( $action_name ) {
		switch ( $action_name ) {
			case "inventorymanager_bundle_component_create":
				$this->createComponent();
				return;
			case "inventorymanager_bundle_component_update":
				$this->updateComponent();
				return;
			case "inventorymanager_bundle_component_delete":
				$this->deleteComponent();
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
		$bundleItemID = intval( $this->post['bundle_itemid'] );
		$componentItemID = intval( $this->post['component_itemid'] );
		$this->validateComponent( $bundleItemID, $componentItemID );

		$sql = $DB->build_insert_sql( "inventorymanager_bundle_component", array(
				"bundle_itemid" => $bundleItemID,
				"component_itemid" => $componentItemID,
				"quantity" => intval( $this->post['quantity'] ) ) );
		$this->execute( $sql );
		$this->setMessage( array( "type" => "[INVENTORY_MANAGER_COMPONENT_CREATED]" ) );
		$this->reload();
	}

	function updateComponent() {
		$DB = $this->db();
		$componentID = intval( $this->post['componentid'] );
		$bundleItemID = intval( $this->post['bundle_itemid'] );
		$componentItemID = intval( $this->post['component_itemid'] );
		$this->validateComponent( $bundleItemID, $componentItemID );

		$this->execute( $DB->build_update_sql( "inventorymanager_bundle_component",
				"id = " . $componentID,
				array( "bundle_itemid" => $bundleItemID,
				"component_itemid" => $componentItemID,
				"quantity" => intval( $this->post['quantity'] ) ) ) );

		$this->setMessage( array( "type" => "Bundle component updated." ) );
		$this->reload();
	}

	function deleteComponent() {
		$DB = $this->db();
		$componentID = intval( $this->post['componentid'] );

		$this->execute( $DB->build_delete_sql( "inventorymanager_bundle_component", "id = " . $componentID ) );
		$this->setMessage( array( "type" => "Bundle component deleted." ) );
		$this->reload();
	}

	function validateComponent( $bundleItemID, $componentItemID ) {
		if ( $bundleItemID == $componentItemID ) {
			throw new SWUserException( "A bundle cannot include itself as a component." );
		}

		if ( intval( $this->post['quantity'] ) < 1 ) {
			throw new SWUserException( "Bundle component quantity must be at least one." );
		}

		$bundle = $this->row( "select id, item_type from inventorymanager_item where id = " . intval( $bundleItemID ) );
		if ( !$bundle || $bundle['item_type'] != "bundle" ) {
			throw new SWUserException( "Bundle inventory item was not found." );
		}

		$component = $this->row( "select id from inventorymanager_item where id = " . intval( $componentItemID ) );
		if ( !$component ) {
			throw new SWUserException( "Component inventory item was not found." );
		}
		if ( $this->wouldCreateCycle( $bundleItemID, $componentItemID ) ) {
			throw new SWUserException( "This component would create a circular bundle." );
		}
	}

	function wouldCreateCycle( $bundleItemID, $componentItemID, $seen = array() ) {
		if ( $componentItemID == $bundleItemID ) {
			return true;
		}
		if ( isset( $seen[$componentItemID] ) ) {
			return false;
		}
		$seen[$componentItemID] = true;
		foreach ( $this->rows( "select component_itemid from inventorymanager_bundle_component where bundle_itemid=" . intval( $componentItemID) ) as $row ) {
			if ( $this->wouldCreateCycle( $bundleItemID, intval( $row['component_itemid'] ), $seen ) ) {
				return true;
			}
		}
		return false;
	}
}
?>
