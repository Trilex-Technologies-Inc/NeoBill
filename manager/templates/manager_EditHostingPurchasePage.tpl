{if $serverDBO != null && $serverDBO->getCPModule() != null}
  {form name="edit_hosting_purchase_action"}
    <div class="action mb-4">
      <div class="card">
        <div class="card-header bg-warning text-dark">
          <p class="header_long h6 mb-0">{echo phrase="SERVER_CONTROL_PANEL_ACTIONS"}</p>
        </div>
        <div class="card-body">
          <div class="d-flex flex-wrap gap-2">
            {form_element field="createaccount" class="btn btn-success"}
            {form_element field="suspendaccount" class="btn btn-warning"}
            {form_element field="unsuspendaccount" class="btn btn-info"}
            {form_element field="killaccount" class="btn btn-danger"}
          </div>
        </div>
      </div>
    </div>
  {/form}
{/if}

{form name="edit_hosting_purchase"}
  <div class="card">
    <div class="card-header bg-primary text-white">
      <h3 class="h6 mb-0">{echo phrase="EDIT_HOSTING_SERVICE_PURCHASE"}</h3>
    </div>
    <div class="card-body">
      
      <!-- Account -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {echo phrase="ACCOUNT"}:
        </div>
        <div class="col-md-8 p-2">
          <span class="fw-bold">{$purchaseDBO->getAccountName()}</span>
        </div>
      </div>
      
      <!-- Hosting Service -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {echo phrase="HOSTING_SERVICE"}:
        </div>
        <div class="col-md-8 p-2">
          <span class="badge bg-info">{$purchaseDBO->getTitle()}</span>
        </div>
      </div>
      
      <!-- Purchased Date -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {echo phrase="PURCHASED"}:
        </div>
        <div class="col-md-8 p-2">
          <span class="badge bg-secondary">{$purchaseDBO->getDate()|datetime:date}</span>
        </div>
      </div>
      
      <!-- Term -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="term"}
        </div>
        <div class="col-md-8 p-2">
          {form_element field="term" value=$purchaseDBO->getTermID() class="form-select"}
        </div>
      </div>
      
      <!-- Next Billing Date -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="nextbillingdate"}
        </div>
        <div class="col-md-8 p-2">
          {form_element field="nextbillingdate" value=$purchaseDBO->getNextBillingDate() class="form-control"}
        </div>
      </div>
      
      <!-- Server -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="server"}
        </div>
        <div class="col-md-8 p-2">
          {form_element field="server" value=$purchaseDBO->getServerID() nulloption="true" class="form-select"}
        </div>
      </div>
      
      <!-- Domain (conditional) -->
      {assign var="domainIsRequired" value=$purchaseDBO->isDomainRequired()}
      {if $domainIsRequired}
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="domain"}
          </div>
          <div class="col-md-8 p-2">
            {form_element field="domain" value=$purchaseDBO->getDomainName() class="form-control"}
          </div>
        </div>
      {/if}
      
      <!-- Note -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="note"}
        </div>
        <div class="col-md-8 p-2">
          {form_element field="note" value=$purchaseDBO->getNote() rows=4 cols=50 class="form-control"}
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