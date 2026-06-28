<div class="manager_content subscriptionmanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header">
      <div class="subscriptionmanager-title">
        <span class="subscriptionmanager-title-icon"><i class="ti ti-list-details"></i></span>
        <div>
          <span>Subscription Manager</span>
          <h2>{echo phrase="SUBSCRIPTION_MANAGER_PLANS"}</h2>
        </div>
      </div>
    </div>

    {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

    <div class="subscriptionmanager-grid">
      <section class="subscriptionmanager-card">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-plus"></i></span>
          <div>
            <h3>Create Plan</h3>
            <p>Define the plan, cycle, price, trial, and usage rules.</p>
          </div>
        </div>
        {form name="subscriptionmanager_plan_create"}
          <div class="subscriptionmanager-form-grid">
            <div class="subscriptionmanager-field subscriptionmanager-field-wide">
              <label class="form-label">{form_description field="name"}</label>
              {form_element field="name" size="40"}
            </div>
            <div class="subscriptionmanager-field subscriptionmanager-field-wide">
              <label class="form-label">{form_description field="description"}</label>
              {form_element field="description" cols="70" rows="4"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="billing_type"}</label>
              {form_element field="billing_type"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="billing_cycle"}</label>
              {form_element field="billing_cycle"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="cycle_interval"}</label>
              {form_element field="cycle_interval" value="1" size="5"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="amount"}</label>
              {form_element field="amount" value="0.00" size="10"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="included_quantity"}</label>
              {form_element field="included_quantity" value="0" size="10"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="unit_amount"}</label>
              {form_element field="unit_amount" value="0.0000" size="10"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="trial_days"}</label>
              {form_element field="trial_days" value="0" size="5"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="intro_amount"}</label>
              {form_element field="intro_amount" size="10"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="intro_cycles"}</label>
              {form_element field="intro_cycles" value="0" size="5"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="taxable"}</label>
              {form_element field="taxable"}
            </div>
          </div>
          <div class="subscriptionmanager-actions">{form_element field="save"}</div>
        {/form}
      </section>

      <section class="subscriptionmanager-card subscriptionmanager-card-table">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-table"></i></span>
          <div>
            <h3>{echo phrase="SUBSCRIPTION_MANAGER_EXISTING_PLANS"}</h3>
            <p>Use the Plan ID and Price ID when creating subscriptions.</p>
          </div>
        </div>
        <div class="subscriptionmanager-table-wrap">
          <table class="table subscriptionmanager-table">
            <thead>
              <tr>
                <th>ID</th><th>{echo phrase="SUBSCRIPTION_MANAGER_PRICE_ID"}</th><th>{echo phrase="SUBSCRIPTION_MANAGER_PLAN_NAME"}</th>
                <th>{echo phrase="SUBSCRIPTION_MANAGER_BILLING_TYPE"}</th><th>{echo phrase="SUBSCRIPTION_MANAGER_BILLING_CYCLE"}</th><th>{echo phrase="SUBSCRIPTION_MANAGER_AMOUNT"}</th>
              </tr>
            </thead>
            <tbody>
              {foreach from=$plans item=plan}
                <tr>
                  <td>{$plan.id}</td>
                  <td>{$plan.priceid}</td>
                  <td><strong>{$plan.name}</strong></td>
                  <td><span class="subscriptionmanager-badge">{$plan.billing_type}</span></td>
                  <td>{$plan.billing_cycle}</td>
                  <td>{$plan.amount}</td>
                </tr>
              {/foreach}
            </tbody>
          </table>
        </div>
      </section>
    </div>
  </div>
</div>
