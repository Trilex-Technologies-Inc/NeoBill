<div class="manager_content registered-domains-page">
  <div class="registered-domains-shell">
    <div class="registered-domains-header">
      <div class="registered-domains-title">
        <span class="registered-domains-icon"><i class="ti ti-world"></i></span>
        <div>
          <span class="registered-domains-kicker">Domains</span>
          <h2>{echo phrase="REGISTERED_DOMAINS"}</h2>
          <p>Search, review, and maintain active domain registrations.</p>
        </div>
      </div>
      <div class="registered-domains-actions">
        <a href="manager_content.php?page=domains_register" class="btn btn-primary">
          <i class="ti ti-plus"></i> Register Domain
        </a>
      </div>
    </div>

    <div class="registered-domains-toolbar">
      <div class="registered-domains-search">
        <div class="registered-domains-search-header">
          <span><i class="ti ti-search"></i></span>
          <div>
            <h3>Find Domains</h3>
            <p>Filter by domain, extension, or account name.</p>
          </div>
        </div>
        {form name="search_domains"}
          <div class="registered-domains-search-grid">
            <div class="registered-domains-field">
              <label class="form-label">{echo phrase="DOMAIN_NAME"}</label>
              {form_description field="fulldomainname"}
              <div class="registered-domains-input-icon">
                <i class="ti ti-world-www"></i>
                {form_element field="fulldomainname" size="30" class="form-control"}
              </div>
            </div>
            <div class="registered-domains-field">
              <label class="form-label">{echo phrase="TLD"}</label>
              {form_description field="tld"}
              <div class="registered-domains-input-icon">
                <i class="ti ti-point"></i>
                {form_element field="tld" size="6" class="form-control"}
              </div>
            </div>
            <div class="registered-domains-field">
              <label class="form-label">{echo phrase="ACCOUNT_NAME"}</label>
              {form_description field="accountname"}
              <div class="registered-domains-input-icon">
                <i class="ti ti-user"></i>
                {form_element field="accountname" size="30" class="form-control"}
              </div>
            </div>
            <div class="registered-domains-submit">
              {form_element field="search" class="btn btn-primary"}
            </div>
          </div>
        {/form}
      </div>
    </div>

    <div class="registered-domains-table-card">
      <div class="registered-domains-table-header">
        <div>
          <span>Inventory</span>
          <h3>Active Registrations</h3>
        </div>
        <a href="manager_content.php?page=domains_expired" class="registered-domains-link-button">
          <i class="ti ti-alert-triangle"></i> Expired Domains
        </a>
      </div>
      <div class="registered-domains-table-wrap table-responsive">
        {form name="registered_domains"}
          {form_table field="domains" class="table table-hover align-middle mb-0" empty="[THERE_ARE_NO_REGISTERED_DOMAINS]"}
            {form_table_column columnid="" header="[SELECT]"}
              <span class="registered-domains-check">{form_table_checkbox option=$domains.id}</span>
            {/form_table_column}
            {form_table_column columnid="fulldomainname" header="[DOMAIN_NAME]"}
              <a href="manager_content.php?page=domains_edit_domain&dpurchase={$domains.id}" class="registered-domains-domain">
                <i class="ti ti-world"></i>
                {$domains.fulldomainname}
              </a>
            {/form_table_column}
            {form_table_column columnid="accountname" header="[ACCOUNT]"}
              <a href="manager_content.php?page=accounts_view_account&account={$domains.accountid}" class="registered-domains-account">
                {$domains.accountname}
              </a>
            {/form_table_column}
            {form_table_column columnid="date" header="[REGISTRATION_DATE]"}
              <span class="registered-domains-date">{$domains.date|datetime:date}</span>
            {/form_table_column}
            {form_table_column columnid="term" header="[TERM]"}
              <span class="registered-domains-term">{$domains.term} {echo phrase="YEAR"}(s)</span>
            {/form_table_column}
            {form_table_column columnid="expiredate" header="[EXPIRATION_DATE]"}
              {assign var="expireDate" value=$domains.expiredate|datetime:date}
              {assign var="expireDateRaw" value=$domains.expiredate}
              {if $expireDateRaw < $smarty.now}
                <span class="registered-domains-expire registered-domains-expire-danger">
                  <i class="ti ti-alert-triangle"></i>
                  {$expireDate}
                </span>
              {else}
                <span class="registered-domains-expire registered-domains-expire-success">
                  <i class="ti ti-circle-check"></i>
                  {$expireDate}
                </span>
              {/if}
            {/form_table_column}
            {form_table_footer}
              <tr>
                <td colspan="6">
                  <div class="registered-domains-remove-actions">
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
