<div class="manager_content accounts-browser">

  <div class="accounts-page-header">
    <div class="accounts-page-title">
      <span class="accounts-page-icon"><i class="ti ti-users"></i></span>
      <div>
        <h2>{echo phrase="ACTIVE_ACCOUNTS"}</h2>
        <p>Search, review, and manage active customer accounts.</p>
      </div>
    </div>

    {form name="browse_accounts_action"}
      {form_element field="add" class="btn btn-primary btn-sm"}
    {/form}
  </div>

  <div class="accounts-filter">
    <div class="accounts-section-heading">
      <div>
        <h3><i class="ti ti-filter"></i> Filter accounts</h3>
        <p>Search by account name or current balance.</p>
      </div>
    </div>

    {form name="search_accounts"}
      <div class="row g-3 align-items-end">
        <div class="col-lg-6">
          <label class="form-label" for="accountname">{echo phrase="ACCOUNT_NAME"}</label>
          <div class="input-group">
            <span class="input-group-text"><i class="ti ti-search"></i></span>
            {form_element field="accountname" size="30" class="form-control" placeholder="Enter account name"}
          </div>
        </div>

        <div class="col-sm-7 col-lg-4">
          <label class="form-label" for="balance">{echo phrase="BALANCE"}</label>
          <div class="input-group">
            <span class="input-group-text"><i class="ti ti-currency-dollar"></i></span>
            {form_element field="balance" size="6" class="form-control" placeholder="Enter balance"}
          </div>
        </div>

        <div class="col-sm-5 col-lg-2 d-grid">
          {form_element field="search" class="btn btn-secondary"}
        </div>
      </div>
    {/form}
  </div>

  <div class="accounts-list">
    <div class="accounts-list-header">
      <div>
        <h3>Account list</h3>
        <p>Active customer records matching the current filter.</p>
      </div>
    </div>

    <div class="table-responsive accounts-table-wrap">
      {form name="active_accounts"}
        {form_table field="accounts" size="10" class="table table-hover align-middle mb-0" empty="No active accounts found."}
          {form_table_column columnid="id" header="[ID]"}
            <a href="manager_content.php?page=accounts_view_account&account={$accounts.id}" class="account-id">
              #{$accounts.id}
            </a>
          {/form_table_column}

          {form_table_column columnid="accountname" header="[ACCOUNT_NAME]"}
            <a href="manager_content.php?page=accounts_view_account&account={$accounts.id}" class="account-name">
              <span class="account-avatar"><i class="ti ti-user"></i></span>
              <span>{$accounts.accountname}</span>
            </a>
          {/form_table_column}

          {form_table_column columnid="type" header="[TYPE]"}
            {assign var="type" value=$accounts.type}
            {if $type == "Business"}
              <span class="account-badge account-badge-business">{$type}</span>
            {elseif $type == "Individual"}
              <span class="account-badge account-badge-individual">{$type}</span>
            {else}
              <span class="account-badge account-badge-default">{$type}</span>
            {/if}
          {/form_table_column}

          {form_table_column columnid="billingstatus" header="[BILL]"}
            {assign var="billingstatus" value=$accounts.billingstatus}
            {if $billingstatus == "Active"}
              <span class="account-status account-status-active">
                <i></i>{$billingstatus}
              </span>
            {elseif $billingstatus == "Suspended"}
              <span class="account-status account-status-warning">
                <i></i>{$billingstatus}
              </span>
            {else}
              <span class="account-status account-status-default">
                <i></i>{$billingstatus}
              </span>
            {/if}
          {/form_table_column}

          {form_table_column columnid="balance" header="[BALANCE]"}
            <span class="account-balance">{$accounts.balance|currency}</span>
          {/form_table_column}

          {form_table_column columnid="" header="Actions"}
            <a href="manager_content.php?page=accounts_view_account&account={$accounts.id}" class="account-view-link" title="View account" aria-label="View account #{$accounts.id}">
              View
              <i class="ti ti-chevron-right"></i>
            </a>
          {/form_table_column}
        {/form_table}
      {/form}
    </div>
  </div>

</div>
