<div class="manager_content services-list-page services-domain-page">
  <div class="services-list-shell">
    <div class="services-list-header">
      <div class="services-list-title">
        <span class="services-list-icon"><i class="ti ti-world-www"></i></span>
        <div>
          <span class="services-list-kicker">Products &amp; Services</span>
          <h2>{echo phrase="DOMAIN_SERVICES"}</h2>
          <p>Manage TLD offerings, registrar modules, pricing, and public availability.</p>
        </div>
      </div>
      <div class="services-list-actions">
        {form name="domain_services_action"}
          {form_element field="add" class="btn btn-primary"}
        {/form}
      </div>
    </div>

    <div class="services-list-toolbar">
      <div class="services-list-search">
        <div class="services-list-search-header">
          <span><i class="ti ti-search"></i></span>
          <div>
            <h3>Find Domain Services</h3>
            <p>Filter available domain services by TLD.</p>
          </div>
        </div>
        {form name="search_domain_services"}
          <div class="services-list-search-grid services-list-search-grid-one">
            <div class="services-list-field">
              <label class="form-label">{echo phrase="TLD"}</label>
              {form_description field="tld"}
              <div class="services-list-input-icon">
                <i class="ti ti-point"></i>
                {form_element field="tld" size="30" class="form-control"}
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
          <h3>Domain Services</h3>
        </div>
      </div>
      <div class="services-list-table-wrap table-responsive">
        {form name="domain_services"}
          {form_table field="services" size="10" class="table table-hover align-middle mb-0" empty="No domain services found."}
            {form_table_column columnid="" header="[SELECT]"}
              <span class="services-list-check">{form_table_checkbox option=$services.tld}</span>
            {/form_table_column}
            {form_table_column columnid="tld" header="[TLD]"}
              <a href="manager_content.php?page=services_edit_domain_service&dservice={$services.tld}" class="services-list-name">
                <i class="ti ti-world-www"></i>
                .{$services.tld}
              </a>
            {/form_table_column}
            {form_table_column columnid="module" header="[MODULE]"}
              <span class="services-list-module">{$services.module}</span>
            {/form_table_column}
            {form_table_column columnid="pricing" header="[PRICING]"}
              <span class="services-list-pricing">{$services.pricing}</span>
            {/form_table_column}
            {form_table_column columnid="public" header="[PUBLIC]"}
              {if $services.public == "Yes"}
                <span class="services-list-status services-list-status-public">{$services.public}</span>
              {else}
                <span class="services-list-status services-list-status-private">{$services.public}</span>
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
