<p class="alert alert-warning text-center">
  {echo phrase="DELETE_DOMAIN"}
</p>

{form name="delete_domain_service"}
  <div class="card">
    <div class="card-header bg-danger text-white">
      <h2 class="h5 mb-0"> {echo phrase="DOMAIN_SERVICE"} </h2>
    </div>
    <div class="card-body">
      <div class="properties">
        
        <!-- TLD -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">TLD:</div>
          <div class="col-md-8 p-2">.{dbo_echo dbo="domain_service_dbo" field="tld"}</div>
        </div>
        
        <!-- REGISTRAR MODULE -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="REGISTRAR_MODULE"}:</div>
          <div class="col-md-8 p-2">{dbo_echo dbo="domain_service_dbo" field="modulename"}</div>
        </div>
        
        <!-- DESCRIPTION -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="DESCRIPTION"}:</div>
          <div class="col-md-8 p-2">
            <textarea class="form-control" rows="3" readonly="readonly">{dbo_echo dbo="domain_service_dbo" field="description"}</textarea>
          </div>
        </div>
        
        <!-- RECURRING PRICES -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (1 {echo phrase="YEAR"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="domain_service_dbo" field="price1yr"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (2 {echo phrase="YEAR"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="domain_service_dbo" field="price2yr"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (3 {echo phrase="YEAR"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="domain_service_dbo" field="price3yr"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (4 {echo phrase="YEAR"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="domain_service_dbo" field="price4yr"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (5 {echo phrase="YEAR"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="domain_service_dbo" field="price5yr"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (6 {echo phrase="YEAR"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="domain_service_dbo" field="price6yr"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (7 {echo phrase="YEAR"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="domain_service_dbo" field="price7yr"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (8 {echo phrase="YEAR"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="domain_service_dbo" field="price8yr"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (9 {echo phrase="YEAR"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="domain_service_dbo" field="price9yr"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (10 {echo phrase="YEAR"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="domain_service_dbo" field="price10yr"}</span></div>
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