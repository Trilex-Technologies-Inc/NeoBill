<div class="card mb-4">
  <div class="card-header">
    <h5 class="mb-0">{echo phrase="PAY_WITH_STRIPE"}</h5>
  </div>
  <div class="card-body">
    <p class="mb-4">{echo phrase="PAY_WITH_STRIPE_TEXT"}</p>

    <dl class="row mb-4">
      <dt class="col-sm-4">{echo phrase="ORDER"}:</dt>
      <dd class="col-sm-8">#{$orderid}</dd>

      <dt class="col-sm-4">{echo phrase="TOTAL"}:</dt>
      <dd class="col-sm-8">{$amount|currency}</dd>
    </dl>

    {form name="stripe_checkout"}
      <div class="d-flex justify-content-center">
        {form_element field="pay" class="btn btn-primary"}
      </div>
    {/form}
  </div>
</div>

<div class="d-flex justify-content-between">
  {form name="stripe_checkout"}
    {form_element field="startover" class="btn btn-outline-secondary"}
  {/form}

  {form name="stripe_checkout"}
    {form_element field="back" class="btn btn-outline-primary"}
  {/form}
</div>
