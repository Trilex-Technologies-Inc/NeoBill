<?php
/**
 * Stripe hosted checkout payment processor module.
 */

require_once BASE_PATH . "modules/PaymentProcessorModule.class.php";

define( "STRIPE_MODE_TEST", "test" );
define( "STRIPE_MODE_LIVE", "live" );
define( "STRIPE_CHECKOUT_SESSION_URL", "https://api.stripe.com/v1/checkout/sessions" );

class stripe extends PaymentProcessorModule {
	var $configPage = "stripe_config";
	var $description = "Stripe Hosted Checkout Payment Processor Module";
	var $name = "stripe";
	var $orderCheckoutPage = "stripe_checkout";
	var $sDescription = "Stripe";
	var $version = 1;

	var $mode = STRIPE_MODE_TEST;
	var $testPublishableKey = "";
	var $testSecretKey = "";
	var $livePublishableKey = "";
	var $liveSecretKey = "";
	var $currencyCode = "USD";

	function init() {
		parent::init();

		$this->setMode( $this->moduleDBO->loadSetting( "mode" ) );
		$this->setTestPublishableKey( $this->moduleDBO->loadSetting( "test_publishable_key" ) );
		$this->setTestSecretKey( $this->moduleDBO->loadSetting( "test_secret_key" ) );
		$this->setLivePublishableKey( $this->moduleDBO->loadSetting( "live_publishable_key" ) );
		$this->setLiveSecretKey( $this->moduleDBO->loadSetting( "live_secret_key" ) );
		$this->setCurrencyCode( $this->moduleDBO->loadSetting( "currency" ) );
	}

	function install() {
		parent::install();
		$this->saveSettings();
	}

	function saveSettings() {
		$this->moduleDBO->saveSetting( "mode", $this->getMode() );
		$this->moduleDBO->saveSetting( "test_publishable_key", $this->getTestPublishableKey() );
		$this->moduleDBO->saveSetting( "test_secret_key", $this->getTestSecretKey() );
		$this->moduleDBO->saveSetting( "live_publishable_key", $this->getLivePublishableKey() );
		$this->moduleDBO->saveSetting( "live_secret_key", $this->getLiveSecretKey() );
		$this->moduleDBO->saveSetting( "currency", $this->getCurrencyCode() );
	}

	function getMode() {
		return $this->mode;
	}

	function getTestPublishableKey() {
		return $this->testPublishableKey;
	}

	function getTestSecretKey() {
		return $this->testSecretKey;
	}

	function getLivePublishableKey() {
		return $this->livePublishableKey;
	}

	function getLiveSecretKey() {
		return $this->liveSecretKey;
	}

	function getCurrencyCode() {
		return $this->currencyCode;
	}

	function getPublishableKey() {
		return $this->getMode() == STRIPE_MODE_LIVE ?
				$this->getLivePublishableKey() :
				$this->getTestPublishableKey();
	}

	function getSecretKey() {
		return $this->getMode() == STRIPE_MODE_LIVE ?
				$this->getLiveSecretKey() :
				$this->getTestSecretKey();
	}

	function setMode( $mode ) {
		if ( $mode != STRIPE_MODE_LIVE && $mode != STRIPE_MODE_TEST ) {
			$mode = STRIPE_MODE_TEST;
		}
		$this->mode = $mode;
	}

	function setTestPublishableKey( $key ) {
		$this->testPublishableKey = trim( (string) $key );
	}

	function setTestSecretKey( $key ) {
		$this->testSecretKey = trim( (string) $key );
	}

	function setLivePublishableKey( $key ) {
		$this->livePublishableKey = trim( (string) $key );
	}

	function setLiveSecretKey( $key ) {
		$this->liveSecretKey = trim( (string) $key );
	}

	function setCurrencyCode( $currencyCode ) {
		$currencyCode = strtoupper( trim( (string) $currencyCode ) );
		$this->currencyCode = $currencyCode == "" ? "USD" : $currencyCode;
	}

	function createCheckoutSession( $order, $successURL, $cancelURL ) {
		$secretKey = $this->getSecretKey();
		if ( $secretKey == "" ) {
			throw new SWUserException( "Stripe secret key is not configured." );
		}

		$params = array(
				"mode" => "payment",
				"success_url" => $successURL,
				"cancel_url" => $cancelURL,
				"client_reference_id" => $order->getID(),
				"payment_intent_data[metadata][order_id]" => $order->getID(),
				"metadata[order_id]" => $order->getID() );

		if ( $order->getTotal() <= 0 ) {
			throw new SWUserException( "Stripe checkout cannot be started for a zero-total order." );
		}

		$params["line_items[0][quantity]"] = 1;
		$params["line_items[0][price_data][currency]"] =
				strtolower( (string) $this->getCurrencyCode() );
		$params["line_items[0][price_data][unit_amount]"] = $this->amountToCents( $order->getTotal() );
		$params["line_items[0][price_data][product_data][name]"] = "Order #" . $order->getID();

		return $this->stripeRequest( "POST", STRIPE_CHECKOUT_SESSION_URL, $params );
	}

	function retrieveCheckoutSession( $sessionID ) {
		$sessionID = trim( (string) $sessionID );
		if ( $sessionID == "" ) {
			throw new SWUserException( "Missing Stripe checkout session." );
		}

		return $this->stripeRequest( "GET", STRIPE_CHECKOUT_SESSION_URL . "/" . rawurlencode( $sessionID ), array() );
	}

	function amountToCents( $amount ) {
		return intval( round( floatval( $amount ) * 100 ) );
	}

	function stripeRequest( $method, $url, $params ) {
		if ( !function_exists( "curl_init" ) ) {
			throw new SWUserException( "The PHP cURL extension is required for Stripe checkout." );
		}

		$curl = curl_init();
		$options = array(
				CURLOPT_RETURNTRANSFER => true,
				CURLOPT_USERPWD => $this->getSecretKey() . ":",
				CURLOPT_TIMEOUT => 30 );

		if ( $method == "POST" ) {
			$options[CURLOPT_POST] = true;
			$options[CURLOPT_POSTFIELDS] = http_build_query( $params, "", "&" );
		}

		curl_setopt( $curl, CURLOPT_URL, $url );
		curl_setopt_array( $curl, $options );
		$response = curl_exec( $curl );
		$errno = curl_errno( $curl );
		$error = curl_error( $curl );
		$status = curl_getinfo( $curl, CURLINFO_HTTP_CODE );
		curl_close( $curl );

		if ( $errno ) {
			throw new SWUserException( "Stripe request failed: " . $error );
		}

		$data = json_decode( $response, true );
		if ( !is_array( $data ) ) {
			throw new SWUserException( "Stripe returned an invalid response." );
		}

		if ( $status < 200 || $status >= 300 ) {
			$message = isset( $data['error']['message'] ) ?
					$data['error']['message'] :
					"Stripe request failed.";
			throw new SWUserException( $message );
		}

		return $data;
	}
}
?>
