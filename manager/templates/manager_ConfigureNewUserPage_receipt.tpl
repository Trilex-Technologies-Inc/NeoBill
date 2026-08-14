<div class="manager_content">

<!-- Success Message -->
<div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
  <div class="d-flex align-items-center">
    <i class="bi bi-check-circle-fill fs-3 me-3 text-success"></i>
    <div>
      <strong>{echo phrase="USER_CREATED"}</strong>
      <p class="mb-0 text-muted">The user account has been successfully created.</p>
    </div>
  </div>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<!-- Actions Section -->
<div class="action mb-4">
  <div class="card border-0 bg-light">
    <div class="card-body py-2">
      <div class="d-flex justify-content-between align-items-center">
        <p class="header fw-bold mb-0">
          <i class="bi bi-gear me-2"></i>
          {echo phrase="ACTIONS"}
        </p>
        <div class="d-flex gap-2">
          {form name="new_user_action"}
            {form_element field="add" class="btn btn-success btn-sm"}
            {form_element field="view" class="btn btn-info btn-sm text-white"}
          {/form}
        </div>
      </div>
    </div>
  </div>
</div>

<h2 class="mb-4">
  <i class="bi bi-person-check me-2 text-success"></i>
  {echo phrase="NEW_USER"}
</h2>

<div class="properties">
  <div class="card shadow-sm border-success">
    <div class="card-header bg-success text-white">
      <h5 class="mb-0">User Account Details</h5>
    </div>
    
    <div class="card-body">
      
      <!-- Username -->
      <div class="row mb-3">
        <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold text-success">
          {echo phrase="USERNAME"}:
        </label>
        <div class="col-sm-8 col-md-9 col-lg-10">
          <p class="form-control-plaintext fw-bold">
            <i class="bi bi-person-circle me-2"></i>
            {dbo_echo dbo="new_user_dbo" field="username"}
          </p>
        </div>
      </div>

      <!-- Password -->
      <div class="row mb-3">
        <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
          {echo phrase="PASSWORD"}:
        </label>
        <div class="col-sm-8 col-md-9 col-lg-10">
          <p class="form-control-plaintext">
            <i class="bi bi-key me-2"></i>
            <span class="font-monospace">{dbo_echo|password dbo="new_user_dbo" field="password"}</span>
          </p>
        </div>
      </div>

      <!-- User Type -->
      <div class="row mb-3">
        <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
          {echo phrase="TYPE"}:
        </label>
        <div class="col-sm-8 col-md-9 col-lg-10">
          <p class="form-control-plaintext">
            <span class="badge bg-info"> {dbo_echo dbo="new_user_dbo" field="type"}</span>
          </p>
        </div>
      </div>

      <!-- Contact Name -->
      <div class="row mb-3">
        <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
          {echo phrase="NAME"}:
        </label>
        <div class="col-sm-8 col-md-9 col-lg-10">
          <p class="form-control-plaintext">
            <i class="bi bi-person-badge me-2"></i>
            {dbo_echo dbo="new_user_dbo" field="contactname"}
          </p>
        </div>
      </div>

      <!-- Email -->
      <div class="row mb-4">
        <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
          {echo phrase="EMAIL"}:
        </label>
        <div class="col-sm-8 col-md-9 col-lg-10">
          <p class="form-control-plaintext">
            <i class="bi bi-envelope me-2"></i>
            {dbo_echo|mailto dbo="new_user_dbo" field="email"}
          </p>
        </div>
      </div>

    </div>
  </div>
</div>

</div>
