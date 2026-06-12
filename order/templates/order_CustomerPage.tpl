{form name="customer_information"}
  <div class="card mb-4">
    <div class="card-header"><h5 class="mb-0">E-Mail</h5></div>
    <div class="card-body">
      <p>{echo phrase="EMAIL_TEXT"}</p>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="contactemail"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="contactemail" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="verifyemail"}</div>
        <div class="col-sm-8">{form_element field="verifyemail" size="50"}</div>
      </div>
    </div>
  </div>

  <div class="card mb-4">
    <div class="card-header"><h5 class="mb-0">{echo phrase="CONTACT_INFORMATION"}</h5></div>
    <div class="card-body">
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="businessname"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="businessname" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="contactname"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="contactname" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="address1"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="address1" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4"></div>
        <div class="col-sm-8">{form_element dbo="order" field="address2" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="city"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="city" size="30"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="state"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="state" size="30"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="postalcode"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="postalcode" size="10"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="country"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="country"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="phone"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="phone"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="mobilephone"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="mobilephone"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="fax"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="fax"}</div>
      </div>
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

  <div class="card mb-4">
    <div class="card-header"><h5 class="mb-0">Login</h5></div>
    <div class="card-body">
      <p>{echo phrase="LOGIN_TEXT"}</p>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="username"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="username"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="password"}</div>
        <div class="col-sm-8">{form_element field="password"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="repassword"}</div>
        <div class="col-sm-8">{form_element field="repassword"}</div>
      </div>
    </div>
  </div>

  <div class="card mb-4">
    <div class="card-header"><h5 class="mb-0">[ADDITIONAL_INFORMATION]</h5></div>
    <div class="card-body">
      <p>[FEEL_FREE_TO_USE_THIS_SPACE_TO_ASK_QUESTIONS_OR]:</p>
      {form_element field="note" rows="5" cols="60"}
    </div>
  </div>

  <div class="d-flex justify-content-between">
    <div>{form_element field="startover"}</div>
    <div class="btn-group">
      {form_element field="back"}
      {form_element field="continue"}
    </div>
  </div>
{/form}
