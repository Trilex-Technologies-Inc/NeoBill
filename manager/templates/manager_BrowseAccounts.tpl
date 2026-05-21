<div class="manager_content">

<div class="action mb-4">
  <p class="header fw-bold mb-2">Actions</p>
  {form name="browse_accounts_action"}
    {form_element field="add"}
  {/form}
</div>

<h2 class="mb-3">{echo phrase="ACCOUNTS"}</h2>

<div class="search mb-4">
  {form name="search_accounts"}
    
    <div class="card">
      <div class="card-body">
        <!-- Search row -->
        <div class="row g-3 align-items-end">
          <!-- Account Name field -->
          <div class="col-md-5 col-lg-4">
            <label class="form-label fw-bold">
              {echo phrase="SEARCH"} - {form_description field="accountname"}
            </label>
            {form_element field="accountname" size="30" class="form-control"}
          </div>
          
          <!-- Balance field -->
          <div class="col-md-4 col-lg-3">
            <label class="form-label fw-bold">
              {form_description field="balance"}
            </label>
            {form_element field="balance" size="6" class="form-control"}
          </div>
          
          <!-- Submit button -->
          <div class="col-md-3 col-lg-2">
            {form_element field="search" class="btn btn-primary"}
          </div>
        </div>
      </div>
    </div>
    
  {/form}
</div>

<div class="table-responsive">
  {form name="active_accounts"}
    {form_table field="accounts" size="10" class="table table-sm table-striped align-middle table-hover"}
      
      <!-- ID Column -->
      {form_table_column columnid="id" header="[ID]"}
        {$accounts.id}
      {/form_table_column}
      
      <!-- Account Name Column -->
      {form_table_column columnid="accountname" header="[ACCOUNT_NAME]"}
        <a target="content" href="manager_content.php?page=accounts_view_account&account={$accounts.id}">{$accounts.accountname}</a>
      {/form_table_column}
      
      <!-- Type Column -->
      {form_table_column columnid="type" header="[TYPE]"}
        {$accounts.type}
      {/form_table_column}
      
      <!-- Billing Status Column -->
      {form_table_column columnid="billingstatus" header="[BILL]"}
        {$accounts.billingstatus}
      {/form_table_column}
      
      <!-- Balance Column -->
      {form_table_column columnid="balance" header="[BALANCE]"}
        {$accounts.balance|currency}
      {/form_table_column}
      
    {/form_table}
  {/form}
</div>

</div>