<div class="manager_content subscriptionmanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header">
      <div class="subscriptionmanager-title">
        <span class="subscriptionmanager-title-icon"><i class="ti ti-repeat"></i></span>
        <div>
          <span>Subscription Manager</span>
          <h2>{echo phrase="SUBSCRIPTION_MANAGER_SUBSCRIPTIONS"}</h2>
        </div>
      </div>
    </div>

    {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

    <div class="subscriptionmanager-grid">
      <section class="subscriptionmanager-card">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-user-plus"></i></span>
          <div>
            <h3>{echo phrase="SUBSCRIPTION_MANAGER_CREATE_SUBSCRIPTION"}</h3>
            <p>Attach an account to a plan and start its billing cycle.</p>
          </div>
        </div>
        {form name="subscriptionmanager_subscription_create"}
          <div class="subscriptionmanager-form-grid">
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="accountid"}</label>
              {form_element field="accountid" size="8"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="planid"}</label>
              {form_element field="planid" size="8"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="priceid"}</label>
              {form_element field="priceid" size="8"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="quantity"}</label>
              {form_element field="quantity" value="1" size="8"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="status"}</label>
              {form_element field="status"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="start_date"}</label>
              {form_element field="start_date"}
            </div>
          </div>
          <div class="subscriptionmanager-actions">{form_element field="save"}</div>
        {/form}
      </section>

      <section class="subscriptionmanager-card subscriptionmanager-card-table">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-list-search"></i></span>
          <div>
            <h3>{echo phrase="SUBSCRIPTION_MANAGER_AVAILABLE_PLANS"}</h3>
            <p>Copy the IDs from here into the subscription form.</p>
          </div>
        </div>
        <div class="subscriptionmanager-table-wrap">
          <table class="table subscriptionmanager-table">
            <thead><tr><th>Plan ID</th><th>Price ID</th><th>Name</th><th>Cycle</th><th>Amount</th></tr></thead>
            <tbody>
              {foreach from=$plans item=plan}
                <tr><td>{$plan.id}</td><td>{$plan.priceid}</td><td><strong>{$plan.name}</strong></td><td>{$plan.billing_cycle}</td><td>{$plan.amount}</td></tr>
              {/foreach}
            </tbody>
          </table>
        </div>
      </section>
    </div>

    <section class="subscriptionmanager-card subscriptionmanager-card-table">
      <div class="subscriptionmanager-card-header">
        <span><i class="ti ti-users"></i></span>
        <div>
          <h3>{echo phrase="SUBSCRIPTION_MANAGER_EXISTING_SUBSCRIPTIONS"}</h3>
          <p>Track status, next billing date, and current period end.</p>
        </div>
      </div>
      <div class="subscriptionmanager-table-wrap">
        <table class="table subscriptionmanager-table">
          <thead><tr><th>ID</th><th>Account</th><th>Plan</th><th>Status</th><th>Next Billing</th><th>Period End</th></tr></thead>
          <tbody>
            {foreach from=$subscriptions item=subscription}
              <tr>
                <td>{$subscription.id}</td>
                <td>{$subscription.accountid}</td>
                <td><strong>{$subscription.planname}</strong></td>
                <td><span class="subscriptionmanager-badge">{$subscription.status}</span></td>
                <td>{$subscription.nextbillingdate}</td>
                <td>{$subscription.current_period_end}</td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </section>
  </div>
</div>
