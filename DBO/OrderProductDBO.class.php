<?php
/**
 * OrderProductDBO.class.php
 *
 * Product item held in the public order cart.
 */

class OrderProductDBO extends OrderItemDBO {
    /**
     * @var integer OrderProduct ID
     */
    protected $id = null;

    /**
     * Set OrderProduct ID
     *
     * @param integer $id OrderProduct ID
     */
    public function setID( $id ) {
        $this->id = $id;
    }

    /**
     * Get OrderProduct ID
     *
     * @return integer OrderProduct ID
     */
    public function getID() {
        return $this->id;
    }

    /**
     * Set Purchasable
     *
     * @param ProductDBO $purchasable Product to be purchased
     */
    public function setPurchasable( PurchasableDBO $purchasable ) {
        if( !( $purchasable instanceof ProductDBO ) ) {
            throw new InvalidArgumentException( "Expected ProductDBO" );
        }

        parent::setPurchasable( $purchasable );
    }

    /**
     * Set Product ID
     *
     * @param integer $id Product ID
     */
    public function setProductID( $id ) {
        $this->setPurchasable( load_ProductDBO( $id ) );
    }

    /**
     * Get Product ID
     *
     * @return integer Product ID
     */
    public function getProductID() {
        return $this->purchasable->getID();
    }

    /**
     * Get Description
     *
     * @return string Description of this order item
     */
    public function getDescription() {
        return $this->purchasable->getName();
    }

    /**
     * Execute Product Order
     *
     * @param AccountDBO $accountDBO Account object
     * @return boolean True for success
     */
    public function execute( $accountDBO ) {
        $purchaseDBO = new ProductPurchaseDBO();
        $purchaseDBO->setAccountID( $accountDBO->getID() );
        $purchaseDBO->setProductID( $this->getProductID() );
        $purchaseDBO->setTerm( $this->getTerm() );
        $purchaseDBO->setDate( DBConnection::format_datetime( time() ) );
        $purchaseDBO->setNote( null );
        $purchaseDBO->setPrevInvoiceID( -1 );
        if( $this->getTerm() != null ) {
            $purchaseDBO->incrementNextBillingDate();
        }
        add_ProductPurchaseDBO( $purchaseDBO );

        $this->setStatus( "Fulfilled" );
        return true;
    }
}
?>
