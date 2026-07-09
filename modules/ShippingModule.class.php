<?php
/**
 * ShippingModule.class.php
 *
 * Base class for carrier/shipping modules.
 */

require_once BASE_PATH . "modules/SolidStateModule.class.php";

abstract class ShippingModule extends SolidStateModule {
	/**
	 * @var string Module type is shipping
	 */
	protected $type = "shipping";

	/**
	 * Get Rates
	 *
	 * @param array $shipment Carrier-specific shipment data
	 */
	function getRates( $shipment ) {
		throw new ModuleOperatinNotSupported( "getRates" );
	}

	/**
	 * Track Shipment
	 *
	 * @param string $trackingNumber Carrier tracking number
	 */
	function trackShipment( $trackingNumber ) {
		throw new ModuleOperatinNotSupported( "trackShipment" );
	}
}
?>
