<?php
require_once BASE_PATH . "modules/SolidStateModule.class.php";
require_once BASE_PATH . "modules/inventorymanager/lib/InventoryService.class.php";

class inventorymanager extends SolidStateModule {
	var $configPage = "inventorymanager_items";
	var $description = "Inventory Management System with real-time stock sync, low-stock alerts, locations, variants, and bundles.";
	var $name = "inventorymanager";
	var $sDescription = "Inventory";
	var $type = "inventory";

	function init() {
		parent::init();

		if ( $this->isEnabled() && class_exists( "SolidStateMenu", false ) ) {
			$menu = SolidStateMenu::getSolidStateMenu();
			$pages = array(
					"inventorymanager_items" => "Inventory Items",
					"inventorymanager_locations" => "Stock Locations",
					"inventorymanager_bundles" => "Bundles",
					"inventorymanager_adjustments" => "Stock Adjustments",
					"inventorymanager_alerts" => "Low-Stock Alerts" );
			foreach ( $pages as $page => $title ) {
				$menu->addItem( new SolidStateMenuItem(
						$page,
						$title,
						null,
						"manager_content.php?page=" . $page ),
						"modules" );
			}
		}
	}

	function install() {
		parent::install();
		$this->createTables();
	}

	function createTables() {
		$this->runSqlFile( BASE_PATH . "modules/inventorymanager/sql/install.sql" );
	}

	function uninstallTables() {
		$this->runSqlFile( BASE_PATH . "modules/inventorymanager/sql/uninstall.sql" );
	}

	function runSqlFile( $file ) {
		$DB = DBConnection::getDBConnection();
		$sql = file_get_contents( $file );
		$statements = explode( ";", $sql );

		foreach ( $statements as $statement ) {
			$statement = trim( $statement );
			if ( $statement == "" || substr( $statement, 0, 2 ) == "--" ) {
				continue;
			}

			if ( !mysql_query( $statement, $DB->handle() ) ) {
				throw new ModuleInstallFailedException(
						"inventorymanager",
						mysql_error( $DB->handle() ) );
			}
		}
	}

	function getInventoryService() {
		return new InventoryService();
	}
}
?>
