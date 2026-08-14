<div class="manager_content">
  <h2>{echo phrase="PAYPAL_WPS_MODULE"}</h2>

  {form name="psm_config"}
    <div class="card mb-4">
      <div class="card-header">
        <h5 class="mb-0">{echo phrase="PAYPAL_WPS_MODULE"}</h5>
      </div>
      <div class="card-body">
        <div class="row g-3">
          <div class="col-md-6">
            <label class="form-label">{form_description field="account"}</label>
            {form_element field="account" value="$account" size="40"}
          </div>

          <div class="col-md-3">
            <label class="form-label">{form_description field="mode"}</label>
            {form_element field="mode" value="$mode"}
          </div>

          <div class="col-md-3">
            <label class="form-label">{form_description field="currency"}</label>
            {form_element field="currency" value="$currency"}
          </div>

          <div class="col-12">
            <label class="form-label">{form_description field="carturl"}</label>
            {form_element field="carturl" value="$cartURL" size="70"}
          </div>

          <div class="col-12">
            <label class="form-label">{form_description field="idtoken"}</label>
            {form_element field="idtoken" value="$idToken" size="80"}
          </div>
        </div>
      </div>
      <div class="card-footer d-flex justify-content-end">
        {form_element field="save" class="btn btn-primary"}
      </div>
    </div>
  {/form}
</div>
