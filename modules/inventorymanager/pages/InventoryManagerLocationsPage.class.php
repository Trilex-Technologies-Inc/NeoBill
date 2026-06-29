<?php
require_once BASE_PATH . "modules/inventorymanager/pages/InventoryManagerAdminPage.class.php";

class InventoryManagerLocationsPage extends InventoryManagerAdminPage {
	function action( $action_name ) {
		if ( $action_name == "inventorymanager_location_create" ) {
			$this->createLocation();
			return;
		}
		parent::action( $action_name );
	}

	function init() {
		parent::init();
		$this->smarty->assign( "locations", $this->rows( "select * from inventorymanager_location order by id desc" ) );
	}

	function createLocation() {
		$DB = $this->db();
		$sql = $DB->build_insert_sql( "inventorymanager_location", array(
				"name" => $this->post['name'],
				"location_type" => $this->post['location_type'],
				"status" => "active",
				"created" => DBConnection::format_datetime( time() ) ) );
		$this->execute( $sql );
		$this->setMessage( array( "type" => "[INVENTORY_MANAGER_LOCATION_CREATED]" ) );
		$this->reload();
	}
}
?>
