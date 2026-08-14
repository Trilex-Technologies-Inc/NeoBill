{form name="edit_payment"}

  {dbo_assign dbo="payment_dbo" field="status" var="status"}
  {dbo_assign dbo="payment_dbo" field="moduletype" var="moduletype"}
  
  {if $moduletype == "payment_gateway" && $status == "Authorized"}
    <div class="action mb-4">
      <div class="card">
        <div class="card-header bg-primary text-white">
          <p class="header h6 mb-0">{echo phrase="ACTIONS"}</p>
        </div>
        <div class="card-body">
          <div class="d-flex gap-2">
            {form_element field="capture" class="btn btn-success"}
            {form_element field="void" class="btn btn-warning"}
          </div>
        </div>
      </div>
    </div>
  {elseif $moduletype == "payment_gateway" && $status == "Completed"}
    <div class="action mb-4">
      <div class="card">
        <div class="card-header bg-primary text-white">
          <p class="header h6 mb-0">{echo phrase="ACTIONS"}</p>
        </div>
        <div class="card-body">
          <div class="d-flex gap-2">
            {form_element field="refund" class="btn btn-danger"}
          </div>
        </div>
      </div>
    </div>
  {/if}

  <div class="card">
    <div class="card-header bg-secondary text-white">
      <h3 class="h6 mb-0">{echo phrase="EDIT_PAYMENT"}</h3>
    </div>
    <div class="card-body">
      
      {dbo_assign dbo="payment_dbo" field="invoiceid" var="invoiceid"}
      
      <!-- Account or Order ID -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {if $invoiceid != 0}
            {echo phrase="ACCOUNT"}:
          {else}
            {echo phrase="ORDER_ID"}:
          {/if}
        </div>
        <div class="col-md-8 p-2">
          {if $invoiceid != 0}
            <span class="fw-bold text-primary">{dbo_echo dbo="payment_dbo" field="accountname"}</span>
          {else}
            <span class="fw-bold">{dbo_echo dbo="payment_dbo" field="orderid"}</span>
          {/if}
        </div>
      </div>
      
      <!-- Invoice (conditional) -->
      {if $invoiceid != 0}
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {echo phrase="INVOICE"}:
          </div>
          <div class="col-md-8 p-2">
            <a href="manager_content.php?page=edit_invoice&invoiceid={dbo_echo dbo="payment_dbo" field="invoiceid"}" class="badge bg-info text-decoration-none">
              #{dbo_echo dbo="payment_dbo" field="invoiceid"}
            </a>
          </div>
        </div>
      {/if}
      
      <!-- Type -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {echo phrase="TYPE"}:
        </div>
        <div class="col-md-8 p-2">
          <span class="badge bg-secondary">{dbo_echo dbo="payment_dbo" field="type"}</span>
        </div>
      </div>
      
      <!-- Module -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {echo phrase="MODULE"}:
        </div>
        <div class="col-md-8 p-2">
          <span class="badge bg-info">{dbo_echo dbo="payment_dbo" field="module"}</span>
        </div>
      </div>
      
      <!-- Amount -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="amount"}
        </div>
        <div class="col-md-8 p-2">
          <div class="input-group">
            <span class="input-group-text">$</span>
            {form_element dbo="payment_dbo" field="amount" size="7" class="form-control"}
          </div>
        </div>
      </div>
      
      <!-- Status -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="status"}
        </div>
        <div class="col-md-8 p-2">
          {form_element dbo="payment_dbo" field="status" class="form-select"}
        </div>
      </div>
      
      <!-- Status Message -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="statusmessage"}
        </div>
        <div class="col-md-8 p-2">
          {form_element dbo="payment_dbo" field="statusmessage" class="form-control"}
        </div>
      </div>
      
      <!-- Date -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="date"}
        </div>
        <div class="col-md-8 p-2">
          {form_element dbo="payment_dbo" field="date" class="form-control"}
        </div>
      </div>
      
      <!-- Transaction 1 -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="transaction1"}
        </div>
        <div class="col-md-8 p-2">
          {form_element dbo="payment_dbo" field="transaction1" size="20" class="form-control"}
        </div>
      </div>
      
      <!-- Transaction 2 -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="transaction2"}
        </div>
        <div class="col-md-8 p-2">
          {form_element field="transaction2" size="20" class="form-control"}
        </div>
      </div>
      
    </div>
    <div class="card-footer d-flex justify-content-between">
      <div class="left">
        {form_element field="cancel" class="btn btn-secondary"}
      </div>
      <div class="right">
        {form_element field="save" class="btn btn-primary"}
      </div>
    </div>
  </div>
  
{/form}