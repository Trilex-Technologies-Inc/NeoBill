<div class="manager_content">
  <div class="form">

    {form name="edit_server"}

      <div class="card">
        <div class="card-header bg-primary text-white">
          <h3 class="h6 mb-0">{echo phrase="EDIT_SERVER"} ({echo phrase="ID"}: {dbo_echo dbo="server_dbo" field="id"})</h3>
        </div>
        <div class="card-body">
          
          <!-- Hostname -->
          <div class="row mb-3">
            <div class="col-md-4 fw-bold bg-light p-2 rounded">
              {form_description field="hostname"}
            </div>
            <div class="col-md-8 p-2">
              {form_element dbo="server_dbo" field="hostname" class="form-control"}
            </div>
          </div>
          
          <!-- Location -->
          <div class="row mb-3">
            <div class="col-md-4 fw-bold bg-light p-2 rounded">
              {form_description field="location"}
            </div>
            <div class="col-md-8 p-2">
              {form_element dbo="server_dbo" field="location" size="30" class="form-control"}
            </div>
          </div>
          
          <!-- Control Panel Module -->
          <div class="row mb-3">
            <div class="col-md-4 fw-bold bg-light p-2 rounded">
              {form_description field="cpmodule"}
            </div>
            <div class="col-md-8 p-2">
              {form_element dbo="server_dbo" field="cpmodule" empty="[NO_CONTROL_PANEL_MODULES_HAVE_BEEN_ENABLED]" class="form-select"}
            </div>
          </div>
          
        </div>
        <div class="card-footer d-flex justify-content-between">
          <div class="left">
            {form_element field="cancel" class="btn btn-secondary"}
          </div>
          <div class="right">
            {form_element field="save" class="btn btn-primary"}
          </div>
        </div>
      </div>

    {/form}

  </div>
</div>