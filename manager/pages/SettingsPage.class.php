<?php
/**
 * SettingsPage.class.php
 *
 * This file contains the definition for the SettingsPage class
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 * @copyright John Diamond <jdiamond@solid-state.org>
 * @license http://www.opensource.org/licenses/gpl-license.php GNU Public License
 */

require BASE_PATH . "include/SolidStateAdminPage.class.php";
require_once BASE_PATH . "solidworks/Email.class.php";

/**
 * SettingsPage
 *
 * View SolidState Settings page
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 */
class SettingsPage extends SolidStateAdminPage {
	/**
	 * Initialize Settings Page
	 */
	public function init() {
		parent::init();

		$this->smarty->assign( "company_name", $this->conf['company']['name'] ?? 'NeoBill' );
		$this->smarty->assign( "company_email", $this->conf['company']['email'] ?? '' );
		$this->smarty->assign( "company_notification_email",
				$this->conf['company']['notification_email'] ?? '' );
		$this->smarty->assign( "mail_transport", $this->conf['mail']['transport'] ?? 'mail' );
		$this->smarty->assign( "smtp_host", $this->conf['mail']['smtp']['host'] ?? '' );
		$this->smarty->assign( "smtp_port", $this->conf['mail']['smtp']['port'] ?? 587 );
		$this->smarty->assign( "smtp_encryption", $this->conf['mail']['smtp']['encryption'] ?? 'tls' );
		$this->smarty->assign( "smtp_username", $this->conf['mail']['smtp']['username'] ?? '' );

		$this->smarty->assign( "confirmation_subject",
				$this->conf['order']['confirmation_subject'] ?? '' );
		$this->smarty->assign( "confirmation_email",
				$this->conf['order']['confirmation_email'] ?? '' );

		$this->smarty->assign( "notification_subject",
				$this->conf['order']['notification_subject'] ?? '' );
		$this->smarty->assign( "notification_email",
				$this->conf['order']['notification_email'] ?? '' );

		$this->smarty->assign( "welcome_subject", $this->conf['welcome_subject'] ?? '' );
		$this->smarty->assign( "welcome_email", $this->conf['welcome_email'] ?? '' );

		$this->smarty->assign( "invoice_text", $this->conf['invoice_text'] ?? '' );
		$this->smarty->assign( "invoice_subject", $this->conf['invoice_subject'] ?? '' );

		$this->smarty->assign( "currency", $this->conf['locale']['currency_symbol'] ?? '$' );
		$this->smarty->assign( "localeLanguage", $this->conf['locale']['language'] ?? 'english' );

		$this->smarty->assign( "default_gateway", $this->conf['payment_gateway']['default_module'] ?? '' );

		$this->smarty->assign( "order_title", $this->conf['order']['title'] ?? '' );
		$this->smarty->assign( "order_accept_checks",
				!empty($this->conf['order']['accept_checks']) ? "true" : "false" );
		$this->smarty->assign( "order_tos_required",
				!empty($this->conf['order']['tos_required']) ? "true" : "false" );
		$this->smarty->assign( "order_tos_url", $this->conf['order']['tos_url'] ?? '' );

		$this->smarty->assign( "managerTheme", $this->conf['themes']['manager'] ?? 'default' );
		$this->smarty->assign( "orderTheme", $this->conf['themes']['order'] ?? 'default' );

		// This flag indicates if any payment_gateway modules are enabled
		$modules = $this->forms['settings_payment_gateway']->getField( "default_module" )->getWidget()->getData();
		$this->smarty->assign( "gatewaysAreEnabled", !empty( $modules ) );

		// Setup the theme select boxes
		$mtField = $this->forms['settings_themes']->getField( "managertheme" );
		$otField = $this->forms['settings_themes']->getField( "ordertheme" );
		$mtField->getWidget()->setType( "manager" );
		$otField->getWidget()->setType( "order" );
		$mtField->getValidator()->setType( "manager" );
		$otField->getValidator()->setType( "order" );
	}

	/**
	 * Action
	 *
	 * Actions handled by this page:
	 *   general
	 *   dns
	 *   billing
	 *   locale
	 *   order
	 *   settings_company (form)
	 *   settings_welcome (form)
	 *
	 * @param string $action_name Action
	 */
	function action( $action_name ) {
		switch( $action_name ) {
			case "settings_general":
				$this->updateGeneral();
				break;

			case "settings_themes":
				$this->updateThemes();
				break;

			case "settings_invoice":
				$this->update_invoice();
				break;

			case "settings_locale":
				$this->update_locale();
				break;

			case "settings_payment_gateway":
				$this->update_payment_gateway();
				break;

			case "settings_order_interface":
				$this->updateOrderInterface();
				break;

			default:
				// No matching action, refer to base class
				parent::action( $action_name );
		}
	}

	/**
	 * Update General Settings
	 */
	function updateGeneral() {
		// Company
		$this->conf['company']['name'] = $this->post['name'];
		$this->conf['company']['email'] = $this->post['email'];
		$this->conf['company']['notification_email'] = $this->post['notification_email'];
		$this->conf['mail']['transport'] = $this->post['mail_transport'];
		$this->conf['mail']['smtp']['host'] = trim( (string)( $this->post['smtp_host'] ?? '' ) );
		$this->conf['mail']['smtp']['port'] = (int)( $this->post['smtp_port'] ?? 587 );
		$this->conf['mail']['smtp']['encryption'] = $this->post['smtp_encryption'] ?? 'tls';
		$this->conf['mail']['smtp']['username'] = trim( (string)( $this->post['smtp_username'] ?? '' ) );
		$smtpPassword = (string)( $this->post['smtp_password'] ?? '' );
		if ( $smtpPassword !== '' ) {
			$this->conf['mail']['smtp']['password'] = $smtpPassword;
		}

		// Welcome E-mail
		$this->conf['welcome_subject'] = $this->post['welcome_subject'];
		$this->conf['welcome_email'] = $this->post['welcome_email'];

		// Order Confirmation E-mail
		$this->conf['order']['confirmation_subject'] = $this->post['confirm_subject'];
		$this->conf['order']['confirmation_email'] = $this->post['confirm_email'];

		// Order Notice E-mail
		$this->conf['order']['notification_subject'] = $this->post['notify_subject'];
		$this->conf['order']['notification_email'] = $this->post['notify_email'];

		$this->save();
		if ( isset( $this->post['test_smtp'] ) ) {
			$this->testSMTP();
		}
		$this->smarty->assign( "tab", "general" );
	}

	/**
	 * Send a diagnostic message using the saved mail configuration.
	 */
	function testSMTP() {
		$recipient = trim( (string)( $this->conf['company']['email'] ?? '' ) );
		$email = new Email();
		$email->addRecipient( $recipient );
		$email->setFrom( $recipient, $this->conf['company']['name'] ?? 'NeoBill' );
		$email->setSubject( 'NeoBill SMTP test' );
		$email->setBody( "Your NeoBill SMTP settings are working.\n\nSent: " . date( 'Y-m-d H:i:s T' ) );

		if ( $email->send() ) {
			$this->setMessage( array( "type" => "[SMTP_TEST_SENT]", "args" => array( $recipient ) ) );
			return;
		}

		$error = $email->getLastError();
		$this->setError( array( "type" => "[SMTP_TEST_FAILED]", "args" => array(
				htmlspecialchars( $error !== '' ? $error : 'The selected mail transport returned an error.',
						ENT_QUOTES, 'UTF-8' ) ) ) );
	}

	/**
	 * Update Theme Settings
	 */
	function updateThemes() {
		$this->conf['themes']['manager'] = $this->post['managertheme'];
		$this->conf['themes']['order'] = $this->post['ordertheme'];
		$this->save();
		$this->smarty->assign( "tab", "themes" );
		$this->reload();
	}

	function updateOrderInterface() {
		$this->conf['order']['title'] = $this->post['title'];
		$this->conf['order']['accept_checks'] = $this->post['accept_checks'];
		$this->conf['order']['tos_required'] = $this->post['tos_required'];
		$this->conf['order']['tos_url'] = $this->post['tos_url'];
		$this->save();
		$this->smarty->assign( "tab", "order_interface" );
	}

	/**
	 * Update Invoice
	 */
	function update_invoice() {
		$this->conf['invoice_text'] = $this->post['text'];
		$this->conf['invoice_subject'] = $this->post['subject'];
		$this->save();
		$this->smarty->assign( "tab", "billing" );
	}

	/**
	 * Update Locale
	 */
	function update_locale() {
		$this->conf['locale']['currency_symbol'] = $this->post['currency'];
		$this->conf['locale']['language'] = $this->post['language'];
		$this->save();

		// The manager UI follows the logged-in user's language preference. Keep
		// that preference in sync when an administrator changes the locale here.
		if ( !empty( $_SESSION['client']['userdbo'] ) ) {
			$_SESSION['client']['userdbo']->setLanguage( $this->post['language'] );
			update_UserDBO( $_SESSION['client']['userdbo'] );
			TranslationParser::load( ($this->conf['application_dir'] ?? BASE_PATH . 'manager') .
					"/language/" . $this->post['language'] );
			Translator::getTranslator()->setActiveLanguage( $this->post['language'] );
		}
		$_SESSION['jsFunction'] = "reloadMenu()";
		$this->smarty->assign( "tab", "locale" );
	}

	/**
	 * Update Payment Gateway
	 */
	function update_payment_gateway() {
		$this->conf['payment_gateway']['default_module'] =
				$this->post['default_module']->getName();
		$this->conf['payment_gateway']['order_method'] = $this->post['order_method'];
		$this->save();
		$this->smarty->assign( "tab", "payment_gateway" );
	}

	/**
	 * Save changes
	 */
	function save() {
		save_settings( $this->conf );
		$this->setMessage( array( "type" => "[SETTINGS_UPDATED]" ) );
	}
}
?>
