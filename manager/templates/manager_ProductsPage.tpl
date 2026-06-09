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
            <table class="table table-hover table-striped align-middle mb-0">
              <thead class="table-dark">
                <tr>
                  <th style="width: 40px; text-align: center">{echo phrase="SELECT"}</th>
                  <th>{echo phrase="PRODUCT_NAME"}</th>
                  <th>{echo phrase="PRICING"}</th>
                  <th>{echo phrase="PUBLIC"}</th>
                </tr>
              </thead>
              <tbody>
                {form_table field="products" size="10"}
                  <tr>
                    <td class="text-center">
                      {form_table_checkbox option=$products.id}
                    </td>
                    <td>
                      <a href="manager_content.php?page=services_edit_product&product={$products.id}" class="text-decoration-none fw-bold">
                        {$products.name}
                      </a>
                    </td>
                    <td>
                      <span class="badge bg-info">{$products.pricing}</span>
                    </td>
                    <td>
                      {if $products.public == "Yes"}
                        <span class="badge bg-success">{$products.public}</span>
                      {else}
                        <span class="badge bg-secondary">{$products.public}</span>
                      {/if}
                    </td>
                  </tr>
                {/form_table}
              </tbody>
              {form_table_footer}
                <tfoot>
                  <tr class="table-light">
                    <td colspan="4" class="p-3">
                      {form_element field="remove" class="btn btn-danger"}
                    </td>
                  </tr>
                </tfoot>
              {/form_table_footer}
            </table>
          {/form}
        </div>
      </div>
    </div>
  </div>

</div>