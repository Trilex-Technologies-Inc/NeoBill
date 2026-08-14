<p class="alert alert-warning text-center">
  {echo phrase="DELETE_PRODUCT"}
</p>

{form name="delete_product"}
  <div class="card">
    <div class="card-header bg-danger text-white">
      <h2 class="h5 mb-0">{echo phrase="PRODUCT"}</h2>
    </div>
    <div class="card-body">
      <div class="properties">
        
        <!-- PRODUCT NAME -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="PRODUCT_NAME"}:</div>
          <div class="col-md-8 p-2">
            <span class="fw-bold">{dbo_echo dbo="product_dbo" field="name"}</span>
          </div>
        </div>
        
        <!-- DESCRIPTION -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="DESCRIPTION"}:</div>
          <div class="col-md-8 p-2">
            <textarea class="form-control" rows="3" readonly="readonly">{dbo_echo dbo="product_dbo" field="description"}</textarea>
          </div>
        </div>
        
        <!-- PRICE -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="PRICE"}:</div>
          <div class="col-md-8 p-2">
            <span class="badge bg-success fs-6">{dbo_echo|currency dbo="product_dbo" field="price"}</span>
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
    </div>
  </div>
{/form}