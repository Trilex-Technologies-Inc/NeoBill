<div class="manager_content">
{form name="new_user"}

  <div class="form">
    <div class="card shadow-sm border-0">
      <div class="card-header bg-gradient bg-primary text-white">
        <div class="d-flex align-items-center">
          <i class="bi bi-person-plus fs-4 me-2"></i>
          <h5 class="mb-0">[NEW_USER]</h5>
        </div>
      </div>
      
      <div class="card-body">
        
        <div class="row">
          <!-- Left Column -->
          <div class="col-md-6">
            <!-- Username -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="username"}
                <span class="text-danger">*</span>
              </label>
              <div class="col-sm-7">
                {form_element field="username" size="20" class="form-control"}
              </div>
            </div>

            <!-- Password -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="password"}
                <span class="text-danger">*</span>
              </label>
              <div class="col-sm-7">
                {form_element field="password" size="20" class="form-control" type="password"}
              </div>
            </div>

            <!-- Confirm Password -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="repassword"}
                <span class="text-danger">*</span>
              </label>
              <div class="col-sm-7">
                {form_element field="repassword" size="20" class="form-control" type="password"}
              </div>
            </div>

            <!-- User Type -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="type"}
                <span class="text-danger">*</span>
              </label>
              <div class="col-sm-7">
                {form_element field="type" class="form-select"}
              </div>
            </div>
          </div>

          <!-- Right Column -->
          <div class="col-md-6">
            <!-- Contact Name -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="contactname"}
                <span class="text-danger">*</span>
              </label>
              <div class="col-sm-7">
                {form_element field="contactname" size="30" class="form-control"}
              </div>
            </div>

            <!-- Email -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="email"}
                <span class="text-danger">*</span>
              </label>
              <div class="col-sm-7">
                {form_element field="email" size="30" class="form-control" type="email"}
              </div>
            </div>

            <!-- Language -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="language"}
              </label>
              <div class="col-sm-7">
                {form_element field="language" class="form-select"}
              </div>
            </div>

            <!-- Theme -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="theme"}
              </label>
              <div class="col-sm-7">
                {form_element field="theme" class="form-select"}
              </div>
            </div>
          </div>
        </div>

        <!-- Info Card -->
        <div class="row mt-3">
          <div class="col-12">
            <div class="card bg-light">
              <div class="card-body py-2">
                <small class="text-muted">
                  <i class="bi bi-info-circle me-1"></i>
                  All fields marked with <span class="text-danger">*</span> are required.
                </small>
              </div>
            </div>
          </div>
        </div>

        <!-- Submit Button -->
        <div class="row mt-4">
          <div class="col-12">
            <hr>
            <div class="d-flex justify-content-end">
              <input type="submit" value="Create User" class="btn btn-primary px-5 py-2"/>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

{/form}
</div>