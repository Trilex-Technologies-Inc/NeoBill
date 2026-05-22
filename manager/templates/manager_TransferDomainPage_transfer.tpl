<div class="manager_content">

{form name="transfer_domain_service"}

  <div class="card">
    <div class="card-header bg-info text-white">
      <h3 class="h6 mb-0">{echo phrase="TRANSFER"} {dbo_echo dbo="dspdbo" field="fulldomainname"}</h3>
    </div>
    <div class="card-body">
      
      <div class="form">
        
        <!-- Account -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="account"}
          </div>
          <div class="col-md-8 p-2">
            {form_element field="account" class="form-select"}
          </div>
        </div>
        
        <!-- Term -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="term"}
          </div>
          <div class="col-md-8 p-2">
            {form_element field="term" class="form-select"}
          </div>
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

</div>