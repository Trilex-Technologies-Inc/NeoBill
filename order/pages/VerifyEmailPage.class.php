<?php
require_once BASE_PATH . "include/SolidStatePage.class.php";
require_once BASE_PATH . "DBO/UserDBO.class.php";
require_once BASE_PATH . "util/email_verification.php";

class VerifyEmailPage extends SolidStatePage {
	function init() {
		parent::init();

		$user = verify_customer_email_token( $this->get['token'] ?? '' );
		if ( $user === null ) {
			$this->smarty->assign( "verification_success", false );
			return;
		}

		$_SESSION['client']['userdbo'] = $user;
		$this->smarty->assign( "verification_success", true );
	}
}
?>
