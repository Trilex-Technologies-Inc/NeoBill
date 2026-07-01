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

        $bridgeFile = BASE_PATH . "modules/productorderbridge/ProductOrderBridge.class.php";
        if ( file_exists( $bridgeFile ) ) {
            require_once $bridgeFile;
            $bridge = new ProductOrderBridge();
            $bridge->fulfillProductOrder( $this, $accountDBO, $purchaseDBO );
        }

        $this->setStatus( "Fulfilled" );
        update_OrderProductDBO( $this );
        return true;
    }

    /**
     * Load member data from an array.
     *
     * @param array $data Order product row
     */
    public function load( $data ) {
        $this->setID( $data['id'] );
        $this->setOrderID( $data['orderid'] );
        $this->setOrderItemID( $data['orderitemid'] );
        $this->setProductID( $data['productid'] );
        $this->setStatus( $data['status'] );
        $this->setTerm( $data['term'] );
    }
}

function ensure_OrderProductDBOTable() {
    $DB = DBConnection::getDBConnection();
    $sql = "create table if not exists `orderproduct` (" .
            "`id` int(10) unsigned not null auto_increment," .
            "`orderid` int(10) unsigned not null default '0'," .
            "`orderitemid` int(10) unsigned not null default '0'," .
            "`status` enum('Rejected','Pending','Accepted','Fulfilled') not null default 'Pending'," .
            "`productid` int(10) unsigned not null default '0'," .
            "`term` int(11) default null," .
            "primary key (`id`)" .
            ") default charset=utf8";
    if( !mysql_query( $sql, $DB->handle() ) ) {
        throw new DBException( mysql_error( $DB->handle() ) );
    }
}

function add_OrderProductDBO( OrderProductDBO $dbo ) {
    ensure_OrderProductDBOTable();
    $DB = DBConnection::getDBConnection();

    $sql = $DB->build_insert_sql( "orderproduct",
            array( "orderid" => intval( $dbo->getOrderID() ),
            "orderitemid" => intval( $dbo->getOrderItemID() ),
            "productid" => $dbo->getProductID(),
            "status" => $dbo->getStatus(),
            "term" => $dbo->getTerm() ) );

    if( !mysql_query( $sql, $DB->handle() ) ) {
        throw new DBException( mysql_error( $DB->handle() ) );
    }

    $id = mysql_insert_id( $DB->handle() );
    if( $id === false || $id == 0 ) {
        throw new DBException( "Previous INSERT did not generate an ID" );
    }

    $dbo->setID( $id );
}

function update_OrderProductDBO( OrderProductDBO $dbo ) {
    ensure_OrderProductDBOTable();
    $DB = DBConnection::getDBConnection();

    if ( $dbo->getID() == null ) {
        return;
    }

    $sql = $DB->build_update_sql( "orderproduct",
            "id = " . intval( $dbo->getID() ),
            array( "orderid" => intval( $dbo->getOrderID() ),
            "productid" => $dbo->getProductID(),
            "status" => $dbo->getStatus(),
            "term" => $dbo->getTerm() ) );

    if( !mysql_query( $sql, $DB->handle() ) ) {
        throw new DBException( mysql_error( $DB->handle() ) );
    }
}

function delete_OrderProductDBO( OrderProductDBO $dbo ) {
    ensure_OrderProductDBOTable();
    $DB = DBConnection::getDBConnection();

    $sql = $DB->build_delete_sql( "orderproduct",
            "id = " . intval( $dbo->getID() ) );

    if( !mysql_query( $sql, $DB->handle() ) ) {
        throw new DBException( mysql_error( $DB->handle() ) );
    }
}

function load_OrderProductDBO( $id ) {
    ensure_OrderProductDBOTable();
    $DB = DBConnection::getDBConnection();

    $sql = $DB->build_select_sql( "orderproduct",
            "*",
            "id=" . intval( $id ),
            null,
            null,
            null,
            null );

    if( !($result = @mysql_query( $sql, $DB->handle() ) ) ) {
        throw new DBException( mysql_error( $DB->handle() ) );
    }

    if( mysql_num_rows( $result ) == 0 ) {
        throw new DBNoRowsFoundException();
    }

    $dbo = new OrderProductDBO();
    $data = mysql_fetch_array( $result );
    $dbo->load( $data );
    return $dbo;
}

function &load_array_OrderProductDBO( $filter = null,
        $sortby = null,
        $sortdir = null,
        $limit = null,
        $start = null ) {
    ensure_OrderProductDBOTable();
    $DB = DBConnection::getDBConnection();

    $sql = $DB->build_select_sql( "orderproduct",
            "*",
            $filter,
            $sortby,
            $sortdir,
            $limit,
            $start );

    if( !( $result = @mysql_query( $sql, $DB->handle() ) ) ) {
        throw new DBException( mysql_error( $DB->handle() ) );
    }

    if( mysql_num_rows( $result ) == 0 ) {
        throw new DBNoRowsFoundException();
    }

    $dbo_array = array();
    while( $data = mysql_fetch_array( $result ) ) {
        $dbo = new OrderProductDBO();
        $dbo->load( $data );
        $dbo_array[] = $dbo;
    }

    return $dbo_array;
}

function count_all_OrderProductDBO( $filter = null ) {
    ensure_OrderProductDBOTable();
    $DB = DBConnection::getDBConnection();

    $sql = "SELECT COUNT(*) FROM orderproduct";
    if( $filter != null ) {
        $sql .= " WHERE " . $filter;
    }

    if( !( $result = @mysql_query( $sql, $DB->handle() ) ) ) {
        throw new DBException( mysql_error( $DB->handle() ) );
    }

    $data = mysql_fetch_array( $result );
    return $data[0];
}

?>
