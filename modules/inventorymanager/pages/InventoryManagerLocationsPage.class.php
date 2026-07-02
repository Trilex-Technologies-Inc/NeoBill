<?php
require_once BASE_PATH . "modules/inventorymanager/pages/InventoryManagerAdminPage.class.php";

class InventoryManagerLocationsPage extends InventoryManagerAdminPage {
	function action( $action_name ) {
		switch ( $action_name ) {
			case "inventorymanager_location_create":
				$this->createLocation();
				return;
			case "inventorymanager_location_update":
				$this->updateLocation();
				return;
			case "inventorymanager_location_delete":
				$this->deleteLocation();
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

	function updateLocation() {
		$DB = $this->db();
		$locationID = intval( $this->post['locationid'] );

		$this->execute( $DB->build_update_sql( "inventorymanager_location",
				"id = " . $locationID,
				array( "name" => $this->post['name'],
				"location_type" => $this->post['location_type'],
				"status" => $this->post['status'] ) ) );

		$this->setMessage( array( "type" => "Inventory location updated." ) );
		$this->reload();
	}

	function deleteLocation() {
		$DB = $this->db();
		$locationID = intval( $this->post['locationid'] );

		if ( $this->hasLocationReferences( $locationID ) ) {
			throw new SWUserException( "Inventory location is still used by stock, movements, or product links." );
		}

		$this->execute( $DB->build_delete_sql( "inventorymanager_location", "id = " . $locationID ) );
		$this->setMessage( array( "type" => "Inventory location deleted." ) );
		$this->reload();
	}

	function hasLocationReferences( $locationID ) {
		$locationID = intval( $locationID );
		$checks = array(
				"select count(*) as total from inventorymanager_stock where locationid = " . $locationID,
				"select count(*) as total from inventorymanager_movement where locationid = " . $locationID,
				"select count(*) as total from inventorymanager_product_map where locationid = " . $locationID );

		foreach ( $checks as $sql ) {
			$row = $this->row( $sql );
			if ( $row && intval( $row['total'] ) > 0 ) {
				return true;
			}
		}
		return false;
	}
}
?>
