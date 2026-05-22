<div class="manager_content">

{form name="generate_invoices"}

  <div class="card">
    <div class="card-header bg-primary text-white">
      <h3 class="h6 mb-0">{echo phrase="GENERATE_INVOICE_BATCH"}</h3>
    </div>
    <div class="card-body">
      
      <div class="form">
        
        <!-- Date -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="date"}
          </div>
          <div class="col-md-8 p-2">
            {form_element field="date" class="form-control"}
          </div>
        </div>
        
        <!-- Invoice Period -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {echo phrase="INVOICE_PERIOD"}:
          </div>
          <div class="col-md-8 p-2">
            <div class="row g-2">
              <div class="col">
                <label class="form-label small text-muted">{echo phrase="START"}</label>
                {form_element field="periodbegin" class="form-control"}
              </div>
              <div class="col-auto">
                <span class="fw-bold h4 mt-4 pt-2">→</span>
              </div>
              <div class="col">
                <label class="form-label small text-muted">{echo phrase="END"}</label>
                {form_element field="periodend" value=$nextMonth class="form-control"}
              </div>
            </div>
          </div>
        </div>
        
        <!-- Terms -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="terms"}
          </div>
          <div class="col-md-8 p-2">
            <div class="row g-2">
              <div class="col-sm-4">
                {form_element field="terms" size="2" class="form-control"}
              </div>
              <div class="col-sm-auto">
                <span class="text-muted">{echo phrase="DAYS"}</span>
              </div>
            </div>
          </div>
        </div>
        
        <!-- Note -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">
            {form_description field="note"}
          </div>
          <div class="col-md-8 p-2">
            {form_element field="note" rows="4" cols="60" class="form-control"}
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