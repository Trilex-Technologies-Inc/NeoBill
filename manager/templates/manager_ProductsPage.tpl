<div class="manager_content services-list-page services-products-page">
  <div class="services-list-shell">
    <div class="services-list-header">
      <div class="services-list-title">
        <span class="services-list-icon"><i class="ti ti-package"></i></span>
        <div>
          <span class="services-list-kicker">Products &amp; Services</span>
          <h2>{echo phrase="PRODUCTS"}</h2>
          <p>Maintain add-on products, recurring charges, and customer catalog visibility.</p>
        </div>
      </div>
      <div class="services-list-actions">
        {form name="products_action"}
          {form_element field="add" class="btn btn-primary"}
        {/form}
      </div>
    </div>

    <div class="services-list-toolbar">
      <div class="services-list-search">
        <div class="services-list-search-header">
          <span><i class="ti ti-search"></i></span>
          <div>
            <h3>Find Products</h3>
            <p>Filter product catalog entries by name.</p>
          </div>
        </div>
        {form name="search_products"}
          <div class="services-list-search-grid services-list-search-grid-one">
            <div class="services-list-field">
              <label class="form-label">{echo phrase="PRODUCT_NAME"}</label>
              {form_description field="name"}
              <div class="services-list-input-icon">
                <i class="ti ti-package"></i>
                {form_element field="name" size="30" class="form-control"}
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
          <span>Catalog</span>
          <h3>Other Products</h3>
        </div>
      </div>
      <div class="services-list-table-wrap table-responsive">
        {form name="products"}
          {form_table field="products" class="table table-hover align-middle mb-0" size="10"}
            {form_table_column columnid="" header="[SELECT]"}
              <span class="services-list-check">{form_table_checkbox option=$products.id}</span>
            {/form_table_column}
            {form_table_column columnid="name" header="[PRODUCT_NAME]"}
              <a href="manager_content.php?page=services_edit_product&product={$products.id}" class="services-list-name">
                <i class="ti ti-package"></i>
                {$products.name}
              </a>
            {/form_table_column}
            {form_table_column columnid="pricing" header="[PRICING]"}
              <span class="services-list-pricing">{$products.pricing}</span>
            {/form_table_column}
            {form_table_column columnid="public" header="[PUBLIC]"}
              {if $products.public == "Yes"}
                <span class="services-list-status services-list-status-public">{$products.public}</span>
              {else}
                <span class="services-list-status services-list-status-private">{$products.public}</span>
              {/if}
            {/form_table_column}
            {form_table_footer}
              <tr>
                <td colspan="4">
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
