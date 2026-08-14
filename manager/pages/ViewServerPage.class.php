<?php
/**
 * ViewServerPage.class.php
 *
 * This file contains the definition for the ViewServerPage class
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 * @copyright John Diamond <jdiamond@solid-state.org>
 * @license http://www.opensource.org/licenses/gpl-license.php GNU Public License
 */

// Include the parent class
require BASE_PATH . "include/SolidStatePage.class.php";

/**
 * ViewServerPage
 *
 * Display a Server
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 */
class ViewServerPage extends SolidStatePage {
	/**
	 * Initialize View Server Page
	 */
	function init() {
		throw new SWUserException( "Server management has been disabled." );
	}

	/**
	 * Action
	 *
	 * Actions handled by this page:
	 *   info
	 *   ips
	 *   delete_ip
	 *   view_server_add_ip (form)
	 *
	 * @param string $action_name Action
	 */
	function action( $action_name ) {
		throw new SWUserException( "Server management has been disabled." );
	}
}

?>
