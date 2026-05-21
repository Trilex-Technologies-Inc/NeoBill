<div class="manager_content">
<div class="form">

  {form name="add_ip_address"}

    <div class="card shadow-sm">
      <div class="card-header bg-primary text-white">
        <h5 class="mb-0">[ADD_IPS] {dbo_echo dbo="server_dbo" field="hostname"}</h5>
      </div>
      
      <div class="card-body">
        
        <!-- Begin Address -->
        <div class="row mb-3">
          <div class="col-sm-4 col-md-3 col-lg-2">
            <label class="form-label fw-bold">
              {form_description field="begin_address"}
            </label>
          </div>
          <div class="col-sm-8 col-md-9 col-lg-10">
            {form_element field="begin_address" class="form-control"}
          </div>
        </div>

        <!-- End Address -->
        <div class="row mb-4">
          <div class="col-sm-4 col-md-3 col-lg-2">
            <label class="form-label fw-bold">
              {form_description field="end_address"}
            </label>
          </div>
          <div class="col-sm-8 col-md-9 col-lg-10">
            {form_element field="end_address" class="form-control"}
          </div>
        </div>

        <!-- Buttons -->
        <div class="row mt-4">
          <div class="col-12 d-flex justify-content-between justify-content-md-start gap-2">
            {form_element field="continue" class="btn btn-primary"}
            {form_element field="cancel" class="btn btn-secondary"}
          </div>
        </div>

      </div>
    </div>

  {/form}

</div>
</div>