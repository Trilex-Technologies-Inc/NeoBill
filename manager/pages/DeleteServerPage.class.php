<?php
/**
 * DeleteServerPage.class.php
 *
 * This file contains the definition for the DeleteServerPage class
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 * @copyright John Diamond <jdiamond@solid-state.org>
 * @license http://www.opensource.org/licenses/gpl-license.php GNU Public License
 */

// Include the parent class
require BASE_PATH . "include/SolidStateAdminPage.class.php";

/**
 * DeleteServerPage
 *
 * Delete a Server
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 */
class DeleteServerPage extends SolidStateAdminPage {
	/**
	 * Initialize Delete Server Page
	 */
	function init() {
		throw new SWUserException( "Server management has been disabled." );
	}

	/**
	 * Action
	 *
	 * Actions handled by this page:
	 *   delete_server (form)
	 *
	 * @param string $action_name Action
	 */
	function action( $action_name ) {
		throw new SWUserException( "Server management has been disabled." );
	}
}
?>
