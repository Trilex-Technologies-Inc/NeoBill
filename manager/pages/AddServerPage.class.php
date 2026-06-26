<?php
/**
 * AddServerPage.class.php
 *
 * This file contains the definition for the AddServerPage class
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 * @copyright John Diamond <jdiamond@solid-state.org>
 * @license http://www.opensource.org/licenses/gpl-license.php GNU Public License
 */

require_once BASE_PATH . "include/SolidStateAdminPage.class.php";

/**
 * AddServerPage
 *
 * Add Server Page
 *
 * @package Pages
 * @author John Diamond <jdiamond@solid-state.org>
 */
class AddServerPage extends SolidStateAdminPage {
    function init() {
        throw new SWUserException( "Server management has been disabled." );
    }

    /**
     * Action
     *
     * Actions handled by this page:
     *
     * @param string $action_name Action
     */
    function action( $action_name ) {
        throw new SWUserException( "Server management has been disabled." );
    }
}
?>
