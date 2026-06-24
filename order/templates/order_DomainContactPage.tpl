<script type="text/javascript" src="./include.js"></script>

{form name="domain_contact"}
  <div class="order-page-heading">
    <span class="order-kicker">Domain contacts</span>
    <h2>{echo phrase="ENTER_DOMAIN_CONTACT_INFORMATION"}: {$fqdn}</h2>
  </div>

  <div class="card mb-4 domain-contact-card">
    <div class="card-header">
      <h5 class="mb-0">{echo phrase="ADMINISTRATIVE_CONTACT"}</h5>
    </div>
    <div class="card-body">
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="abusinessname"}</div>
        <div class="col-sm-8">{form_element field="abusinessname" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="acontactname"}</div>
        <div class="col-sm-8">{form_element field="acontactname" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="acontactemail"}</div>
        <div class="col-sm-8">{form_element field="acontactemail" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="aaddress1"}</div>
        <div class="col-sm-8">{form_element field="aaddress1" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4"></div>
        <div class="col-sm-8">{form_element field="aaddress2" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4"></div>
        <div class="col-sm-8">{form_element field="aaddress3" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="acity"}</div>
        <div class="col-sm-8">{form_element field="acity" size="30"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="astate"}</div>
        <div class="col-sm-8">{form_element field="astate" size="30"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="apostalcode"}</div>
        <div class="col-sm-8">{form_element field="apostalcode" size="10"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="acountry"}</div>
        <div class="col-sm-8">{form_element field="acountry"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="aphone"}</div>
        <div class="col-sm-8">{form_element field="aphone"}</div>
      </div>
      <div class="row mb-0">
        <div class="col-sm-4">{form_description field="afax"}</div>
        <div class="col-sm-8">{form_element field="afax"}</div>
      </div>
    </div>
  </div>

  <div class="card mb-4 domain-contact-card">
    <div class="card-header domain-contact-card-header">
      <h5 class="mb-0">{echo phrase="BILLING_CONTACT"}</h5>
      <label class="form-check mb-0">
        <input name="billingcopy" value="true" type="checkbox" onclick="adminToBilling( this.form );">
        <span>{echo phrase="USE_ADMIN_CONTACT"}</span>
      </label>
    </div>
    <div class="card-body">
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="bbusinessname"}</div>
        <div class="col-sm-8">{form_element field="bbusinessname" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="bcontactname"}</div>
        <div class="col-sm-8">{form_element field="bcontactname" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="bcontactemail"}</div>
        <div class="col-sm-8">{form_element field="bcontactemail" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="baddress1"}</div>
        <div class="col-sm-8">{form_element field="baddress1" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4"></div>
        <div class="col-sm-8">{form_element field="baddress2" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4"></div>
        <div class="col-sm-8">{form_element field="baddress3" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="bcity"}</div>
        <div class="col-sm-8">{form_element field="bcity" size="30"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="bstate"}</div>
        <div class="col-sm-8">{form_element field="bstate" size="30"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="bpostalcode"}</div>
        <div class="col-sm-8">{form_element field="bpostalcode" size="10"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="bcountry"}</div>
        <div class="col-sm-8">{form_element field="bcountry"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="bphone"}</div>
        <div class="col-sm-8">{form_element field="bphone"}</div>
      </div>
      <div class="row mb-0">
        <div class="col-sm-4">{form_description field="bfax"}</div>
        <div class="col-sm-8">{form_element field="bfax"}</div>
      </div>
    </div>
  </div>

  <div class="card mb-4 domain-contact-card">
    <div class="card-header domain-contact-card-header">
      <h5 class="mb-0">{echo phrase="TECHNICAL_CONTACT"}</h5>
      <label class="form-check mb-0">
        <input name="techcopy" value="true" type="checkbox" onclick="billingToTech( this.form );">
        <span>{echo phrase="USE_BILLING_CONTACT"}</span>
      </label>
    </div>
    <div class="card-body">
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="tbusinessname"}</div>
        <div class="col-sm-8">{form_element field="tbusinessname" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="tcontactname"}</div>
        <div class="col-sm-8">{form_element field="tcontactname" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="tcontactemail"}</div>
        <div class="col-sm-8">{form_element field="tcontactemail" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="taddress1"}</div>
        <div class="col-sm-8">{form_element field="taddress1" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4"></div>
        <div class="col-sm-8">{form_element field="taddress2" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4"></div>
        <div class="col-sm-8">{form_element field="taddress3" size="50"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="tcity"}</div>
        <div class="col-sm-8">{form_element field="tcity" size="30"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="tstate"}</div>
        <div class="col-sm-8">{form_element field="tstate" size="30"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="tpostalcode"}</div>
        <div class="col-sm-8">{form_element field="tpostalcode" size="10"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="tcountry"}</div>
        <div class="col-sm-8">{form_element field="tcountry"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="tphone"}</div>
        <div class="col-sm-8">{form_element field="tphone"}</div>
      </div>
      <div class="row mb-0">
        <div class="col-sm-4">{form_description field="tfax"}</div>
        <div class="col-sm-8">{form_element field="tfax"}</div>
      </div>
    </div>
  </div>

  <div class="cart table-responsive">
    {form_table field="domains"}

      {form_table_column columnid=""}
        <div class="order-table-check">{form_table_checkbox option=$domains.orderitemid}</div>
      {/form_table_column}

      {form_table_column columnid="domainname" header="[DOMAIN_NAME]"}
        {$domains.domainname}
      {/form_table_column}

    {/form_table}
  </div>

  <div class="buttoncontainer order-actions">
    <div>{form_element field="startover"}</div>
    <div>
      {form_element field="back"}
      {form_element field="continue"}
    </div>
  </div>
{/form}
