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
            {form_table field="hosting_services" class="table table-hover table-striped align-middle mb-0" size="10"}
              {form_table_column columnid="" header="[SELECT]"}
                {form_table_checkbox option=$hosting_services.id}
              {/form_table_column}
              {form_table_column columnid="title" header="[TITLE]"}
                <a href="manager_content.php?page=services_edit_hosting&hservice={$hosting_services.id}" class="text-decoration-none fw-bold">
                  {$hosting_services.title}
                </a>
              {/form_table_column}
              {form_table_column columnid="description" header="[DESCRIPTION]"}
                {$hosting_services.description|truncate:40:"..."}
              {/form_table_column}
              {form_table_column columnid="pricing" header="[PRICING]"}
                <span class="badge bg-info">{$hosting_services.pricing}</span>
              {/form_table_column}
              {form_table_column columnid="public" header="[PUBLIC]"}
                {if $hosting_services.public == "Yes"}
                  <span class="badge bg-success">{$hosting_services.public}</span>
                {else}
                  <span class="badge bg-secondary">{$hosting_services.public}</span>
                {/if}
              {/form_table_column}
              {form_table_footer}
                <tr class="table-light">
                  <td colspan="5" class="p-3">
                    {form_element field="remove" class="btn btn-danger"}
                  </td>
                </tr>
              {/form_table_footer}
            {/form_table}
          {/form}
        </div>
      </div>
    </div>
  </div>

</div>