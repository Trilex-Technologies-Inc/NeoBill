<div class="manager_content">

<div class="alert alert-info alert-dismissible fade show shadow-sm" role="alert">
  <div class="d-flex align-items-center">
    <i class="bi bi-person-plus-fill fs-4 me-3 text-info"></i>
    <div>
      <strong>{echo phrase="CONFIRM_NEW_USER"}</strong>
    </div>
  </div>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

{form name="new_user_confirm"}

  <h2 class="mb-4">
    <i class="bi bi-person-badge me-2 text-primary"></i>
    {echo phrase="ADD_NEW_USER"}
  </h2>

  <div class="properties">
    <div class="card shadow-sm border-primary">
      <div class="card-header bg-primary text-white">
        <h5 class="mb-0">User Information Summary</h5>
      </div>
      
      <div class="card-body">
        
        <!-- Username -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold text-primary">
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

        <!-- Action Buttons -->
        <div class="row">
          <div class="col-12">
            <hr class="my-3">
            <div class="d-flex gap-2 justify-content-between justify-content-md-start">
              {form_element field="goback" class="btn btn-secondary"}
              {form_element field="continue" class="btn btn-primary px-4"}
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

{/form}

</div>