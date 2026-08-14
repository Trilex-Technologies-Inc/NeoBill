<div class="manager_content transfer-domain-page">
  <div class="transfer-domain-shell">
    <div class="transfer-domain-header">
      <div class="transfer-domain-title">
        <span class="transfer-domain-icon"><i class="ti ti-transfer-in"></i></span>
        <div>
          <span class="transfer-domain-kicker">Domains</span>
          <h2>{echo phrase="TRANSFER_DOMAIN"}</h2>
          <p>Move an external domain into your management flow.</p>
        </div>
      </div>
      <div class="transfer-domain-actions">
        <a href="manager_content.php?page=domains_browse" class="btn btn-outline-primary">
          <i class="ti ti-world"></i> Registered Domains
        </a>
      </div>
    </div>

    {form name="transfer_domain"}
      <div class="transfer-domain-card card">
        <div class="card-header transfer-domain-card-header">
          <div>
            <span>Transfer Details</span>
            <h3>Enter the domain and authorization code</h3>
          </div>
        </div>
        <div class="card-body">
          <div class="transfer-domain-grid">
            <div class="transfer-domain-field">
              <label class="form-label">{form_description field="domainname"}</label>
              <div class="transfer-domain-input-group input-group">
                {form_element field="domainname" class="form-control transfer-domain-input"}
                <span class="input-group-text transfer-domain-separator">.</span>
                {form_element field="servicetld" class="form-select transfer-domain-tld"}
              </div>
              <div class="transfer-domain-help">Use the exact domain name and extension you want to transfer.</div>
            </div>

            <div class="transfer-domain-field">
              <label class="form-label">{form_description field="secret"}</label>
              {form_element field="secret" size="10" class="form-control transfer-domain-secret"}
              <div class="transfer-domain-help">{echo phrase="TRANSFER_SECRET_HELP"}</div>
            </div>
          </div>
        </div>
        <div class="card-footer transfer-domain-footer">
          {form_element field="continue" class="btn btn-primary transfer-domain-submit"}
        </div>
      </div>
    {/form}
  </div>
</div>
