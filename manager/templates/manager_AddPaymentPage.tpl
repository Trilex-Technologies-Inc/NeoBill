<div class="manager_content billing-payment-page">
{form name="new_payment"}

  <div class="billing-payment-shell">
    <div class="billing-payment-header">
      <div class="billing-payment-title">
        <span class="billing-payment-icon">
          <i class="ti ti-cash-banknote"></i>
        </span>
        <div>
          <span class="billing-payment-kicker">Billing</span>
          <h2>[ENTER_PAYMENT]</h2>
          <p>Record a payment for {dbo_echo dbo="account_dbo" field="accountname"}.</p>
        </div>
      </div>
    </div>

    <div class="billing-payment-grid">
      <div class="billing-payment-card">
        <div class="billing-payment-card-header">
          <span><i class="ti ti-file-invoice"></i></span>
          <div>
            <h3>Account &amp; Invoice</h3>
            <p>Confirm where this payment should be applied.</p>
          </div>
        </div>
        <div class="billing-payment-card-body">
          <div class="billing-payment-field">
            <label class="form-label">{echo phrase="ACCOUNT"}</label>
            <div class="billing-payment-input-icon">
              <i class="ti ti-user"></i>
              <input type="text" class="form-control" value="{dbo_echo dbo="account_dbo" field="accountname"}" readonly="readonly" />
            </div>
          </div>

          <div class="billing-payment-field">
            <label class="form-label">{form_description field="invoice"}</label>
            {if isset($invoice_id)}
              <div class="billing-payment-input-icon">
                <i class="ti ti-hash"></i>
                <input type="text" class="form-control" value="{echo phrase="INVOICE"} #{$invoice_id}" readonly="readonly" />
              </div>
            {else}
              {form_element field="invoice" class="form-select"}
              <small>Select the invoice that should receive this payment.</small>
            {/if}
          </div>
        </div>
      </div>

      <div class="billing-payment-card billing-payment-summary-card">
        <div class="billing-payment-card-header">
          <span><i class="ti ti-checkup-list"></i></span>
          <div>
            <h3>Payment Details</h3>
            <p>Enter the amount, method, date, and transaction references.</p>
          </div>
        </div>
        <div class="billing-payment-card-body">
          <div class="row g-3">
            <div class="col-md-6">
              <div class="billing-payment-field">
                <label class="form-label">{form_description field="date"}</label>
                <div class="billing-payment-input-icon">
                  <i class="ti ti-calendar"></i>
                  {form_element field="date" class="form-control"}
                </div>
              </div>
            </div>

            <div class="col-md-6">
              <div class="billing-payment-field">
                <label class="form-label">{form_description field="amount"}</label>
                <div class="billing-payment-input-icon">
                  <i class="ti ti-currency-dollar"></i>
                  {form_element field="amount" size="7" class="form-control" placeholder="0.00"}
                </div>
              </div>
            </div>

            <div class="col-md-12">
              <div class="billing-payment-field">
                <label class="form-label">{form_description field="type"}</label>
                {form_element field="type" class="form-select"}
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
