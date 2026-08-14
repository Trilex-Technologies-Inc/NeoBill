<?php
/**
 * Starts a Stripe hosted checkout session.
 */

require_once BASE_PATH . "include/SolidStatePage.class.php";
require_once BASE_PATH . "DBO/OrderDBO.class.php";

class StripeCheckoutPage extends SolidStatePage {
	var $stripeModule;

	function action( $action_name ) {
		switch ( $action_name ) {
			case "stripe_checkout":
				if ( isset( $this->post['pay'] ) ) {
					$this->startCheckout();
				}
				elseif ( isset( $this->post['back'] ) ) {
					$this->gotoPage( "review" );
				}
				elseif ( isset( $this->post['startover'] ) ) {
					$this->newOrder();
				}
				break;
			default:
				parent::action( $action_name );
		}
	}

	function init() {
		parent::init();
		if ( empty( $_SESSION['order'] ) ) {
			throw new SWUserException( "No active order was found." );
		}

		$registry = ModuleRegistry::getModuleRegistry();
		$this->stripeModule = $registry->getModule( "stripe" );
		$this->smarty->assign( "currencyCode", $this->stripeModule->getCurrencyCode() );
		$this->smarty->assign( "mode", $this->stripeModule->getMode() );
		$this->smarty->assign( "orderid", $_SESSION['order']->getID() );
		$this->smarty->assign( "amount", $_SESSION['order']->getTotal() );
	}

	function startCheckout() {
		$successURL = $this->absoluteOrderURL( "stripe_return", "session_id={CHECKOUT_SESSION_ID}" );
		$cancelURL = $this->absoluteOrderURL( "review", "" );
		$session = $this->stripeModule->createCheckoutSession( $_SESSION['order'], $successURL, $cancelURL );

		if ( !isset( $session['url'] ) || $session['url'] == "" ) {
			throw new SWUserException( "Stripe did not return a checkout URL." );
		}

		header( "Location: " . $session['url'] );
		exit;
	}

	function absoluteOrderURL( $page, $query ) {
		$scheme = ( isset( $_SERVER['HTTPS'] ) && $_SERVER['HTTPS'] == "on" ) ? "https" : "http";
		$host = $_SERVER['HTTP_HOST'] ?? 'localhost';
		$path = dirname( $_SERVER['SCRIPT_NAME'] ?? '/order/index.php' );
		$url = $scheme . "://" . $host . $path . "/index.php?page=" . $page;
		if ( $query != "" ) {
			$url .= "&" . $query;
		}
		return $url;
	}

	function newOrder() {
		unset( $_SESSION['order'] );
		$this->gotoPage( "cart" );
	}
}
?>
