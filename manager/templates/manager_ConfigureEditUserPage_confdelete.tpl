<div class="manager_content">

<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <i class="bi bi-exclamation-triangle-fill me-2"></i>
  {echo phrase="REMOVE_USER_NOTICE"}:
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>

<h2 class="mb-4">{echo phrase="REMOVE_USER"}</h2>

{form name="delete_user_confirm"}

  <div class="properties">
    <div class="card shadow-sm border-danger">
      <div class="card-header bg-danger text-white">
        <h5 class="mb-0">
          <i class="bi bi-person-x me-2"></i>
          {echo phrase="USER_CONFIRMATION"}
        </h5>
      </div>
      
      <div class="card-body">
        
        <!-- Username -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold text-danger">
            {echo phrase="USERNAME"}:
          </label>
          <div class="col-sm-8 col-md-9 col-lg-10">
            <p class="form-control-plaintext fw-bold">
              <i class="bi bi-person-circle me-2"></i>
              {dbo_echo dbo="edit_user_dbo" field="username"}
            </p>
          </div>
        </div>

        <!-- Name -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {echo phrase="NAME"}:
          </label>
          <div class="col-sm-8 col-md-9 col-lg-10">
            <p class="form-control-plaintext">
              <i class="bi bi-person-badge me-2"></i>
              {dbo_echo dbo="edit_user_dbo" field="contactname"}
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
              {dbo_echo|mailto dbo="edit_user_dbo" field="email"}
            </p>
          </div>
        </div>

        <!-- Warning Box -->
        <div class="row mb-4">
          <div class="col-sm-4 col-md-3 col-lg-2"></div>
          <div class="col-sm-8 col-md-9 col-lg-10">
            <div class="alert alert-danger border-0">
              <i class="bi bi-exclamation-octagon-fill me-2"></i>
              <strong>Warning:</strong> This action cannot be undone. All data associated with this user will be permanently removed.
            </div>
          </div>
        </div>

        <!-- Buttons -->
        <div class="row">
          <div class="col-12">
            <hr>
            <div class="d-flex gap-2 justify-content-between justify-content-md-start">
              {form_element field="goback" class="btn btn-secondary"}
              {form_element field="continue" class="btn btn-danger px-4"}
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

{/form}

</div>
