{form name="view_product_action"}

  <div class="card">
    <div class="card-header bg-primary text-white">
      <h2 class="h5 mb-0">{echo phrase="PRODUCT"}</h2>
    </div>
    <div class="card-body">
      
      <div class="properties">
        
        <!-- PRODUCT NAME -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="PRODUCT_NAME"}:</div>
          <div class="col-md-8 p-2">
            <span class="fw-bold text-primary">{dbo_echo dbo="product_dbo" field="name"}</span>
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
        
        <!-- TAXABLE -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="TAXABLE"}:</div>
          <div class="col-md-8 p-2">
            {assign var="taxable" value={dbo_echo dbo="product_dbo" field="taxable"}}
            {if $taxable == "Yes"}
              <span class="badge bg-danger">{$taxable}</span>
            {else}
              <span class="badge bg-secondary">{$taxable}</span>
            {/if}
          </div>
        </div>
        
      </div>
      
    </div>
    <div class="card-footer d-flex gap-2">
      {form_element field="edit" class="btn btn-primary"}
      {form_element field="delete" class="btn btn-danger"}
    </div>
  </div>

{/form}