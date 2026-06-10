<div class="manager_content">
<h2>{echo phrase="IP_ADDRESS_POOL"}</h2>

<div class="search mb-4">
  <div class="card">
    <div class="card-body">
      {form name="search_ips"}
        <div class="row g-3 align-items-end">
          <div class="col-md-3">
            <label class="form-label fw-bold">{echo phrase="SEARCH"}</label>
            {form_description field="ipaddressstring"}
            {form_element field="ipaddressstring" size="15" class="form-control"}
          </div>
          <div class="col-md-3">
            <label class="form-label fw-bold">{echo phrase="HOSTNAME"}</label>
            {form_description field="hostname"}
            {form_element field="hostname" size="20" class="form-control"}
          </div>
          <div class="col-md-3">
            <label class="form-label fw-bold">{echo phrase="ACCOUNT_NAME"}</label>
            {form_description field="accountname"}
            {form_element field="accountname" size="20" class="form-control"}
          </div>
          <div class="col-md-2">
            <label class="form-label fw-bold">{echo phrase="SERVICE"}</label>
            {form_description field="service"}
            {form_element field="service" size="20" class="form-control"}
          </div>
          <div class="col-md-1">
            {form_element field="search" class="btn btn-primary w-100"}
          </div>
        </div>
      {/form}
    </div>
  </div>
</div>



<div class="table-container">
  <div class="card">
    <div class="card-body p-0">
      <div class="table-responsive">
        {form name="ippool"}
          {form_table field="ipaddresses" class="table table-sm table-striped align-middle mb-0" size="20"}
            {form_table_column columnid="" header="[SELECT]"}
              {form_table_checkbox option=$ipaddresses.ipaddress}
            {/form_table_column}
            {form_table_column columnid="ipaddress" header="[IP_ADDRESS]"}
              {$ipaddresses.ipaddressstring}
            {/form_table_column}
            {form_table_column columnid="server" header="[SERVER]"}
              <a href="manager_content.php?page=services_view_server&server={$ipaddresses.server}">{$ipaddresses.hostname}</a>
            {/form_table_column}
            {form_table_column columnid="accountname" header="[ASSIGNED_TO]"}
              {if $ipaddresses.isAvailable}
                [AVAILABLE]
              {else}
                <a href="manager_content.php?page=accounts_view_account&account={$ipaddresses.accountid}">{$ipaddresses.accountname}</a>
              {/if}
            {/form_table_column}
            {form_table_column columnid="service" header="[SERVICE]"}
              {if $ipaddresses.isAvailable}
                [N/A]
              {else}
                {$ipaddresses.service}
              {/if}
            {/form_table_column}
            {form_table_footer}
              <tr class="table-light">
                <td colspan="5" class="p-3">
                  {form_element field="remove" class="btn btn-danger"}
                </td>
              </tr>
            {/form_table_footer}
          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>

