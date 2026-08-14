<script type="text/javascript" src="javascript/purchasehostingpage.js"></script>

{form name="purchasehosting"}
  <div id="purchaseoption" class="card mb-4"></div>

  <div name="hostingoption" class="card mb-4">
    <div class="card-header"><h5 class="mb-0">[PLEASE_SELECT_A_HOSTING_OPTION]</h5></div>
    <div class="card-body">
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="hostingservice"}</div>
        <div class="col-sm-8">{form_element field="hostingservice" onchange="submit()" value=$service}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="hostingterm"}</div>
        <div class="col-sm-8">{form_element field="hostingterm"}</div>
      </div>
    </div>
  </div>
  
  <p/>

  {if $serviceDBO->isDomainRequired()}
    <div name="domainoption" class="card mb-4">
      <div class="card-header"><h5 class="mb-0">[PLEASE_SELECT_A_DOMAIN_OPTION]</h5></div>
      <div class="card-body">
        <div class="form-check mb-2">{form_element field="domainoption" id="New" option="New" onchange="showDomainBox()"}</div>
        <div class="form-check mb-2">{form_element field="domainoption" id="Transfer" option="Transfer" onchange="showDomainBox()"}</div>
        <div class="form-check mb-2">{form_element field="domainoption" id="InCart" option="InCart" onchange="showDomainBox()"}</div>
        <div class="form-check mb-3">{form_element field="domainoption" id="Existing" option="Existing" onchange="showDomainBox()"}</div>

        <div class="ps-3">
          <div id="newdomain" class="card card-body mb-3">
            <div class="row mb-3">
              <div class="col-sm-4">[REGISTER_NEW_DOMAIN]:</div>
              <div class="col-sm-8">{form_element field="registerdomainname" size="30" value=$domain}.{form_element field="registerdomaintld" onchange="submit()" value=$tld}</div>
            </div>
            <div class="row mb-3">
              <div class="col-sm-4">{form_description field="registerdomainterm"}</div>
              <div class="col-sm-8">{form_element field="registerdomainterm"}</div>
            </div>
          </div>

          <div id="transferdomain" class="card card-body mb-3">
            <div class="row mb-3">
              <div class="col-sm-4">[DOMAIN_TO_TRANSFER]:</div>
              <div class="col-sm-8">{form_element field="transferdomainname" size="30"}.{form_element field="transferdomaintld" onchange="submit()"}</div>
            </div>
            <div class="row mb-3">
              <div class="col-sm-4">{form_description field="transferdomainterm"}</div>
              <div class="col-sm-8">{form_element field="transferdomainterm"}</div>
            </div>
          </div>

          <div id="incartdomain" class="card card-body mb-3">
            <div class="row mb-3">
              <div class="col-sm-4">{form_description field="incartdomain"}</div>
              <div class="col-sm-8">{form_element field="incartdomain" empty="[THERE_ARE_NO_DOMAINS_IN_YOUR_CART]"}</div>
            </div>
          </div>

          <div id="existingdomain" class="card card-body mb-3">
            <div class="row mb-3">
              <div class="col-sm-4">[YOUR_EXISTING_DOMAIN]:</div>
              <div class="col-sm-8">{form_element field="existingdomainname" size="40"}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  {/if}

  <div class="d-flex justify-content-between">
    <div>
      {if !$orderDBO->isEmpty()}
        {form_element field="cancel"}
      {/if}
    </div>
    <div>{form_element field="continue"}</div>
  </div>
{/form}

<script type="text/javascript">
  showDomainBox();
</script>
