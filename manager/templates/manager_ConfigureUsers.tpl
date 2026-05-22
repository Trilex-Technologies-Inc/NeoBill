<div class="manager_content">

<!-- Actions Section -->
<div class="action mb-4">
  <div class="card border-0 bg-light">
    <div class="card-body py-2">
      <div class="d-flex justify-content-between align-items-center">
        <p class="header fw-bold mb-0">
          <i class="bi bi-gear me-2"></i>
          Actions
        </p>
        {form name="users_action"}
          {form_element field="add" class="btn btn-primary btn-sm"}
        {/form}
      </div>
    </div>
  </div>
</div>

<h2 class="mb-3">
  <i class="bi bi-people me-2 text-primary"></i>
  [USERS]
</h2>

<!-- Search Section -->
<div class="search mb-4">
  {form name="search_users"}
    <div class="card shadow-sm">
      <div class="card-body">
        <div class="row g-3 align-items-end">
          <!-- Username -->
          <div class="col-md-3">
            <label class="form-label fw-bold">
              {form_description field="username"}
            </label>
            {form_element field="username" size="10" class="form-control" placeholder="Username"}
          </div>
          
          <!-- Contact Name -->
          <div class="col-md-4">
            <label class="form-label fw-bold">
              {form_description field="contactname"}
            </label>
            {form_element field="contactname" size="20" class="form-control" placeholder="Full name"}
          </div>
          
          <!-- Email -->
          <div class="col-md-3">
            <label class="form-label fw-bold">
              {form_description field="email"}
            </label>
            {form_element field="email" class="form-control" placeholder="Email address"}
          </div>
          
          <!-- Search Button -->
          <div class="col-md-2">
            {form_element field="search" class="btn btn-primary w-100"}
          </div>
        </div>
      </div>
    </div>
  {/form}
</div>

<!-- Users Table -->
<div class="table-responsive">
  <div class="card shadow-sm">
    <div class="card-body p-0">
      {form name="users"}
        {form_table field="users" class="table table-sm table-striped align-middle table-hover mb-0"}
          
          {form_table_column columnid="username" header="[USERNAME]"}
            <a href="manager_content.php?page=config_edit_user&user={$users.username}" class="text-decoration-none fw-bold">
              <i class="bi bi-person-circle me-1"></i>
              {$users.username}
            </a>
          {/form_table_column}
          
          {form_table_column columnid="type" header="[TYPE]"}
            {if $users.type == 'admin'}
              <span class="badge bg-danger">{$users.type}</span>
            {elseif $users.type == 'reseller'}
              <span class="badge bg-warning text-dark">{$users.type}</span>
            {else}
              <span class="badge bg-secondary">{$users.type}</span>
            {/if}
          {/form_table_column}
          
          {form_table_column columnid="contactname" header="[NAME]"}
            {$users.contactname}
          {/form_table_column}
          
          {form_table_column columnid="email" header="[EMAIL]"}
            {$users.email|mailto}
          {/form_table_column}
          
        {/form_table}
      {/form}
    </div>
  </div>
</div>

</div>
