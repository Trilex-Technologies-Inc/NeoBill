<div class="manager_content configure-users-page">
  <div class="configure-users-shell">
    <div class="configure-users-header">
      <div class="configure-users-title">
        <span class="configure-users-icon"><i class="ti ti-users"></i></span>
        <div>
          <span class="configure-users-kicker">{echo phrase="SETTINGS"}</span>
          <h2>{echo phrase="USERS"}</h2>
          <p>{echo phrase="USER_TYPE"}</p>
        </div>
      </div>

      <div class="configure-users-actions">
        {form name="users_action"}
          {form_element field="add" class="btn btn-primary"}
        {/form}
      </div>
    </div>

    <div class="configure-users-toolbar">
      {form name="search_users"}
        <div class="configure-users-search">
          <div class="configure-users-search-header">
            <span><i class="ti ti-search"></i></span>
            <div>
              <h3>{echo phrase="SEARCH"}</h3>
              <p>{echo phrase="USERS"}</p>
            </div>
          </div>

          <div class="configure-users-search-grid">
            <div class="configure-users-field">
              <label class="form-label">{form_description field="username"}</label>
              <div class="configure-users-input-icon">
                <i class="ti ti-user"></i>
                {form_element field="username" size="10" class="form-control"}
              </div>
            </div>

            <div class="configure-users-field">
              <label class="form-label">{form_description field="contactname"}</label>
              <div class="configure-users-input-icon">
                <i class="ti ti-id"></i>
                {form_element field="contactname" size="20" class="form-control"}
              </div>
            </div>

            <div class="configure-users-field">
              <label class="form-label">{form_description field="email"}</label>
              <div class="configure-users-input-icon">
                <i class="ti ti-mail"></i>
                {form_element field="email" class="form-control"}
              </div>
            </div>

            <div class="configure-users-submit">
              {form_element field="search" class="btn btn-primary"}
            </div>
          </div>
        </div>
      {/form}
    </div>

    <div class="configure-users-table-card">
      <div class="configure-users-table-header">
        <div>
          <span>{echo phrase="USERS"}</span>
          <h3>{echo phrase="USERS"}</h3>
        </div>
        <a class="configure-users-link-button" href="manager_content.php?page=config_new_user">
          <i class="ti ti-user-plus"></i>
          {echo phrase="CREATE_USER"}
        </a>
      </div>

      <div class="table-responsive configure-users-table-wrap">
        {form name="users"}
          {form_table field="users" class="table table-sm table-hover align-middle mb-0"}

            {form_table_column columnid="username" header="[USERNAME]"}
              <a href="manager_content.php?page=config_edit_user&user={$users.username}" class="configure-users-username">
                <i class="ti ti-user-circle"></i>
                <span>{$users.username}</span>
              </a>
            {/form_table_column}

            {form_table_column columnid="type" header="[TYPE]"}
              <span class="configure-users-type">{$users.type}</span>
            {/form_table_column}

            {form_table_column columnid="contactname" header="[NAME]"}
              <span class="configure-users-name">{$users.contactname}</span>
            {/form_table_column}

            {form_table_column columnid="email" header="[EMAIL]"}
              <span class="configure-users-email">{$users.email|mailto}</span>
            {/form_table_column}

          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>
