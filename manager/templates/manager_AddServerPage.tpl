<div class="manager_content">
<div class="form">

  {form name="add_server"}

    <div class="card shadow-sm">
      <div class="card-header bg-primary text-white">
        <h5 class="mb-0">[ADD_SERVER_PAGE]</h5>
      </div>
      
      <div class="card-body">
        
        <!-- Hostname -->
        <div class="row mb-3">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="hostname"}
          </label>
          <div class="col-sm-8 col-md-9 col-lg-6">
            {form_element field="hostname" class="form-control" placeholder="e.g., web01.example.com"}
            <small class="form-text text-muted">Enter the server hostname or IP address</small>
          </div>
        </div>

        <!-- Location -->
        <div class="row mb-4">
          <label class="col-sm-4 col-md-3 col-lg-2 col-form-label fw-bold">
            {form_description field="location"}
          </label>
          <div class="col-sm-8 col-md-9 col-lg-6">
            {form_element field="location" size="30" class="form-control" placeholder="e.g., New York, USA"}
            <small class="form-text text-muted">Physical location of the server</small>
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

  {/form}

</div>
</div>