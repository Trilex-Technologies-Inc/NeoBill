<?php
/**
 * BrowseInvoicesPage.class.php
 *
 * This file contains the definition for the Browse Invoices Page class
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 * @copyright John Diamond <jdiamond@solid-state.org>
 * @license http://www.opensource.org/licenses/gpl-license.php GNU Public License
 */

// Include the parent class
require_once BASE_PATH . "include/SolidStatePage.class.php";

require_once BASE_PATH . "util/billing.php";

/**
 * BrowseInvoicesPage
 *
 * Display all Invoices
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 */
class BrowseInvoicesPage extends SolidStatePage {
	/**
	 * Initialize Browse Invoices Page
	 */
	function init() {
		parent::init();

		$invoice_count = 0;
		try {
			$invoice_count = count( load_array_InvoiceDBO() );
		}
		catch( DBNoRowsFoundException $e ) {

		}

		$stats = outstanding_invoices_stats();
		$this->smarty->assign( "invoice_count",                 $invoice_count );
		$this->smarty->assign( "os_invoices_count",             $stats['count'] );
		$this->smarty->assign( "os_invoices_total",             $stats['total'] );
		$this->smarty->assign( "os_invoices_count_past_due",    $stats['count_past_due'] );
		$this->smarty->assign( "os_invoices_total_past_due",    $stats['total_past_due'] );
	}

	/**
	 * Action
	 *
	 * Actions handled by this page:
	 *   browse_invoices_action (form)
	 *
	 * @param string $action_name Action
	 */
	function action( $action_name ) {
		switch( $action_name ) {
			case "browse_invoices_action":
				// Create a new invoice
				$this->gotoPage( "accounts_add_invoice" );
				break;

			case "search_invoices":
				$this->searchTable( "browse_invoices", "invoices", $this->post );
				break;

			default:
				// No matching action, refer to base class
				parent::action( $action_name );
		}
	}
}
?>
