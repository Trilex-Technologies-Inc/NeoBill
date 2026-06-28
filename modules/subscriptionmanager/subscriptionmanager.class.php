<?php
/**
 * Subscription Manager module.
 *
 * Provides the installable base for subscription billing, trials, discounts,
 * usage records, proration, and dunning management.
 */

require_once BASE_PATH . "modules/SolidStateModule.class.php";
require_once BASE_PATH . "modules/subscriptionmanager/lib/SubscriptionBillingService.class.php";

class subscriptionmanager extends SolidStateModule {
	var $configPage = "subscriptionmanager_config";
	var $description = "Subscription Management and Recurring Billing Module";
	var $name = "subscriptionmanager";
	var $sDescription = "Subscriptions";
	var $type = "billing";

	var $invoiceTerms = 7;
	var $retrySchedule = "1,3,5";
	var $failedPaymentSubject = "Payment failed for invoice #{invoice_id}";
	var $failedPaymentEmail = "We could not process your subscription payment. Please update your card here: {card_update_url}";
	var $cardUpdateUrl = "";

	function init() {
		parent::init();

		$this->invoiceTerms = $this->moduleDBO->loadSetting( "invoice_terms" );
		$this->retrySchedule = $this->moduleDBO->loadSetting( "retry_schedule" );
		$this->failedPaymentSubject = $this->moduleDBO->loadSetting( "failed_payment_subject" );
		$this->failedPaymentEmail = $this->moduleDBO->loadSetting( "failed_payment_email" );
		$this->cardUpdateUrl = $this->moduleDBO->loadSetting( "card_update_url" );

		if ( class_exists( "SolidStateMenu", false ) ) {
			$menu = SolidStateMenu::getSolidStateMenu();
			$pages = array(
					"subscriptionmanager_plans" => "Create Plan",
					"subscriptionmanager_subscriptions" => "Create Subscription",
					"subscriptionmanager_usage" => "Record Usage",
					"subscriptionmanager_billing" => "Run Billing",
					"subscriptionmanager_dunning" => "Dunning Queue" );
			foreach ( $pages as $page => $title ) {
				$menu->addItem( new SolidStateMenuItem(
						$page,
						$title,
						null,
						"manager_content.php?page=" . $page ),
						"modules" );
			}
		}
	}

	function install() {
		parent::install();
		$this->createTables();
		$this->saveSettings();
	}

	function createTables() {
		$this->runSqlFile( BASE_PATH . "modules/subscriptionmanager/sql/install.sql" );
	}

	function uninstallTables() {
		$this->runSqlFile( BASE_PATH . "modules/subscriptionmanager/sql/uninstall.sql" );
	}

	function runSqlFile( $file ) {
		$DB = DBConnection::getDBConnection();
		$sql = file_get_contents( $file );
		$statements = explode( ";", $sql );

		foreach ( $statements as $statement ) {
			$statement = trim( $statement );
			if ( $statement == "" || substr( $statement, 0, 2 ) == "--" ) {
				continue;
			}

			if ( !mysql_query( $statement, $DB->handle() ) ) {
				throw new ModuleInstallFailedException(
						"subscriptionmanager",
						mysql_error( $DB->handle() ) );
			}
		}
	}

	function saveSettings() {
		$this->moduleDBO->saveSetting( "invoice_terms", $this->invoiceTerms );
		$this->moduleDBO->saveSetting( "retry_schedule", $this->retrySchedule );
		$this->moduleDBO->saveSetting( "failed_payment_subject", $this->failedPaymentSubject );
		$this->moduleDBO->saveSetting( "failed_payment_email", $this->failedPaymentEmail );
		$this->moduleDBO->saveSetting( "card_update_url", $this->cardUpdateUrl );
	}

	function getInvoiceTerms() {
		return $this->invoiceTerms;
	}

	function setInvoiceTerms( $invoiceTerms ) {
		$this->invoiceTerms = intval( $invoiceTerms );
	}

	function getRetrySchedule() {
		return $this->retrySchedule;
	}

	function setRetrySchedule( $retrySchedule ) {
		$this->retrySchedule = $retrySchedule;
	}

	function getFailedPaymentSubject() {
		return $this->failedPaymentSubject;
	}

	function setFailedPaymentSubject( $failedPaymentSubject ) {
		$this->failedPaymentSubject = $failedPaymentSubject;
	}

	function getFailedPaymentEmail() {
		return $this->failedPaymentEmail;
	}

	function setFailedPaymentEmail( $failedPaymentEmail ) {
		$this->failedPaymentEmail = $failedPaymentEmail;
	}

	function getCardUpdateUrl() {
		return $this->cardUpdateUrl;
	}

	function setCardUpdateUrl( $cardUpdateUrl ) {
		$this->cardUpdateUrl = $cardUpdateUrl;
	}

	function getBillingService() {
		return new SubscriptionBillingService( $this );
	}
}
?>
