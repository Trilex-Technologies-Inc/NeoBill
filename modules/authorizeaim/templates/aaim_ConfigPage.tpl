<div class="manager_content">
  <h2>{echo phrase="AUTHORIZENET_AIM_MODULE"}</h2>

  {form name="aaim_config"}
    <div class="card mb-4">
      <div class="card-header">
        <h5 class="mb-0">{echo phrase="AUTHORIZENET_AIM_MODULE"}</h5>
      </div>
      <div class="card-body">
        <div class="row g-3">
          <div class="col-md-6">
            <label class="form-label">{form_description field="loginid"}</label>
            {form_element field="loginid" value="$loginid" size="30"}
          </div>

          <div class="col-md-3">
            <label class="form-label">{form_description field="mode"}</label>
            {form_element field="mode" value="$mode"}
          </div>

          <div class="col-md-3">
            <label class="form-label">{form_description field="delimiter"}</label>
            {form_element field="delimiter" value="$delimiter" size="1"}
          </div>

          <div class="col-12">
            <label class="form-label">{form_description field="transactionkey"}</label>
            {form_element field="transactionkey" value="$transactionkey" size="50"}
          </div>

          <div class="col-12">
            <label class="form-label">{form_description field="transactionurl"}</label>
            {form_element field="transactionurl" value="$transactionurl" size="70"}
          </div>
        </div>
      </div>
      <div class="card-footer d-flex justify-content-end">
        {form_element field="save" class="btn btn-primary"}
      </div>
    </div>
  {/form}
</div>
