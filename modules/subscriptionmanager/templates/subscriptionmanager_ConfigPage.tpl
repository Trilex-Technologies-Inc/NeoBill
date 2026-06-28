<div class="manager_content subscriptionmanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header">
      <div class="subscriptionmanager-title">
        <span class="subscriptionmanager-title-icon"><i class="ti ti-settings"></i></span>
        <div>
          <span>Subscription Manager</span>
          <h2>{echo phrase="SUBSCRIPTION_MANAGER"}</h2>
        </div>
      </div>
    </div>

    {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

    <div class="subscriptionmanager-grid subscriptionmanager-grid-narrow">
      <section class="subscriptionmanager-card">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-adjustments"></i></span>
          <div>
            <h3>Billing Settings</h3>
            <p>Configure invoice terms, retries, failed payment email, and card update URL.</p>
          </div>
        </div>
        {form name="subscriptionmanager_config"}
          <div class="subscriptionmanager-form-grid">
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="invoice_terms"}</label>
              {form_element field="invoice_terms" value="$invoice_terms" size="5"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="retry_schedule"}</label>
              {form_element field="retry_schedule" value="$retry_schedule" size="30"}
            </div>
            <div class="subscriptionmanager-field subscriptionmanager-field-wide">
              <label class="form-label">{form_description field="failed_payment_subject"}</label>
              {form_element field="failed_payment_subject" value="$failed_payment_subject" size="60"}
            </div>
            <div class="subscriptionmanager-field subscriptionmanager-field-wide">
              <label class="form-label">{form_description field="failed_payment_email"}</label>
              {form_element field="failed_payment_email" value="$failed_payment_email" cols="70" rows="8"}
            </div>
            <div class="subscriptionmanager-field subscriptionmanager-field-wide">
              <label class="form-label">{form_description field="card_update_url"}</label>
              {form_element field="card_update_url" value="$card_update_url" size="60"}
            </div>
          </div>
          <div class="subscriptionmanager-actions">{form_element field="save"}</div>
        {/form}
      </section>

      <section class="subscriptionmanager-card">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-database"></i></span>
          <div>
            <h3>{echo phrase="SUBSCRIPTION_MANAGER_INSTALL_FILES"}</h3>
            <p>Schema files used by the installable module.</p>
          </div>
        </div>
        <div class="subscriptionmanager-path-list">
          <span>modules/subscriptionmanager/sql/install.sql</span>
          <span>modules/subscriptionmanager/sql/uninstall.sql</span>
        </div>
      </section>
    </div>
  </div>
</div>
