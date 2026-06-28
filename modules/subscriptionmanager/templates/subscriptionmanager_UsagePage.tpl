<div class="manager_content subscriptionmanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header">
      <div class="subscriptionmanager-title">
        <span class="subscriptionmanager-title-icon"><i class="ti ti-chart-bar"></i></span>
        <div>
          <span>Subscription Manager</span>
          <h2>{echo phrase="SUBSCRIPTION_MANAGER_USAGE"}</h2>
        </div>
      </div>
    </div>

    {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

    <div class="subscriptionmanager-grid">
      <section class="subscriptionmanager-card">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-database-plus"></i></span>
          <div>
            <h3>Record Usage</h3>
            <p>Add metered quantities for usage-based plans.</p>
          </div>
        </div>
        {form name="subscriptionmanager_usage_record"}
          <div class="subscriptionmanager-form-grid">
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="subscriptionid"}</label>
              {form_element field="subscriptionid" size="8"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="quantity"}</label>
              {form_element field="quantity" size="10"}
            </div>
            <div class="subscriptionmanager-field subscriptionmanager-field-wide">
              <label class="form-label">{form_description field="description"}</label>
              {form_element field="description" size="60"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="usage_date"}</label>
              {form_element field="usage_date"}
            </div>
          </div>
          <div class="subscriptionmanager-actions">{form_element field="save"}</div>
        {/form}
      </section>

      <section class="subscriptionmanager-card subscriptionmanager-card-table">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-repeat"></i></span>
          <div>
            <h3>{echo phrase="SUBSCRIPTION_MANAGER_ACTIVE_SUBSCRIPTIONS"}</h3>
            <p>Use the subscription ID when recording usage.</p>
          </div>
        </div>
        <div class="subscriptionmanager-table-wrap">
          <table class="table subscriptionmanager-table">
            <thead><tr><th>ID</th><th>Account</th><th>Plan</th></tr></thead>
            <tbody>
              {foreach from=$subscriptions item=subscription}
                <tr><td>{$subscription.id}</td><td>{$subscription.accountid}</td><td><strong>{$subscription.planname}</strong></td></tr>
              {/foreach}
            </tbody>
          </table>
        </div>
      </section>
    </div>

    <section class="subscriptionmanager-card subscriptionmanager-card-table">
      <div class="subscriptionmanager-card-header">
        <span><i class="ti ti-history"></i></span>
        <div>
          <h3>{echo phrase="SUBSCRIPTION_MANAGER_RECENT_USAGE"}</h3>
          <p>Recent usage records and invoice assignment.</p>
        </div>
      </div>
      <div class="subscriptionmanager-table-wrap">
        <table class="table subscriptionmanager-table">
          <thead><tr><th>ID</th><th>Subscription</th><th>Plan</th><th>Quantity</th><th>Date</th><th>Invoice</th></tr></thead>
          <tbody>
            {foreach from=$usageRecords item=usage}
              <tr><td>{$usage.id}</td><td>{$usage.subscriptionid}</td><td><strong>{$usage.planname}</strong></td><td>{$usage.quantity}</td><td>{$usage.usage_date}</td><td>{$usage.invoiceid}</td></tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </section>
  </div>
</div>
