<div class="card">
  <div class="card-header bg-danger text-white">
    <h2 class="h5 mb-0">{echo phrase="DELETE_SERVER"}</h2>
  </div>
  <div class="card-body">
    
    <p class="alert alert-warning text-center">
      {echo phrase="DELETE_SERVER_NOTICE"}
    </p>
    
    <div class="properties">
      
      <!-- HOSTNAME -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="HOSTNAME"}:</div>
        <div class="col-md-8 p-2">
          <span class="fw-bold text-primary">{dbo_echo dbo="server_dbo" field="hostname"}</span>
        </div>
      </div>
      
      <!-- LOCATION -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="LOCATION"}:</div>
        <div class="col-md-8 p-2">
          <span class="badge bg-info">{dbo_echo dbo="server_dbo" field="location"}</span>
        </div>
      </div>
      
      <!-- Buttons -->
      <div class="row mt-4">
        <div class="col-12">
          {form name="delete_server"}
            <div class="d-flex gap-2">
              {form_element field="delete"}
              {form_element field="cancel"}
            </div>
          {/form}
        </div>
      </div>
      
    </div>
  </div>
</div>