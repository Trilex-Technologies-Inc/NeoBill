{dbo_assign dbo="invoice_dbo" var="invoice_id" field="id"}

<p class="alert alert-warning text-center">
  {echo phrase="DELETE_INVOICE"}
</p>

<div class="card mb-4">
  <div class="card-header bg-danger text-white">
    <h2 class="h5 mb-0">{echo phrase="INVOICE"} #{$invoice_id}</h2>
  </div>
  <div class="card-body">
    {form name="delete_invoice"}
      <div class="properties">
        
        <!-- ACCOUNT -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="ACCOUNT"}:</div>
          <div class="col-md-8 p-2">
            {dbo_echo dbo="invoice_dbo" field="accountname"} (ID: {dbo_echo dbo="invoice_dbo" field="accountid"})
          </div>
        </div>
        
        <!-- PERIOD -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="PERIOD"}:</div>
          <div class="col-md-8 p-2">
            {dbo_echo|datetime:date dbo="invoice_dbo" field="periodbegin"} -
            {dbo_echo|datetime:date dbo="invoice_dbo" field="periodend"}
          </div>
        </div>
        
        <!-- AMOUNT DUE -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="AMOUNT_DUE"}:</div>
          <div class="col-md-8 p-2">
            <span class="badge bg-danger fs-6">{dbo_echo|currency dbo="invoice_dbo" field="balance"}</span>
          </div>
        </div>
        
        <!-- INVOICE DATE -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="INVOICE_DATE"}:</div>
          <div class="col-md-8 p-2">
            <span class="badge bg-secondary">{dbo_echo|datetime:date dbo="invoice_dbo" field="date"}</span>
          </div>
        </div>
        
        <!-- INVOICE TOTAL -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="INVOICE_TOTAL"}:</div>
          <div class="col-md-8 p-2">
            <span class="badge bg-info fs-6">{dbo_echo|currency dbo="invoice_dbo" field="total"}</span>
          </div>
        </div>
        
        <!-- NOTE TO CUSTOMER -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="NOTE_TO_CUSTOMER"}:</div>
          <div class="col-md-8 p-2">
            <div class="alert alert-secondary mb-0">
              {dbo_echo dbo="invoice_dbo" field="note"}
            </div>
          </div>
        </div>
        
        <!-- Buttons -->
        <div class="row mt-4">
          <div class="col-12">
            {form_element field="delete"}
            {form_element field="cancel"}
          </div>
        </div>
        
      </div>
    {/form}
  </div>
</div>

{form name="delete_invoice_items"}
  <div class="card">
    <div class="card-header bg-secondary text-white">
      <h3 class="h6 mb-0">{echo phrase="INVOICE_ITEMS"}</h3>
    </div>
    <div class="card-body p-0">
      <div class="table-responsive">
        <table class="table table-sm table-striped align-middle mb-0">
          <thead class="table-dark">
            <tr>
              <th>{echo phrase="ITEM"}</th>
              <th>{echo phrase="UNIT_PRICE"}</th>
              <th>{echo phrase="QUANTITY"}</th>
              <th>{echo phrase="TOTAL"}</th>
            </tr>
          </thead>
          <tbody>
            {form_table field="items"}
              <tr>
                <td>{$items.text}</td>
                <td>{$items.unitamount|currency}</td>
                <td>{$items.quantity}</td>
                <td class="fw-bold">{$items.amount|currency}</td>
              </tr>
            {/form_table}
          </tbody>
        </table>
      </div>
    </div>
  </div>
{/form}