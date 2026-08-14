{form name="creditcard"}
  <div class="card mb-4">
    <div class="card-header">
      <h5 class="mb-0"> {echo phrase="BILLING_INFORMATION"} </h5>
    </div>
    <div class="card-body">
      <p class="text-muted">{echo phrase="BILLING_INFO_NOTE"}</p>
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
        <div class="col-sm-4">{form_description field="country"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="country"}</div>
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
        <div class="col-sm-4">{form_description field="phone"}</div>
        <div class="col-sm-8">{form_element dbo="order" field="phone"}</div>
      </div>
    </div>
  </div>

  <div class="card mb-4">
    <div class="card-header">
      <h5 class="mb-0"> {echo phrase="CREDIT_CARD_INFORMATION"} </h5>
    </div>
    <div class="card-body">
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="cardnumber"}</div>
        <div class="col-sm-8">{form_element field="cardnumber" size="16"} {echo phrase="CARD_NUMBER_FORMAT"}</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="cardexpire"}</div>
        <div class="col-sm-8">{form_element field="cardexpire" size="5"} (MM/YY)</div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="cardcode"}</div>
        <div class="col-sm-8">{form_element field="cardcode" size="4"}</div>
      </div>
    </div>
  </div>

  <div class="d-flex justify-content-between">
    <div>{form_element field="startover"}</div>
    <div class="btn-group">
      {form_element field="back"}
      {form_element field="authorize"}
    </div>
  </div>
{/form}
