<div class="manager_content">
  <h2>{echo phrase="SUBSCRIPTION_MANAGER_SUBSCRIPTIONS"}</h2>
  {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

  <h3>{echo phrase="SUBSCRIPTION_MANAGER_CREATE_SUBSCRIPTION"}</h3>
  {form name="subscriptionmanager_subscription_create"}
    <div class="form">
      <table>
        <tr><th>{form_description field="accountid"}</th><td>{form_element field="accountid" size="8"}</td></tr>
        <tr><th>{form_description field="planid"}</th><td>{form_element field="planid" size="8"}</td></tr>
        <tr><th>{form_description field="priceid"}</th><td>{form_element field="priceid" size="8"}</td></tr>
        <tr><th>{form_description field="quantity"}</th><td>{form_element field="quantity" value="1" size="8"}</td></tr>
        <tr><th>{form_description field="status"}</th><td>{form_element field="status"}</td></tr>
        <tr><th>{form_description field="start_date"}</th><td>{form_element field="start_date"}</td></tr>
        <tr class="footer"><td colspan="2">{form_element field="save"}</td></tr>
      </table>
    </div>
  {/form}

  <h3>{echo phrase="SUBSCRIPTION_MANAGER_AVAILABLE_PLANS"}</h3>
  <table class="table">
    <tr><th>Plan ID</th><th>Price ID</th><th>Name</th><th>Cycle</th><th>Amount</th></tr>
    {foreach from=$plans item=plan}
      <tr><td>{$plan.id}</td><td>{$plan.priceid}</td><td>{$plan.name}</td><td>{$plan.billing_cycle}</td><td>{$plan.amount}</td></tr>
    {/foreach}
  </table>

  <h3>{echo phrase="SUBSCRIPTION_MANAGER_EXISTING_SUBSCRIPTIONS"}</h3>
  <table class="table">
    <tr><th>ID</th><th>Account</th><th>Plan</th><th>Status</th><th>Next Billing</th><th>Period End</th></tr>
    {foreach from=$subscriptions item=subscription}
      <tr>
        <td>{$subscription.id}</td>
        <td>{$subscription.accountid}</td>
        <td>{$subscription.planname}</td>
        <td>{$subscription.status}</td>
        <td>{$subscription.nextbillingdate}</td>
        <td>{$subscription.current_period_end}</td>
      </tr>
    {/foreach}
  </table>
</div>
