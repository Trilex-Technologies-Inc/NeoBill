<div class="manager_content modules-page">
  <div class="modules-shell">
    <div class="modules-header">
      <div class="modules-title">
        <span class="modules-icon"><i class="ti ti-puzzle"></i></span>
        <div>
          <span class="modules-kicker">{echo phrase="SETTINGS"}</span>
          <h2>{echo phrase="MODULES"}</h2>
          <p>{echo phrase="INSTALLED_MODULES"}</p>
        </div>
      </div>

      <div class="modules-actions">
        {form name="modules_action"}
          {form_element field="add" class="btn btn-primary"}
        {/form}
      </div>
    </div>

    <div class="modules-table-card">
      <div class="modules-table-header">
        <div>
          <span>{echo phrase="MODULES"}</span>
          <h3>{echo phrase="INSTALLED_MODULES"}</h3>
        </div>
        <a class="modules-link-button" href="manager_content.php?page=config_new_module">
          <i class="ti ti-plus"></i>
          New Module
        </a>
      </div>

      <div class="table-responsive modules-table-wrap">
        {form name="modules"}
          {form_table field="modules" class="table table-sm table-hover align-middle mb-0" empty="No modules found"}

            {form_table_column columnid="" header="[ENABLED]"}
              <span class="modules-check">{form_table_checkbox option=$modules.name}</span>
            {/form_table_column}

            {form_table_column columnid="name" header="[MODULE_NAME]"}
              {if $modules.configpage == null}
                <span class="modules-name">
                  <i class="ti ti-puzzle"></i>
                  {$modules.name}
                </span>
              {else}
                <a class="modules-name modules-name-link" href="manager_content.php?page={$modules.configpage}">
                  <i class="ti ti-settings"></i>
                  {$modules.name}
                </a>
              {/if}
            {/form_table_column}

            {form_table_column columnid="type" header="[TYPE]"}
              <span class="modules-type">{$modules.type}</span>
            {/form_table_column}

            {form_table_column columnid="description" header="[DESCRIPTION]"}
              <span class="modules-description">{$modules.description}</span>
            {/form_table_column}

            {form_table_footer}
              <div class="modules-update-actions">
                {form_element field="update" class="btn btn-primary"}
              </div>
            {/form_table_footer}
          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>
