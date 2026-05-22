<div class="manager_content">

  <h2 class="mb-3">{echo phrase="EXPIRED_DOMAINS"}</h2>

  <!-- Search Section -->
  <div class="search mb-4">
    <div class="card">
      <div class="card-body">
        {form name="search_expired_domains"}
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

  <!-- Expired Domains Table -->
  <div class="table-container">
    <div class="card">
      <div class="card-body p-0">
        <div class="table-responsive">
          {form name="expired_domains"}
            <table class="table table-hover table-striped align-middle mb-0">
              <thead class="table-dark">
                <tr>
                  <th style="width: 40px; text-align: center">{echo phrase="SELECT"}</th>
                  <th>{echo phrase="DOMAIN_NAME"}</th>
                  <th>{echo phrase="ACCOUNT"}</th>
                  <th>{echo phrase="REGISTRATION_DATE"}</th>
                  <th>{echo phrase="TERM"}</th>
                  <th>{echo phrase="EXPIRATION_DATE"}</th>
                </tr>
              </thead>
              <tbody>
                {form_table field="domains"}
                  <tr>
                    <td class="text-center">
                      {form_table_checkbox option=$domains.id}
                    </td>
                    <td>
                      <a href="manager_content.php?page=domains_edit_domain&dpurchase={$domains.id}" class="text-decoration-none fw-bold">
                        {$domains.fulldomainname}
                      </a>
                    </td>
                    <td>
                      <a href="manager_content.php?page=accounts_view_account&account={$domains.accountid}" class="text-decoration-none">
                        {$domains.accountname}
                      </a>
                    </td>
                    <td>
                      <span class="badge bg-secondary">{$domains.date|datetime:date}</span>
                    </td>
                    <td>
                      <span class="badge bg-info">{$domains.term} {echo phrase="YEAR"}(s)</span>
                    </td>
                    <td class="fw-bold text-danger">
                      <span class="badge bg-danger">{$domains.expiredate|datetime:date}</span>
                      <i class="bi bi-exclamation-triangle-fill ms-1"></i>
                    </td>
                  </tr>
                {/form_table}
              </tbody>
              {form_table_footer}
                <tfoot>
                  <tr class="table-light">
                    <td colspan="6" class="p-3">
                      {form_element field="remove" class="btn btn-danger"}
                    </td>
                  </tr>
                </tfoot>
              {/form_table_footer}
            </table>
          {/form}
        </div>
      </div>
    </div>
  </div>

</div>