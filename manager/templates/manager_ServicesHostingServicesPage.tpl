<div class="manager_content">

  <!-- Actions Section -->
  <div class="action mb-4">
    <div class="card shadow-sm border-0">
      <div class="card-header bg-primary text-white py-3 px-4">
        <span class="fw-bold mb-0">{echo phrase="ACTIONS"}</span>
      </div>
      <div class="card-body bg-white py-3 px-4">
        {form name="web_hosting_action"}
          {form_element field="add" class="btn btn-success btn-sm"}
        {/form}
      </div>
    </div>
  </div>

  <!-- Header -->
  <h2 class="mb-3">{echo phrase="WEB_HOSTING_SERVICES"}</h2>

  <!-- Search Section -->
  <div class="search mb-4">
    <div class="card">
      <div class="card-body">
        {form name="search_hosting_services"}
          <div class="row align-items-end g-3">
            <div class="col-md-5">
              <label class="form-label fw-bold">{echo phrase="TITLE"}</label>
              {form_description field="title"}
              {form_element field="title" size="30" class="form-control"}
            </div>
            <div class="col-md-5">
              <label class="form-label fw-bold">{echo phrase="DESCRIPTION"}</label>
              {form_description field="description"}
              {form_element field="description" size="30" class="form-control"}
            </div>
            <div class="col-md-2">
              {form_element field="search" class="btn btn-primary w-100"}
            </div>
          </div>
        {/form}
      </div>
    </div>
  </div>

  <!-- Web Hosting Services Table -->
  <div class="table-container">
    <div class="card">
      <div class="card-body p-0">
        <div class="table-responsive">
          {form name="hosting_services"}
            <table class="table table-hover table-striped align-middle mb-0">
              <thead class="table-dark">
                <tr>
                  <th style="width: 40px; text-align: center">{echo phrase="SELECT"}</th>
                  <th>{echo phrase="TITLE"}</th>
                  <th>{echo phrase="DESCRIPTION"}</th>
                  <th>{echo phrase="PRICING"}</th>
                  <th>{echo phrase="PUBLIC"}</th>
                </tr>
              </thead>
              <tbody>
                {form_table field="hosting_services"}
                  <tr>
                    <td class="text-center">
                      {form_table_checkbox option=$hosting_services.id}
                    </td>
                    <td>
                      <a href="manager_content.php?page=services_edit_hosting&hservice={$hosting_services.id}" class="text-decoration-none fw-bold">
                        {$hosting_services.title}
                      </a>
                    </td>
                    <td>{$hosting_services.description|truncate:40:"..."}</td>
                    <td>
                      <span class="badge bg-info">{$hosting_services.pricing}</span>
                    </td>
                    <td>
                      {if $hosting_services.public == "Yes"}
                        <span class="badge bg-success">{$hosting_services.public}</span>
                      {else}
                        <span class="badge bg-secondary">{$hosting_services.public}</span>
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