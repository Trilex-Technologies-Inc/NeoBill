{form name="purchaseproduct"}
  <div class="order-page-heading">
    <span class="order-kicker">Register</span>
    <h2>Choose a product</h2>
  </div>

  <div class="card mb-4">
    <div class="card-header">
      <h5 class="mb-0">Product registration</h5>
    </div>
    <div class="card-body">
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="product"}</div>
        <div class="col-sm-8">{form_element field="product" onchange="submit()" value=$product class="form-select"}</div>
      </div>

      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="term"}</div>
        <div class="col-sm-8">{form_element field="term" class="form-select"}</div>
      </div>
    </div>
  </div>

  <div class="d-flex justify-content-between">
    <div>
      {if !$orderDBO->isEmpty()}
        {form_element field="cancel"}
      {/if}
    </div>
    <div>{form_element field="continue"}</div>
  </div>
{/form}
