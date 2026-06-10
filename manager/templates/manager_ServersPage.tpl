<div class="manager_content">

  <div class="action mb-4">
    <div class="card shadow-sm border-0">
      <div class="card-header bg-primary text-white py-3 px-4">
        <div class="d-flex align-items-center gap-2">
          <i class="bi bi-hdd-stack-fill"></i>
          <span class="fw-bold mb-0">{echo phrase="ACTIONS"}</span>
        </div>
      </div>
      <div class="card-body bg-white py-3 px-4">
        {form name="servers_action"}
          {form_element field="add" class="btn btn-success btn-sm"}
        {/form}
      </div>
    </div>
  </div>

  <div class="card mb-4 shadow-sm border-0">
    <div class="card-body">
      <div class="d-flex align-items-center gap-3 mb-3">
        <i class="bi bi-server fs-3 text-primary"></i>
        <div>
          <h2 class="h5 mb-1">{echo phrase="SERVERS"}</h2>
          <p class="text-muted mb-0">Search and view servers</p>
        </div>
      </div>

      <div class="row g-3 align-items-end">
        <div class="col-md-5">
          <label class="form-label fw-semibold">{echo phrase="HOSTNAME"}</label>
          {form name="search_servers"}
            <div class="input-group">
              <span class="input-group-text bg-light"><i class="bi bi-search"></i></span>
              {form_element field="hostname" class="form-control" placeholder="Search hostname"}
            </div>
        </div>
        <div class="col-md-5">
          <label class="form-label fw-semibold">{echo phrase="LOCATION"}</label>
          <div class="input-group">
            <span class="input-group-text bg-light"><i class="bi bi-geo-alt"></i></span>
            {form_element field="location" class="form-control" placeholder="Search location"}
          </div>
        </div>
        <div class="col-md-2 d-grid">
          {form_element field="search" class="btn btn-primary"}
        </div>
        {/form}
      </div>
    </div>
  </div>

  <div class="card shadow-sm border-0">
    <div class="card-header bg-white border-bottom-0">
      <h3 class="h6 mb-0">Servers List</h3>
    </div>
    <div class="card-body p-0">
      <div class="table-responsive">
        {form name="servers"}
          {form_table field="servers" class="table table-hover table-striped align-middle mb-0"}
            {form_table_column columnid="id" header="[ID]"}
              <a href="manager_content.php?page=services_view_server&server={$servers.id}" class="btn btn-link btn-sm p-0 text-decoration-none fw-bold">#{$servers.id}</a>
            {/form_table_column}

            {form_table_column columnid="hostname" header="[HOSTNAME]"}
              <a href="manager_content.php?page=services_view_server&server={$servers.id}" class="text-decoration-none fw-bold">{$servers.hostname}</a>
            {/form_table_column}

            {form_table_column columnid="location" header="[LOCATION]"}
              <span class="badge bg-info text-dark">
                <i class="bi bi-geo-alt-fill me-1"></i>
                {$servers.location}
              </span>
            {/form_table_column}
          {/form_table}
        {/form}
      </div>
    </div>
  </div>

</div>
