<div class="manager_content">

<!-- Bootstrap Tabs -->
<ul class="nav nav-tabs mb-3" id="userTabs" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="delete-tab" data-bs-toggle="tab" data-bs-target="#tabs-1" type="button" role="tab">
      <i class="bi bi-trash3 me-1"></i> Delete User
    </button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="edit-tab" data-bs-toggle="tab" data-bs-target="#tabs-2" type="button" role="tab">
      <i class="bi bi-pencil-square me-1"></i> Edit Basic Info
    </button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="password-tab" data-bs-toggle="tab" data-bs-target="#tabs-3" type="button" role="tab">
      <i class="bi bi-key me-1"></i> Edit Password
    </button>
  </li>
</ul>

<div class="tab-content" id="userTabsContent">
  
  <!-- Tab 1: Delete User -->
  <div class="tab-pane fade show active" id="tabs-1" role="tabpanel">
    <div class="card border-danger shadow-sm">
      <div class="card-body text-center py-5">
        <i class="bi bi-exclamation-triangle-fill display-1 text-danger mb-3"></i>
        <h3 class="text-danger">Delete User Account</h3>
        <p class="text-muted mb-4">Are you sure you want to delete this user? This action is permanent.</p>
        {form name="edit_user_action"}
          {form_element field="delete" class="btn btn-danger btn-lg px-5"}
        {/form}
      </div>
    </div>
  </div>

  <!-- Tab 2: Edit Basic Info -->
  <div class="tab-pane fade" id="tabs-2" role="tabpanel">
    {form name="edit_user"}
      <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
          <h5 class="mb-0">
            <i class="bi bi-person-badge me-2"></i>
            [EDIT_USER]: {dbo_echo dbo="edit_user_dbo" field="username"}
          </h5>
        </div>
        <div class="card-body">
          <!-- Form fields -->
          <div class="row mb-3">
            <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
              {form_description field="type"}
            </label>
            <div class="col-sm-8 col-md-9 col-lg-6">
              {form_element dbo="edit_user_dbo" field="type" class="form-select"}
            </div>
          </div>

          <div class="row mb-3">
            <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
              {form_description field="contactname"}
            </label>
            <div class="col-sm-8 col-md-9 col-lg-6">
              {form_element dbo="edit_user_dbo" field="contactname" size="30" class="form-control"}
            </div>
          </div>

          <div class="row mb-3">
            <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
              {form_description field="email"}
            </label>
            <div class="col-sm-8 col-md-9 col-lg-6">
              <div class="input-group">
                <span class="input-group-text">@</span>
                {form_element dbo="edit_user_dbo" field="email" size="30" class="form-control"}
              </div>
            </div>
          </div>

          <div class="row mb-3">
            <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
              {form_description field="language"}
            </label>
            <div class="col-sm-8 col-md-9 col-lg-4">
              {form_element dbo="edit_user_dbo" field="language" class="form-select"}
            </div>
          </div>

          <div class="row mb-4">
            <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
              {form_description field="theme"}
            </label>
            <div class="col-sm-8 col-md-9 col-lg-4">
              {form_element dbo="edit_user_dbo" field="theme" class="form-select"}
            </div>
          </div>

          <div class="row">
            <div class="col-12">
              <hr>
              <div class="d-flex justify-content-end">
                <input type="submit" value="Update User" class="btn btn-primary px-5"/>
              </div>
            </div>
          </div>
        </div>
      </div>
    {/form}
  </div>

  <!-- Tab 3: Edit Password -->
  <div class="tab-pane fade" id="tabs-3" role="tabpanel">
    {form name="edit_user_pass"}
      <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
          <h5 class="mb-0">
            <i class="bi bi-lock me-2"></i>
            [RESET_PASSWORD]
          </h5>
        </div>
        <div class="card-body">
          <div class="row mb-3">
            <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
              {form_description field="password"}
            </label>
            <div class="col-sm-8 col-md-9 col-lg-5">
              {form_element field="password" size="20" class="form-control" type="password"}
            </div>
          </div>

          <div class="row mb-4">
            <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
              {form_description field="repassword"}
            </label>
            <div class="col-sm-8 col-md-9 col-lg-5">
              {form_element field="repassword" size="20" class="form-control" type="password"}
            </div>
          </div>

          <div class="row">
            <div class="col-12">
              <hr>
              <div class="d-flex justify-content-end">
                <input type="submit" value="Reset Password" class="btn btn-warning px-5"/>
              </div>
            </div>
          </div>
        </div>
      </div>
    {/form}
  </div>
</div>

</div>