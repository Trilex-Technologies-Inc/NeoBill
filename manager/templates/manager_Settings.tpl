<div class="manager_content settings-page">
  <div class="settings-shell">
    <div class="settings-header">
      <div class="settings-title">
        <span class="settings-icon"><i class="ti ti-settings"></i></span>
        <div>
          <span class="settings-kicker">[SETTINGS]</span>
          <h2>[SETTINGS]</h2>
          <p>[GENERAL]</p>
        </div>
      </div>
    </div>

    <div id="tabs" class="settings-tabs">
      <ul>
        <li><a href="#tabs-1"><i class="ti ti-mail"></i> [EMAIL]</a></li>
        <li><a href="#tabs-2"><i class="ti ti-palette"></i> Themes</a></li>
        <li><a href="#tabs-3"><i class="ti ti-file-invoice"></i> Invoice</a></li>
        <li><a href="#tabs-4"><i class="ti ti-language"></i> Locale</a></li>
        <li><a href="#tabs-5"><i class="ti ti-credit-card"></i> Payment Gateway</a></li>
        <li><a href="#tabs-6"><i class="ti ti-shopping-cart"></i> Order Interface</a></li>
      </ul>
      <div id="tabs-1">
        <div id="general" class="settings-panel">
          {form name="settings_general"}
            <div class="settings-grid settings-grid-two">
              <div class="settings-card">
                <div class="settings-card-header">
                  <span><i class="ti ti-building"></i></span>
                  <div>
                    <h3>[COMPANY]</h3>
                    <p>[GENERAL]</p>
                  </div>
                </div>
                <div class="settings-card-body">
                  <div class="settings-field">
                    <label class="form-label">{form_description field="name"}</label>
                    {form_element field="name" value="$company_name" size="40"}
                  </div>
                  <div class="settings-field">
                    <label class="form-label">{form_description field="email"}</label>
                    {form_element field="email" value="$company_email" size="30"}
                  </div>
                  <div class="settings-field">
                    <label class="form-label">{form_description field="notification_email"}</label>
                    {form_element field="notification_email" value="$company_notification_email" size="30"}
                  </div>
                </div>
              </div>

              <div class="settings-card">
                <div class="settings-card-header">
                  <span><i class="ti ti-server"></i></span>
                  <div>
                    <h3>SMTP</h3>
                    <p>[OUTGOING_MAIL_DELIVERY]</p>
                  </div>
                </div>
                <div class="settings-card-body">
                  <div class="settings-field">
                    <label class="form-label">{form_description field="mail_transport"}</label>
                    {form_element field="mail_transport" value="$mail_transport"}
                  </div>
                  <div class="settings-field settings-inline-fields">
                    <div>
                      <label class="form-label">{form_description field="smtp_host"}</label>
                      {form_element field="smtp_host" value="$smtp_host" size="30"}
                    </div>
                    <div>
                      <label class="form-label">{form_description field="smtp_port"}</label>
                      {form_element field="smtp_port" value="$smtp_port" size="6"}
                    </div>
                  </div>
                  <div class="settings-field">
                    <label class="form-label">{form_description field="smtp_encryption"}</label>
                    {form_element field="smtp_encryption" value="$smtp_encryption"}
                  </div>
                  <div class="settings-field">
                    <label class="form-label">{form_description field="smtp_username"}</label>
                    {form_element field="smtp_username" value="$smtp_username" autocomplete="username" size="30"}
                  </div>
                  <div class="settings-field">
                    <label class="form-label">{form_description field="smtp_password"}</label>
                    {form_element field="smtp_password" autocomplete="new-password" size="30" placeholder="Leave blank to keep current password"}
                  </div>
                </div>
              </div>

              <div class="settings-card">
                <div class="settings-card-header">
                  <span><i class="ti ti-mail-forward"></i></span>
                  <div>
                    <h3>[WELCOME_EMAIL]</h3>
                    <p>{form_description field="welcome_subject"}</p>
                  </div>
                </div>
                <div class="settings-card-body">
                  <div class="settings-field">
                    <label class="form-label">{form_description field="welcome_subject"}</label>
                    {form_element field="welcome_subject" value="$welcome_subject" size="40"}
                  </div>
                  <div class="settings-field">
                    <label class="form-label">{form_description field="welcome_email"}</label>
                    {form_element field="welcome_email" value="$welcome_email" cols="70" rows="10"}
                  </div>
                </div>
              </div>

              <div class="settings-card">
                <div class="settings-card-header">
                  <span><i class="ti ti-mail-check"></i></span>
                  <div>
                    <h3>[ORDER_CONFIRMATION_EMAIL]</h3>
                    <p>{form_description field="confirm_subject"}</p>
                  </div>
                </div>
                <div class="settings-card-body">
                  <div class="settings-field">
                    <label class="form-label">{form_description field="confirm_subject"}</label>
                    {form_element field="confirm_subject" value="$confirmation_subject" size="40"}
                  </div>
                  <div class="settings-field">
                    <label class="form-label">{form_description field="confirm_email"}</label>
                    {form_element field="confirm_email" value="$confirmation_email" cols="70" rows="10"}
                  </div>
                </div>
              </div>

              <div class="settings-card">
                <div class="settings-card-header">
                  <span><i class="ti ti-bell"></i></span>
                  <div>
                    <h3>[ORDER_NOTIFICATION_EMAIL]</h3>
                    <p>{form_description field="notify_subject"}</p>
                  </div>
                </div>
                <div class="settings-card-body">
                  <div class="settings-field">
                    <label class="form-label">{form_description field="notify_subject"}</label>
                    {form_element field="notify_subject" value="$notification_subject" size="40"}
                  </div>
                  <div class="settings-field">
                    <label class="form-label">{form_description field="notify_email"}</label>
                    {form_element field="notify_email" value="$notification_email" cols="70" rows="10"}
                  </div>
                </div>
              </div>
            </div>

            <div class="settings-actions">
              {form_element field="save" class="btn btn-primary"}
            </div>
          {/form}
        </div>
      </div>

      <div id="tabs-2">
        <div id="themes" class="settings-panel">
          {form name="settings_themes"}
            <div class="settings-grid">
              <div class="settings-card">
                <div class="settings-card-header">
                  <span><i class="ti ti-palette"></i></span>
                  <div>
                    <h3>[THEMES]</h3>
                    <p>[MANAGER_THEME]</p>
                  </div>
                </div>
                <div class="settings-card-body settings-compact-fields">
                  <div class="settings-field">
                    <label class="form-label">{form_description field="managertheme"}</label>
                    {form_element field="managertheme" value="$managerTheme"}
                  </div>
                  <div class="settings-field">
                    <label class="form-label">{form_description field="ordertheme"}</label>
                    {form_element field="ordertheme" value="$orderTheme"}
                  </div>
                </div>
              </div>
            </div>
            <div class="settings-actions">
              {form_element field="save" class="btn btn-primary"}
            </div>
          {/form}
        </div>
      </div>

      <div id="tabs-3">
        <div id="billing" class="settings-panel">
          {form name="settings_invoice"}
            <div class="settings-grid">
              <div class="settings-card">
                <div class="settings-card-header">
                  <span><i class="ti ti-file-invoice"></i></span>
                  <div>
                    <h3>[INVOICE]</h3>
                    <p>{form_description field="subject"}</p>
                  </div>
                </div>
                <div class="settings-card-body">
                  <div class="settings-field">
                    <label class="form-label">{form_description field="subject"}</label>
                    {form_element field="subject" value="$invoice_subject" size="80"}
                  </div>
                  <div class="settings-field">
                    <label class="form-label">{form_description field="text"}</label>
                    {form_element field="text" value="$invoice_text" cols="70" rows="20"}
                  </div>
                </div>
              </div>
            </div>
            <div class="settings-actions">
              {form_element field="save" class="btn btn-primary"}
            </div>
          {/form}
        </div>
      </div>

      <div id="tabs-4">
        <div id="locale" class="settings-panel">
          {form name="settings_locale"}
            <div class="settings-grid">
              <div class="settings-card">
                <div class="settings-card-header">
                  <span><i class="ti ti-language"></i></span>
                  <div>
                    <h3>[LOCALE]</h3>
                    <p>[LANGUAGE]</p>
                  </div>
                </div>
                <div class="settings-card-body settings-compact-fields">
                  <div class="settings-field">
                    <label class="form-label">{form_description field="language"}</label>
                    {form_element field="language"}
                  </div>
                  <div class="settings-field settings-currency-field">
                    <label class="form-label">{form_description field="currency"}</label>
                    {form_element field="currency" value="$currency" size="5"}
                  </div>
                </div>
              </div>
            </div>
            <div class="settings-actions">
              {form_element field="save" class="btn btn-primary"}
            </div>
          {/form}
        </div>
      </div>

      <div id="tabs-5">
        <div id="payment_gateway" class="settings-panel">
          {form name="settings_payment_gateway"}
            <div class="settings-grid">
              <div class="settings-card">
                <div class="settings-card-header">
                  <span><i class="ti ti-credit-card"></i></span>
                  <div>
                    <h3>[PAYMENT_GATEWAY]</h3>
                    <p>[PAYMENT_METHOD_FOR_ORDERS]</p>
                  </div>
                </div>
                <div class="settings-card-body settings-compact-fields">
				  {if !empty($gatewaysAreEnabled)}
                    <div class="settings-field">
                      <label class="form-label">{form_description field="default_module"}</label>
                      {form_element field="default_module"}
                    </div>
                    <div class="settings-field">
                      <label class="form-label">{form_description field="order_method"}</label>
                      {form_element field="order_method"}
                    </div>
                  {else}
                    <div class="settings-empty">
                      <i class="ti ti-alert-circle"></i>
                      <span>[THERE_ARE_NO_GATEWAY_MODULES]</span>
                    </div>
                  {/if}
                </div>
              </div>
            </div>
			{if !empty($gatewaysAreEnabled)}
              <div class="settings-actions">
                {form_element field="save" class="btn btn-primary"}
              </div>
            {/if}
          {/form}
        </div>
      </div>

      <div id="tabs-6">
        <div id="order_interface" class="settings-panel">
          {form name="settings_order_interface"}
            <div class="settings-grid">
              <div class="settings-card">
                <div class="settings-card-header">
                  <span><i class="ti ti-shopping-cart"></i></span>
                  <div>
                    <h3>[ORDER_INTERFACE]</h3>
                    <p>[ORDER_INTERFACE_PAGE_TITLE]</p>
                  </div>
                </div>
                <div class="settings-card-body settings-compact-fields">
                  <div class="settings-field">
                    <label class="form-label">{form_description field="title"}</label>
                    {form_element field="title" size="40" value=$order_title}
                  </div>
                  <div class="settings-field settings-check-field">
                    <label>{form_element field="accept_checks" option="true" value=$order_accept_checks} <span>{form_description field="accept_checks"}</span></label>
                  </div>
                  <div class="settings-field">
                    <label class="form-label">{form_description field="tos_url"}</label>
                    {form_element field="tos_url" value=$order_tos_url size="50"}
                  </div>
                  <div class="settings-field settings-check-field">
                    <label>{form_element field="tos_required" option="true" value=$order_tos_required} <span>{form_description field="tos_required"}</span></label>
                  </div>
                </div>
              </div>
            </div>
            <div class="settings-actions">
              {form_element field="save" class="btn btn-primary"}
            </div>
          {/form}
        </div>
      </div>
    </div>
  </div>
</div>
