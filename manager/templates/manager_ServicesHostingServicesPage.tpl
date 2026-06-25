<div class="manager_content services-list-page services-hosting-page">
  <div class="services-list-shell">
    <div class="services-list-header">
      <div class="services-list-title">
        <span class="services-list-icon"><i class="ti ti-cloud"></i></span>
        <div>
          <span class="services-list-kicker">Products &amp; Services</span>
          <h2>{echo phrase="WEB_HOSTING_SERVICES"}</h2>
          <p>Manage hosting packages, pricing visibility, and customer-facing service options.</p>
        </div>
      </div>
      <div class="services-list-actions">
        {form name="web_hosting_action"}
          {form_element field="add" class="btn btn-primary"}
        {/form}
      </div>
    </div>

    <div class="services-list-toolbar">
      <div class="services-list-search">
        <div class="services-list-search-header">
          <span><i class="ti ti-search"></i></span>
          <div>
            <h3>Find Hosting Services</h3>
            <p>Filter packages by title or description.</p>
          </div>
        </div>
        {form name="search_hosting_services"}
          <div class="services-list-search-grid services-list-search-grid-two">
            <div class="services-list-field">
              <label class="form-label">{echo phrase="TITLE"}</label>
              {form_description field="title"}
              <div class="services-list-input-icon">
                <i class="ti ti-tag"></i>
                {form_element field="title" size="30" class="form-control"}
              </div>
            </div>
            <div class="services-list-field">
              <label class="form-label">{echo phrase="DESCRIPTION"}</label>
              {form_description field="description"}
              <div class="services-list-input-icon">
                <i class="ti ti-file-text"></i>
                {form_element field="description" size="30" class="form-control"}
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
          <span>Catalog</span>
          <h3>Hosting Services</h3>
        </div>
      </div>
      <div class="services-list-table-wrap table-responsive">
        {form name="hosting_services"}
          {form_table field="hosting_services" class="table table-hover align-middle mb-0" size="10"}
            {form_table_column columnid="" header="[SELECT]"}
              <span class="services-list-check">{form_table_checkbox option=$hosting_services.id}</span>
            {/form_table_column}
            {form_table_column columnid="title" header="[TITLE]"}
              <a href="manager_content.php?page=services_edit_hosting&hservice={$hosting_services.id}" class="services-list-name">
                <i class="ti ti-cloud"></i>
                {$hosting_services.title}
              </a>
            {/form_table_column}
            {form_table_column columnid="description" header="[DESCRIPTION]"}
              <span class="services-list-description">{$hosting_services.description|truncate:72:"..."}</span>
            {/form_table_column}
            {form_table_column columnid="pricing" header="[PRICING]"}
              <span class="services-list-pricing">{$hosting_services.pricing}</span>
            {/form_table_column}
            {form_table_column columnid="public" header="[PUBLIC]"}
              {if $hosting_services.public == "Yes"}
                <span class="services-list-status services-list-status-public">{$hosting_services.public}</span>
              {else}
                <span class="services-list-status services-list-status-private">{$hosting_services.public}</span>
              {/if}
            {/form_table_column}
            {form_table_footer}
              <tr>
                <td colspan="5">
                  <div class="services-list-remove-actions">
                    {form_element field="remove" class="btn btn-danger"}
                  </div>
                </td>
              </tr>
            {/form_table_footer}
          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>
