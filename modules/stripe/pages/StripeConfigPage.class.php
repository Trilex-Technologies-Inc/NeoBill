<?php
/**
 * Stripe module configuration page.
 */

require_once BASE_PATH . "include/SolidStateAdminPage.class.php";

class StripeConfigPage extends SolidStateAdminPage {
	var $stripeModule;

	function action( $action_name ) {
		switch ( $action_name ) {
			case "stripe_config":
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
		$this->stripeModule = $registry->getModule( "stripe" );

		$this->smarty->assign( "mode", $this->stripeModule->getMode() );
		$this->smarty->assign( "test_publishable_key", $this->stripeModule->getTestPublishableKey() );
		$this->smarty->assign( "test_secret_key", $this->stripeModule->getTestSecretKey() );
		$this->smarty->assign( "live_publishable_key", $this->stripeModule->getLivePublishableKey() );
		$this->smarty->assign( "live_secret_key", $this->stripeModule->getLiveSecretKey() );
		$this->smarty->assign( "currency", $this->stripeModule->getCurrencyCode() );
	}

	function save() {
		$this->stripeModule->setMode( $this->post['mode'] );
		$this->stripeModule->setTestPublishableKey( $this->post['test_publishable_key'] );
		$this->stripeModule->setLivePublishableKey( $this->post['live_publishable_key'] );
		$this->stripeModule->setCurrencyCode( $this->post['currency'] );

		if ( trim( $this->post['test_secret_key'] ) != "" ) {
			$this->stripeModule->setTestSecretKey( $this->post['test_secret_key'] );
		}

		if ( trim( $this->post['live_secret_key'] ) != "" ) {
			$this->stripeModule->setLiveSecretKey( $this->post['live_secret_key'] );
		}

		$this->stripeModule->saveSettings();

		$this->setMessage( array( "type" => "[STRIPE_CONFIGURATION_SAVED]" ) );
	}
}
?>
