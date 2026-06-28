<div class="manager_content subscriptionmanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header">
      <div class="subscriptionmanager-title">
        <span class="subscriptionmanager-title-icon"><i class="ti ti-alert-circle"></i></span>
        <div>
          <span>Subscription Manager</span>
          <h2>{echo phrase="SUBSCRIPTION_MANAGER_DUNNING"}</h2>
        </div>
      </div>
    </div>

    {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

    <div class="subscriptionmanager-grid subscriptionmanager-grid-narrow">
      <section class="subscriptionmanager-card">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-clock-plus"></i></span>
          <div>
            <h3>{echo phrase="SUBSCRIPTION_MANAGER_SCHEDULE_DUNNING"}</h3>
            <p>Schedule a retry flow for a failed subscription invoice.</p>
          </div>
        </div>
        {form name="subscriptionmanager_schedule_dunning"}
          <div class="subscriptionmanager-form-grid">
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="subscriptionid"}</label>
              {form_element field="subscriptionid" size="8"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="invoiceid"}</label>
              {form_element field="invoiceid" size="8"}
            </div>
          </div>
          <div class="subscriptionmanager-actions">{form_element field="save"}</div>
        {/form}
      </section>

      <section class="subscriptionmanager-card subscriptionmanager-card-table">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-list-check"></i></span>
          <div>
            <h3>{echo phrase="SUBSCRIPTION_MANAGER_DUNNING_ATTEMPTS"}</h3>
            <p>Retry schedule, attempt status, and failure messages.</p>
          </div>
        </div>
        <div class="subscriptionmanager-table-wrap">
          <table class="table subscriptionmanager-table">
            <thead><tr><th>ID</th><th>Subscription</th><th>Plan</th><th>Invoice</th><th>Attempt</th><th>Status</th><th>Scheduled</th><th>Message</th></tr></thead>
            <tbody>
              {foreach from=$attempts item=attempt}
                <tr>
                  <td>{$attempt.id}</td>
                  <td>{$attempt.subscriptionid}</td>
                  <td><strong>{$attempt.planname}</strong></td>
                  <td>{$attempt.invoiceid}</td>
                  <td>{$attempt.attempt_number}</td>
                  <td><span class="subscriptionmanager-badge">{$attempt.status}</span></td>
                  <td>{$attempt.scheduled_at}</td>
                  <td>{$attempt.message}</td>
                </tr>
              {/foreach}
            </tbody>
          </table>
        </div>
      </section>
    </div>
  </div>
</div>
