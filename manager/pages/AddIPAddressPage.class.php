<?php
/**
 * AddIPAddressPage.class.php
 *
 * This file contains the definition for the AddIPAddressPage class
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 * @copyright John Diamond <jdiamond@solid-state.org>
 * @license http://www.opensource.org/licenses/gpl-license.php GNU Public License
 */

require_once BASE_PATH . "include/SolidStateAdminPage.class.php";

/**
 * AddIPAddressPage
 *
 * Add IP Addresses Page
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 */
class AddIPAddressPage extends SolidStateAdminPage {
    /**
     * Initialize AddIPAddress Page
     */
    function init() {
        throw new SWUserException( "IP address management has been disabled." );
    }

    /**
     * Action
     *
     * Actions handled by this page:
     *  add_ip_address (form)
     *  add_ip_confirm (form)
     *
     * @param string $action_name Action
     */
    function action( $action_name ) {
        throw new SWUserException( "IP address management has been disabled." );
    }
}
?>
