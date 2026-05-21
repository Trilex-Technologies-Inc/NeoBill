<div class="manager_content">
{form name="billing_payment"}

  <div class="form">
    <div class="card shadow-sm">
      <div class="card-header bg-primary text-white">
        <h5 class="mb-0">[ENTER_PAYMENT]</h5>
      </div>
      
      <div class="card-body">
        
        <!-- Invoice Selection (Dropdown) -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="invoiceselect"}
            <span class="text-danger">*</span>
          </label>
          <div class="col-sm-8 col-md-9 col-lg-6">
            {form_element field="invoiceselect" class="form-select"}
            <small class="form-text text-muted">Select an existing invoice</small>
          </div>
        </div>

        <!-- OR Invoice Number (Manual Entry) -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            &nbsp;&nbsp; or {form_description field="invoiceint"}
          </label>
          <div class="col-sm-8 col-md-9 col-lg-4">
            <div class="input-group">
              <span class="input-group-text bg-light">
                <i class="bi bi-hash"></i>
              </span>
              {form_element field="invoiceint" size="5" class="form-control" placeholder="Invoice #"}
            </div>
            <small class="form-text text-muted">Or enter invoice number manually</small>
          </div>
        </div>

        <hr class="my-3">

        <!-- Date -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="date"}
            <span class="text-danger">*</span>
          </label>
          <div class="col-sm-8 col-md-9 col-lg-4">
            <div class="input-group">
              <span class="input-group-text bg-light">
                <i class="bi bi-calendar"></i>
              </span>
              {form_element field="date" class="form-control"}
            </div>
          </div>
        </div>

        <!-- Payment Type -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="type"}
            <span class="text-danger">*</span>
          </label>
          <div class="col-sm-8 col-md-9 col-lg-4">
            <div class="input-group">
              <span class="input-group-text bg-light">
                <i class="bi bi-credit-card"></i>
              </span>
              {form_element field="type" class="form-select"}
            </div>
          </div>
        </div>

        <!-- Amount -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="amount"}
            <span class="text-danger">*</span>
          </label>
          <div class="col-sm-8 col-md-9 col-lg-4">
            <div class="input-group">
              <span class="input-group-text bg-light">$</span>
              {form_element field="amount" size="7" class="form-control" placeholder="0.00"}
            </div>
          </div>
        </div>

        <!-- Status -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="status"}
          </label>
          <div class="col-sm-8 col-md-9 col-lg-4">
            {form_element field="status" class="form-select"}
          </div>
        </div>

        <!-- Transaction 1 -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="transaction1"}
          </label>
          <div class="col-sm-8 col-md-9 col-lg-5">
            {form_element field="transaction1" size="20" class="form-control" placeholder="Check #, Reference ID, etc."}
          </div>
        </div>

        <!-- Transaction 2 -->
        <div class="row mb-4">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="transaction2"}
          </label>
          <div class="col-sm-8 col-md-9 col-lg-5">
            {form_element field="transaction2" size="20" class="form-control" placeholder="Additional reference"}
          </div>
        </div>

        <!-- Buttons -->
        <div class="row">
          <div class="col-12">
            <hr class="my-3">
            <div class="d-flex gap-2 justify-content-end">
              {form_element field="continue" class="btn btn-primary btn-lg px-5"}
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

{/form}
</div>