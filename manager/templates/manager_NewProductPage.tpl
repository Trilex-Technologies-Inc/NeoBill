<div class="manager_content services-edit-page services-products-page services-new-product-page">
  <div class="services-edit-shell">
    <div class="services-list-header">
      <div class="services-list-title">
        <span class="services-list-icon"><i class="ti ti-package-plus"></i></span>
        <div>
          <span class="services-list-kicker">Products &amp; Services</span>
          <h2>{echo phrase="NEW_PRODUCT"}</h2>
          <p>{echo phrase="CREATE_PRODUCT"}</p>
        </div>
      </div>
    </div>

    {form name="new_product"}
      <div class="services-new-product-grid">
        <div class="services-edit-card services-edit-details">
          <div class="services-edit-card-header">
            <span><i class="ti ti-file-plus"></i></span>
            <div>
              <h3>[GENERAL]</h3>
              <p>[PRODUCT]</p>
            </div>
          </div>

          <div class="services-edit-card-body">
            <div class="services-edit-field">
              <label class="form-label">{form_description field="name"}</label>
              {form_element field="name" size="20" class="form-control"}
            </div>

            <div class="services-edit-field">
              <label class="form-label">{form_description field="description"}</label>
              {form_element field="description" cols="40" rows="5" class="form-control"}
            </div>

            <div class="services-edit-check">
              {form_element field="public" option="Yes" class="form-check-input"}
              <div>
                <label class="form-check-label">{form_description field="public"}</label>
              </div>
            </div>
          </div>

          <div class="services-edit-actions">
            {form_element field="cancel" class="btn btn-light"}
            {form_element field="continue" class="btn btn-primary"}
          </div>
        </div>
      </div>
    {/form}
  </div>
</div>
