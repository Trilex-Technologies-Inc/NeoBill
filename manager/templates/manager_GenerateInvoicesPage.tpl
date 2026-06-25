<div class="manager_content generate-invoices-page">
  <div class="generate-invoices-shell">
    {form name="generate_invoices"}
      <div class="generate-invoices-header">
        <div class="generate-invoices-title">
          <span class="generate-invoices-icon"><i class="ti ti-file-stack"></i></span>
          <div>
            <span class="generate-invoices-kicker">{echo phrase="BILLING_INVOICES"}</span>
            <h2>{echo phrase="GENERATE_INVOICE_BATCH"}</h2>
            <p>{echo phrase="INVOICE_PERIOD"}</p>
          </div>
        </div>
      </div>

      <div class="generate-invoices-grid">
        <div class="generate-invoices-card">
          <div class="generate-invoices-card-header">
            <span><i class="ti ti-calendar-dollar"></i></span>
            <div>
              <h3>{echo phrase="GENERATE_INVOICES"}</h3>
              <p>{form_description field="date"}</p>
            </div>
          </div>

          <div class="generate-invoices-card-body">
            <div class="generate-invoices-field">
              <label class="form-label">{form_description field="date"}</label>
              <div class="generate-invoices-input-icon">
                <i class="ti ti-calendar"></i>
                {form_element field="date" class="form-control"}
              </div>
            </div>

            <div class="generate-invoices-period-grid">
              <div class="generate-invoices-field">
                <label class="form-label">{form_description field="periodbegin"}</label>
                <div class="generate-invoices-input-icon">
                  <i class="ti ti-calendar-event"></i>
                  {form_element field="periodbegin" class="form-control"}
                </div>
              </div>

              <div class="generate-invoices-field">
                <label class="form-label">{form_description field="periodend"}</label>
                <div class="generate-invoices-input-icon">
                  <i class="ti ti-calendar-due"></i>
                  {form_element field="periodend" value=$nextMonth class="form-control"}
                </div>
              </div>
            </div>

            <div class="generate-invoices-field">
              <label class="form-label">{form_description field="terms"}</label>
              <div class="generate-invoices-terms">
                {form_element field="terms" size="2" class="form-control"}
                <span>{echo phrase="TERMS_DAYS"}</span>
              </div>
            </div>
          </div>
        </div>

        <div class="generate-invoices-card generate-invoices-note-card">
          <div class="generate-invoices-card-header">
            <span><i class="ti ti-message-2"></i></span>
            <div>
              <h3>{form_description field="note"}</h3>
              <p>{echo phrase="NOTE_TO_CUSTOMER"}</p>
            </div>
          </div>

          <div class="generate-invoices-card-body">
            <div class="generate-invoices-field">
              <label class="form-label">{form_description field="note"}</label>
              {form_element field="note" rows="10" cols="60" class="form-control"}
            </div>
          </div>
        </div>
      </div>

      <div class="generate-invoices-actions">
        {form_element field="cancel" class="btn btn-outline-secondary"}
        {form_element field="continue" class="btn btn-primary"}
      </div>
    {/form}
  </div>
</div>
