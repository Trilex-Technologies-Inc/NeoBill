<div class="manager_content">
{form name="new_tax_rule"}

  <div class="form">
    <div class="card shadow-sm">
      <div class="card-header bg-primary text-white">
        <h5 class="mb-0">[NEW_TAX_RULE]</h5>
      </div>
      
      <div class="card-body">
        
        <!-- Tax Rate -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="rate"}
            <span class="text-danger">*</span>
          </label>
          <div class="col-sm-8 col-md-9 col-lg-4">
            <div class="input-group">
              {form_element field="rate" size="4" class="form-control"}
              <span class="input-group-text">%</span>
            </div>
            <small class="form-text text-muted">Enter the tax rate as a percentage</small>
          </div>
        </div>

        <!-- Country -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="country"}
            <span class="text-danger">*</span>
          </label>
          <div class="col-sm-8 col-md-9 col-lg-6">
            {form_element field="country" class="form-select"}
          </div>
        </div>

        <!-- Apply to All States -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="allstates"}
          </label>
          <div class="col-sm-8 col-md-9 col-lg-6">
            <div class="form-check form-switch">
              {form_element field="allstates" option="true" class="form-check-input"}
              <label class="form-check-label" for="allstates">
                Apply to all states/provinces
              </label>
            </div>
            <small class="form-text text-muted">Enable to apply this tax rule to all states</small>
          </div>
        </div>

        <!-- State/Province -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            &nbsp;{form_description field="state"}
          </label>
          <div class="col-sm-8 col-md-9 col-lg-6">
            {form_element field="state" size="20" class="form-control" placeholder="e.g., California, NY, London"}
            <small class="form-text text-muted">Specific state/province (if not applying to all)</small>
          </div>
        </div>

        <!-- Description -->
        <div class="row mb-4">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="description"}
          </label>
          <div class="col-sm-8 col-md-9 col-lg-6">
            {form_element field="description" size="40" class="form-control" placeholder="e.g., Sales Tax, VAT, GST"}
            <small class="form-text text-muted">Optional description for this tax rule</small>
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
</div>