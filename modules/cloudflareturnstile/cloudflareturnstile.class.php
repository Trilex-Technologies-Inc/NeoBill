<?php
/**
 * Cloudflare Turnstile login protection module.
 */

require_once BASE_PATH . "solidworks/Module.class.php";
require_once BASE_PATH . "modules/SolidStateModule.class.php";

class cloudflareturnstile extends SolidStateModule {
	var $configPage = "cloudflareturnstile_config";
	var $description = "Protect manager and order logins with Cloudflare Turnstile.";
	var $name = "cloudflareturnstile";
	var $sDescription = "Cloudflare Turnstile";
	var $type = "security";

	var $siteKey = "";
	var $secretKey = "";

	function init() {
		parent::init();

		$this->setSiteKey( $this->moduleDBO->loadSetting( "site_key" ) );
		$this->setSecretKey( $this->moduleDBO->loadSetting( "secret_key" ) );
	}

	function install() {
		parent::install();
		$this->saveSettings();
	}

	function saveSettings() {
		$this->moduleDBO->saveSetting( "site_key", $this->getSiteKey() );
		$this->moduleDBO->saveSetting( "secret_key", $this->getSecretKey() );
	}

	function getSiteKey() {
		return $this->siteKey;
	}

	function getSecretKey() {
		return $this->secretKey;
	}

	function setSiteKey( $siteKey ) {
		$this->siteKey = trim( $siteKey );
	}

	function setSecretKey( $secretKey ) {
		$this->secretKey = trim( $secretKey );
	}

	function isConfigured() {
		return $this->isEnabled() &&
				$this->getSiteKey() != "" &&
				$this->getSecretKey() != "";
	}

	function renderWidget() {
		if ( !$this->isConfigured() ) {
			return "";
		}

		return '<div class="cf-turnstile" data-sitekey="' .
				htmlspecialchars( $this->getSiteKey(), ENT_QUOTES, "UTF-8" ) .
				'"></div>';
	}

	function renderScript() {
		if ( !$this->isConfigured() ) {
			return "";
		}

		return '<script src="https://challenges.cloudflare.com/turnstile/v0/api.js" async defer></script>';
	}

	function verify( $token, $remoteIP = null ) {
		if ( !$this->isConfigured() ) {
			return true;
		}

		if ( empty( $token ) ) {
			return false;
		}

		$postData = array(
				"secret" => $this->getSecretKey(),
				"response" => $token );

		if ( !empty( $remoteIP ) ) {
			$postData['remoteip'] = $remoteIP;
		}

		$response = $this->postSiteverify( $postData );
		if ( empty( $response ) ) {
			return false;
		}

		$result = json_decode( $response, true );
		return is_array( $result ) && !empty( $result['success'] );
	}

	function postSiteverify( $postData ) {
		$url = "https://challenges.cloudflare.com/turnstile/v0/siteverify";
		$body = http_build_query( $postData, "", "&" );

		if ( function_exists( "curl_init" ) ) {
			$ch = curl_init( $url );
			curl_setopt( $ch, CURLOPT_POST, true );
			curl_setopt( $ch, CURLOPT_POSTFIELDS, $body );
			curl_setopt( $ch, CURLOPT_RETURNTRANSFER, true );
			curl_setopt( $ch, CURLOPT_TIMEOUT, 10 );
			curl_setopt( $ch, CURLOPT_HTTPHEADER, array(
					"Content-Type: application/x-www-form-urlencoded" ) );
			$response = curl_exec( $ch );
			curl_close( $ch );

			return $response;
		}

		$context = stream_context_create( array(
				"http" => array(
						"method" => "POST",
						"header" => "Content-Type: application/x-www-form-urlencoded\r\n",
						"content" => $body,
						"timeout" => 10 ) ) );

		return file_get_contents( $url, false, $context );
	}

	static function getModule() {
		if ( class_exists( "ModuleRegistry", false ) ) {
			try {
				return ModuleRegistry::getModuleRegistry()->getModule( "cloudflareturnstile" );
			}
			catch ( Exception $e ) {
			}
		}

		return cloudflareturnstile::loadFromDatabase();
	}

	static function loadFromDatabase() {
		try {
			$module = new cloudflareturnstile();
			$module->moduleDBO = load_ModuleDBO( "cloudflareturnstile" );
			$module->setSiteKey( $module->moduleDBO->loadSetting( "site_key" ) );
			$module->setSecretKey( $module->moduleDBO->loadSetting( "secret_key" ) );
			return $module;
		}
		catch ( Exception $e ) {
			return null;
		}
	}

	static function loginProtectionEnabled() {
		$module = cloudflareturnstile::getModule();
		return isset( $module ) && $module->isConfigured();
	}

	static function loginWidget() {
		$module = cloudflareturnstile::getModule();
		return isset( $module ) ? $module->renderWidget() : "";
	}

	static function loginScript() {
		$module = cloudflareturnstile::getModule();
		return isset( $module ) ? $module->renderScript() : "";
	}

	static function verifyLoginToken( $token ) {
		$module = cloudflareturnstile::getModule();
		if ( !isset( $module ) ) {
			return true;
		}

		return $module->verify( $token, cloudflareturnstile::remoteIP() );
	}

	static function remoteIP() {
		if ( !empty( $_SERVER['HTTP_CF_CONNECTING_IP'] ) ) {
			return $_SERVER['HTTP_CF_CONNECTING_IP'];
		}

		if ( !empty( $_SERVER['HTTP_X_FORWARDED_FOR'] ) ) {
			$ips = explode( ",", $_SERVER['HTTP_X_FORWARDED_FOR'] );
			return trim( $ips[0] );
		}

		return isset( $_SERVER['REMOTE_ADDR'] ) ? $_SERVER['REMOTE_ADDR'] : null;
	}
}
?>
