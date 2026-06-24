<div class="manager_content billing-payment-page">
{form name="billing_payment"}

  <div class="billing-payment-shell">
    <div class="billing-payment-header">
      <div class="billing-payment-title">
        <span class="billing-payment-icon">
          <i class="ti ti-cash-banknote"></i>
        </span>
        <div>
          <span class="billing-payment-kicker">Billing</span>
          <h2>[ENTER_PAYMENT]</h2>
          <p>Record a payment against an outstanding invoice.</p>
        </div>
      </div>
      <a href="manager_content.php?page=billing" class="btn btn-outline-secondary">
        <i class="ti ti-arrow-left"></i>
        Billing
      </a>
    </div>

    <div class="billing-payment-grid">
      <div class="billing-payment-card">
        <div class="billing-payment-card-header">
          <span><i class="ti ti-file-invoice"></i></span>
          <div>
            <h3>Invoice</h3>
            <p>Choose the invoice that should receive this payment.</p>
          </div>
        </div>
        <div class="billing-payment-card-body">
          <div class="billing-payment-field">
            <label class="form-label">
              {form_description field="invoiceselect"}
            </label>
            {form_element field="invoiceselect" class="form-select"}
            <small>Select from outstanding invoices.</small>
          </div>

          <div class="billing-payment-divider">
            <span>or</span>
          </div>

          <div class="billing-payment-field">
            <label class="form-label">{form_description field="invoiceint"}</label>
            <div class="billing-payment-input-icon">
              <i class="ti ti-hash"></i>
              {form_element field="invoiceint" size="5" class="form-control" placeholder="Invoice number"}
            </div>
            <small>Enter an invoice ID manually.</small>
          </div>
        </div>
      </div>

      <div class="billing-payment-card billing-payment-summary-card">
        <div class="billing-payment-card-header">
          <span><i class="ti ti-checkup-list"></i></span>
          <div>
            <h3>Payment Details</h3>
            <p>Confirm the amount, method, status, and references.</p>
          </div>
        </div>
        <div class="billing-payment-card-body">
          <div class="row g-3">
            <div class="col-md-6">
              <div class="billing-payment-field">
                <label class="form-label">
                  {form_description field="date"}
                </label>
                <div class="billing-payment-input-icon">
                  <i class="ti ti-calendar"></i>
                  {form_element field="date" class="form-control"}
                </div>
              </div>
            </div>

            <div class="col-md-6">
              <div class="billing-payment-field">
                <label class="form-label">
                  {form_description field="amount"}
                </label>
                <div class="billing-payment-input-icon">
                  <i class="ti ti-currency-dollar"></i>
                  {form_element field="amount" size="7" class="form-control" placeholder="0.00"}
                </div>
              </div>
            </div>

            <div class="col-md-6">
              <div class="billing-payment-field">
                <label class="form-label">
                  {form_description field="type"}
                </label>
                {form_element field="type" class="form-select"}
              </div>
            </div>

            <div class="col-md-6">
              <div class="billing-payment-field">
                <label class="form-label">{form_description field="status"}</label>
                {form_element field="status" class="form-select"}
              </div>
            </div>

            <div class="col-md-6">
              <div class="billing-payment-field">
                <label class="form-label">{form_description field="transaction1"}</label>
                {form_element field="transaction1" size="20" class="form-control" placeholder="Check number or reference ID"}
              </div>
            </div>

            <div class="col-md-6">
              <div class="billing-payment-field">
                <label class="form-label">{form_description field="transaction2"}</label>
                {form_element field="transaction2" size="20" class="form-control" placeholder="Additional reference"}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="billing-payment-actions">
      {form_element field="cancel" class="btn btn-outline-secondary"}
      {form_element field="continue" class="btn btn-primary"}
    </div>
  </div>

{/form}
</div>
