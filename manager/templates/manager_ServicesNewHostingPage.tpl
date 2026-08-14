<div class="manager_content">

{form name="new_hosting"}

  <div class="card">
    <div class="card-header bg-success text-white">
      <h3 class="h6 mb-0">{echo phrase="NEW_HOSTING_SERVICE"}</h3>
    </div>
    <div class="card-body">
      
      <div class="form">
        
        <!-- Title -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="title"}
          </div>
          <div class="col-md-8 p-2">
            {form_element field="title" size="40" class="form-control"}
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
        
        <!-- Unique IP -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="uniqueip"}
          </div>
          <div class="col-md-8 p-2">
            <div class="form-check form-switch">
              {form_element field="uniqueip" class="form-check-input"}
              <label class="form-check-label text-muted">{echo phrase="ENABLE_UNIQUE_IP"}</label>
            </div>
          </div>
        </div>
        
        <!-- Domain Requirement -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="domainrequirement"}
          </div>
          <div class="col-md-8 p-2">
            <div class="form-check form-switch">
              {form_element field="domainrequirement" class="form-check-input"}
              <label class="form-check-label text-muted">{echo phrase="REQUIRE_DOMAIN"}</label>
            </div>
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