<?php
/**
 * MyProductsPage.class.php
 *
 * Public customer page for viewing purchased products.
 */

require_once dirname(__FILE__) . '/../../config/config.inc.php';
require_once BASE_PATH . "include/SolidStatePage.class.php";

class MyProductsPage extends SolidStatePage {
    /**
     * Initialize the Page
     */
    public function init() {
        parent::init();

        if ( !isset( $_SESSION['client']['userdbo'] ) ||
                $_SESSION['client']['userdbo'] == null ) {
            $this->gotoPage( "customerlogin" );
            return;
        }

        $userDBO = $_SESSION['client']['userdbo'];
        $accountDBO = load_AccountDBO_username( $userDBO->getUsername() );
        $products = array();

        foreach ( $accountDBO->getProducts() as $purchaseDBO ) {
            $productDBO = $purchaseDBO->getPurchasable();
            $products[] = array(
                    "id" => $purchaseDBO->getID(),
                    "name" => $purchaseDBO->getProductName(),
                    "description" => $productDBO->getDescription(),
                    "term" => $purchaseDBO->getTerm(),
                    "date" => $purchaseDBO->getDate(),
                    "nextbillingdate" => $purchaseDBO->getNextBillingDate() );
        }

        $this->smarty->assign( "myProducts", $products );
        $this->smarty->assign( "myProductsCount", count( $products ) );
    }
}
?>
