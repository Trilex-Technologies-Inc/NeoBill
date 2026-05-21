<div class="manager_content">

<div class="action mb-4">
  <div class="card border-0 bg-light">
    <div class="card-body py-2">
      <div class="d-flex justify-content-between align-items-center">
        <p class="header fw-bold mb-0">{echo phrase="ACTIONS"}</p>
        {form name="browse_invoices_action"}
          {form_element field="add" class="btn btn-primary btn-sm"}
        {/form}
      </div>
    </div>
  </div>
</div>

<h2 class="mb-3">{echo phrase="INVOICES"}</h2>

<div class="search mb-4">
  {form name="search_invoices"}
    <div class="card shadow-sm">
      <div class="card-body">
        <div class="row g-3 align-items-end">
          <div class="col-md-8 col-lg-9">
            <label class="form-label fw-bold">
              {echo phrase="SEARCH"} - {form_description field="accountname"}
            </label>
            <div class="input-group">
              <span class="input-group-text bg-light">
                <i class="bi bi-search"></i>
              </span>
              {form_element field="accountname" size="30" class="form-control" placeholder="Enter account name..."}
            </div>
          </div>
          <div class="col-md-4 col-lg-3">
            {form_element field="search" class="btn btn-primary w-100"}
          </div>
        </div>
      </div>
    </div>
  {/form}
</div>

<div class="table-responsive">
  <div class="card">
    <div class="card-body p-0">
      {form name="browse_invoices"}
        {form_table field="invoices" size="10" class="table table-sm table-striped align-middle table-hover mb-0"}
          
          {form_table_column columnid="id" header="[ID]"}
            <a href="./manager_content.php?page=billing_view_invoice&invoice={$invoices.id}" class="btn btn-link btn-sm p-0 text-decoration-none fw-bold">#{$invoices.id}</a>
          {/form_table_column}
          
          {form_table_column columnid="accountname" header="[ACCOUNT]"}
            <a href="./manager_content.php?page=accounts_view_account&account={$invoices.accountid}" class="text-decoration-none">{$invoices.accountname}</a>
          {/form_table_column}
          
          {form_table_column columnid="date" header="[INVOICE_DATE]"}
            <span class="text-nowrap">{$invoices.date|datetime:date}</span>
          {/form_table_column}
          
          {form_table_column columnid="periodbegin" header="[BILLING_PERIOD]"}
            <span class="text-nowrap small">{$invoices.periodbegin|datetime:date} - {$invoices.periodend|datetime:date}</span>
          {/form_table_column}
          
          {form_table_column columnid="total" header="[INVOICE_TOTAL]"}
            <span class="fw-bold text-primary">{$invoices.total|currency}</span>
          {/form_table_column}
          
          {form_table_column columnid="totalpayments" header="[AMOUNT_PAID]"}
            <span class="text-success">{$invoices.totalpayments|currency}</span>
          {/form_table_column}
          
          {form_table_column columnid="balance" header="[AMOUNT_DUE]"}
            {if $invoices.balance > 0}
              <span class="badge bg-danger fs-6">{$invoices.balance|currency}</span>
            {else}
              <span class="badge bg-success fs-6">{$invoices.balance|currency}</span>
            {/if}
          {/form_table_column}
          
        {/form_table}
      {/form}
    </div>
  </div>
</div>

</div>