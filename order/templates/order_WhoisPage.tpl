<h3> {$fqdn} [IS_AVAILABLE]! </h3>

{form name="whoispurchase"}
  <div class="card mb-4">
    <div class="card-header"><h5 class="mb-0">[REGISTER_DOMAIN]</h5></div>
    <div class="card-body">
      <div class="form-check mb-2 ps-3">{form_element field="option" option="hosting"}</div>
      <div class="form-check ps-3">{form_element field="option" option="nohosting"}</div>
    </div>
  </div>

  <div class="d-flex justify-content-end">
    {form_element field="continue"}
  </div>
{/form}
