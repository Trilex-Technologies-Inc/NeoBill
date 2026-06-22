<div class="manager_content">

  <div class="action mb-4">
    <div class="card border-0 bg-light">
      <div class="card-body py-2">
        <div class="d-flex justify-content-between align-items-center">
          <p class="header fw-bold mb-0">{echo phrase="ACTIONS"}</p>
          {form name="domain_services_action"}
            {form_element field="add" class="btn btn-primary btn-sm"}
          {/form}
        </div>
      </div>
    </div>
  </div>

  <h2 class="mb-3">{echo phrase="DOMAIN_SERVICES"}</h2>

  <div class="search mb-4">
    {form name="search_domain_services"}
      <div class="card shadow-sm">
        <div class="card-body">
          <div class="row g-3 align-items-end">
            <div class="col-md-8 col-lg-9">
              <label class="form-label fw-bold">
                {echo phrase="SEARCH"} - {form_description field="tld"}
              </label>
              <div class="input-group">
                <span class="input-group-text bg-light">
                  <i class="ti ti-search"></i>
                </span>
                {form_element field="tld" size="30" class="form-control" placeholder="Enter TLD..."}
              </div>
            </div>
            <div class="col-md-4 col-lg-3">
              {form_element field="search" class="btn btn-primary w-100"}
            </div>
          </div>
        </div>
      </div>
    {/form}
  </div>

  <div class="table-responsive">
    <div class="card">
      <div class="card-body p-0">
        {form name="domain_services"}
          {form_table field="services" size="10" class="table table-sm table-striped align-middle table-hover mb-0" empty="No domain services found."}

            {form_table_column columnid="" header="[SELECT]"}
              <div class="text-center">
                {form_table_checkbox option=$services.tld}
              </div>
            {/form_table_column}

            {form_table_column columnid="tld" header="[TLD]"}
              <a href="manager_content.php?page=services_edit_domain_service&dservice={$services.tld}" class="btn btn-link btn-sm p-0 text-decoration-none fw-bold">
                .{$services.tld}
              </a>
            {/form_table_column}

            {form_table_column columnid="module" header="[MODULE]"}
              <span class="text-nowrap">{$services.module}</span>
            {/form_table_column}

            {form_table_column columnid="pricing" header="[PRICING]"}
              <span class="small">{$services.pricing}</span>
            {/form_table_column}

            {form_table_column columnid="public" header="[PUBLIC]"}
              {if $services.public == "Yes"}
                <span class="badge bg-success">{$services.public}</span>
              {else}
                <span class="badge bg-secondary">{$services.public}</span>
              {/if}
            {/form_table_column}

            {form_table_footer}
              <div class="d-flex justify-content-end p-3">
                {form_element field="remove" class="btn btn-outline-danger btn-sm"}
              </div>
            {/form_table_footer}

          {/form_table}
        {/form}
      </div>
    </div>
  </div>

</div>
