<div class="manager_content">
  <h2>{echo phrase="UPS_MODULE"}</h2>

  {form name="ups_config"}
    <div class="card mb-4">
      <div class="card-header">
        <h5 class="mb-0">{echo phrase="UPS_MODULE"}</h5>
      </div>
      <div class="card-body">
        <div class="row g-3">
          <div class="col-md-6">
            <label class="form-label">{form_description field="mode"}</label>
            {form_element field="mode" value="$mode"}
          </div>

          <div class="col-md-6">
            <label class="form-label">{form_description field="currency"}</label>
            {form_element field="currency" value="$currency"}
          </div>

          <div class="col-12">
            <label class="form-label">{form_description field="client_id"}</label>
            {form_element field="client_id" value="$client_id" size="70"}
          </div>

          <div class="col-12">
            <label class="form-label">{form_description field="client_secret"}</label>
            {form_element field="client_secret" value="$client_secret" size="70"}
          </div>

          <div class="col-md-4">
            <label class="form-label">{form_description field="shipper_number"}</label>
            {form_element field="shipper_number" value="$shipper_number" size="20"}
          </div>

          <div class="col-md-4">
            <label class="form-label">{form_description field="account_country"}</label>
            {form_element field="account_country" value="$account_country" size="2"}
          </div>

          <div class="col-md-4">
            <label class="form-label">{form_description field="account_postal_code"}</label>
            {form_element field="account_postal_code" value="$account_postal_code" size="16"}
          </div>

          <div class="col-md-3">
            <label class="form-label">{form_description field="default_service_code"}</label>
            {form_element field="default_service_code" value="$default_service_code"}
          </div>

          <div class="col-md-3">
            <label class="form-label">{form_description field="default_packaging_code"}</label>
            {form_element field="default_packaging_code" value="$default_packaging_code"}
          </div>

          <div class="col-md-3">
            <label class="form-label">{form_description field="weight_unit"}</label>
            {form_element field="weight_unit" value="$weight_unit"}
          </div>

          <div class="col-md-3">
            <label class="form-label">{form_description field="dimension_unit"}</label>
            {form_element field="dimension_unit" value="$dimension_unit"}
          </div>
        </div>
      </div>
      <div class="card-footer d-flex justify-content-end">
        {form_element field="save" class="btn btn-primary"}
      </div>
    </div>
  {/form}
</div>
