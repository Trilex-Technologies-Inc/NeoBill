<div class="manager_content">

{form name="new_product"}

  <div class="card">
    <div class="card-header bg-success text-white">
      <h3 class="h6 mb-0">{echo phrase="NEW_PRODUCT"}</h3>
    </div>
    <div class="card-body">
      
      <div class="form">
        
        <!-- Product Name -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="name"}
          </div>
          <div class="col-md-8 p-2">
            {form_element field="name" size="20" class="form-control"}
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