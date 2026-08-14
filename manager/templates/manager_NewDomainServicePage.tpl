<div class="manager_content">

{form name="new_domain_service"}

  <div class="card">
    <div class="card-header bg-success text-white">
      <h3 class="h6 mb-0">{echo phrase="NEW_DOMAIN_SERVICE"}</h3>
    </div>
    <div class="card-body">
      
      <div class="form">
        
        <!-- TLD -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="tld"}
          </div>
          <div class="col-md-8 p-2">
            <div class="input-group">
              <span class="input-group-text">.</span>
              {form_element field="tld" size="8" class="form-control w-auto"}
              <span class="input-group-text text-muted">(com, net, org, ...)</span>
            </div>
          </div>
        </div>
        
        <!-- Module Name -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="modulename"}
          </div>
          <div class="col-md-8 p-2">
            {form_element field="modulename" class="form-select"}
          </div>
        </div>
        
        <!-- Description -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="description"}
          </div>
          <div class="col-md-8 p-2">
            {form_element field="description" cols="40" rows="3" class="form-control"}
          </div>
        </div>
        
        <!-- Public -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="public"}
          </div>
          <div class="col-md-8 p-2">
            <div class="form-check">
              {form_element field="public" option="Yes" class="form-check-input"}
              <label class="form-check-label">{echo phrase="MAKE_PUBLIC"}</label>
            </div>
          </div>
        </div>
        
      </div>
      
    </div>
    <div class="card-footer d-flex justify-content-between">
      <div class="left">
        {form_element field="cancel" class="btn btn-secondary"}
      </div>
      <div class="right">
        {form_element field="continue" class="btn btn-success"}
      </div>
    </div>
  </div>

{/form}

</div>