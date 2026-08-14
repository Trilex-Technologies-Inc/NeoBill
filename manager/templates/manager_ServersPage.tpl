<div class="manager_content services-list-page services-servers-page">
  <div class="services-list-shell">
    <div class="services-list-header">
      <div class="services-list-title">
        <span class="services-list-icon"><i class="ti ti-server-2"></i></span>
        <div>
          <span class="services-list-kicker">Products &amp; Services</span>
          <h2>{echo phrase="SERVERS"}</h2>
          <p>Track hosting infrastructure, locations, and server records.</p>
        </div>
      </div>
      <div class="services-list-actions">
        {form name="servers_action"}
          {form_element field="add" class="btn btn-primary"}
        {/form}
      </div>
    </div>

    <div class="services-list-toolbar">
      <div class="services-list-search">
        <div class="services-list-search-header">
          <span><i class="ti ti-search"></i></span>
          <div>
            <h3>Find Servers</h3>
            <p>Filter infrastructure by hostname or location.</p>
          </div>
        </div>
        {form name="search_servers"}
          <div class="services-list-search-grid services-list-search-grid-two">
            <div class="services-list-field">
              <label class="form-label">{echo phrase="HOSTNAME"}</label>
              <div class="services-list-input-icon">
                <i class="ti ti-server"></i>
                {form_element field="hostname" class="form-control"}
              </div>
            </div>
            <div class="services-list-field">
              <label class="form-label">{echo phrase="LOCATION"}</label>
              <div class="services-list-input-icon">
                <i class="ti ti-map-pin"></i>
                {form_element field="location" class="form-control"}
              </div>
            </div>
            <div class="services-list-submit">
              {form_element field="search" class="btn btn-primary"}
            </div>
          </div>
        {/form}
      </div>
    </div>

    <div class="services-list-table-card">
      <div class="services-list-table-header">
        <div>
          <span>Infrastructure</span>
          <h3>Servers List</h3>
        </div>
      </div>
      <div class="services-list-table-wrap table-responsive">
        {form name="servers"}
          {form_table field="servers" class="table table-hover align-middle mb-0"}
            {form_table_column columnid="id" header="[ID]"}
              <a href="manager_content.php?page=services_view_server&server={$servers.id}" class="services-list-id">#{$servers.id}</a>
            {/form_table_column}
            {form_table_column columnid="hostname" header="[HOSTNAME]"}
              <a href="manager_content.php?page=services_view_server&server={$servers.id}" class="services-list-name">
                <i class="ti ti-server-2"></i>
                {$servers.hostname}
              </a>
            {/form_table_column}
            {form_table_column columnid="location" header="[LOCATION]"}
              <span class="services-list-location">
                <i class="ti ti-map-pin"></i>
                {$servers.location}
              </span>
            {/form_table_column}
          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>
