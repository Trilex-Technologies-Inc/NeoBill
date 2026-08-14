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
              <select name="subscriptionid">
                <option value="">Select subscription</option>
                {foreach from=$subscriptions item=subscription}
                  <option value="{$subscription.id}">#{$subscription.id} {$subscription.planname} / #{$subscription.accountid} {$subscription.account_name}</option>
                {/foreach}
              </select>
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="invoiceid"}</label>
              <select name="invoiceid">
                <option value="">Select invoice</option>
                {foreach from=$invoices item=invoice}
                  <option value="{$invoice.id}">#{$invoice.id} / #{$invoice.accountid} {$invoice.account_name} / {$invoice.date}</option>
                {/foreach}
              </select>
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
            <thead><tr><th>ID</th><th>Subscription</th><th>Plan</th><th>Invoice</th><th>Attempt</th><th>Status</th><th>Scheduled</th><th>Message</th><th>Actions</th></tr></thead>
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
                  <td><span class="subscriptionmanager-table-action-note">Edit below</span></td>
                </tr>
                <tr class="subscriptionmanager-edit-row">
                  <td colspan="9">
                    {form name="subscriptionmanager_dunning_update"}
                      <input type="hidden" name="attemptid" value="{$attempt.id}"/>
                      <div class="subscriptionmanager-inline-edit-grid">
                        <div class="subscriptionmanager-field">
                          <label class="form-label">{form_description field="subscriptionid"}</label>
                          <select name="subscriptionid">
                            {foreach from=$subscriptions item=subscription}
                              <option value="{$subscription.id}"{if $subscription.id == $attempt.subscriptionid} selected="selected"{/if}>#{$subscription.id} {$subscription.planname} / #{$subscription.accountid} {$subscription.account_name}</option>
                            {/foreach}
                          </select>
                        </div>
                        <div class="subscriptionmanager-field">
                          <label class="form-label">{form_description field="invoiceid"}</label>
                          <select name="invoiceid">
                            {foreach from=$invoices item=invoice}
                              <option value="{$invoice.id}"{if $invoice.id == $attempt.invoiceid} selected="selected"{/if}>#{$invoice.id} / #{$invoice.accountid} {$invoice.account_name} / {$invoice.date}</option>
                            {/foreach}
                          </select>
                        </div>
                        <div class="subscriptionmanager-field">
                          <label class="form-label">{form_description field="attempt_number"}</label>
                          {form_element field="attempt_number" value=$attempt.attempt_number size="8"}
                        </div>
                        <div class="subscriptionmanager-field">
                          <label class="form-label">{form_description field="status"}</label>
                          {form_element field="status" value=$attempt.status}
                        </div>
                        <div class="subscriptionmanager-field">
                          <label class="form-label">{form_description field="scheduled_at"}</label>
                          {form_element field="scheduled_at" value=$attempt.scheduled_at size="18"}
                        </div>
                        <div class="subscriptionmanager-field subscriptionmanager-field-wide">
                          <label class="form-label">{form_description field="message"}</label>
                          {form_element field="message" value=$attempt.message size="60"}
                        </div>
                        <div class="subscriptionmanager-row-actions">
                          {form_element field="save" class="btn btn-primary"}
                        </div>
                      </div>
                    {/form}
                    {form name="subscriptionmanager_dunning_delete"}
                      <input type="hidden" name="attemptid" value="{$attempt.id}"/>
                      <div class="subscriptionmanager-row-delete">
                        {form_element field="delete" class="btn btn-outline-danger" onclick="return confirm('Delete this dunning attempt?');"}
                      </div>
                    {/form}
                  </td>
                </tr>
              {/foreach}
            </tbody>
          </table>
        </div>
      </section>
    </div>
  </div>
</div>
