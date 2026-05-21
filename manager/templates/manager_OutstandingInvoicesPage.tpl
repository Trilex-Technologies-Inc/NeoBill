<div class="manager_content">

<div class="action mb-4">
  <p class="header fw-bold mb-2">{echo phrase="ACTIONS"}</p>
  {form name="outstanding_invoices_action"}
    {form_element field="add"}
  {/form}
</div>

<h2 class="mb-3">{echo phrase="OUTSTANDING_INVOICES"}</h2>

<div class="search mb-4">
  {form name="search_outstanding_invoices"}
    <div class="card">
      <div class="card-body">
        <div class="row g-3 align-items-end">
          <div class="col-md-8 col-lg-9">
            <label class="form-label fw-bold">
              {echo phrase="SEARCH"} - {form_description field="accountname"}
            </label>
            {form_element field="accountname" size="30" class="form-control"}
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
  <div class="alert alert-info alert-dismissible fade show" role="alert">
    <i class="bi bi-info-circle"></i> 
    {echo phrase="OUTSTANDING_INVOICES_LIST"}
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
  
  {form name="outstanding_invoices"}
    {form_table field="invoices" size="10" class="table table-sm table-striped align-middle table-hover"}
      
      {form_table_column columnid="id" header="[ID]"}
        <a href="./manager_content.php?page=billing_view_invoice&invoice={$invoices.id}" class="text-decoration-none">{$invoices.id}</a>
      {/form_table_column}
      
      {form_table_column columnid="accountname" header="[ACCOUNT]"}
        <a href="./manager_content.php?page=accounts_view_account&account={$invoices.accountid}" class="text-decoration-none">{$invoices.accountname}</a>
      {/form_table_column}
      
      {form_table_column columnid="date" header="[INVOICE_DATE]"}
        {$invoices.date|datetime:date}
      {/form_table_column}
      
      {form_table_column columnid="periodbegin" header="[BILLING_PERIOD]"}
        {$invoices.periodbegin|datetime:date} - {$invoices.periodend|datetime:date}
      {/form_table_column}
      
      {form_table_column columnid="total" header="[INVOICE_TOTAL]"}
        <span class="fw-bold">{$invoices.total|currency}</span>
      {/form_table_column}
      
      {form_table_column columnid="totalpayments" header="[AMOUNT_PAID]"}
        {$invoices.totalpayments|currency}
      {/form_table_column}
      
      {form_table_column columnid="balance" header="[AMOUNT_DUE]"}
        {if $invoices.balance > 0}
          <span class="text-danger fw-bold">{$invoices.balance|currency}</span>
        {else}
          <span class="text-success">{$invoices.balance|currency}</span>
        {/if}
      {/form_table_column}
      
    {/form_table}
  {/form}
</div>

</div>