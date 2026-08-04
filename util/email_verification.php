<?php
require_once BASE_PATH . "solidworks/Email.class.php";

function ensure_email_verification_table() {
	$DB = DBConnection::getDBConnection();
	$sql = "CREATE TABLE IF NOT EXISTS email_verification (" .
			"username varchar(32) NOT NULL, " .
			"token_hash char(64) NOT NULL, " .
			"expires_at datetime NOT NULL, " .
			"PRIMARY KEY (username), UNIQUE KEY token_hash (token_hash)" .
			") DEFAULT CHARSET=utf8";
	if ( !mysql_query( $sql, $DB->handle() ) ) {
		throw new DBException( mysql_error( $DB->handle() ) );
	}
}

function send_customer_verification_email( UserDBO $user ) {
	$DB = DBConnection::getDBConnection();
	ensure_email_verification_table();

	$token = bin2hex( random_bytes( 32 ) );
	$tokenHash = hash( 'sha256', $token );
	$username = $DB->quote_smart( $user->getUsername() );
	mysql_query( "DELETE FROM email_verification WHERE username = " . $username, $DB->handle() );

	$sql = $DB->build_insert_sql( "email_verification", array(
			"username" => $user->getUsername(),
			"token_hash" => $tokenHash,
			"expires_at" => date( 'Y-m-d H:i:s', time() + 86400 ) ) );
	if ( !mysql_query( $sql, $DB->handle() ) ) {
		throw new DBException( mysql_error( $DB->handle() ) );
	}

	$email = new Email();
	$email->addRecipient( $user->getEmail(), $user->getContactName() );
	$email->setFrom( $GLOBALS['conf']['company']['email'] ?? '',
			$GLOBALS['conf']['company']['name'] ?? 'NeoBill' );
	$email->setSubject( 'Verify your email address' );
	$email->setBody( "Hello " . $user->getContactName() . ",\n\n" .
			"Please verify your email address to activate your account:\n\n" .
			build_customer_verification_url( $token ) . "\n\n" .
			"This link expires in 24 hours." );
	return $email->send();
}

function verify_customer_email_token( $token ) {
	if ( !is_string( $token ) || !preg_match( '/^[a-f0-9]{64}$/', $token ) ) {
		return null;
	}

	$DB = DBConnection::getDBConnection();
	ensure_email_verification_table();
	$hash = hash( 'sha256', $token );
	$sql = $DB->build_select_sql( "email_verification", "*",
			"token_hash = " . $DB->quote_smart( $hash ) . " AND expires_at > NOW()" );
	$result = mysql_query( $sql, $DB->handle() );
	if ( !$result ) {
		throw new DBException( mysql_error( $DB->handle() ) );
	}
	$row = mysql_fetch_array( $result );
	if ( !$row ) {
		return null;
	}

	$account = load_AccountDBO_username( $row['username'] );
	$account->setStatus( "Active" );
	update_AccountDBO( $account );
	mysql_query( "DELETE FROM email_verification WHERE username = " .
			$DB->quote_smart( $row['username'] ), $DB->handle() );
	return load_UserDBO( $row['username'] );
}

function build_customer_verification_url( $token ) {
	$https = !empty( $_SERVER['HTTPS'] ) && strtolower( $_SERVER['HTTPS'] ) !== 'off';
	$scheme = $https ? 'https' : 'http';
	$host = $_SERVER['HTTP_HOST'] ?? $_SERVER['SERVER_NAME'] ?? 'localhost';
	if ( !preg_match( '/^[a-z0-9.:-]+$/i', $host ) ) {
		$host = 'localhost';
	}
	$script = $_SERVER['SCRIPT_NAME'] ?? '/order/index.php';
	return $scheme . '://' . $host . $script . '?page=verifyemail&token=' . urlencode( $token );
}
?>
