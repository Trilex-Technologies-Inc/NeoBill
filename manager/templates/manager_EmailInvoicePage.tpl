<div class="manager_content email-invoice-page">
  <div class="email-invoice-shell">
    {form name="email_invoice"}
      <div class="email-invoice-header">
        <div class="email-invoice-title">
          <span class="email-invoice-icon"><i class="ti ti-mail-forward"></i></span>
          <div>
            <span class="email-invoice-kicker">[BILLING_INVOICES]</span>
            <h2>[EMAIL_INVOICE]</h2>
            <p>{form_description field="subject"}</p>
          </div>
        </div>
      </div>

      <div class="email-invoice-grid">
        <div class="email-invoice-card">
          <div class="email-invoice-card-header">
            <span><i class="ti ti-send"></i></span>
            <div>
              <h3>[EMAIL_INVOICE]</h3>
              <p>{form_description field="email"}</p>
            </div>
          </div>

          <div class="email-invoice-card-body">
            <div class="email-invoice-field">
              <label class="form-label">{form_description field="email"}</label>
              <div class="email-invoice-input-icon">
                <i class="ti ti-at"></i>
                {form_element field="email" size="30" value="$email" class="form-control"}
              </div>
            </div>

            <div class="email-invoice-field">
              <label class="form-label">{form_description field="subject"}</label>
              <div class="email-invoice-input-icon">
                <i class="ti ti-message-circle"></i>
                {form_element field="subject" size="60" value="$subject" class="form-control"}
              </div>
            </div>
          </div>
        </div>

        <div class="email-invoice-card email-invoice-body-card">
          <div class="email-invoice-card-header">
            <span><i class="ti ti-file-invoice"></i></span>
            <div>
              <h3>{form_description field="invoice"}</h3>
              <p>[EMAIL_INVOICE]</p>
            </div>
          </div>

          <div class="email-invoice-card-body">
            <div class="email-invoice-field">
              <label class="form-label">{form_description field="invoice"}</label>
              {form_element field="invoice" cols="80" rows="20" value="$body" class="form-control"}
            </div>
          </div>
        </div>
      </div>

      <div class="email-invoice-actions">
        {form_element field="cancel" class="btn btn-outline-secondary"}
        {form_element field="continue" class="btn btn-primary"}
      </div>
    {/form}
  </div>
</div>
