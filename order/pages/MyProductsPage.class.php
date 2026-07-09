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
            $pricing = array();
            foreach ( $productDBO->getPricing() as $priceDBO ) {
                $pricing[] = array(
                        "type" => $priceDBO->getType(),
                        "term" => $priceDBO->getTermLength(),
                        "price" => $priceDBO->getPrice(),
                        "taxable" => $priceDBO->getTaxable() );
            }

            $onetimePrice = $purchaseDBO->getOnetimePrice();
            $recurringPrice = $purchaseDBO->getTerm() == null ?
                    null :
                    $purchaseDBO->getRecurringPrice();

            $products[] = array(
                    "id" => $purchaseDBO->getID(),
                    "productid" => $productDBO->getID(),
                    "name" => $purchaseDBO->getProductName(),
                    "description" => $productDBO->getDescription(),
                    "public" => $productDBO->getPublic(),
                    "term" => $purchaseDBO->getTerm(),
                    "onetimeprice" => $onetimePrice,
                    "hasonetimeprice" => $onetimePrice !== null,
                    "recurringprice" => $recurringPrice,
                    "hasrecurringprice" => $recurringPrice !== null,
                    "pricing" => $pricing,
                    "date" => $purchaseDBO->getDate(),
                    "nextbillingdate" => $purchaseDBO->getNextBillingDate(),
                    "note" => $purchaseDBO->getNote(),
                    "previnvoiceid" => $purchaseDBO->getPrevInvoiceID() );
        }

        $this->smarty->assign( "myProducts", $products );
        $this->smarty->assign( "myProductsCount", count( $products ) );
    }
}
?>
