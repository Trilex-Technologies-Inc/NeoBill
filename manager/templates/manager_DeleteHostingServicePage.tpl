<p class="alert alert-warning text-center">
  {echo phrase="DELETE_SERVICE"}
</p>

{form name="delete_hosting"}
  <div class="card">
    <div class="card-header bg-danger text-white">
      <h2 class="h5 mb-0"> {echo phrase="WEB_HOSTING_SERVICE"} </h2>
    </div>
    <div class="card-body">
      <div class="properties">
        
        <!-- ID -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="ID"}:</div>
          <div class="col-md-8 p-2">{dbo_echo dbo="hosting_dbo" field="id"}</div>
        </div>
        
        <!-- TITLE -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="TITLE"}:</div>
          <div class="col-md-8 p-2">{dbo_echo dbo="hosting_dbo" field="title"}</div>
        </div>
        
        <!-- DESCRIPTION -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="DESCRIPTION"}:</div>
          <div class="col-md-8 p-2">
            <textarea class="form-control" rows="3" readonly="readonly">{dbo_echo dbo="hosting_dbo" field="description"}</textarea>
          </div>
        </div>
        
        <!-- SETUP PRICES -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="SETUP_PRICE"} (1 {echo phrase="MONTH"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-secondary">{dbo_echo|currency dbo="hosting_dbo" field="setupprice1mo"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="SETUP_PRICE"} (3 {echo phrase="MONTHS"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-secondary">{dbo_echo|currency dbo="hosting_dbo" field="setupprice3mo"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="SETUP_PRICE"} (6 {echo phrase="MONTHS"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-secondary">{dbo_echo|currency dbo="hosting_dbo" field="setupprice6mo"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="SETUP_PRICE"} (12 {echo phrase="MONTHS"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-secondary">{dbo_echo|currency dbo="hosting_dbo" field="setupprice12mo"}</span></div>
        </div>
        
        <!-- RECURRING PRICES -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (1 {echo phrase="MONTH"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="hosting_dbo" field="price1mo"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (3 {echo phrase="MONTHS"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="hosting_dbo" field="price3mo"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (6 {echo phrase="MONTHS"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="hosting_dbo" field="price6mo"}</span></div>
        </div>
        
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="RECURRING_PRICE"} (12 {echo phrase="MONTHS"}):</div>
          <div class="col-md-8 p-2"><span class="badge bg-info">{dbo_echo|currency dbo="hosting_dbo" field="price12mo"}</span></div>
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