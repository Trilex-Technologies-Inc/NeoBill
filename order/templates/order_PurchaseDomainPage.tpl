<script type="text/javascript" src="javascript/purchasedomainpage.js"></script>

{form name="purchasedomain"}
  <div class="card mb-4">
    <div class="card-header"><h5 class="mb-0">[PURCHASE_A_DOMAIN]</h5></div>
    <div class="card-body">
      <div class="form-check mb-2">{form_element field="domainoption" id="New" option="New"}</div>
      <div class="form-check mb-3">{form_element field="domainoption" id="Transfer" option="Transfer"}</div>
      <div class="row mb-3">
        <label class="col-sm-4 col-form-label">[DOMAIN_NAME]:</label>
        <div class="col-sm-8">{form_element field="domainname" size="30" value=$domain}.{form_element field="domaintld" onchange="submit()" value=$tld}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="domainterm"}</div>
        <div class="col-sm-8">{form_element field="domainterm"}</div>
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
