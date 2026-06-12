<div class="manager_content">
  <div class="card mb-4">
    <div class="card-header d-flex justify-content-between align-items-center">
      <h2 class="mb-0">{echo phrase="MODULES"}</h2>
      {form name="modules_action"}
        {form_element field="add" class="btn btn-primary"}
      {/form}
    </div>
    <div class="card-body p-0">
      <div class="table-responsive">
        {form name="modules"}
          {form_table field="modules" class="table table-striped table-hover align-middle mb-0" empty="[THERE_ARE_NO_MODULES]"}
            {form_table_column columnid="" header="[ENABLED]"}
              <div class="text-center">{form_table_checkbox option=$modules.name}</div>
            {/form_table_column}

            {form_table_column columnid="name" header="[MODULE_NAME]"}
              {if $modules.configpage == null}
                {$modules.name}
              {else}
                <a href="manager_content.php?page={$modules.configpage}">{$modules.name}</a>
              {/if}
            {/form_table_column}

            {form_table_column columnid="type" header="[TYPE]"}
              {$modules.type}
            {/form_table_column}

            {form_table_column columnid="description" header="[DESCRIPTION]"}
              {$modules.description}
            {/form_table_column}

            {form_table_footer}
              <div class="d-flex justify-content-end p-3">
                {form_element field="update" class="btn btn-success"}
              </div>
            {/form_table_footer}
          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>
