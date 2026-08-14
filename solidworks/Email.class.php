<?php
/**
 * Email.class.php
 *
 * This file contains the definition for the Email class
 *
 * @package SolidWorks
 * @author John Diamond <jdiamond@solid-state.org>
 * @copyright John Diamond <jdiamond@solid-state.org>
 * @license http://www.opensource.org/licenses/gpl-license.php GNU Public License
 */

/**
 * Email
 *
 * This class sends an email using the PHP mail() function.  All the necessary
 * headers are added by this class.  The user only needs to supply the To:, the
 * Subject:, From:, and the body.
 *
 * @package SolidWorks
 * @author John Diamond <jdiamond@solid-state.org>
 */
class Email {
	/** @var string Last SMTP transport error */
	protected $smtpError = '';
	/**
	 * @var string To Address(es)
	 */
	var $to;

	/**
	 * @var string Subject
	 */
	var $subject;

	/**
	 * @var string From
	 */
	var $from;

	/**
	 * @var string Body
	 */
	var $body;

	/**
	 * Set Subject
	 *
	 * Set the Subject: field
	 *
	 * @param string $subject Subject
	 */
	function setSubject( $subject ) {
		$this->subject = $subject;
	}

	/**
	 * Set From
	 *
	 * Set the From: field
	 *
	 * @param string $email Email address
	 * @param string $name Name of sender
	 */
	function setFrom( $email, $name ) {
		$this->from = $this->formatAddress( $email, $name );
	}

	/**
	 * Set Body
	 *
	 * Set the message body
	 *
	 * @param string $body Message body
	 */
	function setBody( $body ) {
		// Limit lines to 70 chars
		$this->body = wordwrap( $body, 70 );
	}

	/**
	 * Add Recipient
	 *
	 * Add a recipient to the To: field
	 *
	 * @param string $email Email address
	 * @param string $name Name of recipient
	 */
	function addRecipient( $email, $name = null ) {
		// Format the recipient
		$recipient = $this->formatAddress( $email, $name );

		// Add address to To: field
		if ( !isset( $this->to ) ) {
			// First recipient
			$this->to = $recipient;
		}
		else {
			// Append this recipient to the To: field
			$this->to .= ", " . $recipient;
		}
	}

	/**
	 * Format Address
	 *
	 * Format the name and email address like so: Full Name <email@address.com>
	 *
	 * @param string $email Email address
	 * @param string $name Name
	 */
	function formatAddress( $email, $name = null ) {
		if ( isset( $name ) ) {
			$address = $name . " <";
		}
		else {
			$address = "<";
		}
		$address .= $email . ">";

		return $address;
	}

	/**
	 * Send
	 *
	 * Attempts to send the email using the PHP mail() function.  Returns true
	 * for success and false on failure.
	 *
	 * @return bool
	 */
	function send() {
		global $conf;

		if ( ( $conf['mail']['transport'] ?? 'mail' ) === 'smtp' ) {
			$sent = $this->sendSMTP( $conf['mail']['smtp'] ?? array() );
			if ( !$sent ) {
				error_log( 'NeoBill SMTP delivery failed: ' . ( $this->smtpError ?: 'unknown SMTP error' ) );
			}
			return $sent;
		}

		// Tells sendmail to parse the message for recipients in the To: field
		$options = "-t";

		// Set some extra headers
		$headers = "From: " . $this->from;

		$sent = @mail( $this->to,
				$this->subject,
				$this->body,
				$headers,
				$options );
		if ( !$sent ) {
			error_log( 'NeoBill PHP mail() delivery failed.' );
		}
		return $sent;
	}

	/**
	 * Return the last transport error for an administrator-facing test.
	 *
	 * @return string
	 */
	public function getLastError() {
		return $this->smtpError;
	}

	/**
	 * Send the message directly to an SMTP server.
	 *
	 * @param array $config SMTP connection settings
	 * @return bool
	 */
	protected function sendSMTP( $config ) {
		$host = trim( $config['host'] ?? '' );
		$port = (int)( $config['port'] ?? 587 );
		$encryption = $config['encryption'] ?? 'tls';
		if ( $host === '' || $port < 1 || $port > 65535 ) {
			$this->smtpError = 'SMTP host is empty or the port is invalid';
			return false;
		}

		$remote = ( $encryption === 'ssl' ? 'ssl://' : '' ) . $host;
		$socket = @stream_socket_client( $remote . ':' . $port, $errno, $error, 15 );
		if ( !$socket ) {
			$this->smtpError = sprintf( 'connection to %s:%d failed (%d: %s)',
					$host, $port, $errno, $error );
			return false;
		}
		stream_set_timeout( $socket, 15 );

		$ok = $this->smtpExpect( $socket, array( 220 ) );
		$hostname = gethostname() ?: 'localhost';
		$ok = $ok && $this->smtpCommand( $socket, 'EHLO ' . $hostname, array( 250 ) );

		if ( $ok && $encryption === 'tls' ) {
			$ok = $this->smtpCommand( $socket, 'STARTTLS', array( 220 ) );
			$tlsEnabled = $ok && @stream_socket_enable_crypto( $socket, true, STREAM_CRYPTO_METHOD_TLS_CLIENT );
			if ( $ok && !$tlsEnabled ) {
				$this->smtpError = 'STARTTLS negotiation failed';
			}
			$ok = $ok && $tlsEnabled;
			$ok = $ok && $this->smtpCommand( $socket, 'EHLO ' . $hostname, array( 250 ) );
		}

		$username = $config['username'] ?? '';
		if ( $ok && $username !== '' ) {
			$ok = $this->smtpCommand( $socket, 'AUTH LOGIN', array( 334 ) );
			$ok = $ok && $this->smtpCommand( $socket, base64_encode( $username ), array( 334 ) );
			$ok = $ok && $this->smtpCommand( $socket,
					base64_encode( $config['password'] ?? '' ), array( 235 ) );
		}

		$from = $this->extractAddress( $this->from );
		$recipients = array_map( array( $this, 'extractAddress' ), explode( ',', $this->to ) );
		$ok = $ok && filter_var( $from, FILTER_VALIDATE_EMAIL ) !== false &&
				$this->smtpCommand( $socket, 'MAIL FROM:<' . $from . '>', array( 250 ) );
		foreach ( $recipients as $recipient ) {
			$ok = $ok && filter_var( $recipient, FILTER_VALIDATE_EMAIL ) !== false &&
					$this->smtpCommand( $socket, 'RCPT TO:<' . $recipient . '>', array( 250, 251 ) );
		}

		if ( $ok ) {
			$ok = $this->smtpCommand( $socket, 'DATA', array( 354 ) );
			$body = preg_replace( '/\r?\n/', "\r\n", (string)$this->body );
			$body = preg_replace( '/(^|\r\n)\./', '$1..', $body );
			$message = 'From: ' . $this->cleanHeader( $this->from ) . "\r\n" .
					'To: ' . $this->cleanHeader( $this->to ) . "\r\n" .
					'Subject: ' . $this->cleanHeader( $this->subject ) . "\r\n" .
					"MIME-Version: 1.0\r\nContent-Type: text/plain; charset=UTF-8\r\n\r\n" .
					$body . "\r\n.";
			$ok = $this->smtpCommand( $socket, $message, array( 250 ) );
		}

		if ( $ok ) {
			$this->smtpCommand( $socket, 'QUIT', array( 221 ) );
		}
		fclose( $socket );
		return (bool)$ok;
	}

	protected function smtpCommand( $socket, $command, $codes ) {
		if ( @fwrite( $socket, $command . "\r\n" ) === false ) {
			$this->smtpError = 'failed to write to the SMTP connection';
			return false;
		}
		return $this->smtpExpect( $socket, $codes );
	}

	protected function smtpExpect( $socket, $codes ) {
		$response = '';
		while ( ( $line = fgets( $socket, 515 ) ) !== false ) {
			$response .= $line;
			if ( strlen( $line ) < 4 || $line[3] !== '-' ) {
				break;
			}
		}
		if ( $response === '' ) {
			$this->smtpError = 'SMTP server closed the connection without a response';
			return false;
		}
		$code = (int)substr( $line, 0, 3 );
		if ( !in_array( $code, $codes, true ) ) {
			$this->smtpError = 'server replied: ' . trim( preg_replace( '/\s+/', ' ', $response ) );
			return false;
		}
		return true;
	}

	protected function extractAddress( $address ) {
		if ( preg_match( '/<([^>]+)>/', $address, $matches ) ) {
			return trim( $matches[1] );
		}
		return trim( $address, " <>\t\r\n" );
	}

	protected function cleanHeader( $value ) {
		return str_replace( array( "\r", "\n" ), '', (string)$value );
	}
}

?>
