{form name="repeat_customer"}
  <div class="card mb-4">
    <div class="card-header"><h5 class="mb-0">Account Information</h5></div>
    <div class="card-body">
      <dl class="row mb-0">
        <dt class="col-sm-4">{echo phrase="BUSINESS_NAME"}:</dt>
        <dd class="col-sm-8">{dbo_echo dbo="order" field="businessname"}</dd>

        <dt class="col-sm-4">{echo phrase="CONTACT_NAME"}:</dt>
        <dd class="col-sm-8">{dbo_echo dbo="order" field="contactname"}</dd>

        <dt class="col-sm-4">{echo phrase="ADDRESS"}:</dt>
        <dd class="col-sm-8">{dbo_echo dbo="order" field="address1"}</dd>

        <dt class="col-sm-4"></dt>
        <dd class="col-sm-8">{dbo_echo dbo="order" field="address2"}</dd>

        <dt class="col-sm-4">{echo phrase="CITY"}:</dt>
        <dd class="col-sm-8">{dbo_echo dbo="order" field="city"}</dd>

        <dt class="col-sm-4">{echo phrase="STATE"}:</dt>
        <dd class="col-sm-8">{dbo_echo dbo="order" field="state"}</dd>

        <dt class="col-sm-4">{echo phrase="ZIP_POSTAL_CODE"}:</dt>
        <dd class="col-sm-8">{dbo_echo dbo="order" field="postalcode"}</dd>

        <dt class="col-sm-4">{echo phrase="COUNTRY"}:</dt>
        <dd class="col-sm-8">{dbo_echo|country dbo="order" field="country"}</dd>

        <dt class="col-sm-4">{echo phrase="PHONE"}:</dt>
        <dd class="col-sm-8">{dbo_echo dbo="order" field="phone"}</dd>

        <dt class="col-sm-4">{echo phrase="MOBILE_PHONE"}:</dt>
        <dd class="col-sm-8">{dbo_echo dbo="order" field="mobilephone"}</dd>

        <dt class="col-sm-4">{echo phrase="FAX"}:</dt>
        <dd class="col-sm-8">{dbo_echo dbo="order" field="fax"}</dd>
      </dl>
    </div>
  </div>

  {if $orderHasDomains}
    <div class="card mb-4">
      <div class="card-header"><h5 class="mb-0">{echo phrase="DOMAIN_CONTACT_INFORMATION"}</h5></div>
      <div class="card-body">
        <p>{echo phrase="DOMAIN_CONTACT_INFORMATION_TEXT"}</p>
        <div class="form-check mb-2">{form_element field="domaincontact" option="same"}</div>
        <div class="form-check">{form_element field="domaincontact" option="new"}</div>
      </div>
    </div>
  {else}
    <input type="hidden" name="domaincontact" value="same"/>
  {/if}

  <div class="d-flex justify-content-between">
    <div>{form_element field="startover"}</div>
    <div class="btn-group">
      {form_element field="back"}
      {form_element field="continue"}
    </div>
  </div>
{/form}
