<div class="manager_content">
  
  <!-- Action Section -->
  <div class="action mb-4">
    <div class="card shadow-sm border-0">
      <div class="card-header bg-primary text-white py-3 px-4">
        <span class="fw-bold mb-0">{echo phrase="ACTIONS"}</span>
      </div>
      <div class="card-body bg-white py-3 px-4">
        {form name="domain_services_action"}
          {form_element field="add" class="btn btn-success btn-sm"}
        {/form}
      </div>
    </div>
  </div>

  <!-- Domain Services Header -->
  <h2 class="mb-3">{echo phrase="DOMAIN_SERVICES"}</h2>

  <!-- Search Section -->
  <div class="search mb-4">
    <div class="card">
      <div class="card-body">
        {form name="search_domain_services"}
          <div class="row align-items-end g-3">
            <div class="col-md-8">
              <label class="form-label fw-bold">{echo phrase="SEARCH"}</label>
              {form_description field="tld"}
              {form_element field="tld" class="form-control"}
            </div>
            <div class="col-md-4">
              {form_element field="search" class="btn btn-primary w-100"}
            </div>
          </div>
        {/form}
      </div>
    </div>
  </div>

  <!-- Domain Services Table (Responsive) -->
  <div class="table-container">
    <div class="card">
      <div class="card-body p-0">
        <div class="table-responsive">
          {form name="domain_services"}
            <table class="table table-hover table-striped align-middle mb-0">
              <thead class="table-dark">
                <tr>
                  <th style="width: 40px; text-align: center">
                    {echo phrase="SELECT"}
                  </th>
                  <th>{echo phrase="TLD"}</th>
                  <th>{echo phrase="MODULE"}</th>
                  <th>{echo phrase="PRICING"}</th>
                  <th>{echo phrase="PUBLIC"}</th>
                </tr>
              </thead>
              <tbody>
                {form_table field="services"}
                  <tr>
                    <td class="text-center">
                      {form_table_checkbox option=$services.tld}
                    </td>
                    <td>
                      <a href="manager_content.php?page=services_edit_domain_service&dservice={$services.tld}" class="text-decoration-none fw-bold">
                        .{$services.tld}
                      </a>
                    </td>
                    <td>{$services.module}</td>
                    <td>
                      <span class="badge bg-info">{$services.pricing}</span>
                    </td>
                    <td>
                      {if $services.public == "Yes"}
                        <span class="badge bg-success">{$services.public}</span>
                      {else}
                        <span class="badge bg-secondary">{$services.public}</span>
                      {/if}
                    </td>
                  </tr>
                {/form_table}
              </tbody>
              {form_table_footer}
                <tfoot>
                  <tr class="table-light">
                    <td colspan="5" class="p-3">
                      {form_element field="remove" class="btn btn-danger"}
                    </td>
                  </tr>
                </tfoot>
              {/form_table_footer}
            </table>
          {/form}
        </div>
      </div>
    </div>
  </div>
  
</div>