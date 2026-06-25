<div class="manager_content register-domain-page">
  <div class="register-domain-shell">
    <div class="register-domain-header">
      <div class="register-domain-title">
        <span class="register-domain-icon"><i class="ti ti-world-plus"></i></span>
        <div>
          <span class="register-domain-kicker">Domains</span>
          <h2>{echo phrase="REGISTER_NEW_DOMAIN"}</h2>
          <p>Check availability and start a new registration in one step.</p>
        </div>
      </div>
      <div class="register-domain-actions">
        <a href="manager_content.php?page=domains_browse" class="btn btn-outline-primary">
          <i class="ti ti-world"></i> Registered Domains
        </a>
      </div>
    </div>

    {form name="register_domain"}
      <div class="register-domain-card card">
        <div class="card-header register-domain-card-header">
          <div>
            <span>Availability</span>
            <h3>Enter the domain you want to register</h3>
          </div>
        </div>
        <div class="card-body">
          <div class="register-domain-grid">
            <div class="register-domain-field">
              <label class="form-label">{echo phrase="DOMAIN_NAME"}</label>
              {form_description field="domainname"}
              <div class="register-domain-input-group input-group">
                {form_element field="domainname" class="form-control register-domain-input"}
                <span class="input-group-text register-domain-separator">.</span>
                {form_element field="servicetld" class="form-select register-domain-tld"}
              </div>
              <div class="register-domain-help">
                Choose the base name and the extension to check availability.
              </div>
            </div>
          </div>
        </div>
        <div class="card-footer register-domain-footer">
          {form_element field="continue" class="btn btn-primary register-domain-submit"}
        </div>
      </div>
    {/form}
  </div>
</div>
