<?php
/**
 * Handles the customer returning from Stripe Checkout.
 */

require_once BASE_PATH . "include/SolidStatePage.class.php";
require_once BASE_PATH . "DBO/OrderDBO.class.php";
require_once BASE_PATH . "DBO/PaymentDBO.class.php";

class StripeReturnPage extends SolidStatePage {
	var $stripeModule;

	function init() {
		parent::init();

		if ( !isset( $this->get['session_id'] ) ) {
			throw new SWUserException( "Missing Stripe checkout session." );
		}

		$registry = ModuleRegistry::getModuleRegistry();
		$this->stripeModule = $registry->getModule( "stripe" );
		$session = $this->stripeModule->retrieveCheckoutSession( $this->get['session_id'] );

		if ( !isset( $session['payment_status'] ) || $session['payment_status'] != "paid" ) {
			throw new SWUserException( "Stripe payment has not completed." );
		}

		$orderID = isset( $session['client_reference_id'] ) ? intval( $session['client_reference_id'] ) : 0;
		if ( !isset( $_SESSION['order'] ) || $_SESSION['order']->getID() != $orderID ) {
			throw new SWUserException( "Stripe payment does not match the current order." );
		}

		$this->recordPayment( $session );
		$_SESSION['order']->complete();
		$this->gotoPage( "receipt" );
	}

	function recordPayment( $session ) {
		$sessionID = $session['id'] ?? null;
		if ( $sessionID === null ) {
			throw new SWUserException( "Stripe did not return a session identifier." );
		}
		if ( $this->paymentExists( $sessionID ) ) {
			return;
		}

		$paymentDBO = new PaymentDBO();
		$paymentDBO->setType( "Module" );
		$paymentDBO->setModule( $this->stripeModule->getName() );
		$paymentDBO->setOrderID( $_SESSION['order']->getID() );
		$paymentDBO->setAmount( $_SESSION['order']->getTotal() );
		$paymentDBO->setStatus( "Completed" );
		$paymentDBO->setStatusMessage( "Stripe Checkout payment completed." );
		$paymentDBO->setDate( DBConnection::format_datetime( time() ) );
		$paymentDBO->setTransaction1( $sessionID );
		if ( isset( $session['payment_intent'] ) ) {
			$paymentDBO->setTransaction2( $session['payment_intent'] );
		}
		add_PaymentDBO( $paymentDBO );
	}

	function paymentExists( $sessionID ) {
		$DB = DBConnection::getDBConnection();
		try {
			$payments = load_array_PaymentDBO( sprintf(
					"transaction1=%s AND module=%s",
					$DB->quote_smart( $sessionID ),
					$DB->quote_smart( $this->stripeModule->getName() ) ) );
			return count( $payments ) > 0;
		}
		catch ( DBNoRowsFoundException $e ) {
			return false;
		}
	}
}
?>
