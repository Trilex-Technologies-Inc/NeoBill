<div class="manager_content browse-invoices-page">
  <div class="browse-invoices-shell">
    <div class="browse-invoices-header">
      <div class="browse-invoices-title">
        <span class="browse-invoices-icon"><i class="ti ti-files"></i></span>
        <div>
          <span class="browse-invoices-kicker">{echo phrase="BILLING_INVOICES"}</span>
          <h2>{echo phrase="ALL_INVOICES"}</h2>
          <p>{echo phrase="INVOICES"}</p>
        </div>
      </div>

      <div class="browse-invoices-actions">
        {form name="browse_invoices_action"}
          {form_element field="add" class="btn btn-primary"}
        {/form}
      </div>
    </div>

    <div class="browse-invoices-summary">
      <div class="browse-invoices-stat browse-invoices-stat-primary">
        <span>{echo phrase="ALL_INVOICES"}</span>
        <strong>{$invoice_count}</strong>
      </div>
      <div class="browse-invoices-stat browse-invoices-stat-danger">
        <span>{echo phrase="TOTAL_OUTSTANDING_INVOICES"}</span>
        <strong>{$os_invoices_total|currency}</strong>
      </div>
      <div class="browse-invoices-stat browse-invoices-stat-warning">
        <span>{echo phrase="PAST_DUE_INVOICES"}</span>
        <strong>{$os_invoices_count_past_due}</strong>
      </div>
      <div class="browse-invoices-stat browse-invoices-stat-muted">
        <span>{echo phrase="AMOUNT_DUE"}</span>
        <strong>{$os_invoices_total_past_due|currency}</strong>
      </div>
    </div>

    <div class="browse-invoices-toolbar">
      {form name="search_invoices"}
        <div class="browse-invoices-search">
          <label class="form-label">
            {echo phrase="SEARCH"} - {form_description field="accountname"}
          </label>
          <div class="browse-invoices-search-row">
            <div class="browse-invoices-search-input">
              <i class="ti ti-search"></i>
              {form_element field="accountname" size="30" class="form-control"}
            </div>
            {form_element field="search" class="btn btn-outline-primary"}
          </div>
        </div>
      {/form}
    </div>

    <div class="browse-invoices-table-card">
      <div class="browse-invoices-table-header">
        <div>
          <span>{echo phrase="INVOICES"}</span>
          <h3>{echo phrase="OUTSTANDING_INVOICES"}: {$os_invoices_count}</h3>
        </div>
        <a class="browse-invoices-link-button" href="manager_content.php?page=billing_invoices_outstanding">
          <i class="ti ti-alert-circle"></i>
          {echo phrase="OUTSTANDING_INVOICES"}
        </a>
      </div>

      <div class="table-responsive browse-invoices-table-wrap">
        {form name="browse_invoices"}
          {form_table field="invoices" size="10" class="table table-sm table-hover align-middle mb-0"}
            
            {form_table_column columnid="id" header="[ID]"}
              <a href="./manager_content.php?page=billing_view_invoice&invoice={$invoices.id}" class="browse-invoices-link">#{$invoices.id}</a>
            {/form_table_column}
            
            {form_table_column columnid="accountname" header="[ACCOUNT]"}
              <a href="./manager_content.php?page=accounts_view_account&account={$invoices.accountid}" class="browse-invoices-account">{$invoices.accountname}</a>
            {/form_table_column}
            
            {form_table_column columnid="date" header="[INVOICE_DATE]"}
              <span class="browse-invoices-date">{$invoices.date|datetime:date}</span>
            {/form_table_column}
            
            {form_table_column columnid="periodbegin" header="[BILLING_PERIOD]"}
              <span class="browse-invoices-period">{$invoices.periodbegin|datetime:date} - {$invoices.periodend|datetime:date}</span>
            {/form_table_column}
            
            {form_table_column columnid="total" header="[INVOICE_TOTAL]"}
              <span class="browse-invoices-money">{$invoices.total|currency}</span>
            {/form_table_column}
            
            {form_table_column columnid="totalpayments" header="[AMOUNT_PAID]"}
              <span class="browse-invoices-paid">{$invoices.totalpayments|currency}</span>
            {/form_table_column}
            
            {form_table_column columnid="balance" header="[AMOUNT_DUE]"}
              {if $invoices.balance > 0}
                <span class="browse-invoices-due">{$invoices.balance|currency}</span>
              {else}
                <span class="browse-invoices-clear">{$invoices.balance|currency}</span>
              {/if}
            {/form_table_column}
            
          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>
