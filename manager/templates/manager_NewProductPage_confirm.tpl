<div class="manager_content services-edit-page services-products-page services-new-product-page">
  <div class="services-edit-shell">
    <div class="services-list-header">
      <div class="services-list-title">
        <span class="services-list-icon"><i class="ti ti-package-plus"></i></span>
        <div>
          <span class="services-list-kicker">Products &amp; Services</span>
          <h2>{echo phrase="ADD_PRODUCT"}</h2>
          <p>{echo phrase="NEW_PRODUCT_CONFIRM"}</p>
        </div>
      </div>
    </div>

    {form name="new_product_confirm"}
      <div class="services-new-product-grid">
        <div class="services-edit-card services-edit-details">
          <div class="services-edit-card-header">
            <span><i class="ti ti-checkup-list"></i></span>
            <div>
              <h3>[GENERAL]</h3>
              <p>[PRODUCT]</p>
            </div>
          </div>

          <div class="services-edit-card-body">
            <div class="services-confirm-row">
              <span>{echo phrase="PRODUCT_NAME"}</span>
              <strong>{dbo_echo dbo="new_product_dbo" field="name"}</strong>
            </div>

            <div class="services-edit-field">
              <label class="form-label">{echo phrase="DESCRIPTION"}</label>
              <textarea class="form-control" rows="5" readonly="readonly">{dbo_echo dbo="new_product_dbo" field="description"}</textarea>
            </div>

            <div class="services-confirm-grid">
              <div class="services-confirm-row">
                <span>{echo phrase="PRICE"}</span>
                <strong>{dbo_echo|currency dbo="new_product_dbo" field="price"}</strong>
              </div>

              <div class="services-confirm-row">
                <span>{echo phrase="TAXABLE"}</span>
                {assign var="taxable" value={dbo_echo dbo="new_product_dbo" field="taxable"}}
                {if $taxable == "Yes"}
                  <strong class="services-list-status services-list-status-private">{$taxable}</strong>
                {else}
                  <strong class="services-list-status services-list-status-public">{$taxable}</strong>
                {/if}
              </div>
            </div>
          </div>

          <div class="services-edit-actions services-edit-actions-end">
            {form_element field="goback" class="btn btn-light"}
            {form_element field="continue" class="btn btn-primary"}
          </div>
        </div>
      </div>
    {/form}
  </div>
</div>
