<div class="manager_content view-invoice-page">
  {dbo_assign dbo="invoice_dbo" var="invoice_id" field="id"}

  <div class="view-invoice-shell">
    <div class="view-invoice-header">
      <div class="view-invoice-title">
        <span class="view-invoice-icon"><i class="ti ti-file-invoice"></i></span>
        <div>
          <span class="view-invoice-kicker">{echo phrase="BILLING_INVOICES"}</span>
          <h2>{echo phrase="INVOICE"} #{$invoice_id}</h2>
          <p>{dbo_echo|datetime:date dbo="invoice_dbo" field="date"} &middot; {echo phrase="PERIOD"}: {dbo_echo|datetime:date dbo="invoice_dbo" field="periodbegin"} - {dbo_echo|datetime:date dbo="invoice_dbo" field="periodend"}</p>
        </div>
      </div>

      <div class="view-invoice-actions">
        <button type="button" class="btn btn-outline-secondary" onclick="window.open('manager_content.php?page=billing_print_invoice&invoice={$invoice_id}&no_headers=1','Print Invoice')">
          <i class="ti ti-printer"></i> {echo phrase="PRINT"}
        </button>
        {form name="view_invoice_action"}
          {form_element field="email" class="btn btn-outline-primary"}
          {form_element field="add_payment" class="btn btn-success"}
          {form_element field="delete" class="btn btn-outline-danger"}
        {/form}
      </div>
    </div>

    <div class="view-invoice-overview">
      <section class="view-invoice-card view-invoice-details">
        <div class="view-invoice-card-header">
          <span><i class="ti ti-receipt-2"></i></span>
          <div>
            <h3>{echo phrase="INVOICE_DETAILS"}</h3>
            <p>{echo phrase="ACCOUNT"} &amp; {echo phrase="PERIOD"}</p>
          </div>
        </div>
        <div class="view-invoice-detail-list">
          <div class="view-invoice-detail-row">
            <span><i class="ti ti-building"></i> {echo phrase="ACCOUNT"}</span>
            <strong><a href="manager_content.php?page=accounts_view_account&account={dbo_echo dbo="invoice_dbo" field="accountid"}">{dbo_echo dbo="invoice_dbo" field="accountname"}</a> <small># {dbo_echo dbo="invoice_dbo" field="accountid"}</small></strong>
          </div>
          <div class="view-invoice-detail-row">
            <span><i class="ti ti-calendar"></i> {echo phrase="INVOICE_DATE"}</span>
            <strong>{dbo_echo|datetime:date dbo="invoice_dbo" field="date"}</strong>
          </div>
          <div class="view-invoice-detail-row">
            <span><i class="ti ti-calendar-range"></i> {echo phrase="PERIOD"}</span>
            <strong>{dbo_echo|datetime:date dbo="invoice_dbo" field="periodbegin"} - {dbo_echo|datetime:date dbo="invoice_dbo" field="periodend"}</strong>
          </div>
          <div class="view-invoice-note">
            <span><i class="ti ti-message-2"></i> {echo phrase="NOTE_TO_CUSTOMER"}</span>
            <p>{dbo_echo dbo="invoice_dbo" field="note"}</p>
          </div>
        </div>
      </section>

      <section class="view-invoice-card view-invoice-summary">
        <div class="view-invoice-card-header">
          <span><i class="ti ti-calculator"></i></span>
          <div><h3>{echo phrase="SUMMARY"}</h3><p>{echo phrase="INVOICE_TOTAL"}</p></div>
        </div>
        <div class="view-invoice-summary-list">
          <div><span>{echo phrase="SUB_TOTAL"}</span><strong>{dbo_echo|currency dbo="invoice_dbo" field="subtotal"}</strong></div>
          <div><span>{echo phrase="TAXES"}</span><strong>{dbo_echo|currency dbo="invoice_dbo" field="taxtotal"}</strong></div>
          <div><span>{echo phrase="INVOICE_TOTAL"}</span><strong>{dbo_echo|currency dbo="invoice_dbo" field="total"}</strong></div>
          <div class="view-invoice-paid"><span>{echo phrase="PAYMENTS"}</span><strong>{dbo_echo|currency dbo="invoice_dbo" field="totalpayments"}</strong></div>
        </div>
        <div class="view-invoice-balance">
          <span>{echo phrase="INVOICE_BALANCE"}</span>
          <strong>{dbo_echo|currency dbo="invoice_dbo" field="balance"}</strong>
          <small>{echo phrase="OUTSTANDING_BALANCE"}: {dbo_echo|currency dbo="invoice_dbo" field="outstandingbalance"}</small>
        </div>
      </section>
    </div>

    <section class="view-invoice-card view-invoice-section">
      <div class="view-invoice-card-header">
        <span><i class="ti ti-list-details"></i></span>
        <div><h3>{echo phrase="ITEMS"}</h3><p>{echo phrase="INVOICE_DETAILS"}</p></div>
      </div>
      {form name="view_invoice_items"}
        <div class="table-responsive view-invoice-table-wrap">
          {form_table field="items" class="table table-hover align-middle mb-0"}
            {form_table_column columnid=""}<div class="view-invoice-check">{form_table_checkbox option=$items.id}</div>{/form_table_column}
            {form_table_column columnid="text" header="[ITEM]"}<strong class="view-invoice-item-name">{$items.text}</strong>{/form_table_column}
            {form_table_column columnid="unitamount" header="[UNIT_PRICE]"}<span class="view-invoice-money">{$items.unitamount|currency}</span>{/form_table_column}
            {form_table_column columnid="quantity" header="[QUANTITY]"}<span class="view-invoice-quantity">{$items.quantity}</span>{/form_table_column}
            {form_table_column columnid="amount" header="[TOTAL]"}<strong class="view-invoice-money">{$items.amount|currency}</strong>{/form_table_column}
            {form_table_footer}<div class="view-invoice-table-action">{form_element field="remove" class="btn btn-outline-danger btn-sm"}</div>{/form_table_footer}
          {/form_table}
        </div>
      {/form}
    </section>

    <section class="view-invoice-card view-invoice-section view-invoice-add-item">
      <div class="view-invoice-card-header">
        <span><i class="ti ti-circle-plus"></i></span>
        <div><h3>{echo phrase="ADD_LINE_ITEM"}</h3><p>{echo phrase="ITEMS"}</p></div>
      </div>
      {form name="new_line_item"}
        <div class="view-invoice-add-grid">
          <div class="view-invoice-field view-invoice-field-wide"><label>{form_description field="text"}</label>{form_element field="text" size="50" class="form-control"}</div>
          <div class="view-invoice-field"><label>{form_description field="unitamount"}</label>{form_element field="unitamount" size="7" class="form-control"}</div>
          <div class="view-invoice-field"><label>{form_description field="quantity"}</label>{form_element field="quantity" size="3" class="form-control"}</div>
          <div class="view-invoice-add-action">{form_element field="continue" class="btn btn-primary"}</div>
        </div>
      {/form}
    </section>

    <div class="view-invoice-lower-grid">
      <section class="view-invoice-card view-invoice-section">
        <div class="view-invoice-card-header"><span><i class="ti ti-credit-card"></i></span><div><h3>{echo phrase="PAYMENTS"}</h3><p>{echo phrase="AMOUNT_PAID"}</p></div></div>
        {form name="view_invoice_payments"}
          <div class="table-responsive view-invoice-table-wrap">
            {form_table field="payments" class="table table-hover align-middle mb-0"}
              {form_table_column columnid=""}<div class="view-invoice-check">{form_table_checkbox option=$payments.id}</div>{/form_table_column}
              {form_table_column columnid="id" header="[ID]"}<a class="view-invoice-link" href="manager_content.php?page=edit_payment&payment={$payments.id}">#{$payments.id}</a>{/form_table_column}
              {form_table_column columnid="date" header="[DATE_RECEIVED]"}{$payments.date|datetime:date}{/form_table_column}
              {form_table_column columnid="amount" header="[AMOUNT]"}<strong class="view-invoice-paid-money">{$payments.amount|currency}</strong>{/form_table_column}
              {form_table_column columnid="type" header="[PAYMENT_TYPE]"}<span class="view-invoice-badge">{$payments.type}</span>{/form_table_column}
              {form_table_footer}<div class="view-invoice-table-action">{form_element field="remove" class="btn btn-outline-danger btn-sm"}</div>{/form_table_footer}
            {/form_table}
          </div>
        {/form}
      </section>

      <section class="view-invoice-card view-invoice-section">
        <div class="view-invoice-card-header"><span><i class="ti ti-alert-circle"></i></span><div><h3>{echo phrase="OUTSTANDING_INVOICES"}</h3><p>{echo phrase="AMOUNT_DUE"}</p></div></div>
        {form name="view_invoice_outstanding_invoices"}
          <div class="table-responsive view-invoice-table-wrap">
            {form_table field="invoices" class="table table-hover align-middle mb-0"}
              {form_table_column columnid="id" header="[ID]"}<a class="view-invoice-link" href="./manager_content.php?page=billing_view_invoice&invoice={$invoices.id}">#{$invoices.id}</a>{/form_table_column}
              {form_table_column columnid="date" header="[INVOICE_DATE]"}{$invoices.date|datetime:date}{/form_table_column}
              {form_table_column columnid="periodbegin" header="[BILLING_PERIOD]"}<span class="view-invoice-period">{$invoices.periodbegin|datetime:date} - {$invoices.periodend|datetime:date}</span>{/form_table_column}
              {form_table_column columnid="total" header="[INVOICE_TOTAL]"}<span class="view-invoice-money">{$invoices.total|currency}</span>{/form_table_column}
              {form_table_column columnid="totalpayments" header="[AMOUNT_PAID]"}<span class="view-invoice-paid-money">{$invoices.totalpayments|currency}</span>{/form_table_column}
              {form_table_column columnid="balance" header="[AMOUNT_DUE]"}<strong class="view-invoice-due">{$invoices.balance|currency}</strong>{/form_table_column}
            {/form_table}
          </div>
        {/form}
      </section>
    </div>
  </div>
</div>
