<div class="manager_content">
  <h2>{echo phrase="STRIPE_MODULE"}</h2>

  {form name="stripe_config"}
    <div class="card mb-4">
      <div class="card-header">
        <h5 class="mb-0">{echo phrase="STRIPE_MODULE"}</h5>
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
            <label class="form-label">{form_description field="test_publishable_key"}</label>
            {form_element field="test_publishable_key" value="$test_publishable_key" size="70"}
          </div>

          <div class="col-12">
            <label class="form-label">{form_description field="test_secret_key"}</label>
            {form_element field="test_secret_key" value="$test_secret_key" size="70"}
          </div>

          <div class="col-12">
            <label class="form-label">{form_description field="live_publishable_key"}</label>
            {form_element field="live_publishable_key" value="$live_publishable_key" size="70"}
          </div>

          <div class="col-12">
            <label class="form-label">{form_description field="live_secret_key"}</label>
            {form_element field="live_secret_key" value="$live_secret_key" size="70"}
          </div>
        </div>
      </div>
      <div class="card-footer d-flex justify-content-end">
        {form_element field="save" class="btn btn-primary"}
      </div>
    </div>
  {/form}
</div>
