<?php
/**
 * PurchaseProductPage.class.php
 *
 * Public order page for product purchases.
 */

require_once dirname(__FILE__) . '/../../config/config.inc.php';
require_once BASE_PATH . "include/SolidStatePage.class.php";

class PurchaseProductPage extends SolidStatePage {
    /**
     * Action
     *
     * @param string $action_name Action
     */
    public function action( $action_name ) {
        switch ( $action_name ) {
            case "purchaseproduct":
                if ( isset( $this->post['continue'] ) ) {
                    $this->process();
                }
                elseif ( isset( $this->post['cancel'] ) ) {
                    $this->goback();
                }
                break;

            default:
                parent::action( $action_name );
                break;
        }
    }

    /**
     * Initialize the Page
     */
    public function init() {
        parent::init();

        if ( !isset( $_SESSION['order'] ) ) {
            $_SESSION['order'] = new OrderDBO();
        }

        $this->smarty->assign( "orderDBO", $_SESSION['order'] );

        $productDBO = $this->getSelectedProduct();
        $this->updatePrices( $productDBO );
        $this->smarty->assign( "product", $productDBO->getID() );
    }

    /**
     * Get selected or first public product.
     *
     * @return ProductDBO
     */
    protected function getSelectedProduct() {
        if ( isset( $this->post['product'] ) && is_object( $this->post['product'] ) ) {
            return $this->post['product'];
        }

        try {
            $products = load_array_ProductDBO( "public='Yes'" );
            return array_shift( $products );
        }
        catch ( DBNoRowsFoundException $e ) {
            throw new SWUserException( "There are no public products configured." );
        }
    }

    /**
     * Update term selector.
     *
     * @param ProductDBO $productDBO Product to show prices for
     */
    protected function updatePrices( ProductDBO $productDBO ) {
        $widget = $this->forms['purchaseproduct']->getField( "term" )->getWidget();
        $widget->setPurchasable( $productDBO );

        $this->smarty->assign( "productDBO", $productDBO );
    }

    /**
     * Add selected product to the cart.
     */
    protected function process() {
        $productItem = new OrderProductDBO();
        $productItem->setPurchasable( $this->post['product'] );
        $productItem->setStatus( "Accepted" );

        if ( isset( $this->post['term'] ) && is_object( $this->post['term'] ) ) {
            $productItem->setTerm( $this->post['term']->getTermLength() );
        }

        $_SESSION['order']->addItem( $productItem );
        $this->gotoPage( "cart" );
    }
}
?>
