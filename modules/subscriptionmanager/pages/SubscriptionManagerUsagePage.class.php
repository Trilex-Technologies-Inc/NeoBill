<?php
require_once BASE_PATH . "modules/subscriptionmanager/pages/SubscriptionManagerAdminPage.class.php";

class SubscriptionManagerUsagePage extends SubscriptionManagerAdminPage
{
	function action($action_name)
	{
		switch ($action_name) {
			case "subscriptionmanager_usage_record":
				$this->recordUsage();
				break;
			case "subscriptionmanager_usage_update":
				$this->updateUsage();
				break;
			case "subscriptionmanager_usage_delete":
				$this->deleteUsage();
				break;
			case "subscriptionmanager_subscription_delete":
			case "subscriptionmanager_subscription_delete_usage":
				$this->deleteSubscription();
				break;
			default:
				parent::action($action_name);
		}
	}

	function init()
	{
		parent::init();
		$this->smarty->assign("subscriptions", $this->rows(
			"select s.id, s.accountid, p.name as planname, " .
				"case when a.type='Individual Account' then a.contactname else a.businessname end as account_name " .
				"from subscriptionmanager_subscription s " .
				"left join account a on a.id=s.accountid " .
				"left join subscriptionmanager_plan p on p.id=s.planid where s.status in ('trialing','active','past_due') " .
				"order by s.id desc"
		));
		$this->smarty->assign("usageRecords", $this->rows(
			"select u.*, p.name as planname from subscriptionmanager_usage u " .
				"left join subscriptionmanager_subscription s on s.id=u.subscriptionid " .
				"left join subscriptionmanager_plan p on p.id=s.planid order by u.id desc limit 50"
		));
	}

	function recordUsage()
	{
		$DB = $this->db();
		$this->validateUsageInput();
		$sql = $DB->build_insert_sql(
			"subscriptionmanager_usage",
			array(
				"subscriptionid" => intval($this->post['subscriptionid']),
				"usage_date" => $this->datetimeValue($this->post['usage_date']),
				"quantity" => $this->post['quantity'],
				"description" => $this->post['description']
			)
		);
		$this->execute($sql);

		$this->setMessage(array("type" => "[SUBSCRIPTION_MANAGER_USAGE_RECORDED]"));
		$this->reload();
	}

	function updateUsage()
	{
		$DB = $this->db();
		$existing = $this->row("select invoiceid from subscriptionmanager_usage where id=" . intval($this->post['usageid']));
		if (!$existing || $existing['invoiceid'] !== null) {
			throw new SWUserException("Billed usage records are immutable.");
		}
		$this->validateUsageInput();
		$this->execute($DB->build_update_sql(
			"subscriptionmanager_usage",
			"id = " . intval($this->post['usageid']),
			array(
				"subscriptionid" => intval($this->post['subscriptionid']),
				"usage_date" => $this->datetimeValue($this->post['usage_date']),
				"quantity" => $this->post['quantity'],
				"description" => $this->post['description']
			)
		));
		$this->setMessage(array("type" => "Usage record updated."));
		$this->reload();
	}

	function deleteUsage()
	{
		$existing = $this->row("select invoiceid from subscriptionmanager_usage where id=" . intval($this->post['usageid']));
		if (!$existing || $existing['invoiceid'] !== null) {
			throw new SWUserException("Billed usage records are immutable.");
		}
		$this->execute($this->db()->build_delete_sql(
			"subscriptionmanager_usage",
			"id = " . intval($this->post['usageid'])
		));
		$this->setMessage(array("type" => "Usage record deleted."));
		$this->reload();
	}

	function validateUsageInput()
	{
		$subscription = $this->row("select id, current_period_start, current_period_end from subscriptionmanager_subscription " .
			"where id=" . intval($this->post['subscriptionid']) . " and status in ('trialing','active','past_due')");
		if (!$subscription || floatval($this->post['quantity']) < 0) {
			throw new SWUserException("A billable subscription and non-negative usage quantity are required.");
		}
		$date = strtotime($this->post['usage_date']);
		if ($date === false || $date < strtotime($subscription['current_period_start']) ||
				$date >= strtotime($subscription['current_period_end'])) {
			throw new SWUserException("Usage date must be inside the subscription's current billing period.");
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
