<div class="manager_content">

  <div class="action mb-4">
    <div class="card shadow-sm border-0">
      <div class="card-header bg-primary text-white py-3 px-4">
        <div class="d-flex align-items-center gap-2">
          <i class="bi bi-lightning-fill"></i>
          <span class="fw-bold mb-0">{echo phrase="ACTIONS"}</span>
        </div>
      </div>
      <div class="card-body bg-white py-3 px-4">
        {form name="pending_accounts_action"}
          {form_element field="add" class="btn btn-success btn-sm"}
        {/form}
      </div>
    </div>
  </div>

  <div class="card mb-4 shadow-sm border-0">
    <div class="card-body">
      <div class="d-flex align-items-center gap-3 mb-3">
        <i class="bi bi-clock-history fs-3 text-primary"></i>
        <div>
          <h2 class="h5 mb-1">{echo phrase="PENDING_ACCOUNTS"}</h2>
          <p class="text-muted mb-0">Search and view pending accounts</p>
        </div>
      </div>

      {form name="search_pending_accounts"}
        <div class="row g-3 align-items-end">
          <div class="col-md-6">
            <label class="form-label fw-semibold">{echo phrase="ACCOUNT_NAME"}</label>
            <div class="input-group">
              <span class="input-group-text bg-light"><i class="bi bi-search"></i></span>
              {form_element field="accountname" size="30" class="form-control" placeholder="Search account name"}
            </div>
          </div>
          <div class="col-md-4">
            <label class="form-label fw-semibold">{echo phrase="BALANCE"}</label>
            <div class="input-group">
              <span class="input-group-text">$</span>
              {form_element field="balance" size="6" class="form-control" placeholder="Enter balance"}
            </div>
          </div>
          <div class="col-md-2 d-grid">
            {form_element field="search" class="btn btn-primary"}
          </div>
        </div>
      {/form}
    </div>
  </div>

  <div class="card shadow-sm border-0">
    <div class="card-header bg-white border-bottom-0">
      <h3 class="h6 mb-0">Pending Accounts List</h3>
    </div>
    <div class="card-body p-0">
      <div class="table-responsive">
        {form name="pending_accounts"}
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