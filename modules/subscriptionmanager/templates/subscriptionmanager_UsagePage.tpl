<div class="manager_content">
  <h2>{echo phrase="SUBSCRIPTION_MANAGER_USAGE"}</h2>
  {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

  {form name="subscriptionmanager_usage_record"}
    <div class="form">
      <table>
        <tr><th>{form_description field="subscriptionid"}</th><td>{form_element field="subscriptionid" size="8"}</td></tr>
        <tr><th>{form_description field="quantity"}</th><td>{form_element field="quantity" size="10"}</td></tr>
        <tr><th>{form_description field="description"}</th><td>{form_element field="description" size="60"}</td></tr>
        <tr><th>{form_description field="usage_date"}</th><td>{form_element field="usage_date"}</td></tr>
        <tr class="footer"><td colspan="2">{form_element field="save"}</td></tr>
      </table>
    </div>
  {/form}

  <h3>{echo phrase="SUBSCRIPTION_MANAGER_ACTIVE_SUBSCRIPTIONS"}</h3>
  <table class="table">
    <tr><th>ID</th><th>Account</th><th>Plan</th></tr>
    {foreach from=$subscriptions item=subscription}
      <tr><td>{$subscription.id}</td><td>{$subscription.accountid}</td><td>{$subscription.planname}</td></tr>
    {/foreach}
  </table>

  <h3>{echo phrase="SUBSCRIPTION_MANAGER_RECENT_USAGE"}</h3>
  <table class="table">
    <tr><th>ID</th><th>Subscription</th><th>Plan</th><th>Quantity</th><th>Date</th><th>Invoice</th></tr>
    {foreach from=$usageRecords item=usage}
      <tr><td>{$usage.id}</td><td>{$usage.subscriptionid}</td><td>{$usage.planname}</td><td>{$usage.quantity}</td><td>{$usage.usage_date}</td><td>{$usage.invoiceid}</td></tr>
    {/foreach}
  </table>
</div>
