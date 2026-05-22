<div class="manager_content">

{form name="transfer_domain"}

  <div class="card">
    <div class="card-header bg-info text-white">
      <h3 class="h6 mb-0">{echo phrase="TRANSFER_DOMAIN"}</h3>
    </div>
    <div class="card-body">
      
      <div class="form">
        
        <!-- Domain Name -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="domainname"}
          </div>
          <div class="col-md-8 p-2">
            <div class="input-group">
              {form_element field="domainname" class="form-control"}
              <span class="input-group-text">.</span>
              {form_element field="servicetld" class="form-select w-auto"}
            </div>
          </div>
        </div>
        
        <!-- Secret (Transfer Code/EPP Code) -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="secret"}
          </div>
          <div class="col-md-8 p-2">
            {form_element field="secret" size="10" class="form-control w-auto"}
            <small class="form-text text-muted d-block mt-1">
              {echo phrase="TRANSFER_SECRET_HELP"}
            </small>
          </div>
        </div>
        
      </div>
      
    </div>
    <div class="card-footer text-end">
      {form_element field="continue" class="btn btn-primary"}
    </div>
  </div>

{/form}

</div>