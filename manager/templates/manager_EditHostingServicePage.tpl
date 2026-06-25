<div class="manager_content edit-hosting-page">
  <div class="edit-hosting-shell">
    <div class="edit-hosting-header">
      <div class="edit-hosting-title">
        <span class="edit-hosting-icon"><i class="ti ti-device-laptop"></i></span>
        <div>
          <span class="edit-hosting-kicker">Services</span>
          <h2>{echo phrase="HOSTING_SERVICE"} # {dbo_echo dbo="hosting_dbo" field="id"}</h2>
          <p>Edit service details, pricing, and public visibility from one place.</p>
        </div>
      </div>
      <div class="edit-hosting-actions">
        <a href="manager_content.php?page=services_web_hosting" class="btn btn-outline-primary">
          <i class="ti ti-arrow-left"></i> Back to Services
        </a>
      </div>
    </div>

    <div id="tabs" class="settings-tabs">
      <ul>
        <li><a href="#tabs-1"><i class="ti ti-settings"></i> General</a></li>
        <li><a href="#tabs-2"><i class="ti ti-trash"></i> Pricing</a></li>
        <li><a href="#tabs-3"><i class="ti ti-plus"></i> Add Price</a></li>
      </ul>

      <div id="tabs-1">
        <div class="settings-panel">
          {form name="edit_hosting"}
            <div class="edit-hosting-card card">
              <div class="card-header edit-hosting-card-header">
                <div>
                  <span>General</span>
                  <h3>Service details</h3>
                </div>
              </div>
              <div class="card-body">
                <div class="edit-hosting-grid">
                  <div class="edit-hosting-field">
                    <label class="form-label">{form_description field="title"}</label>
                    {form_element dbo="hosting_dbo" field="title" size="40" class="form-control"}
                  </div>
                  <div class="edit-hosting-field">
                    <label class="form-label">{form_description field="description"}</label>
                    {form_element dbo="hosting_dbo" field="description" cols="40" rows="4" class="form-control"}
                  </div>
                  <div class="edit-hosting-options">
                    <div class="edit-hosting-option">
                      <label class="form-label">{form_description field="uniqueip"}</label>
                      {form_element dbo="hosting_dbo" field="uniqueip"}
                    </div>
                    <div class="edit-hosting-option">
                      <label class="form-label">{form_description field="domainrequirement"}</label>
                      {form_element dbo="hosting_dbo" field="domainrequirement"}
                    </div>
                    <div class="edit-hosting-option">
                      <label class="form-label">{form_description field="public"}</label>
                      {form_element dbo="hosting_dbo" field="public" option="Yes"}
                    </div>
                  </div>
                  <div class="edit-hosting-linkbox">
                    <span class="edit-hosting-link-label">[ADD_TO_CART_URL]</span>
                    <code>order/index.php?page=purchasehosting&amp;service={$serviceDBO->getID()}</code>
                  </div>
                </div>
              </div>
              <div class="card-footer edit-hosting-footer">
                {form_element field="cancel" class="btn btn-outline-secondary"}
                {form_element field="save" class="btn btn-primary"}
              </div>
            </div>
          {/form}
        </div>
      </div>

      <div id="tabs-2">
        <div class="settings-panel">
          {form name="edit_hosting_pricing"}
            <div class="edit-hosting-card card">
              <div class="card-header edit-hosting-card-header">
                <div>
                  <span>Pricing</span>
                  <h3>Delete service prices</h3>
                </div>
              </div>
              <div class="card-body">
                <div class="table-responsive edit-hosting-table-wrap">
                  {form_table field="prices" class="table table-hover align-middle mb-0" style="min-width: 640px"}
                    {form_table_column columnid="id" header=""}
                      {form_table_checkbox option=$prices.id}
                    {/form_table_column}
                    {form_table_column columnid="type" header="[TYPE]"}
                      <strong>{$prices.type}</strong>
                    {/form_table_column}
                    {form_table_column columnid="termlength" header="[TERM_LENGTH]"}
                      {if $prices.type == "Onetime"}
                        [N/A]
                      {else}
                        {$prices.termlength} [MONTHS]
                      {/if}
                    {/form_table_column}
                    {form_table_column columnid="price" header="[PRICE]"}
                      {$prices.price|currency}
                    {/form_table_column}
                    {form_table_column columnid="taxable" header="[TAXABLE]"}
                      {$prices.taxable}
                    {/form_table_column}
                    {form_table_footer}
                      <tr>
                        <td colspan="5" class="edit-hosting-table-footer">
                          {form_element field="delete" class="btn btn-outline-danger btn-sm"}
                        </td>
                      </tr>
                    {/form_table_footer}
                  {/form_table}
                </div>
              </div>
            </div>
          {/form}
        </div>
      </div>

      <div id="tabs-3">
        <div class="settings-panel">
          {form name="edit_hosting_add_price"}
            <div class="edit-hosting-card card">
              <div class="card-header edit-hosting-card-header">
                <div>
                  <span>Pricing</span>
                  <h3>Add or update a price</h3>
                </div>
              </div>
              <div class="card-body">
                <div class="edit-hosting-price-grid">
                  <div class="edit-hosting-field">
                    <label class="form-label">{form_description field="type"}</label>
                    {form_element field="type" class="form-select"}
                  </div>
                  <div class="edit-hosting-field">
                    <label class="form-label">{form_description field="termlength"}</label>
                    {form_element field="termlength" size="4" class="form-control"}
                  </div>
                  <div class="edit-hosting-field">
                    <label class="form-label">{form_description field="price"}</label>
                    {form_element field="price" size="6" class="form-control"}
                  </div>
                  <div class="edit-hosting-field">
                    <label class="form-label">{form_description field="taxable"}</label>
                    {form_element field="taxable"}
                  </div>
                </div>
                <div class="edit-hosting-footer edit-hosting-footer-split">
                  <div class="text-muted small">Use this form to add a new price tier or overwrite an existing one.</div>
                  <div>{form_element field="add" class="btn btn-primary"}</div>
                </div>
              </div>
            </div>
          {/form}
        </div>
      </div>
    </div>
  </div>
</div>
