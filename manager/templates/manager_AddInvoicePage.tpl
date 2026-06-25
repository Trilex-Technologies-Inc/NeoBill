<div class="manager_content add-invoice-page">
  <div class="add-invoice-shell">
    {form name="new_invoice"}
      <div class="add-invoice-header">
        <div class="add-invoice-title">
          <span class="add-invoice-icon"><i class="ti ti-file-invoice"></i></span>
          <div>
            <span class="add-invoice-kicker">[CREATE_INVOICE]</span>
            <h2>[CREATE_INVOICE]</h2>
            <p>[INVOICE_PERIOD]</p>
          </div>
        </div>

      </div>

      <div class="add-invoice-grid">
        <div class="add-invoice-card">
          <div class="add-invoice-card-header">
            <span><i class="ti ti-user-dollar"></i></span>
            <div>
              <h3>{form_description field="account"}</h3>
              <p>[CREATE_INVOICE]</p>
            </div>
          </div>

          <div class="add-invoice-card-body">
            <div class="add-invoice-field">
              <label class="form-label">{form_description field="account"}</label>
              {if isset($account_name)}
                <div class="add-invoice-account-pill">
                  <i class="ti ti-building-bank"></i>
                  <span>{$account_name}</span>
                </div>
                <input type="hidden" name="account" value="{$account}"/>
              {else}
                <div class="add-invoice-select">
                  <i class="ti ti-search"></i>
                  {form_element field="account"}
                </div>
              {/if}
            </div>

            <div class="add-invoice-field">
              <label class="form-label">{form_description field="date"}</label>
              <div class="add-invoice-input-icon">
                <i class="ti ti-calendar"></i>
                {form_element field="date" type="date" class="form-control"}
              </div>
            </div>

            <div class="add-invoice-period-grid">
              <div class="add-invoice-field">
                <label class="form-label">{form_description field="periodbegin"}</label>
                <div class="add-invoice-input-icon">
                  <i class="ti ti-calendar-event"></i>
                  {form_element field="periodbegin" type="date" class="form-control"}
                </div>
              </div>

              <div class="add-invoice-field">
                <label class="form-label">{form_description field="periodend"}</label>
                <div class="add-invoice-input-icon">
                  <i class="ti ti-calendar-due"></i>
                  {form_element field="periodend" type="date" value=$nextMonth class="form-control"}
                </div>
              </div>
            </div>

            <div class="add-invoice-field">
              <label class="form-label">{form_description field="terms"}</label>
              <div class="add-invoice-terms">
                {form_element field="terms" size="2"}
                <span>[TERMS_DAYS]</span>
              </div>
            </div>
          </div>
        </div>

        <div class="add-invoice-card add-invoice-note-card">
          <div class="add-invoice-card-header">
            <span><i class="ti ti-message-2"></i></span>
            <div>
              <h3>{form_description field="note"}</h3>
              <p>[NOTE_TO_CUSTOMER]</p>
            </div>
          </div>

          <div class="add-invoice-card-body">
            <div class="add-invoice-field">
              <label class="form-label">{form_description field="note"}</label>
              {form_element field="note" cols="45" rows="13" class="form-control"}
            </div>
          </div>
        </div>
      </div>

      <div class="add-invoice-actions">
        {form_element field="cancel" class="btn btn-outline-secondary"}
        {form_element field="continue" class="btn btn-primary"}
      </div>
    {/form}
  </div>
</div>
