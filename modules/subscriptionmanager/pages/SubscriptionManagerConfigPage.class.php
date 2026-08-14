<?php
/**
 * Subscription Manager configuration page.
 */

require_once BASE_PATH . "include/SolidStateAdminPage.class.php";

class SubscriptionManagerConfigPage extends SolidStateAdminPage {
	var $subscriptionManagerModule;

	function action( $action_name ) {
		switch ( $action_name ) {
			case "subscriptionmanager_config":
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
		$this->subscriptionManagerModule = $registry->getModule( "subscriptionmanager" );

		$this->smarty->assign( "invoice_terms", $this->subscriptionManagerModule->getInvoiceTerms() );
		$this->smarty->assign( "retry_schedule", $this->subscriptionManagerModule->getRetrySchedule() );
		$this->smarty->assign( "failed_payment_subject", $this->subscriptionManagerModule->getFailedPaymentSubject() );
		$this->smarty->assign( "failed_payment_email", $this->subscriptionManagerModule->getFailedPaymentEmail() );
		$this->smarty->assign( "card_update_url", $this->subscriptionManagerModule->getCardUpdateUrl() );
	}

	function save() {
		$this->subscriptionManagerModule->setInvoiceTerms( $this->post['invoice_terms'] );
		$this->subscriptionManagerModule->setRetrySchedule( $this->post['retry_schedule'] );
		$this->subscriptionManagerModule->setFailedPaymentSubject( $this->post['failed_payment_subject'] );
		$this->subscriptionManagerModule->setFailedPaymentEmail( $this->post['failed_payment_email'] );
		$this->subscriptionManagerModule->setCardUpdateUrl( $this->post['card_update_url'] );
		$this->subscriptionManagerModule->saveSettings();

		$this->setMessage( array( "type" => "[SUBSCRIPTION_MANAGER_CONFIGURATION_SAVED]" ) );
	}
}
?>
