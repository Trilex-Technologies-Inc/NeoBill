<div class="manager_content">

{form name="new_module"}

<div class="form">
  <div class="card shadow-sm">
    <div class="card-header bg-primary text-white">
      <h5 class="mb-0">[MODULE_INFORMATION]</h5>
    </div>
    
    <div class="card-body">
      
      <!-- Module Name -->
      <div class="row mb-3">
        <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
          {form_description field="name"}
          <span class="text-danger">*</span>
        </label>
        <div class="col-sm-8 col-md-9 col-lg-6">
          <div class="input-group">
            <span class="input-group-text bg-light">
              <i class="bi bi-tag"></i>
            </span>
            {form_element field="name" class="form-control" placeholder="Enter module name"}
          </div>
          <small class="form-text text-muted">Unique name for the module</small>
        </div>
      </div>

      <!-- Module Type -->
      <div class="row mb-3">
        <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
          {form_description field="type"}
          <span class="text-danger">*</span>
        </label>
        <div class="col-sm-8 col-md-9 col-lg-4">
          <div class="input-group">
            <span class="input-group-text bg-light">
              <i class="bi bi-grid"></i>
            </span>
            {form_element field="type" class="form-select"}
          </div>
        </div>
      </div>

      <!-- Description -->
      <div class="row mb-3">
        <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
          {form_description field="description"}
        </label>
        <div class="col-sm-8 col-md-9 col-lg-7">
          <div class="input-group">
            <span class="input-group-text bg-light align-items-start">
              <i class="bi bi-file-text"></i>
            </span>
            {form_element field="description" class="form-control" rows="3" placeholder="Full description of the module"}
          </div>
          <small class="form-text text-muted">Detailed description of what this module does</small>
        </div>
      </div>

      <!-- Enabled Status -->
      <div class="row mb-3">
        <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
          {form_description field="enabled"}
        </label>
        <div class="col-sm-8 col-md-9 col-lg-6">
          <div class="form-check form-switch">
            {form_element field="enabled" class="form-check-input"}
            <label class="form-check-label">
              Enable this module immediately after creation
            </label>
          </div>
        </div>
      </div>

      <!-- Short Description -->
      <div class="row mb-4">
        <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
          {form_description field="shortdescription"}
        </label>
        <div class="col-sm-8 col-md-9 col-lg-6">
          <div class="input-group">
            <span class="input-group-text bg-light">
              <i class="bi bi-card-text"></i>
            </span>
            {form_element field="shortdescription" class="form-control" placeholder="Brief summary"}
          </div>
          <small class="form-text text-muted">Short description shown in module listings</small>
        </div>
      </div>

      <!-- Submit Button -->
      <div class="row">
        <div class="col-12">
          <hr class="my-3">
          <div class="d-flex justify-content-end">
            <input type="submit" value="Create Module" class="btn btn-primary btn-lg px-5"/>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

{/form}

</div>
