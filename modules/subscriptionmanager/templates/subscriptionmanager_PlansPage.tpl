<div class="manager_content">
  <h2>{echo phrase="SUBSCRIPTION_MANAGER_PLANS"}</h2>
  {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

  {form name="subscriptionmanager_plan_create"}
    <div class="form">
      <table>
        <tr><th>{form_description field="name"}</th><td>{form_element field="name" size="40"}</td></tr>
        <tr><th>{form_description field="description"}</th><td>{form_element field="description" cols="70" rows="4"}</td></tr>
        <tr><th>{form_description field="billing_type"}</th><td>{form_element field="billing_type"}</td></tr>
        <tr><th>{form_description field="billing_cycle"}</th><td>{form_element field="billing_cycle"}</td></tr>
        <tr><th>{form_description field="cycle_interval"}</th><td>{form_element field="cycle_interval" value="1" size="5"}</td></tr>
        <tr><th>{form_description field="amount"}</th><td>{form_element field="amount" value="0.00" size="10"}</td></tr>
        <tr><th>{form_description field="included_quantity"}</th><td>{form_element field="included_quantity" value="0" size="10"}</td></tr>
        <tr><th>{form_description field="unit_amount"}</th><td>{form_element field="unit_amount" value="0.0000" size="10"}</td></tr>
        <tr><th>{form_description field="trial_days"}</th><td>{form_element field="trial_days" value="0" size="5"}</td></tr>
        <tr><th>{form_description field="intro_amount"}</th><td>{form_element field="intro_amount" size="10"}</td></tr>
        <tr><th>{form_description field="intro_cycles"}</th><td>{form_element field="intro_cycles" value="0" size="5"}</td></tr>
        <tr><th>{form_description field="taxable"}</th><td>{form_element field="taxable"}</td></tr>
        <tr class="footer"><td colspan="2">{form_element field="save"}</td></tr>
      </table>
    </div>
  {/form}

  <h3>{echo phrase="SUBSCRIPTION_MANAGER_EXISTING_PLANS"}</h3>
  <table class="table">
    <tr>
      <th>ID</th><th>{echo phrase="SUBSCRIPTION_MANAGER_PRICE_ID"}</th><th>{echo phrase="SUBSCRIPTION_MANAGER_PLAN_NAME"}</th>
      <th>{echo phrase="SUBSCRIPTION_MANAGER_BILLING_TYPE"}</th><th>{echo phrase="SUBSCRIPTION_MANAGER_BILLING_CYCLE"}</th><th>{echo phrase="SUBSCRIPTION_MANAGER_AMOUNT"}</th>
    </tr>
    {foreach from=$plans item=plan}
      <tr>
        <td>{$plan.id}</td>
        <td>{$plan.priceid}</td>
        <td>{$plan.name}</td>
        <td>{$plan.billing_type}</td>
        <td>{$plan.billing_cycle}</td>
        <td>{$plan.amount}</td>
      </tr>
    {/foreach}
  </table>
</div>
