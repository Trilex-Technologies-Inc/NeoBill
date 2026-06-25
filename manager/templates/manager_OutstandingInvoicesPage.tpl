<div class="manager_content outstanding-invoices-page">
  <div class="outstanding-invoices-shell">
    <div class="outstanding-invoices-header">
      <div class="outstanding-invoices-title">
        <span class="outstanding-invoices-icon"><i class="ti ti-receipt-2"></i></span>
        <div>
          <span class="outstanding-invoices-kicker">{echo phrase="BILLING_SUMMARY"}</span>
          <h2>{echo phrase="OUTSTANDING_INVOICES"}</h2>
          <p>{echo phrase="OUTSTANDING_INVOICES_LIST"}</p>
        </div>
      </div>

      <div class="outstanding-invoices-actions">
        {form name="outstanding_invoices_action"}
          {form_element field="add" class="btn btn-primary"}
        {/form}
      </div>
    </div>

    <div class="outstanding-invoices-summary">
      <div class="outstanding-invoices-stat outstanding-invoices-stat-primary">
        <span>{echo phrase="OUTSTANDING_INVOICES"}</span>
        <strong>{$os_invoices_count}</strong>
      </div>
      <div class="outstanding-invoices-stat outstanding-invoices-stat-danger">
        <span>{echo phrase="TOTAL_OUTSTANDING_INVOICES"}</span>
        <strong>{$os_invoices_total|currency}</strong>
      </div>
      <div class="outstanding-invoices-stat outstanding-invoices-stat-warning">
        <span>{echo phrase="PAST_DUE_INVOICES"}</span>
        <strong>{$os_invoices_count_past_due}</strong>
      </div>
      <div class="outstanding-invoices-stat outstanding-invoices-stat-muted">
        <span>{echo phrase="30_DAYS_PAST_DUE"}</span>
        <strong>{$os_invoices_count_past_due_30}</strong>
      </div>
    </div>

    <div class="outstanding-invoices-toolbar">
      {form name="search_outstanding_invoices"}
        <div class="outstanding-invoices-search">
          <label class="form-label">
            {echo phrase="SEARCH"} - {form_description field="accountname"}
          </label>
          <div class="outstanding-invoices-search-row">
            <div class="outstanding-invoices-search-input">
              <i class="ti ti-search"></i>
              {form_element field="accountname" size="30" class="form-control"}
            </div>
            {form_element field="search" class="btn btn-outline-primary"}
          </div>
        </div>
      {/form}
    </div>

    <div class="outstanding-invoices-table-card">
      <div class="outstanding-invoices-table-header">
        <div>
          <span>{echo phrase="OUTSTANDING_INVOICES"}</span>
          <h3>{echo phrase="TOTAL_PAST_DUE"}: {$os_invoices_total_past_due|currency}</h3>
        </div>
        <div class="outstanding-invoices-badge">
          <i class="ti ti-alert-circle"></i>
          {$os_invoices_total_past_due_30|currency}
        </div>
      </div>

      <div class="table-responsive outstanding-invoices-table-wrap">
        {form name="outstanding_invoices"}
          {form_table field="invoices" size="10" class="table table-sm table-hover align-middle mb-0"}
            
            {form_table_column columnid="id" header="[ID]"}
              <a href="./manager_content.php?page=billing_view_invoice&invoice={$invoices.id}" class="outstanding-invoices-link">#{$invoices.id}</a>
            {/form_table_column}
            
            {form_table_column columnid="accountname" header="[ACCOUNT]"}
              <a href="./manager_content.php?page=accounts_view_account&account={$invoices.accountid}" class="outstanding-invoices-account">{$invoices.accountname}</a>
            {/form_table_column}
            
            {form_table_column columnid="date" header="[INVOICE_DATE]"}
              {$invoices.date|datetime:date}
            {/form_table_column}
            
            {form_table_column columnid="periodbegin" header="[BILLING_PERIOD]"}
              <span class="outstanding-invoices-period">{$invoices.periodbegin|datetime:date} - {$invoices.periodend|datetime:date}</span>
            {/form_table_column}
            
            {form_table_column columnid="total" header="[INVOICE_TOTAL]"}
              <span class="outstanding-invoices-money">{$invoices.total|currency}</span>
            {/form_table_column}
            
            {form_table_column columnid="totalpayments" header="[AMOUNT_PAID]"}
              <span class="outstanding-invoices-paid">{$invoices.totalpayments|currency}</span>
            {/form_table_column}
            
            {form_table_column columnid="balance" header="[AMOUNT_DUE]"}
              {if $invoices.balance > 0}
                <span class="outstanding-invoices-due">{$invoices.balance|currency}</span>
              {else}
                <span class="outstanding-invoices-clear">{$invoices.balance|currency}</span>
              {/if}
            {/form_table_column}
            
          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>
