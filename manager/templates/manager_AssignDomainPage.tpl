{form name="assign_domain"}
  <div class="form">
    <div class="card shadow-sm">
      <div class="card-header bg-primary text-white">
        <h5 class="mb-0">[ASSIGN_DOMAIN]: {dbo_echo dbo="account_dbo" field="accountname"}</h5>
      </div>
      
      <div class="card-body">
        
        <!-- Domain Name with TLD -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="domainname"}
            <span class="text-danger">*</span>
          </label>
          <div class="col-sm-8 col-md-9 col-lg-6">
            <div class="input-group">
              {form_element field="domainname" class="form-control" placeholder="domainname"}
              <span class="input-group-text bg-light">.</span>
              {form_element field="tld" onChange="submit()" class="form-select"}
            </div>
            <small class="form-text text-muted">Enter domain name and select TLD (e.g., .com, .net, .org)</small>
          </div>
        </div>

        <!-- Term -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="term"}
            <span class="text-danger">*</span>
          </label>
          <div class="col-sm-8 col-md-9 col-lg-4">
            {form_element field="term" class="form-select"}
            <small class="form-text text-muted">Registration period</small>
          </div>
        </div>

        <!-- Date -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="date"}
            <span class="text-danger">*</span>
          </label>
          <div class="col-sm-8 col-md-9 col-lg-4">
            {form_element field="date" class="form-control"}
            <small class="form-text text-muted">Registration/assignment date</small>
          </div>
        </div>

        <!-- Note -->
        <div class="row mb-4">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="note"}
          </label>
          <div class="col-sm-8 col-md-9 col-lg-6">
            {form_element field="note" rows=4 cols=50 class="form-control"}
            <small class="form-text text-muted">Optional notes or comments about this domain</small>
          </div>
        </div>

        <!-- Buttons -->
        <div class="row">
          <div class="col-12">
            <hr class="my-3">
            <div class="d-flex gap-2 justify-content-between justify-content-md-start">
              {form_element field="cancel" class="btn btn-secondary"}
              {form_element field="continue" class="btn btn-primary"}
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
{/form}