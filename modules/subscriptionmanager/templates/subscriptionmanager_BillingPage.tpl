<div class="manager_content subscriptionmanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header">
      <div class="subscriptionmanager-title">
        <span class="subscriptionmanager-title-icon"><i class="ti ti-file-invoice"></i></span>
        <div>
          <span>Subscription Manager</span>
          <h2>{echo phrase="SUBSCRIPTION_MANAGER_BILLING"}</h2>
        </div>
      </div>
    </div>

    {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

    <div class="subscriptionmanager-grid subscriptionmanager-grid-narrow">
      <section class="subscriptionmanager-card">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-player-play"></i></span>
          <div>
            <h3>{echo phrase="SUBSCRIPTION_MANAGER_RUN_BILLING"}</h3>
            <p>Create NeoBill invoices for subscriptions due on the selected date.</p>
          </div>
        </div>
        {form name="subscriptionmanager_run_billing"}
          <div class="subscriptionmanager-form-grid">
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="billing_date"}</label>
              {form_element field="billing_date" value="$today"}
            </div>
          </div>
          <div class="subscriptionmanager-actions">{form_element field="run"}</div>
        {/form}
      </section>

      <section class="subscriptionmanager-card subscriptionmanager-card-table">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-calendar-dollar"></i></span>
          <div>
            <h3>{echo phrase="SUBSCRIPTION_MANAGER_DUE_SUBSCRIPTIONS"}</h3>
            <p>Subscriptions ready to invoice for the selected run date.</p>
          </div>
        </div>
        <div class="subscriptionmanager-table-wrap">
          <table class="table subscriptionmanager-table">
            <thead><tr><th>ID</th><th>Account</th><th>Plan</th><th>Status</th><th>Next Billing</th><th>Amount</th></tr></thead>
            <tbody>
              {foreach from=$dueSubscriptions item=subscription}
                <tr>
                  <td>{$subscription.id}</td>
                  <td>{$subscription.accountid}</td>
                  <td><strong>{$subscription.planname}</strong></td>
                  <td><span class="subscriptionmanager-badge">{$subscription.status}</span></td>
                  <td>{$subscription.nextbillingdate}</td>
                  <td>{$subscription.amount}</td>
                </tr>
              {/foreach}
            </tbody>
          </table>
        </div>
      </section>
    </div>
  </div>
</div>
