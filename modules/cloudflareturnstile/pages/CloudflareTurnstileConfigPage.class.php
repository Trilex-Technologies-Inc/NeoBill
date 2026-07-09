<?php
/**
 * Cloudflare Turnstile module configuration page.
 */

require_once BASE_PATH . "include/SolidStateAdminPage.class.php";

class CloudflareTurnstileConfigPage extends SolidStateAdminPage {
	var $turnstileModule;

	function action( $action_name ) {
		switch ( $action_name ) {
			case "cloudflareturnstile_config":
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

		$this->turnstileModule = ModuleRegistry::getModuleRegistry()->getModule( "cloudflareturnstile" );
		$this->smarty->assign( "site_key", $this->turnstileModule->getSiteKey() );
		$this->smarty->assign( "secret_configured", $this->turnstileModule->getSecretKey() != "" );
		$this->smarty->assign( "module_enabled", $this->turnstileModule->isEnabled() );
	}

	function save() {
		$this->turnstileModule->setSiteKey( $this->post['site_key'] );

		if ( trim( $this->post['secret_key'] ) != "" ) {
			$this->turnstileModule->setSecretKey( $this->post['secret_key'] );
		}

		$this->turnstileModule->saveSettings();
		$this->setMessage( array( "type" => "[CLOUDFLARE_TURNSTILE_CONFIGURATION_SAVED]" ) );
		$this->reload();
	}
}
?>
