<div class="manager_content transfer-domain-page">
  <div class="transfer-domain-shell">
    <div class="transfer-domain-header">
      <div class="transfer-domain-title">
        <span class="transfer-domain-icon"><i class="ti ti-transfer-in"></i></span>
        <div>
          <span class="transfer-domain-kicker">Domains</span>
          <h2>{echo phrase="TRANSFER"} {dbo_echo dbo="dspdbo" field="fulldomainname"}</h2>
          <p>Choose the account and term for this transfer.</p>
        </div>
      </div>
    </div>

    {form name="transfer_domain_service"}
      <div class="transfer-domain-card card">
        <div class="card-header transfer-domain-card-header">
          <div>
            <span>Transfer Setup</span>
            <h3>Assign the domain to an account</h3>
          </div>
        </div>
        <div class="card-body">
          <div class="transfer-domain-grid">
            <div class="transfer-domain-field">
              <label class="form-label">{form_description field="account"}</label>
              {form_element field="account" class="form-select"}
            </div>
            <div class="transfer-domain-field">
              <label class="form-label">{form_description field="term"}</label>
              {form_element field="term" class="form-select"}
            </div>
          </div>
        </div>
        <div class="card-footer transfer-domain-footer transfer-domain-footer-split">
          <div>{form_element field="cancel" class="btn btn-outline-secondary transfer-domain-cancel"}</div>
          <div>{form_element field="continue" class="btn btn-primary transfer-domain-submit"}</div>
        </div>
      </div>
    {/form}
  </div>
</div>
