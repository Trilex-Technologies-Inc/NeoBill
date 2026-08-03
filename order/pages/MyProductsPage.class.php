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

        if ( empty( $_SESSION['client']['userdbo'] ) ||
                $_SESSION['client']['userdbo']->getType() !== "Client" ) {
            $this->gotoPage( "customerlogin" );
            return;
        }

        $userDBO = $_SESSION['client']['userdbo'];
        $accountDBO = load_AccountDBO_username( $userDBO->getUsername() );
        $products = array();
        $recurringProducts = 0;
        $oneTimeProducts = 0;

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

            $isRecurring = $purchaseDBO->getTerm() != null &&
                    $purchaseDBO->getTerm() != 0;
            $onetimePrice = $purchaseDBO->getOnetimePrice();
            $recurringPrice = $isRecurring ?
                    $purchaseDBO->getRecurringPrice() :
                    null;

            if ( $isRecurring ) {
                $recurringProducts++;
            }
            else {
                $oneTimeProducts++;
            }

            $products[] = array(
                    "id" => $purchaseDBO->getID(),
                    "productid" => $productDBO->getID(),
                    "name" => $purchaseDBO->getProductName(),
                    "description" => $productDBO->getDescription(),
                    "public" => $productDBO->getPublic(),
                    "term" => $purchaseDBO->getTerm(),
                    "isrecurring" => $isRecurring,
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
        $this->smarty->assign( "myRecurringProductsCount", $recurringProducts );
        $this->smarty->assign( "myOneTimeProductsCount", $oneTimeProducts );
    }
}
?>
