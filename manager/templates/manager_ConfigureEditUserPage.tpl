<div class="manager_content user-edit-page">

  <div class="user-edit-header">
    <div class="user-edit-title">
      <span class="user-edit-avatar"><i class="ti ti-user-cog"></i></span>
      <div>
        <span class="user-edit-kicker">User settings</span>
        <h2>{dbo_echo dbo="edit_user_dbo" field="username"}</h2>
        <p>{dbo_echo dbo="edit_user_dbo" field="contactname"} · {dbo_echo dbo="edit_user_dbo" field="email"}</p>
      </div>
    </div>
    <a class="btn btn-outline-secondary btn-sm" href="manager_content.php?page=config_users">
      <i class="ti ti-arrow-left"></i>
      Users
    </a>
  </div>

  <div class="user-edit-summary">
    <div class="user-edit-stat">
      <span>{echo phrase="USER_TYPE"}</span>
      <strong>{dbo_echo dbo="edit_user_dbo" field="type"}</strong>
    </div>
    <div class="user-edit-stat">
      <span>{echo phrase="LANGUAGE_PREFERENCE"}</span>
      <strong>{dbo_echo dbo="edit_user_dbo" field="language"}</strong>
    </div>
    <div class="user-edit-stat">
      <span>{echo phrase="THEME_PREFERENCE"}</span>
      <strong>{dbo_echo dbo="edit_user_dbo" field="theme"}</strong>
    </div>
  </div>

  <ul class="nav nav-tabs user-edit-tabs" id="userTabs" role="tablist">
    <li class="nav-item" role="presentation">
      <button class="nav-link active" id="edit-tab" data-bs-toggle="tab" data-bs-target="#tabs-1" type="button" role="tab" aria-controls="tabs-1" aria-selected="true">
        <i class="ti ti-id"></i>
        Profile
      </button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link" id="password-tab" data-bs-toggle="tab" data-bs-target="#tabs-2" type="button" role="tab" aria-controls="tabs-2" aria-selected="false">
        <i class="ti ti-key"></i>
        Password
      </button>
    </li>
    <li class="nav-item" role="presentation">
      <button class="nav-link user-edit-danger-tab" id="delete-tab" data-bs-toggle="tab" data-bs-target="#tabs-3" type="button" role="tab" aria-controls="tabs-3" aria-selected="false">
        <i class="ti ti-trash"></i>
        Delete User
      </button>
    </li>
  </ul>

  <div class="tab-content user-edit-tab-content" id="userTabsContent">
    <div class="tab-pane fade show active" id="tabs-1" role="tabpanel" aria-labelledby="edit-tab">
      {form name="edit_user"}
        <div class="user-edit-card">
          <div class="user-edit-card-header">
            <span><i class="ti ti-user"></i></span>
            <div>
              <h3>[EDIT_USER]</h3>
              <p>Update role, contact details, language, and manager theme preferences.</p>
            </div>
          </div>
          <div class="user-edit-card-body">
            <div class="row g-3">
              <div class="col-12 col-md-6">
                <div class="user-edit-field">
                  <label class="form-label" for="type">{form_description field="type" colon="false"}</label>
                  {form_element dbo="edit_user_dbo" field="type" id="type"}
                </div>
              </div>
              <div class="col-12 col-md-6">
                <div class="user-edit-field">
                  <label class="form-label" for="contactname">{form_description field="contactname" colon="false"}</label>
                  {form_element dbo="edit_user_dbo" field="contactname" id="contactname" size="30"}
                </div>
              </div>
            </div>

            <div class="user-edit-field">
              <label class="form-label" for="email">{form_description field="email" colon="false"}</label>
              <div class="user-edit-input-icon">
                <i class="ti ti-mail"></i>
                {form_element dbo="edit_user_dbo" field="email" id="email" size="30"}
              </div>
            </div>

            <div class="row g-3">
              <div class="col-12 col-md-6">
                <div class="user-edit-field">
                  <label class="form-label" for="language">{form_description field="language" colon="false"}</label>
                  {form_element dbo="edit_user_dbo" field="language" id="language"}
                </div>
              </div>
              <div class="col-12 col-md-6">
                <div class="user-edit-field">
                  <label class="form-label" for="theme">{form_description field="theme" colon="false"}</label>
                  {form_element dbo="edit_user_dbo" field="theme" id="theme"}
                </div>
              </div>
            </div>

            <div class="user-edit-actions">
              <input type="submit" value="Update User" class="btn btn-primary"/>
            </div>
          </div>
        </div>
      {/form}
    </div>

    <div class="tab-pane fade" id="tabs-2" role="tabpanel" aria-labelledby="password-tab">
      {form name="edit_user_pass"}
        <div class="user-edit-card">
          <div class="user-edit-card-header">
            <span><i class="ti ti-lock"></i></span>
            <div>
              <h3>[RESET_PASSWORD]</h3>
              <p>Set a new password for this manager user.</p>
            </div>
          </div>
          <div class="user-edit-card-body">
            <div class="row g-3">
              <div class="col-12 col-md-6">
                <div class="user-edit-field">
                  <label class="form-label" for="password">{form_description field="password" colon="false"}</label>
                  {form_element field="password" id="password" size="20" type="password"}
                </div>
              </div>
              <div class="col-12 col-md-6">
                <div class="user-edit-field">
                  <label class="form-label" for="repassword">{form_description field="repassword" colon="false"}</label>
                  {form_element field="repassword" id="repassword" size="20" type="password"}
                </div>
              </div>
            </div>

            <div class="user-edit-actions">
              <input type="submit" value="Reset Password" class="btn btn-warning"/>
            </div>
          </div>
        </div>
      {/form}
    </div>

    <div class="tab-pane fade" id="tabs-3" role="tabpanel" aria-labelledby="delete-tab">
      <div class="user-edit-danger-card">
        <div class="user-edit-danger-icon"><i class="ti ti-alert-triangle"></i></div>
        <div>
          <h3>Delete User Account</h3>
          <p>This will start the confirmation flow before removing the user.</p>
        </div>
        {form name="edit_user_action"}
          {form_element field="delete" class="btn btn-outline-danger"}
        {/form}
      </div>
    </div>
  </div>

</div>
