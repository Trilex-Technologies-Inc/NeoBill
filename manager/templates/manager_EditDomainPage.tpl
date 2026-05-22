<!-- Edit Domain Form -->
{form name="edit_domain"}
  <div class="card mb-4">
    <div class="card-header bg-primary text-white">
      <h3 class="h6 mb-0">{echo phrase="EDIT_DOMAIN"}</h3>
    </div>
    <div class="card-body">
      
      <!-- Domain Name -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {echo phrase="DOMAIN_NAME"}:
        </div>
        <div class="col-md-8 p-2">
          <span class="fw-bold text-primary">{$domainDBO->getFullDomainName()}</span>
        </div>
      </div>
      
      <!-- Activation Date -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {echo phrase="ACTIVATION_DATE"}:
        </div>
        <div class="col-md-8 p-2">
          <span class="badge bg-secondary">{$domainDBO->getDate()|datetime:date}</span>
        </div>
      </div>
      
      <!-- Term -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="term"}
        </div>
        <div class="col-md-8 p-2">
          {form_element value=$domainDBO->getTermID() field="term" class="form-select"}
        </div>
      </div>
      
      <!-- Next Billing Date -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="nextbillingdate"}
        </div>
        <div class="col-md-8 p-2">
          {form_element value=$domainDBO->getNextBillingDate() field="nextbillingdate" class="form-control"}
        </div>
      </div>
      
      <!-- Note -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="note"}
        </div>
        <div class="col-md-8 p-2">
          {form_element value=$domainDBO->getNote() field="note" rows=4 cols=50 class="form-control"}
        </div>
      </div>
      
    </div>
    <div class="card-footer d-flex justify-content-between">
      <div class="left">
        {form_element field="cancel" class="btn btn-secondary"}
      </div>
      <div class="right">
        {form_element field="continue" class="btn btn-primary"}
      </div>
    </div>
  </div>
{/form}

<!-- Renew Domain Form -->
{form name="renew_domain"}
  <div class="card">
    <div class="card-header bg-success text-white">
      <h3 class="h6 mb-0">{echo phrase="RENEW_DOMAIN"}</h3>
    </div>
    <div class="card-body">
      
      <!-- Term -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="term"}
        </div>
        <div class="col-md-8 p-2">
          {form_element field="term" class="form-select"}
        </div>
      </div>
      
      <!-- Date -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="date"}
        </div>
        <div class="col-md-8 p-2">
          {form_element field="date" class="form-control"}
        </div>
      </div>
      
      <!-- Registrar -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="registrar"}
        </div>
        <div class="col-md-8 p-2">
          {form_element field="registrar" option="true" class="form-check-input"}
        </div>
      </div>
      
    </div>
    <div class="card-footer text-end">
      {form_element field="continue" class="btn btn-success"}
    </div>
  </div>
{/form}