<?php
require_once BASE_PATH . "modules/subscriptionmanager/pages/SubscriptionManagerAdminPage.class.php";

class SubscriptionManagerBillingPage extends SubscriptionManagerAdminPage
{
	function action($action_name)
	{
		switch ($action_name) {
			case "subscriptionmanager_run_billing":
				$this->runBilling();
				break;
			case "subscriptionmanager_subscription_delete":
			case "subscriptionmanager_subscription_delete_billing":
				$this->deleteSubscription();
				break;
			default:
				parent::action($action_name);
		}
	}

	function init()
	{
		parent::init();
		$today = DBConnection::format_date(time());
		$this->smarty->assign("today", $today);
		$this->smarty->assign("dueSubscriptions", $this->dueSubscriptions($today));
	}

	function dueSubscriptions($billingDate)
	{
		return $this->rows(
			"select s.*, p.name as planname, " .
				"case when a.type='Individual Account' then a.contactname else a.businessname end as account_name, " .
					"coalesce(s.billing_type,pr.billing_type) as billing_type, coalesce(s.billing_cycle,pr.billing_cycle) as billing_cycle, " .
					"coalesce(s.cycle_interval,pr.cycle_interval) as cycle_interval, coalesce(s.amount,pr.amount) as amount, " .
					"coalesce(s.included_quantity,pr.included_quantity) as included_quantity, " .
					"coalesce(s.unit_amount,pr.unit_amount) as unit_amount, coalesce(s.intro_amount,pr.intro_amount) as intro_amount, pr.intro_cycles, " .
					"coalesce(s.taxable,pr.taxable) as taxable " .
				"from subscriptionmanager_subscription s " .
				"join subscriptionmanager_plan p on p.id=s.planid " .
				"join subscriptionmanager_price pr on pr.id=s.priceid " .
				"left join account a on a.id=s.accountid " .
				"where s.status in ('trialing','active','past_due') " .
				"and s.nextbillingdate is not null and s.nextbillingdate <= " . $this->quote($billingDate) .
				" order by s.nextbillingdate asc"
		);
	}

	function runBilling()
	{
		$billingDate = $this->dateValue($this->post['billing_date']);
		$generated = 0;

		foreach ($this->dueSubscriptions($billingDate) as $subscription) {
			if ($subscription['cancel_at'] !== null && strtotime($subscription['cancel_at']) <= strtotime($billingDate)) {
				$this->cancelDueSubscription($subscription);
				continue;
			}
			if (!$this->claimPeriod($subscription)) {
				continue;
			}
			$amount = $this->baseAmount($subscription);
			$usageAmount = $this->unbilledUsageAmount($subscription);
			$baseTotal = $amount * max(1, intval($subscription['quantity']));
			$discountAmount = $this->discountAmount($subscription['id'], $baseTotal + $usageAmount);
			$total = max(0, $baseTotal + $usageAmount - $discountAmount);
			$taxAmount = $this->taxAmount($subscription, $total);

			if ($total <= 0 && $usageAmount <= 0) {
				$this->markUsageInvoiced($subscription['id'], 0, $subscription);
				$this->advanceSubscription($subscription, null);
				$this->completePeriod($subscription, null, "no_charge");
				continue;
			}

			$invoice = new InvoiceDBO();
			$invoice->setAccountID($subscription['accountid']);
			$invoice->setDate($this->datetimeValue($billingDate));
			$invoice->setPeriodBegin($subscription['current_period_start']);
			$invoice->setPeriodEnd($subscription['current_period_end']);
			$invoice->setTerms($this->module()->getInvoiceTerms());
			$invoice->setNote("Subscription #" . $subscription['id']);

			if ($amount > 0) {
				$invoice->add_item(max(1, intval($subscription['quantity'])), $amount, $subscription['planname'], false);
			}
			if ($usageAmount > 0) {
				$invoice->add_item(1, $usageAmount, $subscription['planname'] . " usage", false);
			}
			if ($discountAmount > 0) {
				$invoice->add_item(1, -1 * $discountAmount, "Subscription discount", false);
			}
			if ($taxAmount > 0) {
				$invoice->add_item(1, $taxAmount, "Subscription tax", true);
			}

			add_InvoiceDBO($invoice);
			$this->markUsageInvoiced($subscription['id'], $invoice->getID(), $subscription);
			$this->advanceSubscription($subscription, $invoice->getID());
			$this->completePeriod($subscription, $invoice->getID(), "invoiced");
			$generated++;
		}

		$this->setMessage(array("type" => sprintf("%d subscription invoices generated.", $generated)));
		$this->reload();
	}

	function cancelDueSubscription($subscription)
	{
		$DB = $this->db();
		$now = DBConnection::format_datetime(time());
		$this->execute("update subscriptionmanager_subscription set status='cancelled', cancelled_at=" .
			$this->quote($now) . ", nextbillingdate=NULL, updated=" . $this->quote($now) .
			" where id=" . intval($subscription['id']));
	}

	function claimPeriod($subscription)
	{
		$DB = $this->db();
		$now = DBConnection::format_datetime(time());
		$sql = $DB->build_insert_sql("subscriptionmanager_billing_period", array(
			"subscriptionid" => intval($subscription['id']),
			"period_start" => $this->datetimeValue($subscription['current_period_start']),
			"period_end" => $this->datetimeValue($subscription['current_period_end']),
			"status" => "processing", "created" => $now, "updated" => $now));
			if (@mysql_query($sql, $DB->handle())) {
				return true;
			}
			if (mysql_errno($DB->handle()) == 1062) {
				return false;
			}
			throw new DBException(mysql_error($DB->handle()));
	}

	function taxAmount($subscription, $amount)
	{
		if ($subscription['taxable'] != "Yes" || $amount <= 0) {
			return 0.00;
		}
		$row = $this->row("select coalesce(sum(t.rate),0) as rate from account a left join taxrule t " .
			"on t.country=a.country and (t.allstates='YES' or t.state=a.state) where a.id=" .
			intval($subscription['accountid']));
		return round($amount * (floatval($row['rate']) / 100), 2);
	}

	function completePeriod($subscription, $invoiceID, $status)
	{
		$DB = $this->db();
		$values = array("status" => $status, "updated" => DBConnection::format_datetime(time()));
		if ($invoiceID !== null) {
			$values['invoiceid'] = intval($invoiceID);
		}
		$this->execute($DB->build_update_sql("subscriptionmanager_billing_period",
			"subscriptionid=" . intval($subscription['id']) . " and period_start=" .
			$this->quote($this->datetimeValue($subscription['current_period_start'])),
			$values));
	}

	function baseAmount($subscription)
	{
		if (
			$subscription['status'] == "trialing" &&
			strtotime($subscription['trial_end']) > strtotime($subscription['nextbillingdate'])
		) {
			return 0.00;
		}

		if ($subscription['intro_amount'] !== null && intval($subscription['intro_cycles_remaining']) > 0) {
			return floatval($subscription['intro_amount']);
		}

		return floatval($subscription['amount']);
	}

	function unbilledUsageAmount($subscription)
	{
		if ($subscription['billing_type'] != "usage") {
			return 0.00;
		}

		$row = $this->row("select coalesce(sum(quantity),0) as quantity from subscriptionmanager_usage " .
			"where subscriptionid=" . intval($subscription['id']) . " and invoiceid is null " .
			"and usage_date >= " . $this->quote($this->datetimeValue($subscription['current_period_start'])) .
			" and usage_date < " . $this->quote($this->datetimeValue($subscription['current_period_end'])));
		return $this->service()->usageCharge(
			floatval($row['quantity']),
			floatval($subscription['unit_amount']),
			floatval($subscription['included_quantity'])
		);
	}

	function discountAmount($subscriptionID, $amount)
	{
		$discount = $this->row("select * from subscriptionmanager_discount where subscriptionid=" .
			intval($subscriptionID) . " and status='active' order by id desc limit 1");
		if (!$discount) {
			return 0.00;
		}

		return $amount - $this->service()->applyDiscount(
			$amount,
			$discount['discount_type'],
			floatval($discount['discount_value'])
		);
	}

	function markUsageInvoiced($subscriptionID, $invoiceID, $subscription)
	{
		$DB = $this->db();
		$sql = $DB->build_update_sql(
			"subscriptionmanager_usage",
			"subscriptionid=" . intval($subscriptionID) . " and invoiceid is null" .
				" and usage_date >= " . $this->quote($this->datetimeValue($subscription['current_period_start'])) .
				" and usage_date < " . $this->quote($this->datetimeValue($subscription['current_period_end'])),
			array("invoiceid" => intval($invoiceID))
		);
		$this->execute($sql);
	}

	function advanceSubscription($subscription, $invoiceID)
	{
		$DB = $this->db();
		$nextStart = $subscription['current_period_end'];
		$nextEnd = $this->service()->nextCycleDate(
			$nextStart,
			$subscription['billing_cycle'],
			$subscription['cycle_interval']
		);
		$status = $subscription['status'] == "trialing" ? "active" : $subscription['status'];
		$introCycles = max(0, intval($subscription['intro_cycles_remaining']) - 1);

		$subSql = $DB->build_update_sql(
			"subscriptionmanager_subscription",
			"id=" . intval($subscription['id']),
			array(
				"status" => $status,
				"current_period_start" => $this->datetimeValue($nextStart),
				"current_period_end" => $this->datetimeValue($nextEnd),
				"nextbillingdate" => $this->dateValue($nextStart),
					"intro_cycles_remaining" => $introCycles,
				"updated" => DBConnection::format_datetime(time())
			)
		);
		if ($invoiceID !== null) {
			// Add the invoice reference only for periods that generated an invoice.
			$subSql = str_replace(" SET ", " SET previnvoiceid=" . intval($invoiceID) . ", ", $subSql);
		}
		$this->execute($subSql);
		$discount = $this->row("select * from subscriptionmanager_discount where subscriptionid=" .
			intval($subscription['id']) . " and status='active' order by id desc limit 1");
		if ($discount && $discount['remaining_cycles'] !== null) {
			$remaining = max(0, intval($discount['remaining_cycles']) - 1);
			$this->execute($DB->build_update_sql("subscriptionmanager_discount", "id=" . intval($discount['id']),
				array("remaining_cycles" => $remaining, "status" => $remaining == 0 ? "expired" : "active")));
		}
	}

	function deleteSubscription()
	{
		$DB = $this->db();
		$subscriptionID = intval($this->post['subscriptionid']);
		$this->execute($DB->build_delete_sql(
			"subscriptionmanager_usage",
			"subscriptionid = " . $subscriptionID
		));
		$this->execute($DB->build_delete_sql(
			"subscriptionmanager_dunning_attempt",
			"subscriptionid = " . $subscriptionID
		));
		$this->execute($DB->build_delete_sql(
			"subscriptionmanager_change",
			"subscriptionid = " . $subscriptionID
		));
		$this->execute($DB->build_delete_sql(
			"subscriptionmanager_discount",
			"subscriptionid = " . $subscriptionID
		));
		$this->execute($DB->build_delete_sql(
			"subscriptionmanager_billing_period",
			"subscriptionid = " . $subscriptionID
		));
		$this->execute($DB->build_delete_sql(
			"subscriptionmanager_subscription",
			"id = " . $subscriptionID
		));
		$this->setMessage(array("type" => "Subscription deleted."));
		$this->reload();
	}
}
