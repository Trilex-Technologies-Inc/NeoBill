<?php
/**
 * UPS shipping module.
 */

require_once BASE_PATH . "modules/ShippingModule.class.php";

define( "UPS_MODE_SANDBOX", "sandbox" );
define( "UPS_MODE_LIVE", "live" );
define( "UPS_SANDBOX_BASE_URL", "https://wwwcie.ups.com" );
define( "UPS_LIVE_BASE_URL", "https://onlinetools.ups.com" );

class ups extends ShippingModule {
	var $configPage = "ups_config";
	var $description = "UPS Shipping Module";
	var $name = "ups";
	var $sDescription = "UPS Shipping";
	var $version = 1;

	var $mode = UPS_MODE_SANDBOX;
	var $clientID = "";
	var $clientSecret = "";
	var $shipperNumber = "";
	var $accountCountry = "US";
	var $accountPostalCode = "";
	var $currencyCode = "USD";
	var $defaultServiceCode = "03";
	var $defaultPackagingCode = "02";
	var $weightUnit = "LBS";
	var $dimensionUnit = "IN";

	function init() {
		parent::init();

		$this->setMode( $this->moduleDBO->loadSetting( "mode" ) );
		$this->setClientID( $this->moduleDBO->loadSetting( "client_id" ) );
		$this->setClientSecret( $this->moduleDBO->loadSetting( "client_secret" ) );
		$this->setShipperNumber( $this->moduleDBO->loadSetting( "shipper_number" ) );
		$this->setAccountCountry( $this->moduleDBO->loadSetting( "account_country" ) );
		$this->setAccountPostalCode( $this->moduleDBO->loadSetting( "account_postal_code" ) );
		$this->setCurrencyCode( $this->moduleDBO->loadSetting( "currency" ) );
		$this->setDefaultServiceCode( $this->moduleDBO->loadSetting( "default_service_code" ) );
		$this->setDefaultPackagingCode( $this->moduleDBO->loadSetting( "default_packaging_code" ) );
		$this->setWeightUnit( $this->moduleDBO->loadSetting( "weight_unit" ) );
		$this->setDimensionUnit( $this->moduleDBO->loadSetting( "dimension_unit" ) );
	}

	function install() {
		parent::install();
		$this->saveSettings();
	}

	function saveSettings() {
		$this->moduleDBO->saveSetting( "mode", $this->getMode() );
		$this->moduleDBO->saveSetting( "client_id", $this->getClientID() );
		$this->moduleDBO->saveSetting( "client_secret", $this->getClientSecret() );
		$this->moduleDBO->saveSetting( "shipper_number", $this->getShipperNumber() );
		$this->moduleDBO->saveSetting( "account_country", $this->getAccountCountry() );
		$this->moduleDBO->saveSetting( "account_postal_code", $this->getAccountPostalCode() );
		$this->moduleDBO->saveSetting( "currency", $this->getCurrencyCode() );
		$this->moduleDBO->saveSetting( "default_service_code", $this->getDefaultServiceCode() );
		$this->moduleDBO->saveSetting( "default_packaging_code", $this->getDefaultPackagingCode() );
		$this->moduleDBO->saveSetting( "weight_unit", $this->getWeightUnit() );
		$this->moduleDBO->saveSetting( "dimension_unit", $this->getDimensionUnit() );
	}

	function getMode() {
		return $this->mode;
	}

	function getClientID() {
		return $this->clientID;
	}

	function getClientSecret() {
		return $this->clientSecret;
	}

	function getShipperNumber() {
		return $this->shipperNumber;
	}

	function getAccountCountry() {
		return $this->accountCountry;
	}

	function getAccountPostalCode() {
		return $this->accountPostalCode;
	}

	function getCurrencyCode() {
		return $this->currencyCode;
	}

	function getDefaultServiceCode() {
		return $this->defaultServiceCode;
	}

	function getDefaultPackagingCode() {
		return $this->defaultPackagingCode;
	}

	function getWeightUnit() {
		return $this->weightUnit;
	}

	function getDimensionUnit() {
		return $this->dimensionUnit;
	}

	function getBaseURL() {
		return $this->getMode() == UPS_MODE_LIVE ?
				UPS_LIVE_BASE_URL :
				UPS_SANDBOX_BASE_URL;
	}

	function setMode( $mode ) {
		if ( $mode != UPS_MODE_LIVE && $mode != UPS_MODE_SANDBOX ) {
			$mode = UPS_MODE_SANDBOX;
		}
		$this->mode = $mode;
	}

	function setClientID( $clientID ) {
		$this->clientID = trim( (string) $clientID );
	}

	function setClientSecret( $clientSecret ) {
		$this->clientSecret = trim( (string) $clientSecret );
	}

	function setShipperNumber( $shipperNumber ) {
		$this->shipperNumber = trim( (string) $shipperNumber );
	}

	function setAccountCountry( $country ) {
		$country = strtoupper( trim( (string) $country ) );
		$this->accountCountry = $country == "" ? "US" : $country;
	}

	function setAccountPostalCode( $postalCode ) {
		$this->accountPostalCode = trim( (string) $postalCode );
	}

	function setCurrencyCode( $currencyCode ) {
		$currencyCode = strtoupper( trim( (string) $currencyCode ) );
		$this->currencyCode = $currencyCode == "" ? "USD" : $currencyCode;
	}

	function setDefaultServiceCode( $serviceCode ) {
		$serviceCode = trim( (string) $serviceCode );
		$this->defaultServiceCode = $serviceCode == "" ? "03" : $serviceCode;
	}

	function setDefaultPackagingCode( $packagingCode ) {
		$packagingCode = trim( (string) $packagingCode );
		$this->defaultPackagingCode = $packagingCode == "" ? "02" : $packagingCode;
	}

	function setWeightUnit( $weightUnit ) {
		$weightUnit = strtoupper( trim( (string) $weightUnit ) );
		$this->weightUnit = $weightUnit == "" ? "LBS" : $weightUnit;
	}

	function setDimensionUnit( $dimensionUnit ) {
		$dimensionUnit = strtoupper( trim( (string) $dimensionUnit ) );
		$this->dimensionUnit = $dimensionUnit == "" ? "IN" : $dimensionUnit;
	}

	function getRates( $shipment ) {
		$this->validateConfigured();
		$request = $this->buildRateRequest( $shipment );
		return $this->upsRequest( "POST", "/api/rating/v2403/Rate", $request );
	}

	function trackShipment( $trackingNumber ) {
		$this->validateConfigured();
		$trackingNumber = trim( (string) $trackingNumber );
		if ( $trackingNumber == "" ) {
			throw new SWUserException( "Missing UPS tracking number." );
		}

		return $this->upsRequest( "GET", "/api/track/v1/details/" . rawurlencode( $trackingNumber ), null );
	}

	function getAccessToken() {
		$this->validateConfigured();

		$headers = array(
				"Content-Type: application/x-www-form-urlencoded",
				"Authorization: Basic " . base64_encode( $this->getClientID() . ":" . $this->getClientSecret() ) );

		$response = $this->curlRequest(
				"POST",
				$this->getBaseURL() . "/security/v1/oauth/token",
				"grant_type=client_credentials",
				$headers );

		if ( !isset( $response['access_token'] ) ) {
			throw new SWUserException( "UPS did not return an access token." );
		}

		return $response['access_token'];
	}

	function buildRateRequest( $shipment ) {
		$shipper = isset( $shipment['shipper'] ) ?
				$shipment['shipper'] :
				$this->getConfiguredShipper();
		$shipFrom = isset( $shipment['ship_from'] ) ?
				$shipment['ship_from'] :
				$shipper;
		$shipTo = isset( $shipment['ship_to'] ) ?
				$shipment['ship_to'] :
				null;

		if ( !is_array( $shipTo ) ) {
			throw new SWUserException( "UPS rate request requires a ship_to address." );
		}

		$packages = isset( $shipment['packages'] ) ?
				$shipment['packages'] :
				array();
		if ( count( $packages ) == 0 ) {
			throw new SWUserException( "UPS rate request requires at least one package." );
		}

		$packagePayload = array();
		foreach ( $packages as $package ) {
			$packagePayload[] = $this->buildPackage( $package );
		}

		$requestOption = isset( $shipment['request_option'] ) ?
				$shipment['request_option'] :
				"Rate";
		$serviceCode = isset( $shipment['service_code'] ) ?
				$shipment['service_code'] :
				$this->getDefaultServiceCode();

		return array(
				"RateRequest" => array(
						"Request" => array(
								"TransactionReference" => array(
										"CustomerContext" => "NeoBill UPS rate request" ) ),
						"Shipment" => array(
								"Shipper" => $this->buildAddressNode( $shipper, true ),
								"ShipTo" => $this->buildAddressNode( $shipTo, false ),
								"ShipFrom" => $this->buildAddressNode( $shipFrom, false ),
								"PaymentDetails" => array(
										"ShipmentCharge" => array(
												"Type" => "01",
												"BillShipper" => array(
														"AccountNumber" => $this->getShipperNumber() ) ) ),
								"Service" => array( "Code" => $serviceCode ),
								"Package" => $packagePayload ),
						"PickupType" => array(
								"Code" => isset( $shipment['pickup_type'] ) ?
										$shipment['pickup_type'] :
										"01" ),
						"CustomerClassification" => array(
								"Code" => isset( $shipment['customer_classification'] ) ?
										$shipment['customer_classification'] :
										"01" ),
						"ShipmentRatingOptions" => array(
								"NegotiatedRatesIndicator" => "" ),
						"RequestOption" => $requestOption ) );
	}

	function buildAddressNode( $address, $includeShipperNumber ) {
		$node = array(
				"Name" => isset( $address['name'] ) ? $address['name'] : "NeoBill",
				"Address" => array(
						"AddressLine" => isset( $address['address_lines'] ) ?
								$address['address_lines'] :
								array(),
						"City" => isset( $address['city'] ) ? $address['city'] : "",
						"StateProvinceCode" => isset( $address['state'] ) ? $address['state'] : "",
						"PostalCode" => isset( $address['postal_code'] ) ? $address['postal_code'] : "",
						"CountryCode" => isset( $address['country'] ) ? $address['country'] : "US" ) );

		if ( $includeShipperNumber ) {
			$node["ShipperNumber"] = $this->getShipperNumber();
		}

		return $node;
	}

	function buildPackage( $package ) {
		$weight = isset( $package['weight'] ) ? $package['weight'] : 1;
		$packagingCode = isset( $package['packaging_code'] ) ?
				$package['packaging_code'] :
				$this->getDefaultPackagingCode();

		$payload = array(
				"PackagingType" => array( "Code" => $packagingCode ),
				"PackageWeight" => array(
						"UnitOfMeasurement" => array( "Code" => $this->getWeightUnit() ),
						"Weight" => sprintf( "%.2f", $weight ) ) );

		if ( isset( $package['length'] ) &&
				isset( $package['width'] ) &&
				isset( $package['height'] ) ) {
			$payload["Dimensions"] = array(
					"UnitOfMeasurement" => array( "Code" => $this->getDimensionUnit() ),
					"Length" => sprintf( "%.2f", $package['length'] ),
					"Width" => sprintf( "%.2f", $package['width'] ),
					"Height" => sprintf( "%.2f", $package['height'] ) );
		}

		return $payload;
	}

	function getConfiguredShipper() {
		return array(
				"name" => "NeoBill",
				"address_lines" => array(),
				"city" => "",
				"state" => "",
				"postal_code" => $this->getAccountPostalCode(),
				"country" => $this->getAccountCountry() );
	}

	function upsRequest( $method, $path, $payload ) {
		$headers = array(
				"Authorization: Bearer " . $this->getAccessToken(),
				"Content-Type: application/json",
				"Accept: application/json",
				"transId: " . uniqid( "neobill-", true ),
				"transactionSrc: NeoBill" );

		$body = $payload === null ? null : json_encode( $payload );
		return $this->curlRequest( $method, $this->getBaseURL() . $path, $body, $headers );
	}

	function curlRequest( $method, $url, $body, $headers ) {
		if ( !function_exists( "curl_init" ) ) {
			throw new SWUserException( "The PHP cURL extension is required for UPS shipping." );
		}

		$curl = curl_init();
		$options = array(
				CURLOPT_URL => $url,
				CURLOPT_RETURNTRANSFER => true,
				CURLOPT_TIMEOUT => 30,
				CURLOPT_HTTPHEADER => $headers );

		if ( $method == "POST" ) {
			$options[CURLOPT_POST] = true;
			$options[CURLOPT_POSTFIELDS] = $body;
		}

		curl_setopt_array( $curl, $options );
		$response = curl_exec( $curl );
		$errno = curl_errno( $curl );
		$error = curl_error( $curl );
		$status = curl_getinfo( $curl, CURLINFO_HTTP_CODE );
		curl_close( $curl );

		if ( $errno ) {
			throw new SWUserException( "UPS request failed: " . $error );
		}

		$data = json_decode( $response, true );
		if ( !is_array( $data ) ) {
			throw new SWUserException( "UPS returned an invalid response." );
		}

		if ( $status < 200 || $status >= 300 ) {
			$message = isset( $data['response']['errors'][0]['message'] ) ?
					$data['response']['errors'][0]['message'] :
					"UPS request failed.";
			throw new SWUserException( $message );
		}

		return $data;
	}

	function validateConfigured() {
		if ( $this->getClientID() == "" ||
				$this->getClientSecret() == "" ||
				$this->getShipperNumber() == "" ) {
			throw new SWUserException( "UPS client ID, client secret, and shipper number must be configured." );
		}
	}
}
?>
