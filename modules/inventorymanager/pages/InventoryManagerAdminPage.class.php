<?php
require_once BASE_PATH . "include/SolidStateAdminPage.class.php";
require_once BASE_PATH . "modules/inventorymanager/lib/InventoryService.class.php";

class InventoryManagerAdminPage extends SolidStateAdminPage {
	function db() {
		return DBConnection::getDBConnection();
	}

	function rows( $sql ) {
		$DB = $this->db();
		if ( !( $result = mysql_query( $sql, $DB->handle() ) ) ) {
			throw new DBException( mysql_error( $DB->handle() ) );
		}
		$rows = array();
		while ( $row = mysql_fetch_assoc( $result ) ) {
			$rows[] = $row;
		}
		return $rows;
	}

	function execute( $sql ) {
		$DB = $this->db();
		if ( !mysql_query( $sql, $DB->handle() ) ) {
			throw new DBException( mysql_error( $DB->handle() ) );
		}
		return mysql_insert_id( $DB->handle() );
	}

	function service() {
		return new InventoryService();
	}

	function init() {
		parent::init();
		$this->smarty->assign( "inventoryManagerLinks", array(
				array( "title" => "Items", "url" => "manager_content.php?page=inventorymanager_items" ),
				array( "title" => "Locations", "url" => "manager_content.php?page=inventorymanager_locations" ),
				array( "title" => "Bundles", "url" => "manager_content.php?page=inventorymanager_bundles" ),
				array( "title" => "Adjustments", "url" => "manager_content.php?page=inventorymanager_adjustments" ),
				array( "title" => "Alerts", "url" => "manager_content.php?page=inventorymanager_alerts" ) ) );
	}
}
?>
