<?php
require_once BASE_PATH . "modules/inventorymanager/pages/InventoryManagerAdminPage.class.php";

class InventoryManagerItemsPage extends InventoryManagerAdminPage {
	function action( $action_name ) {
		if ( $action_name == "inventorymanager_item_create" ) {
			$this->createItem();
			return;
		}
		if ( $action_name == "inventorymanager_product_map_create" ) {
			$this->createProductMap();
			return;
		}
		parent::action( $action_name );
	}

	function init() {
		parent::init();
		$this->ensureProductMapTable();
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

	function createProductMap() {
		$DB = $this->db();
		$productID = intval( $this->post['productid'] );
		$itemID = intval( $this->post['itemid'] );
		$locationID = strlen( trim( $this->post['locationid'] ) ) ? intval( $this->post['locationid'] ) : null;

		$product = $this->row( "select id from product where id = " . $productID );
		if ( !$product ) {
			throw new SWUserException( "Product was not found." );
		}

		$item = $this->row( "select id from inventorymanager_item where id = " . $itemID );
		if ( !$item ) {
			throw new SWUserException( "Inventory item was not found." );
		}

		if ( $locationID !== null ) {
			$location = $this->row( "select id from inventorymanager_location where id = " . $locationID );
			if ( !$location ) {
				throw new SWUserException( "Inventory location was not found." );
			}
		}

		$sql = $DB->build_insert_sql( "inventorymanager_product_map", array(
				"productid" => $productID,
				"itemid" => $itemID,
				"locationid" => $locationID,
				"quantity" => intval( $this->post['quantity'] ) ) );
		$this->execute( $sql );
		$this->setMessage( array( "type" => "Product inventory link saved." ) );
		$this->reload();
	}
}
?>
