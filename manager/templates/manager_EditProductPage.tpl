<div class="manager_content services-edit-page services-products-page">
  <div class="services-edit-shell">
    <div class="services-list-header">
      <div class="services-list-title">
        <span class="services-list-icon"><i class="ti ti-package"></i></span>
        <div>
          <span class="services-list-kicker">Products &amp; Services</span>
          <h2>{echo phrase="EDIT_PRODUCT"}</h2>
          <p>{dbo_echo dbo="product_dbo" field="name"} &middot; [ID]: {dbo_echo dbo="product_dbo" field="id"}</p>
        </div>
      </div>
    </div>

    <div class="services-edit-grid">
      {form name="edit_product"}
        <div class="services-edit-card services-edit-details">
          <div class="services-edit-card-header">
            <span><i class="ti ti-file-pencil"></i></span>
            <div>
              <h3>[GENERAL]</h3>
              <p>[PRODUCT]</p>
            </div>
          </div>

          <div class="services-edit-card-body">
            <div class="services-edit-field">
              <label class="form-label">{form_description field="name"}</label>
              {form_element dbo="product_dbo" field="name" size="20" class="form-control"}
            </div>

            <div class="services-edit-field">
              <label class="form-label">{form_description field="description"}</label>
              {form_element dbo="product_dbo" field="description" cols="40" rows="5" class="form-control"}
            </div>

            <div class="services-edit-check">
              {form_element dbo="product_dbo" field="public" option="Yes" class="form-check-input"}
              <div>
                <label class="form-check-label">{form_description field="public"}</label>
              </div>
            </div>
          </div>

          <div class="services-edit-actions">
            {form_element field="cancel" class="btn btn-light"}
            {form_element field="save" class="btn btn-primary"}
          </div>
        </div>
      {/form}

      <div class="services-edit-stack">
        {form name="edit_product_pricing"}
          <div class="services-edit-card">
            <div class="services-edit-card-header">
              <span><i class="ti ti-cash"></i></span>
              <div>
                <h3>[PRICING]</h3>
                <p>[PRICE]</p>
              </div>
            </div>

            <div class="services-edit-table">
              {form_table field="prices" class="table table-hover align-middle mb-0"}
                {form_table_column columnid="id" header=""}
                  <span class="services-list-check">{form_table_checkbox option=$prices.id}</span>
                {/form_table_column}

                {form_table_column columnid="type" header="[TYPE]"}
                  <span class="services-list-pricing">{$prices.type}</span>
                {/form_table_column}

                {form_table_column columnid="termlength" header="[TERM_LENGTH]"}
                  {if $prices.type == "Onetime"}
                    <span class="services-list-muted">[N/A]</span>
                  {else}
                    {$prices.termlength} [MONTHS]
                  {/if}
                {/form_table_column}

                {form_table_column columnid="price" header="[PRICE]"}
                  <strong>{$prices.price|currency}</strong>
                {/form_table_column}

                {form_table_column columnid="taxable" header="[TAXABLE]"}
                  {if $prices.taxable == "Yes"}
                    <span class="services-list-status services-list-status-public">{$prices.taxable}</span>
                  {else}
                    <span class="services-list-status services-list-status-private">{$prices.taxable}</span>
                  {/if}
                {/form_table_column}

                {form_table_footer}
                  <div class="services-list-remove-actions">
                    {form_element field="delete" class="btn btn-outline-danger"}
                  </div>
                {/form_table_footer}
              {/form_table}
            </div>
          </div>
        {/form}

        {form name="edit_product_add_price"}
          <div class="services-edit-card">
            <div class="services-edit-card-header">
              <span><i class="ti ti-circle-plus"></i></span>
              <div>
                <h3>[ADD_OR_UPDATE_PRICE]</h3>
                <p>[PRICING]</p>
              </div>
            </div>

            <div class="services-edit-price-grid">
              <div class="services-edit-field">
                <label class="form-label">{form_description field="type"}</label>
                {form_element field="type" class="form-select"}
              </div>

              <div class="services-edit-field">
                <label class="form-label">{form_description field="termlength"}</label>
                {form_element field="termlength" size="4" class="form-control"}
              </div>

              <div class="services-edit-field">
                <label class="form-label">{form_description field="price"}</label>
                {form_element field="price" size="6" class="form-control"}
              </div>

              <div class="services-edit-field">
                <label class="form-label">{form_description field="taxable"}</label>
                {form_element field="taxable" class="form-select"}
              </div>
            </div>

            <div class="services-edit-actions services-edit-actions-end">
              {form_element field="add" class="btn btn-primary"}
            </div>
          </div>
        {/form}
      </div>
    </div>
  </div>
</div>
