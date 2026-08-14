<?php
/**
 * Subscription billing service.
 *
 * This service contains the reusable billing calculations for the module. The
 * manager pages or scheduled jobs can call these methods when creating invoices,
 * changing plans, cancelling subscriptions, recording usage, or retrying failed
 * payments.
 */
class SubscriptionBillingService {
	var $module;

	function __construct( $module ) {
		$this->module = $module;
	}

	function nextCycleDate( $date, $cycle, $interval = 1 ) {
		$time = is_numeric( $date ) ? $date : strtotime( $date );
		$interval = max( 1, intval( $interval ) );

		switch ( $cycle ) {
			case "daily":
				return date( "Y-m-d", strtotime( "+" . $interval . " day", $time ) );
			case "weekly":
				return date( "Y-m-d", strtotime( "+" . $interval . " week", $time ) );
			case "monthly":
				return date( "Y-m-d", strtotime( "+" . $interval . " month", $time ) );
			case "annually":
				return date( "Y-m-d", strtotime( "+" . $interval . " year", $time ) );
			default:
				throw new InvalidArgumentException( "Unsupported billing cycle: " . $cycle );
		}
	}

	function calculateProration( $oldAmount, $newAmount, $periodStart, $periodEnd, $changeDate ) {
		$periodStartTS = strtotime( $periodStart );
		$periodEndTS = strtotime( $periodEnd );
		$changeDateTS = strtotime( $changeDate );

		if ( $periodEndTS <= $periodStartTS ) {
			return 0.00;
		}

		if ( $changeDateTS <= $periodStartTS ) {
			return round( $newAmount - $oldAmount, 2 );
		}

		if ( $changeDateTS >= $periodEndTS ) {
			return 0.00;
		}

		$totalSeconds = $periodEndTS - $periodStartTS;
		$remainingSeconds = $periodEndTS - $changeDateTS;
		$remainingRatio = $remainingSeconds / $totalSeconds;

		return round( ( $newAmount - $oldAmount ) * $remainingRatio, 2 );
	}

	function parseRetrySchedule( $schedule ) {
		$days = array();
		foreach ( explode( ",", $schedule ) as $day ) {
			$day = intval( trim( $day ) );
			if ( $day >= 0 ) {
				$days[] = $day;
			}
		}
		return $days;
	}

	function nextRetryDate( $failedDate, $attemptNumber ) {
		$schedule = $this->parseRetrySchedule( $this->module->getRetrySchedule() );
		$index = intval( $attemptNumber ) - 1;

		if ( !isset( $schedule[$index] ) ) {
			return null;
		}

		return date( "Y-m-d H:i:s", strtotime( "+" . $schedule[$index] . " day", strtotime( $failedDate ) ) );
	}

	function applyDiscount( $amount, $discountType, $discountValue ) {
		if ( $discountType == "percent" ) {
			return round( $amount - ( $amount * ( $discountValue / 100 ) ), 2 );
		}

		if ( $discountType == "fixed" ) {
			return round( max( 0, $amount - $discountValue ), 2 );
		}

		return round( $amount, 2 );
	}

	function usageCharge( $quantity, $unitAmount, $includedQuantity = 0 ) {
		$billableQuantity = max( 0, $quantity - $includedQuantity );
		return round( $billableQuantity * $unitAmount, 2 );
	}

	function formatDunningEmail( $template, $invoiceID, $amount, $cardUpdateUrl ) {
		$template = str_replace( "{invoice_id}", $invoiceID, $template );
		$template = str_replace( "{amount}", sprintf( "%01.2f", $amount ), $template );
		$template = str_replace( "{card_update_url}", $cardUpdateUrl, $template );
		return $template;
	}
}
?>
