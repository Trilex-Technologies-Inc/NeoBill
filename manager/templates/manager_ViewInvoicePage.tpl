<div class="manager_content">
{dbo_assign dbo="invoice_dbo" var="invoice_id" field="id"}

<div class="d-flex flex-column flex-md-row justify-content-between align-items-start gap-3 mb-4">
  <div>
    <h2 class="mb-1">{echo phrase="INVOICE"} #{$invoice_id}</h2>
    <div class="text-muted small">
      <span class="me-3"><strong>{echo phrase="INVOICE_DATE"}:</strong> {dbo_echo|datetime:date dbo="invoice_dbo" field="date"}</span>
      <span class="me-3"><strong>{echo phrase="PERIOD"}:</strong> {dbo_echo|datetime:date dbo="invoice_dbo" field="periodbegin"} - {dbo_echo|datetime:date dbo="invoice_dbo" field="periodend"}</span>
      <span><strong>{echo phrase="ACCOUNT"}:</strong> <a href="manager_content.php?page=accounts_view_account&account={dbo_echo dbo="invoice_dbo" field="accountid"}">{dbo_echo dbo="invoice_dbo" field="accountname"}</a></span>
    </div>
  </div>

  <div class="btn-toolbar gap-2">
    <button type="button" class="btn btn-outline-secondary btn-sm" onclick="window.open('manager_content.php?page=billing_print_invoice&invoice={$invoice_id}&no_headers=1','Print Invoice')">
      {echo phrase="PRINT"}
    </button>
    {form name="view_invoice_action"}
      {form_element field="email" class="btn btn-outline-primary btn-sm"}
      {form_element field="add_payment" class="btn btn-success btn-sm"}
      {form_element field="delete" class="btn btn-danger btn-sm"}
    {/form}
  </div>
</div>

<div class="row gx-4 gy-4 mb-4">
  <div class="col-lg-7">
    <div class="card shadow-sm h-100">
      <div class="card-body">
        <h5 class="card-title mb-3">{echo phrase="INVOICE_DETAILS"}</h5>
        <dl class="row mb-0">
          <dt class="col-5 text-muted">{echo phrase="INVOICE_DATE"}:</dt>
          <dd class="col-7">{dbo_echo|datetime:date dbo="invoice_dbo" field="date"}</dd>

          <dt class="col-5 text-muted">{echo phrase="PERIOD"}:</dt>
          <dd class="col-7">{dbo_echo|datetime:date dbo="invoice_dbo" field="periodbegin"} - {dbo_echo|datetime:date dbo="invoice_dbo" field="periodend"}</dd>

          <dt class="col-5 text-muted">{echo phrase="ACCOUNT"}:</dt>
          <dd class="col-7"><a href="manager_content.php?page=accounts_view_account&account={dbo_echo dbo="invoice_dbo" field="accountid"}">{dbo_echo dbo="invoice_dbo" field="accountname"}</a> <small class="text-muted">(ID: {dbo_echo dbo="invoice_dbo" field="accountid"})</small></dd>

          <dt class="col-5 text-muted">{echo phrase="NOTE_TO_CUSTOMER"}:</dt>
          <dd class="col-7">{dbo_echo dbo="invoice_dbo" field="note"}</dd>
        </dl>
      </div>
    </div>
  </div>

  <div class="col-lg-5">
    <div class="card shadow-sm h-100">
      <div class="card-body">
        <h5 class="card-title mb-3">{echo phrase="SUMMARY"}</h5>
        <table class="table table-borderless table-sm mb-0">
          <tbody>
            <tr>
              <th class="py-2 text-muted">{echo phrase="SUB_TOTAL"}:</th>
              <td class="py-2 text-end">{dbo_echo|currency dbo="invoice_dbo" field="subtotal"}</td>
            </tr>
            <tr>
              <th class="py-2 text-muted">{echo phrase="TAXES"}:</th>
              <td class="py-2 text-end">{dbo_echo|currency dbo="invoice_dbo" field="taxtotal"}</td>
            </tr>
            <tr>
              <th class="py-2 text-muted">{echo phrase="INVOICE_TOTAL"}:</th>
              <td class="py-2 text-end"><strong>{dbo_echo|currency dbo="invoice_dbo" field="total"}</strong></td>
            </tr>
            <tr>
              <th class="py-2 text-muted">{echo phrase="PAYMENTS"}:</th>
              <td class="py-2 text-end">{dbo_echo|currency dbo="invoice_dbo" field="totalpayments"}</td>
            </tr>
            <tr>
              <th class="py-2 text-muted">{echo phrase="INVOICE_BALANCE"}:</th>
              <td class="py-2 text-end">{dbo_echo|currency dbo="invoice_dbo" field="balance"}</td>
            </tr>
            <tr>
              <th class="py-2 text-muted">{echo phrase="OUTSTANDING_BALANCE"}:</th>
              <td class="py-2 text-end">{dbo_echo|currency dbo="invoice_dbo" field="outstandingbalance"}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<div class="card shadow-sm mb-4">
  <div class="card-body">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h5 class="card-title mb-0">{echo phrase="ITEMS"}</h5>
    </div>
    {form name="view_invoice_items"}
      <div class="table-responsive">
        {form_table field="items"}
          {form_table_column columnid=""}
            <div class="text-center">{form_table_checkbox option=$items.id}</div>
          {/form_table_column}
          {form_table_column columnid="text" header="[ITEM]"}
            {$items.text}
          {/form_table_column}
          {form_table_column columnid="unitamount" header="[UNIT_PRICE]"}
            {$items.unitamount|currency}
          {/form_table_column}
          {form_table_column columnid="quantity" header="[QUANTITY]"}
            {$items.quantity}
          {/form_table_column}
          {form_table_column columnid="amount" header="[TOTAL]"}
            {$items.amount|currency}
          {/form_table_column}
          {form_table_footer}
            {form_element field="remove" class="btn btn-outline-danger btn-sm"}
          {/form_table_footer}
        {/form_table}
      </div>
    {/form}
  </div>
</div>

<div class="card shadow-sm mb-4">
  <div class="card-body">
    <h5 class="card-title mb-3">{echo phrase="ADD_LINE_ITEM"}</h5>
    {form name="new_line_item"}
      <div class="row g-3 align-items-end">
        <div class="col-md-6">
          <label class="form-label">{form_description field="text"}</label>
          {form_element field="text" size="50" class="form-control"}
        </div>
        <div class="col-md-3">
          <label class="form-label">{form_description field="unitamount"}</label>
          {form_element field="unitamount" size="7" class="form-control"}
        </div>
        <div class="col-md-3">
          <label class="form-label">{form_description field="quantity"}</label>
          {form_element field="quantity" size="3" class="form-control"}
        </div>
        <div class="col-12 text-end">
          {form_element field="continue" class="btn btn-primary"}
        </div>
      </div>
    {/form}
  </div>
</div>

<div class="card shadow-sm mb-4">
  <div class="card-body">
    <h5 class="card-title mb-3">{echo phrase="PAYMENTS"}</h5>
    {form name="view_invoice_payments"}
      <div class="table-responsive">
        {form_table field="payments"}
          {form_table_column columnid=""}
            <div class="text-center">{form_table_checkbox option=$payments.id}</div>
          {/form_table_column}
          {form_table_column columnid="id" header="[ID]"}
            <a href="manager_content.php?page=edit_payment&payment={$payments.id}">{$payments.id}</a>
          {/form_table_column}
          {form_table_column columnid="date" header="[DATE_RECEIVED]"}
            {$payments.date|datetime:date}
          {/form_table_column}
          {form_table_column columnid="amount" header="[AMOUNT]"}
            {$payments.amount|currency}
          {/form_table_column}
          {form_table_column columnid="type" header="[PAYMENT_TYPE]"}
            {$payments.type}
          {/form_table_column}
          {form_table_footer}
            {form_element field="remove" class="btn btn-outline-danger btn-sm"}
          {/form_table_footer}
        {/form_table}
      </div>
    {/form}
  </div>
</div>

<div class="card shadow-sm mb-4">
  <div class="card-body">
    <h5 class="card-title mb-3">{echo phrase="OUTSTANDING_INVOICES"}</h5>
    {form name="view_invoice_outstanding_invoices"}
      <div class="table-responsive">
        {form_table field="invoices"}
          {form_table_column columnid="id" header="[ID]"}
            <a href="./manager_content.php?page=billing_view_invoice&invoice={$invoices.id}">{$invoices.id}</a>
          {/form_table_column}
          {form_table_column columnid="date" header="[INVOICE_DATE]"}
            {$invoices.date|datetime:date}
          {/form_table_column}
          {form_table_column columnid="periodbegin" header="[BILLING_PERIOD]"}
            {$invoices.periodbegin|datetime:date} - {$invoices.periodend|datetime:date}
          {/form_table_column}
          {form_table_column columnid="total" header="[INVOICE_TOTAL]"}
            {$invoices.total|currency}
          {/form_table_column}
          {form_table_column columnid="totalpayments" header="[AMOUNT_PAID]"}
            {$invoices.totalpayments|currency}
          {/form_table_column}
          {form_table_column columnid="balance" header="[AMOUNT_DUE]"}
            {$invoices.balance|currency}
          {/form_table_column}
        {/form_table}
      </div>
    {/form}
  </div>
</div>
