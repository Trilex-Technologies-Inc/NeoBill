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
		$this->ensureWorkflowSchema();

		$this->invoiceTerms = $this->moduleDBO->loadSetting( "invoice_terms" );
		$this->retrySchedule = $this->moduleDBO->loadSetting( "retry_schedule" );
		$this->failedPaymentSubject = $this->moduleDBO->loadSetting( "failed_payment_subject" );
		$this->failedPaymentEmail = $this->moduleDBO->loadSetting( "failed_payment_email" );
		$this->cardUpdateUrl = $this->moduleDBO->loadSetting( "card_update_url" );

		if ( $this->isEnabled() && class_exists( "SolidStateMenu", false ) ) {
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

	function ensureWorkflowSchema() {
		$DB = DBConnection::getDBConnection();
		$table = mysql_query( "show tables like " . $DB->quote_smart( "subscriptionmanager_subscription" ), $DB->handle() );
		if ( !$table || mysql_num_rows( $table ) == 0 ) {
			return;
		}
		$column = mysql_query( "show columns from subscriptionmanager_subscription like 'sourcepurchaseid'", $DB->handle() );
		if ( $column && mysql_num_rows( $column ) == 0 ) {
			if ( !mysql_query( "alter table subscriptionmanager_subscription add sourcepurchaseid int(11) default null, add key sourcepurchaseid (sourcepurchaseid)", $DB->handle() ) ) {
				throw new DBException( mysql_error( $DB->handle() ) );
			}
		}
		$snapshots = array(
			"billing_type" => "enum('fixed','usage') default null",
			"billing_cycle" => "enum('daily','weekly','monthly','annually') default null",
			"cycle_interval" => "int(10) unsigned default null",
			"amount" => "decimal(20,2) default null",
			"included_quantity" => "decimal(20,4) default null",
			"unit_amount" => "decimal(20,4) default null",
			"intro_amount" => "decimal(20,2) default null",
			"taxable" => "enum('Yes','No') default null" );
		foreach ( $snapshots as $name => $definition ) {
			$column = mysql_query( "show columns from subscriptionmanager_subscription like " . $DB->quote_smart( $name ), $DB->handle() );
			if ( $column && mysql_num_rows( $column ) == 0 &&
					!mysql_query( "alter table subscriptionmanager_subscription add `" . $name . "` " . $definition, $DB->handle() ) ) {
				throw new DBException( mysql_error( $DB->handle() ) );
			}
		}
		mysql_query( "update subscriptionmanager_subscription s join subscriptionmanager_price p on p.id=s.priceid set " .
				"s.billing_type=coalesce(s.billing_type,p.billing_type), s.billing_cycle=coalesce(s.billing_cycle,p.billing_cycle)," .
				"s.cycle_interval=coalesce(s.cycle_interval,p.cycle_interval), s.amount=coalesce(s.amount,p.amount)," .
				"s.included_quantity=coalesce(s.included_quantity,p.included_quantity), s.unit_amount=coalesce(s.unit_amount,p.unit_amount)," .
				"s.intro_amount=coalesce(s.intro_amount,p.intro_amount)," .
				"s.taxable=coalesce(s.taxable,p.taxable) where s.billing_type is null or s.billing_cycle is null or " .
				"s.cycle_interval is null or s.amount is null or s.included_quantity is null or s.unit_amount is null or s.taxable is null", $DB->handle() );
		$sql = "create table if not exists subscriptionmanager_billing_period (" .
				"id int(11) not null auto_increment, subscriptionid int(11) not null default 0," .
				"period_start datetime not null, period_end datetime not null, invoiceid int(11) default null," .
				"status enum('processing','invoiced','no_charge','failed') not null default 'processing'," .
				"created datetime not null, updated datetime not null, primary key (id)," .
				"unique key subscription_period (subscriptionid,period_start), key invoiceid (invoiceid)) default charset=utf8";
		if ( !mysql_query( $sql, $DB->handle() ) ) {
			throw new DBException( mysql_error( $DB->handle() ) );
		}
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
