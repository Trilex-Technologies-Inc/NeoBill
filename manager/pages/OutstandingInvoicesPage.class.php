<?php
/**
 * OutstandingInvoicesPage.class.php
 *
 * This file contains the definition for the Outstanding Invoices Page class
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
 * OutstandingInvoicesPage
 *
 * Display a table of outstanding invoices.
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 */
class OutstandingInvoicesPage extends SolidStatePage {
	/**
	 * Action
	 *
	 * Actions handled by this page:
	 *   none
	 *
	 * @param string $action_name Action
	 */
	function action( $action_name ) {
		switch ( $action_name ) {
			case "outstanding_invoices_action":
			// Create a new invoice
				$this->gotoPage( "accounts_add_invoice" );
				break;

			case "search_outstanding_invoices":
				$this->searchTable( "outstanding_invoices", "invoices", $this->post );
				break;

			default:
				// No matching action, refer to base class
				parent::action( $action_name );
		}
	}

	/**
	 * Initialize Outstanding Invoices Page
	 */
	public function init() {
		parent::init();

		$stats = outstanding_invoices_stats();
		$this->smarty->assign( "os_invoices_count",             $stats['count'] );
		$this->smarty->assign( "os_invoices_total",             $stats['total'] );
		$this->smarty->assign( "os_invoices_count_past_due",    $stats['count_past_due'] );
		$this->smarty->assign( "os_invoices_total_past_due",    $stats['total_past_due'] );
		$this->smarty->assign( "os_invoices_count_past_due_30", $stats['count_past_due_30'] );
		$this->smarty->assign( "os_invoices_total_past_due_30", $stats['total_past_due_30'] );

		// Tell the invoice table widget to only show outstanding invoices
		$widget = $this->forms['outstanding_invoices']->getField( "invoices" )->getWidget();
		$widget->setOutstanding( "Yes" );
	}
}
?>
