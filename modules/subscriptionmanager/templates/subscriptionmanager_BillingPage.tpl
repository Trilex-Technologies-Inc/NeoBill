<div class="manager_content">
  <h2>{echo phrase="SUBSCRIPTION_MANAGER_BILLING"}</h2>
  {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

  {form name="subscriptionmanager_run_billing"}
    <div class="form">
      <table>
        <tr><th>{form_description field="billing_date"}</th><td>{form_element field="billing_date" value="$today"}</td></tr>
        <tr class="footer"><td colspan="2">{form_element field="run"}</td></tr>
      </table>
    </div>
  {/form}

  <h3>{echo phrase="SUBSCRIPTION_MANAGER_DUE_SUBSCRIPTIONS"}</h3>
  <table class="table">
    <tr><th>ID</th><th>Account</th><th>Plan</th><th>Status</th><th>Next Billing</th><th>Amount</th></tr>
    {foreach from=$dueSubscriptions item=subscription}
      <tr>
        <td>{$subscription.id}</td>
        <td>{$subscription.accountid}</td>
        <td>{$subscription.planname}</td>
        <td>{$subscription.status}</td>
        <td>{$subscription.nextbillingdate}</td>
        <td>{$subscription.amount}</td>
      </tr>
    {/foreach}
  </table>
</div>
