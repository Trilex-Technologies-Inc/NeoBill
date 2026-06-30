<?php
require_once BASE_PATH . "include/SolidStateAdminPage.class.php";
require_once BASE_PATH . "DBO/InvoiceDBO.class.php";
require_once BASE_PATH . "modules/subscriptionmanager/lib/SubscriptionBillingService.class.php";

class SubscriptionManagerAdminPage extends SolidStateAdminPage {
	function db() {
		return DBConnection::getDBConnection();
	}

	function quote( $value ) {
		return $this->db()->quote_smart( $value );
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

	function row( $sql ) {
		$rows = $this->rows( $sql );
		return empty( $rows ) ? null : $rows[0];
	}

	function execute( $sql ) {
		$DB = $this->db();
		if ( !mysql_query( $sql, $DB->handle() ) ) {
			throw new DBException( mysql_error( $DB->handle() ) );
		}
		return mysql_insert_id( $DB->handle() );
	}

	function module() {
		return ModuleRegistry::getModuleRegistry()->getModule( "subscriptionmanager" );
	}

	function service() {
		return $this->module()->getBillingService();
	}

	function dateValue( $value ) {
		if ( is_numeric( $value ) ) {
			return DBConnection::format_date( $value );
		}
		return DBConnection::format_date( strtotime( $value ) );
	}

	function datetimeValue( $value ) {
		if ( is_numeric( $value ) ) {
			return DBConnection::format_datetime( $value );
		}
		return DBConnection::format_datetime( strtotime( $value ) );
	}

	function assignCommonLinks() {
		$this->smarty->assign( "subscriptionManagerLinks", array(
				array( "title" => "Create Plan", "url" => "manager_content.php?page=subscriptionmanager_plans" ),
				array( "title" => "Create Subscription", "url" => "manager_content.php?page=subscriptionmanager_subscriptions" ),
				array( "title" => "Record Usage", "url" => "manager_content.php?page=subscriptionmanager_usage" ),
				array( "title" => "Run Billing", "url" => "manager_content.php?page=subscriptionmanager_billing" ),
				array( "title" => "Dunning Queue", "url" => "manager_content.php?page=subscriptionmanager_dunning" ) ) );
	}

	function init() {
		parent::init();
		$this->assignCommonLinks();
	}
}
?>
