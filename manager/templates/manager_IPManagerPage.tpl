<div class="manager_content services-list-page services-ip-page">
  <div class="services-list-shell">
    <div class="services-list-header">
      <div class="services-list-title">
        <span class="services-list-icon"><i class="ti ti-network"></i></span>
        <div>
          <span class="services-list-kicker">Products &amp; Services</span>
          <h2>{echo phrase="IP_ADDRESS_POOL"}</h2>
          <p>Search IP inventory, server assignment, account usage, and service allocation.</p>
        </div>
      </div>
    </div>

    <div class="services-list-toolbar">
      <div class="services-list-search">
        <div class="services-list-search-header">
          <span><i class="ti ti-search"></i></span>
          <div>
            <h3>Find IP Addresses</h3>
            <p>Filter by address, hostname, assigned account, or service.</p>
          </div>
        </div>
        {form name="search_ips"}
          <div class="services-list-search-grid services-list-search-grid-ip">
            <div class="services-list-field">
              <label class="form-label">{echo phrase="IP_ADDRESS"}</label>
              {form_description field="ipaddressstring"}
              <div class="services-list-input-icon">
                <i class="ti ti-network"></i>
                {form_element field="ipaddressstring" size="15" class="form-control"}
              </div>
            </div>
            <div class="services-list-field">
              <label class="form-label">{echo phrase="HOSTNAME"}</label>
              {form_description field="hostname"}
              <div class="services-list-input-icon">
                <i class="ti ti-server"></i>
                {form_element field="hostname" size="20" class="form-control"}
              </div>
            </div>
            <div class="services-list-field">
              <label class="form-label">{echo phrase="ACCOUNT_NAME"}</label>
              {form_description field="accountname"}
              <div class="services-list-input-icon">
                <i class="ti ti-user"></i>
                {form_element field="accountname" size="20" class="form-control"}
              </div>
            </div>
            <div class="services-list-field">
              <label class="form-label">{echo phrase="SERVICE"}</label>
              {form_description field="service"}
              <div class="services-list-input-icon">
                <i class="ti ti-cloud"></i>
                {form_element field="service" size="20" class="form-control"}
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
          <span>Inventory</span>
          <h3>IP Address Pool</h3>
        </div>
      </div>
      <div class="services-list-table-wrap table-responsive">
        {form name="ippool"}
          {form_table field="ipaddresses" class="table table-hover align-middle mb-0" size="20"}
            {form_table_column columnid="" header="[SELECT]"}
              <span class="services-list-check">{form_table_checkbox option=$ipaddresses.ipaddress}</span>
            {/form_table_column}
            {form_table_column columnid="ipaddress" header="[IP_ADDRESS]"}
              <span class="services-list-ip">{$ipaddresses.ipaddressstring}</span>
            {/form_table_column}
            {form_table_column columnid="server" header="[SERVER]"}
              <a href="manager_content.php?page=services_view_server&server={$ipaddresses.server}" class="services-list-name">
                <i class="ti ti-server-2"></i>
                {$ipaddresses.hostname}
              </a>
            {/form_table_column}
            {form_table_column columnid="accountname" header="[ASSIGNED_TO]"}
              {if $ipaddresses.isAvailable}
                <span class="services-list-status services-list-status-public">[AVAILABLE]</span>
              {else}
                <a href="manager_content.php?page=accounts_view_account&account={$ipaddresses.accountid}" class="services-list-account">{$ipaddresses.accountname}</a>
              {/if}
            {/form_table_column}
            {form_table_column columnid="service" header="[SERVICE]"}
              {if $ipaddresses.isAvailable}
                <span class="services-list-muted">[N/A]</span>
              {else}
                <span class="services-list-module">{$ipaddresses.service}</span>
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
