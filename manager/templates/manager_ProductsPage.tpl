<div class="manager_content">

  <!-- Actions Section -->
  <div class="action mb-4">
    <div class="card shadow-sm border-0">
      <div class="card-header bg-primary text-white py-3 px-4">
        <span class="fw-bold mb-0">{echo phrase="ACTIONS"}</span>
      </div>
      <div class="card-body bg-white py-3 px-4">
        {form name="products_action"}
          {form_element field="add" class="btn btn-success btn-sm"}
        {/form}
      </div>
    </div>
  </div>

  <!-- Header -->
  <h2 class="mb-3">{echo phrase="PRODUCTS"}</h2>

  <!-- Search Section -->
  <div class="search mb-4">
    <div class="card">
      <div class="card-body">
        {form name="search_products"}
          <div class="row align-items-end g-3">
            <div class="col-md-10">
              <label class="form-label fw-bold">{echo phrase="PRODUCT_NAME"}</label>
              {form_description field="name"}
              {form_element field="name" size="30" class="form-control"}
            </div>
            <div class="col-md-2">
              {form_element field="search" class="btn btn-primary w-100"}
            </div>
          </div>
        {/form}
      </div>
    </div>
  </div>

  <!-- Products Table -->
  <div class="table-container">
    <div class="card">
      <div class="card-body p-0">
        <div class="table-responsive">
          {form name="products"}
            {form_table field="products" class="table table-hover table-striped align-middle mb-0" size="10"}
              {form_table_column columnid="" header="[SELECT]"}
                {form_table_checkbox option=$products.id}
              {/form_table_column}
              {form_table_column columnid="name" header="[PRODUCT_NAME]"}
                <a href="manager_content.php?page=services_edit_product&product={$products.id}" class="text-decoration-none fw-bold">
                  {$products.name}
                </a>
              {/form_table_column}
              {form_table_column columnid="pricing" header="[PRICING]"}
                <span class="badge bg-info">{$products.pricing}</span>
              {/form_table_column}
              {form_table_column columnid="public" header="[PUBLIC]"}
                {if $products.public == "Yes"}
                  <span class="badge bg-success">{$products.public}</span>
                {else}
                  <span class="badge bg-secondary">{$products.public}</span>
                {/if}
              {/form_table_column}
              {form_table_footer}
                <tr class="table-light">
                  <td colspan="4" class="p-3">
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

</div>