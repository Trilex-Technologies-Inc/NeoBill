<div class="manager_content expired-domains-page">
  <div class="expired-domains-shell">
    <div class="expired-domains-header">
      <div class="expired-domains-title">
        <span class="expired-domains-icon"><i class="ti ti-alert-triangle"></i></span>
        <div>
          <span class="expired-domains-kicker">Domains</span>
          <h2>{echo phrase="EXPIRED_DOMAINS"}</h2>
          <p>Review registrations that need renewal, cleanup, or account follow-up.</p>
        </div>
      </div>
      <div class="expired-domains-actions">
        <a href="manager_content.php?page=domains_browse" class="btn btn-outline-primary">
          <i class="ti ti-world"></i> Registered Domains
        </a>
      </div>
    </div>

    <div class="expired-domains-toolbar">
      <div class="expired-domains-search">
        <div class="expired-domains-search-header">
          <span><i class="ti ti-search"></i></span>
          <div>
            <h3>Find Expired Domains</h3>
            <p>Filter overdue registrations by domain, extension, or account.</p>
          </div>
        </div>
        {form name="search_expired_domains"}
          <div class="expired-domains-search-grid">
            <div class="expired-domains-field">
              <label class="form-label">{echo phrase="DOMAIN_NAME"}</label>
              {form_description field="fulldomainname"}
              <div class="expired-domains-input-icon">
                <i class="ti ti-world-www"></i>
                {form_element field="fulldomainname" size="30" class="form-control"}
              </div>
            </div>
            <div class="expired-domains-field">
              <label class="form-label">{echo phrase="TLD"}</label>
              {form_description field="tld"}
              <div class="expired-domains-input-icon">
                <i class="ti ti-point"></i>
                {form_element field="tld" size="6" class="form-control"}
              </div>
            </div>
            <div class="expired-domains-field">
              <label class="form-label">{echo phrase="ACCOUNT_NAME"}</label>
              {form_description field="accountname"}
              <div class="expired-domains-input-icon">
                <i class="ti ti-user"></i>
                {form_element field="accountname" size="30" class="form-control"}
              </div>
            </div>
            <div class="expired-domains-submit">
              {form_element field="search" class="btn btn-primary"}
            </div>
          </div>
        {/form}
      </div>
    </div>

    <div class="expired-domains-table-card">
      <div class="expired-domains-table-header">
        <div>
          <span>Overdue</span>
          <h3>Expired Registrations</h3>
        </div>
        <span class="expired-domains-badge">
          <i class="ti ti-alert-circle"></i> Renewal Required
        </span>
      </div>
      <div class="expired-domains-table-wrap table-responsive">
        {form name="expired_domains"}
          {form_table field="domains" class="table table-hover align-middle mb-0" empty="[THERE_ARE_NO_REGISTERED_DOMAINS]"}
            {form_table_column columnid="" header="[SELECT]"}
              <span class="expired-domains-check">{form_table_checkbox option=$domains.id}</span>
            {/form_table_column}
            {form_table_column columnid="fulldomainname" header="[DOMAIN_NAME]"}
              <a href="manager_content.php?page=domains_edit_domain&dpurchase={$domains.id}" class="expired-domains-domain">
                <i class="ti ti-world"></i>
                {$domains.fulldomainname}
              </a>
            {/form_table_column}
            {form_table_column columnid="accountname" header="[ACCOUNT]"}
              <a href="manager_content.php?page=accounts_view_account&account={$domains.accountid}" class="expired-domains-account">
                {$domains.accountname}
              </a>
            {/form_table_column}
            {form_table_column columnid="date" header="[REGISTRATION_DATE]"}
              <span class="expired-domains-date">{$domains.date|datetime:date}</span>
            {/form_table_column}
            {form_table_column columnid="term" header="[TERM]"}
              <span class="expired-domains-term">{$domains.term} {echo phrase="YEAR"}(s)</span>
            {/form_table_column}
            {form_table_column columnid="expiredate" header="[EXPIRATION_DATE]"}
              <span class="expired-domains-expire">
                <i class="ti ti-alert-triangle"></i>
                {$domains.expiredate|datetime:date}
              </span>
            {/form_table_column}
            {form_table_footer}
              <tr>
                <td colspan="6">
                  <div class="expired-domains-remove-actions">
                    {form_element field="remove" class="btn btn-danger"}
                  </div>
                </td>
              </tr>
            {/form_table_footer}
          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>
