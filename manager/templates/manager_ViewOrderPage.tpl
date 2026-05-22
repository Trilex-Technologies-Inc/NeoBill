{form name="order"}

  <!-- Actions Section -->
  <div class="action mb-4">
    <div class="card">
      <div class="card-header bg-primary text-white">
        <p class="header h6 mb-0">Actions</p>
      </div>
      <div class="card-body">
        <div class="d-flex gap-2">
          {form_element field="execute" class="btn btn-success"}
          {form_element field="delete" class="btn btn-danger"}
        </div>
      </div>
    </div>
  </div>

  <!-- Order Details -->
  <div class="card mb-4">
    <div class="card-header bg-secondary text-white">
      <h2 class="h5 mb-0">{echo phrase="ORDER"} #{dbo_echo dbo="orderdbo" field="id"}</h2>
    </div>
    <div class="card-body">
      
      <!-- Order ID -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="ORDER_ID"}:</div>
        <div class="col-md-8 p-2">
          <span class="fw-bold text-primary">#{dbo_echo dbo="orderdbo" field="id"}</span>
        </div>
      </div>
      
      <!-- Order Date -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="ORDER_DATE"}:</div>
        <div class="col-md-8 p-2">
          <span class="badge bg-info">{dbo_echo|datetime dbo="orderdbo" field="datecreated"}</span>
        </div>
      </div>
      
      <!-- Remote IP Address -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="REMOTE_IP_ADDRESS"}:</div>
        <div class="col-md-8 p-2">
          <code>{dbo_echo dbo="orderdbo" field="remoteipstring"}</code>
        </div>
      </div>
      
      <!-- Accepted TOS -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="ACCEPTED_TOS"}:</div>
        <div class="col-md-8 p-2">
          {assign var="accepted" value={dbo_echo dbo="orderdbo" field="acceptedtos"}}
          {if $accepted == "Yes"}
            <span class="badge bg-success">{$accepted}</span>
          {else}
            <span class="badge bg-danger">{$accepted}</span>
          {/if}
        </div>
      </div>
      
      <!-- Sub Total -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="SUB_TOTAL"}:</div>
        <div class="col-md-8 p-2">
          <span class="badge bg-secondary">{dbo_echo|currency dbo="orderdbo" field="subtotal"}</span>
        </div>
      </div>
      
      <!-- Taxes -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="TAXES"}:</div>
        <div class="col-md-8 p-2">
          <span class="badge bg-warning text-dark">{dbo_echo|currency dbo="orderdbo" field="taxtotal"}</span>
        </div>
      </div>
      
      <!-- Total -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="TOTAL"}:</div>
        <div class="col-md-8 p-2">
          <span class="badge bg-success fs-6">{dbo_echo|currency dbo="orderdbo" field="total"}</span>
        </div>
      </div>
      
      <!-- Customer Note -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="CUSTOMER_NOTE"}:</div>
        <div class="col-md-8 p-2">
          <textarea class="form-control" rows="6" readonly="true">{dbo_echo dbo="orderdbo" field="note"}</textarea>
        </div>
      </div>
      
    </div>
  </div>

  {dbo_assign dbo="orderdbo" field="accounttype" var="accounttype"}
  {if $accounttype == "New Account"}

    <!-- Contact Information (New Account) -->
    <div class="card mb-4">
      <div class="card-header bg-info text-white">
        <h3 class="h6 mb-0">{echo phrase="CONTACT_INFORMATION"}</h3>
      </div>
      <div class="card-body">
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="businessname"}</div>
          <div class="col-md-8 p-2">{form_element dbo="orderdbo" field="businessname" size="40" class="form-control"}</div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="contactname"}</div>
          <div class="col-md-8 p-2">{form_element dbo="orderdbo" field="contactname" size="30" class="form-control"}</div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="contactemail"}</div>
          <div class="col-md-8 p-2">{form_element dbo="orderdbo" field="contactemail" size="30" class="form-control"}</div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="address1"}</div>
          <div class="col-md-8 p-2">{form_element dbo="orderdbo" field="address1" size="40" class="form-control"}</div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="address2"}</div>
          <div class="col-md-8 p-2">{form_element dbo="orderdbo" field="address2" size="40" class="form-control"}</div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="city"}</div>
          <div class="col-md-8 p-2">{form_element dbo="orderdbo" field="city" size="30" class="form-control"}</div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="state"}</div>
          <div class="col-md-8 p-2">{form_element dbo="orderdbo" field="state" size="20" class="form-control"}</div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="postalcode"}</div>
          <div class="col-md-8 p-2">{form_element dbo="orderdbo" field="postalcode" size="10" class="form-control"}</div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="country"}</div>
          <div class="col-md-8 p-2">{form_element dbo="orderdbo" field="country" class="form-select"}</div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="phone"}</div>
          <div class="col-md-8 p-2">{form_element dbo="orderdbo" field="phone" size="15" class="form-control"}</div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="mobilephone"}</div>
          <div class="col-md-8 p-2">{form_element dbo="orderdbo" field="mobilephone" size="15" class="form-control"}</div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="fax"}</div>
          <div class="col-md-8 p-2">{form_element dbo="orderdbo" field="fax" size="15" class="form-control"}</div>
        </div>
        
      </div>
    </div>

    <!-- Account Information (New Account) -->
    <div class="card mb-4">
      <div class="card-header bg-warning text-dark">
        <h3 class="h6 mb-0">{echo phrase="ACCOUNT_INFORMATION"}</h3>
      </div>
      <div class="card-body">
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="username"}</div>
          <div class="col-md-8 p-2">{form_element dbo="orderdbo" field="username" size="10" class="form-control"}</div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{form_description field="password"}</div>
          <div class="col-md-8 p-2">
            {form_element field="password" size="10" class="form-control"}
            <small class="form-text text-muted">{echo phrase="ONLY_SUPPLY_A_PASSWORD"}</small>
          </div>
        </div>
        
      </div>
    </div>

  {else}

    <!-- Account Information (Existing Account) -->
    <div class="card mb-4">
      <div class="card-header bg-success text-white">
        <h3 class="h6 mb-0">{echo phrase="ACCOUNT_INFORMATION"}</h3>
      </div>
      <div class="card-body">
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="ACCOUNT"}:</div>
          <div class="col-md-8 p-2">
            <a href="manager_content.php?page=accounts_view_account&account={dbo_echo dbo="accountdbo" field="id"}" class="fw-bold text-decoration-none">
              {dbo_echo dbo="accountdbo" field="accountname"}
            </a>
          </div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="BALANCE"}:</div>
          <div class="col-md-8 p-2">
            <span class="badge bg-danger fs-6">{dbo_echo|currency dbo="accountdbo" field="balance"}</span>
          </div>
        </div>
        
      </div>
    </div>

  {/if}

  <!-- Order Items Table -->
  <div class="card mb-4">
    <div class="card-header bg-dark text-white">
      <h3 class="h6 mb-0">{echo phrase="ORDER_ITEMS"}</h3>
    </div>
    <div class="card-body p-0">
      <div class="table-responsive">
        <table class="table table-hover table-striped align-middle mb-0">
          <thead class="table-dark">
            <tr>
              <th style="width: 50px; text-align: center">{echo phrase="ACCEPT"}</th>
              <th>{echo phrase="ITEM"}</th>
              <th>{echo phrase="TERM"}</th>
              <th>{echo phrase="SETUP_PRICE"}</th>
              <th>{echo phrase="RECURRING_PRICE"}</th>
            </tr>
          </thead>
          <tbody>
            {form_table field="items"}
              <tr>
                <td class="text-center">{form_table_checkbox option=$items.orderitemid}</td>
                <td>{$items.description}</td>
                <td><span class="badge bg-secondary">{$items.term}</span></td>
                <td>{$items.setupfee|currency}</td>
                <td class="fw-bold text-primary">{$items.price|currency}</td>
              </tr>
            {/form_table}
          </tbody>
          {form_table_footer}
            <tfoot>
              <tr class="table-light">
                <td colspan="5" class="p-3">
                  {form_element field="save" class="btn btn-primary"}
                </td>
              </tr>
            </tfoot>
          {/form_table_footer}
        </table>
      </div>
    </div>
  </div>

  <!-- Payments Table -->
  <div class="card">
    <div class="card-header bg-dark text-white">
      <h3 class="h6 mb-0">{echo phrase="PAYMENTS"}</h3>
    </div>
    <div class="card-body p-0">
      <div class="table-responsive">
        <table class="table table-hover table-striped align-middle mb-0">
          <thead class="table-dark">
            <tr>
              <th>{echo phrase="ID"}</th>
              <th>{echo phrase="DATE_RECEIVED"}</th>
              <th>{echo phrase="AMOUNT"}</th>
              <th>{echo phrase="PAYMENT_TYPE"}</th>
              <th>{echo phrase="MODULE"}</th>
              <th>{echo phrase="PAYMENT_STATUS"}</th>
            </tr>
          </thead>
          <tbody>
            {form_table field="payments"}
              <tr>
                <td><a href="manager_content.php?page=edit_payment&payment={$payments.id}" class="fw-bold text-decoration-none">{$payments.id}</a></td>
                <td><span class="badge bg-info">{$payments.date|datetime:date}</span></td>
                <td class="fw-bold text-success">{$payments.amount|currency}</td>
                <td>{$payments.type}</td>
                <td>{$payments.module}</td>
                <td>
                  {if $payments.status == "Completed"}
                    <span class="badge bg-success">{$payments.status}</span>
                  {elseif $payments.status == "Pending"}
                    <span class="badge bg-warning text-dark">{$payments.status}</span>
                  {else}
                    <span class="badge bg-secondary">{$payments.status}</span>
                  {/if}
                </td>
              </tr>
            {/form_table}
          </tbody>
        </table>
      </div>
    </div>
  </div>

{/form}