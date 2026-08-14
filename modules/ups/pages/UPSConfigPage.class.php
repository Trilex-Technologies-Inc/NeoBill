<?php
/**
 * UPS module configuration page.
 */

require_once BASE_PATH . "include/SolidStateAdminPage.class.php";

class UPSConfigPage extends SolidStateAdminPage {
	var $upsModule;

	function action( $action_name ) {
		switch ( $action_name ) {
			case "ups_config":
				if ( isset( $this->post['save'] ) ) {
					$this->save();
				}
				break;
			default:
				parent::action( $action_name );
		}
	}

	function init() {
		parent::init();

		$registry = ModuleRegistry::getModuleRegistry();
		$this->upsModule = $registry->getModule( "ups" );

		$this->smarty->assign( "mode", $this->upsModule->getMode() );
		$this->smarty->assign( "client_id", $this->upsModule->getClientID() );
		$this->smarty->assign( "client_secret", $this->upsModule->getClientSecret() );
		$this->smarty->assign( "shipper_number", $this->upsModule->getShipperNumber() );
		$this->smarty->assign( "account_country", $this->upsModule->getAccountCountry() );
		$this->smarty->assign( "account_postal_code", $this->upsModule->getAccountPostalCode() );
		$this->smarty->assign( "currency", $this->upsModule->getCurrencyCode() );
		$this->smarty->assign( "default_service_code", $this->upsModule->getDefaultServiceCode() );
		$this->smarty->assign( "default_packaging_code", $this->upsModule->getDefaultPackagingCode() );
		$this->smarty->assign( "weight_unit", $this->upsModule->getWeightUnit() );
		$this->smarty->assign( "dimension_unit", $this->upsModule->getDimensionUnit() );
	}

	function save() {
		$this->upsModule->setMode( $this->post['mode'] );
		$this->upsModule->setClientID( $this->post['client_id'] );
		$this->upsModule->setShipperNumber( $this->post['shipper_number'] );
		$this->upsModule->setAccountCountry( $this->post['account_country'] );
		$this->upsModule->setAccountPostalCode( $this->post['account_postal_code'] );
		$this->upsModule->setCurrencyCode( $this->post['currency'] );
		$this->upsModule->setDefaultServiceCode( $this->post['default_service_code'] );
		$this->upsModule->setDefaultPackagingCode( $this->post['default_packaging_code'] );
		$this->upsModule->setWeightUnit( $this->post['weight_unit'] );
		$this->upsModule->setDimensionUnit( $this->post['dimension_unit'] );

		if ( trim( $this->post['client_secret'] ) != "" ) {
			$this->upsModule->setClientSecret( $this->post['client_secret'] );
		}

		$this->upsModule->saveSettings();

		$this->setMessage( array( "type" => "[UPS_CONFIGURATION_SAVED]" ) );
	}
}
?>
