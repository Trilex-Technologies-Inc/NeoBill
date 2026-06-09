<div class="manager_content">

  <!-- Actions Section -->
  <div class="action mb-4">
    <div class="card">
      <div class="card-header bg-primary text-white">
        <p class="header h6 mb-0">{echo phrase="ACTIONS"}</p>
      </div>
      <div class="card-body">
        {form name="inactive_accounts_action"}
          {form_element field="add" class="btn btn-success"}
        {/form}
      </div>
    </div>
  </div>

  <!-- Header -->
  <h2 class="mb-3">{echo phrase="INACTIVE_ACCOUNTS"}</h2>

  <!-- Search Section -->
  <div class="search mb-4">
    <div class="card">
      <div class="card-body">
        {form name="search_inactive_accounts"}
          <div class="row align-items-end g-3">
            <div class="col-md-5">
              <label class="form-label fw-bold">{echo phrase="ACCOUNT_NAME"}</label>
              {form_description field="accountname"}
              {form_element field="accountname" size="30" class="form-control"}
            </div>
            <div class="col-md-5">
              <label class="form-label fw-bold">{echo phrase="BALANCE"}</label>
              {form_description field="balance"}
              <div class="input-group">
                <span class="input-group-text">$</span>
                {form_element field="balance" size="6" class="form-control"}
              </div>
            </div>
            <div class="col-md-2">
              {form_element field="search" class="btn btn-primary w-100"}
            </div>
          </div>
        {/form}
      </div>
    </div>
  </div>

  <!-- Inactive Accounts Table -->
  <div class="table-container">
    <div class="card">
      <div class="card-body p-0">
        <div class="table-responsive">
          {form name="inactive_accounts"}
            {form_table field="accounts" size="10" class="table table-hover table-striped align-middle mb-0"}
              {form_table_column columnid="id" header="[ID]"}
                <a href="manager_content.php?page=accounts_view_account&account={$accounts.id}" class="btn btn-link btn-sm p-0 text-decoration-none fw-bold">#{$accounts.id}</a>
              {/form_table_column}

              {form_table_column columnid="accountname" header="[ACCOUNT_NAME]"}
                <a href="manager_content.php?page=accounts_view_account&account={$accounts.id}" class="text-decoration-none">{$accounts.accountname}</a>
              {/form_table_column}

              {form_table_column columnid="type" header="[TYPE]"}
                {assign var="type" value=$accounts.type}
                {if $type == "Business"}
                  <span class="badge bg-primary">{$type}</span>
                {elseif $type == "Individual"}
                  <span class="badge bg-info">{$type}</span>
                {else}
                  <span class="badge bg-secondary">{$type}</span>
                {/if}
              {/form_table_column}

              {form_table_column columnid="billingstatus" header="[BILL]"}
                {assign var="billingstatus" value=$accounts.billingstatus}
                {if $billingstatus == "Active"}
                  <span class="badge bg-success">{$billingstatus}</span>
                {elseif $billingstatus == "Suspended"}
                  <span class="badge bg-warning text-dark">{$billingstatus}</span>
                {else}
                  <span class="badge bg-secondary">{$billingstatus}</span>
                {/if}
              {/form_table_column}

              {form_table_column columnid="balance" header="[BALANCE]"}
                <span class="text-primary">{$accounts.balance|currency}</span>
              {/form_table_column}
            {/form_table}
          {/form}
        </div>
      </div>
    </div>
  </div>

</div>