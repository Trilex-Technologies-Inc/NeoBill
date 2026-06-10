<div class="manager_content">

  <h2 class="mb-3">{echo phrase="REGISTERED_DOMAINS"}</h2>

  <!-- Search Section -->
  <div class="search mb-4">
    <div class="card">
      <div class="card-body">
        {form name="search_domains"}
          <div class="row align-items-end g-3">
            <div class="col-md-4">
              <label class="form-label fw-bold">{echo phrase="DOMAIN_NAME"}</label>
              {form_description field="fulldomainname"}
              {form_element field="fulldomainname" size="30" class="form-control"}
            </div>
            <div class="col-md-2">
              <label class="form-label fw-bold">{echo phrase="TLD"}</label>
              {form_description field="tld"}
              {form_element field="tld" size="6" class="form-control"}
            </div>
            <div class="col-md-4">
              <label class="form-label fw-bold">{echo phrase="ACCOUNT_NAME"}</label>
              {form_description field="accountname"}
              {form_element field="accountname" size="30" class="form-control"}
            </div>
            <div class="col-md-2">
              {form_element field="search" class="btn btn-primary w-100"}
            </div>
          </div>
        {/form}
      </div>
    </div>
  </div>

  <!-- Registered Domains Table -->
  <div class="table-container">
    <div class="card">
      <div class="card-body p-0">
        <div class="table-responsive">
          {form name="registered_domains"}
            {form_table field="domains" class="table table-hover table-striped align-middle mb-0" empty="[THERE_ARE_NO_REGISTERED_DOMAINS]"}
              {form_table_column columnid="" header="[SELECT]"}
                {form_table_checkbox option=$domains.id}
              {/form_table_column}
              {form_table_column columnid="fulldomainname" header="[DOMAIN_NAME]"}
                <a href="manager_content.php?page=domains_edit_domain&dpurchase={$domains.id}" class="text-decoration-none fw-bold">
                  {$domains.fulldomainname}
                </a>
              {/form_table_column}
              {form_table_column columnid="accountname" header="[ACCOUNT]"}
                <a href="manager_content.php?page=accounts_view_account&account={$domains.accountid}" class="text-decoration-none">
                  {$domains.accountname}
                </a>
              {/form_table_column}
              {form_table_column columnid="date" header="[REGISTRATION_DATE]"}
                <span class="badge bg-secondary">{$domains.date|datetime:date}</span>
              {/form_table_column}
              {form_table_column columnid="term" header="[TERM]"}
                <span class="badge bg-info">{$domains.term} {echo phrase="YEAR"}(s)</span>
              {/form_table_column}
              {form_table_column columnid="expiredate" header="[EXPIRATION_DATE]"}
                {assign var="expireDate" value=$domains.expiredate|datetime:date}
                {assign var="today" value=$smarty.now|date_format:"%Y-%m-%d"}
                {assign var="expireDateRaw" value=$domains.expiredate}
                {if $expireDateRaw < $smarty.now}
                  <span class="badge bg-danger">{$expireDate}</span>
                  <i class="bi bi-exclamation-triangle-fill ms-1 text-danger"></i>
                {else}
                  <span class="badge bg-success">{$expireDate}</span>
                {/if}
              {/form_table_column}
              {form_table_footer}
                <tr class="table-light">
                  <td colspan="6" class="p-3">
                    {form_element field="remove" class="btn btn-danger"}
                  </td>
                </tr>
              {/form_table_footer}
            {/form_table}
          {/form}
        </div>
      </div>
    </div>
  </div>

</div>