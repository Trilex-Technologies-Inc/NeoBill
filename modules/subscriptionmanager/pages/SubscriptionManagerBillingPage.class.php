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
				"pr.billing_type, pr.billing_cycle, pr.cycle_interval, " .
				"pr.amount, pr.included_quantity, pr.unit_amount, pr.intro_amount, pr.intro_cycles " .
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
			$amount = $this->baseAmount($subscription);
			$usageAmount = $this->unbilledUsageAmount($subscription);
			$discountAmount = $this->discountAmount($subscription['id'], $amount + $usageAmount);
			$total = max(0, $amount + $usageAmount - $discountAmount);

			if ($total <= 0 && $usageAmount <= 0) {
				$this->advanceSubscription($subscription, null);
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
				$invoice->add_item($subscription['quantity'], $amount, $subscription['planname'], false);
			}
			if ($usageAmount > 0) {
				$invoice->add_item(1, $usageAmount, $subscription['planname'] . " usage", false);
			}
			if ($discountAmount > 0) {
				$invoice->add_item(1, -1 * $discountAmount, "Subscription discount", false);
			}

			add_InvoiceDBO($invoice);
			$this->markUsageInvoiced($subscription['id'], $invoice->getID());
			$this->advanceSubscription($subscription, $invoice->getID());
			$generated++;
		}

		$this->setMessage(array("type" => sprintf("%d subscription invoices generated.", $generated)));
		$this->reload();
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
			"where subscriptionid=" . intval($subscription['id']) . " and invoiceid is null");
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

	function markUsageInvoiced($subscriptionID, $invoiceID)
	{
		$DB = $this->db();
		$sql = $DB->build_update_sql(
			"subscriptionmanager_usage",
			"subscriptionid=" . intval($subscriptionID) . " and invoiceid is null",
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
				"previnvoiceid" => $invoiceID,
				"intro_cycles_remaining" => $introCycles,
				"updated" => DBConnection::format_datetime(time())
			)
		);
		$this->execute($subSql);
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
			"subscriptionmanager_subscription",
			"id = " . $subscriptionID
		));
		$this->setMessage(array("type" => "Subscription deleted."));
		$this->reload();
	}
}
