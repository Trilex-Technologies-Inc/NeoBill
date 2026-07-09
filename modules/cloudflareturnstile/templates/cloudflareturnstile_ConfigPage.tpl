<div class="manager_content">
  <h2>{echo phrase="CLOUDFLARE_TURNSTILE_MODULE"}</h2>

  {form name="cloudflareturnstile_config"}
    <div class="card mb-4">
      <div class="card-header">
        <h5 class="mb-0">{echo phrase="CLOUDFLARE_TURNSTILE_MODULE"}</h5>
      </div>
      <div class="card-body">
        <div class="row g-3">
          <div class="col-12">
            <label class="form-label">{form_description field="site_key"}</label>
            {form_element field="site_key" value=$site_key size="70" class="form-control"}
          </div>

          <div class="col-12">
            <label class="form-label">{form_description field="secret_key"}</label>
            {if $secret_configured}
              {form_element field="secret_key" size="70" class="form-control" placeholder="Secret key is configured"}
              <div class="form-text">Secret key is configured. Enter a new value only to replace it.</div>
            {else}
              {form_element field="secret_key" size="70" class="form-control"}
            {/if}
          </div>

          <div class="col-12">
            <div class="alert alert-info mb-0">
              Enable or disable this module from the Modules page. Login protection becomes active when the module is enabled and both keys are configured.
            </div>
          </div>
        </div>
      </div>
      <div class="card-footer d-flex justify-content-end">
        {form_element field="save" class="btn btn-primary"}
      </div>
    </div>
  {/form}
</div>
