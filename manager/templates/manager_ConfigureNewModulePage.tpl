<div class="manager_content new-module-page">
  <div class="new-module-shell">
    <div class="new-module-header">
      <div class="new-module-title">
        <span class="new-module-icon"><i class="ti ti-puzzle-filled"></i></span>
        <div>
          <span class="new-module-kicker">{echo phrase="SETTINGS"}</span>
          <h2>{echo phrase="NEW_MODULE"}</h2>
          <p>Create and register a module in the NeoBill manager.</p>
        </div>
      </div>
      <a class="new-module-back" href="manager_content.php?page=modules">
        <i class="ti ti-arrow-left"></i>
        {echo phrase="MODULES"}
      </a>
    </div>

    {form name="new_module"}
      <div class="new-module-layout">
        <section class="new-module-card">
          <div class="new-module-card-header">
            <span><i class="ti ti-file-info"></i></span>
            <div>
              <h3>{echo phrase="MODULE_INFORMATION"}</h3>
              <p>Define how this module appears and behaves.</p>
            </div>
          </div>

          <div class="new-module-card-body">
            <div class="new-module-field">
              <label class="form-label">{form_description field="name"}</label>
              <div class="new-module-input">
                <i class="ti ti-tag"></i>
                {form_element field="name" class="form-control" placeholder="e.g. Payment Gateway" autocomplete="off"}
              </div>
              <small>Use a unique, recognizable module name.</small>
            </div>

            <div class="new-module-fields-row">
              <div class="new-module-field">
                <label class="form-label">{form_description field="type"}</label>
                <div class="new-module-input">
                  <i class="ti ti-category-2"></i>
                  {form_element field="type" class="form-control" placeholder="e.g. Payment" autocomplete="off"}
                </div>
                <small>Group the module by its purpose.</small>
              </div>

              <div class="new-module-field">
                <label class="form-label">{form_description field="enabled"}</label>
                <div class="new-module-select">
                  <i class="ti ti-toggle-right"></i>
                  {form_element field="enabled" class="form-select"}
                </div>
                <small>Choose whether it is available immediately.</small>
              </div>
            </div>

            <div class="new-module-field">
              <label class="form-label">{form_description field="shortdescription"}</label>
              <div class="new-module-input">
                <i class="ti ti-align-left"></i>
                {form_element field="shortdescription" class="form-control" placeholder="Short summary for module listings" autocomplete="off"}
              </div>
              <small>Keep this concise; it appears in the modules list.</small>
            </div>

            <div class="new-module-field">
              <label class="form-label">{form_description field="description"}</label>
              <div class="new-module-input">
                <i class="ti ti-notes"></i>
                {form_element field="description" class="form-control" placeholder="Describe what this module does" autocomplete="off"}
              </div>
              <small>Explain the module's primary responsibility.</small>
            </div>
          </div>
        </section>

        <aside class="new-module-card new-module-guide">
          <div class="new-module-card-header">
            <span><i class="ti ti-bulb"></i></span>
            <div>
              <h3>Before you create it</h3>
              <p>A few details worth checking.</p>
            </div>
          </div>
          <div class="new-module-guide-list">
            <div>
              <span><i class="ti ti-1-circle"></i></span>
              <p><strong>Choose a clear name</strong>Use a name administrators will recognize later.</p>
            </div>
            <div>
              <span><i class="ti ti-2-circle"></i></span>
              <p><strong>Set the module type</strong>Keep related integrations grouped together.</p>
            </div>
            <div>
              <span><i class="ti ti-3-circle"></i></span>
              <p><strong>Review availability</strong>Disable the module until configuration is complete.</p>
            </div>
          </div>
          <div class="new-module-guide-note">
            <i class="ti ti-info-circle"></i>
            <span>Module settings can be updated after creation.</span>
          </div>
        </aside>
      </div>

      <div class="new-module-actions">
        <a href="manager_content.php?page=modules" class="btn btn-light">{echo phrase="CANCEL"}</a>
        <button type="submit" class="btn btn-primary">
          <i class="ti ti-plus"></i>
          {echo phrase="CREATE_MODULE"}
        </button>
      </div>
    {/form}
  </div>
</div>
