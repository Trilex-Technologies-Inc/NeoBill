<div class="manager_content">
  <h2>{echo phrase="SUBSCRIPTION_MANAGER_DUNNING"}</h2>
  {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

  {form name="subscriptionmanager_schedule_dunning"}
    <div class="form">
      <table>
        <tr><th>{form_description field="subscriptionid"}</th><td>{form_element field="subscriptionid" size="8"}</td></tr>
        <tr><th>{form_description field="invoiceid"}</th><td>{form_element field="invoiceid" size="8"}</td></tr>
        <tr class="footer"><td colspan="2">{form_element field="save"}</td></tr>
      </table>
    </div>
  {/form}

  <h3>{echo phrase="SUBSCRIPTION_MANAGER_DUNNING_ATTEMPTS"}</h3>
  <table class="table">
    <tr><th>ID</th><th>Subscription</th><th>Plan</th><th>Invoice</th><th>Attempt</th><th>Status</th><th>Scheduled</th><th>Message</th></tr>
    {foreach from=$attempts item=attempt}
      <tr>
        <td>{$attempt.id}</td>
        <td>{$attempt.subscriptionid}</td>
        <td>{$attempt.planname}</td>
        <td>{$attempt.invoiceid}</td>
        <td>{$attempt.attempt_number}</td>
        <td>{$attempt.status}</td>
        <td>{$attempt.scheduled_at}</td>
        <td>{$attempt.message}</td>
      </tr>
    {/foreach}
  </table>
</div>
