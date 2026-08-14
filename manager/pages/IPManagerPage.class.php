<?php
/**
 * IPManagerPage.class.php
 *
 * This file contains the definition for the IPManagerPage class
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 * @copyright John Diamond <jdiamond@solid-state.org>
 * @license http://www.opensource.org/licenses/gpl-license.php GNU Public License
 */

require_once BASE_PATH . "include/SolidStatePage.class.php";

/**
 * IPManagerPage
 *
 * IP Address Management page
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 */
class IPManagerPage extends SolidStatePage {
	function init() {
		throw new SWUserException( "IP address management has been disabled." );
	}

	/**
	 * Action
	 *
	 * Actions handled by this page:
	 *  remove_ip
	 *
	 * @param string $action_name Action
	 */
	function action( $action_name ) {
		throw new SWUserException( "IP address management has been disabled." );
	}
}
?>
