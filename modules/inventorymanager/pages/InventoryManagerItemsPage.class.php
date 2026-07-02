<?php
require_once BASE_PATH . "modules/inventorymanager/pages/InventoryManagerAdminPage.class.php";

class InventoryManagerItemsPage extends InventoryManagerAdminPage {
	function action( $action_name ) {
		switch ( $action_name ) {
			case "inventorymanager_item_create":
				$this->createItem();
				return;
			case "inventorymanager_item_update":
				$this->updateItem();
				return;
			case "inventorymanager_item_delete":
				$this->deleteItem();
				return;
			case "inventorymanager_product_map_create":
				$this->createProductMap();
				return;
			case "inventorymanager_product_map_update":
				$this->updateProductMap();
				return;
			case "inventorymanager_product_map_delete":
				$this->deleteProductMap();
				return;
		}
		parent::action( $action_name );
	}

	function init() {
		parent::init();
		$this->ensureProductMapTable();
		$this->smarty->assign( "itemChoices", $this->rows( "select id, sku, name from inventorymanager_item order by sku, name" ) );
		$this->smarty->assign( "products", $this->rows( "select id, name from product order by name" ) );
		$this->smarty->assign( "locations", $this->rows( "select id, name from inventorymanager_location order by name" ) );
		$this->smarty->assign( "items", $this->rows(
				"select i.*, coalesce(sum(s.quantity),0) as total_quantity " .
				"from inventorymanager_item i left join inventorymanager_stock s on s.itemid = i.id " .
				"group by i.id order by i.id desc" ) );
		$this->smarty->assign( "productMaps", $this->rows(
				"select m.*, p.name as product_name, i.sku, i.name as item_name, l.name as location_name " .
				"from inventorymanager_product_map m " .
				"left join product p on p.id = m.productid " .
				"left join inventorymanager_item i on i.id = m.itemid " .
				"left join inventorymanager_location l on l.id = m.locationid " .
				"order by m.id desc" ) );
	}

	function ensureProductMapTable() {
		$this->execute(
				"create table if not exists `inventorymanager_product_map` (" .
				"`id` int(11) not null auto_increment," .
				"`productid` int(11) not null default '0'," .
				"`itemid` int(11) not null default '0'," .
				"`locationid` int(11) default null," .
				"`quantity` int(11) not null default '1'," .
				"primary key (`id`)," .
				"unique key `product_item_location` (`productid`,`itemid`,`locationid`)," .
				"key `itemid` (`itemid`)," .
				"key `locationid` (`locationid`)" .
				") default charset=utf8" );
	}

	function createItem() {
		$parent = strlen( trim( $this->post['parent_itemid'] ) ) ? intval( $this->post['parent_itemid'] ) : null;
		$this->execute(
				"insert into inventorymanager_item " .
				"(sku, name, description, item_type, parent_itemid, reorder_threshold, status, created) values (" .
				$this->quote( $this->post['sku'] ) . ", " .
				$this->quote( $this->post['name'] ) . ", " .
				$this->quote( $this->post['description'] ) . ", " .
				$this->quote( $this->post['item_type'] ) . ", " .
				$this->nullableIntSQL( $parent ) . ", " .
				intval( $this->post['reorder_threshold'] ) . ", " .
				$this->quote( "active" ) . ", " .
				$this->quote( DBConnection::format_datetime( time() ) ) . ")" );
		$this->setMessage( array( "type" => "[INVENTORY_MANAGER_ITEM_CREATED]" ) );
		$this->reload();
	}

	function updateItem() {
		$itemID = intval( $this->post['itemid'] );
		$parent = strlen( trim( $this->post['parent_itemid'] ) ) ? intval( $this->post['parent_itemid'] ) : null;

		if ( $parent !== null && $parent == $itemID ) {
			throw new SWUserException( "An inventory item cannot be its own parent." );
		}

		if ( $parent !== null ) {
			$parentItem = $this->row( "select id from inventorymanager_item where id = " . $parent );
			if ( !$parentItem ) {
				throw new SWUserException( "Parent inventory item was not found." );
			}
		}

		$this->execute(
				"update inventorymanager_item set " .
				"sku = " . $this->quote( $this->post['sku'] ) . ", " .
				"name = " . $this->quote( $this->post['name'] ) . ", " .
				"description = " . $this->quote( $this->post['description'] ) . ", " .
				"item_type = " . $this->quote( $this->post['item_type'] ) . ", " .
				"parent_itemid = " . $this->nullableIntSQL( $parent ) . ", " .
				"reorder_threshold = " . intval( $this->post['reorder_threshold'] ) . ", " .
				"status = " . $this->quote( $this->post['status'] ) . " " .
				"where id = " . $itemID );

		$this->setMessage( array( "type" => "Inventory item updated." ) );
		$this->reload();
	}

	function deleteItem() {
		$DB = $this->db();
		$itemID = intval( $this->post['itemid'] );

		if ( $this->hasItemReferences( $itemID ) ) {
			throw new SWUserException( "Inventory item is still used by stock, movements, bundles, product links, or variants." );
		}

		$this->execute( $DB->build_delete_sql( "inventorymanager_item", "id = " . $itemID ) );
		$this->setMessage( array( "type" => "Inventory item deleted." ) );
		$this->reload();
	}

	function createProductMap() {
		$productID = intval( $this->post['productid'] );
		$itemID = intval( $this->post['itemid'] );
		$locationID = strlen( trim( $this->post['locationid'] ) ) ? intval( $this->post['locationid'] ) : null;

		$this->validateProductMap( $productID, $itemID, $locationID );

		$this->execute(
				"insert into inventorymanager_product_map " .
				"(productid, itemid, locationid, quantity) values (" .
				$productID . ", " .
				$itemID . ", " .
				$this->nullableIntSQL( $locationID ) . ", " .
				intval( $this->post['quantity'] ) . ")" );
		$this->setMessage( array( "type" => "Product inventory link saved." ) );
		$this->reload();
	}

	function updateProductMap() {
		$mapID = intval( $this->post['mapid'] );
		$productID = intval( $this->post['productid'] );
		$itemID = intval( $this->post['itemid'] );
		$locationID = strlen( trim( $this->post['locationid'] ) ) ? intval( $this->post['locationid'] ) : null;

		$this->validateProductMap( $productID, $itemID, $locationID );

		$this->execute(
				"update inventorymanager_product_map set " .
				"productid = " . $productID . ", " .
				"itemid = " . $itemID . ", " .
				"locationid = " . $this->nullableIntSQL( $locationID ) . ", " .
				"quantity = " . intval( $this->post['quantity'] ) . " " .
				"where id = " . $mapID );

		$this->setMessage( array( "type" => "Product inventory link updated." ) );
		$this->reload();
	}

	function deleteProductMap() {
		$DB = $this->db();
		$mapID = intval( $this->post['mapid'] );

		$this->execute( $DB->build_delete_sql( "inventorymanager_product_map", "id = " . $mapID ) );
		$this->setMessage( array( "type" => "Product inventory link deleted." ) );
		$this->reload();
	}

	function validateProductMap( $productID, $itemID, $locationID ) {
		$product = $this->row( "select id from product where id = " . intval( $productID ) );
		if ( !$product ) {
			throw new SWUserException( "Product was not found." );
		}

		$item = $this->row( "select id from inventorymanager_item where id = " . intval( $itemID ) );
		if ( !$item ) {
			throw new SWUserException( "Inventory item was not found." );
		}

		if ( $locationID !== null ) {
			$location = $this->row( "select id from inventorymanager_location where id = " . intval( $locationID ) );
			if ( !$location ) {
				throw new SWUserException( "Inventory location was not found." );
			}
		}
	}

	function hasItemReferences( $itemID ) {
		$itemID = intval( $itemID );
		$checks = array(
				"select count(*) as total from inventorymanager_stock where itemid = " . $itemID,
				"select count(*) as total from inventorymanager_movement where itemid = " . $itemID,
				"select count(*) as total from inventorymanager_bundle_component where bundle_itemid = " . $itemID . " or component_itemid = " . $itemID,
				"select count(*) as total from inventorymanager_product_map where itemid = " . $itemID,
				"select count(*) as total from inventorymanager_item where parent_itemid = " . $itemID );

		foreach ( $checks as $sql ) {
			$row = $this->row( $sql );
			if ( $row && intval( $row['total'] ) > 0 ) {
				return true;
			}
		}
		return false;
	}

	function nullableIntSQL( $value ) {
		return $value === null ? "null" : intval( $value );
	}
}
?>
