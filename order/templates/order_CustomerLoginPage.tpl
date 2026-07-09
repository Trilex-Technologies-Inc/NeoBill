{form name="login"}
  {if $turnstile_enabled}{$turnstile_script}{/if}
  <div class="card mb-4">
    <div class="card-header">
      <h5 class="mb-0"> {echo phrase="CUSTOMER_LOGIN"} </h5>
    </div>
    <div class="card-body">
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="user"}</div>
        <div class="col-sm-8">{form_element field="user"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="password"}</div>
        <div class="col-sm-8">{form_element field="password"}</div>
      </div>
      {if $turnstile_enabled}
        <div class="row mb-3">
          <div class="col-sm-4"></div>
          <div class="col-sm-8">{$turnstile_widget}</div>
        </div>
      {/if}
    </div>
  </div>

  <div class="d-flex justify-content-end gap-2">
    {form_element field="login"}
    {form_element field="back"}
  </div>
{/form}
