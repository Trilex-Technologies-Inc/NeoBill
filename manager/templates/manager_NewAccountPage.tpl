<div class="manager_content">

{form name="new_account"}

  <div class="container-fluid px-0">
    <h2 class="mb-4">{echo phrase="CREATE_ACCOUNT"}</h2>

    <div class="row g-3">
      <div class="col-12 col-lg-6">
        <div class="card">
          <div class="card-header">
            [ACCOUNT_INFORMATION]
          </div>
          <div class="card-body">

            <div class="mb-3">
              <div class="form-label fw-bold mb-2">{form_description field="type" colon="false"}</div>

              <div class="d-flex flex-column gap-2">
                <div class="form-check">
                  {form_element field="type" option="Individual Account" id="type_individual" hideoption="true"}
                  <label class="form-check-label" for="type_individual">Individual Account</label>
                </div>
                <div class="form-check">
                  {form_element field="type" option="Non-Profit Account" id="type_nonprofit" hideoption="true"}
                  <label class="form-check-label" for="type_nonprofit">Non-Profit Account</label>
                </div>
                <div class="form-check">
                  {form_element field="type" option="Business Account" id="type_business" hideoption="true"}
                  <label class="form-check-label" for="type_business">Business Account</label>
                </div>
              </div>
            </div>

            <div class="mb-3">
              <label class="form-label" for="businessname">{form_description field="businessname" colon="false"}</label>
              {form_element field="businessname" id="businessname"}
            </div>

            <div class="mb-3">
              <label class="form-label" for="status">{form_description field="status" colon="false"}</label>
              {form_element field="status" id="status"}
            </div>

            <div class="mb-3">
              <label class="form-label" for="username">{form_description field="username" colon="false"}</label>
              {form_element field="username" id="username"}
            </div>

            <div class="mb-3">
              <label class="form-label" for="password">{form_description field="password" colon="false"}</label>
              {form_element field="password" id="password"}
            </div>

          </div>
        </div>
      </div>

      <div class="col-12 col-lg-6">
        <div class="card">
          <div class="card-header">
            [BILLING_INFORMATION]
          </div>
          <div class="card-body">

            <div class="mb-3">
              <label class="form-label" for="billingstatus">{form_description field="billingstatus" colon="false"}</label>
              {form_element field="billingstatus" id="billingstatus"}
            </div>

            <div class="mb-3">
              <label class="form-label" for="billingday">{form_description field="billingday" colon="false"}</label>
              {form_element field="billingday" id="billingday"}
              <div class="form-text">1-31</div>
            </div>

          </div>
        </div>

        <div class="card mt-3">
          <div class="card-header">
            [CONTACT_INFORMATION]
          </div>
          <div class="card-body">

            <div class="mb-3">
              <label class="form-label" for="contactname">{form_description field="contactname" colon="false"}</label>
              {form_element field="contactname" id="contactname"}
            </div>

            <div class="mb-3">
              <label class="form-label" for="contactemail">{form_description field="contactemail" colon="false"}</label>
              {form_element field="contactemail" id="contactemail"}
            </div>

            <div class="mb-3">
              <label class="form-label" for="address1">{form_description field="address1" colon="false"}</label>
              {form_element field="address1" id="address1"}
            </div>

            <div class="mb-3">
              <label class="form-label" for="address2">{form_description field="address2" colon="false"}</label>
              {form_element field="address2" id="address2"}
            </div>

            <div class="row g-3">
              <div class="col-12 col-md-6">
                <label class="form-label" for="city">{form_description field="city" colon="false"}</label>
                {form_element field="city" id="city"}
              </div>
              <div class="col-12 col-md-6">
                <label class="form-label" for="state">{form_description field="state" colon="false"}</label>
                {form_element field="state" id="state"}
              </div>
            </div>

            <div class="row g-3 mt-0">
              <div class="col-12 col-md-6">
                <label class="form-label" for="postalcode">{form_description field="postalcode" colon="false"}</label>
                {form_element field="postalcode" id="postalcode"}
              </div>
              <div class="col-12 col-md-6">
                <label class="form-label" for="country">{form_description field="country" colon="false"}</label>
                {form_element field="country" id="country"}
              </div>
            </div>

            <div class="row g-3 mt-0">
              <div class="col-12 col-md-4">
                <label class="form-label" for="phone">{form_description field="phone" colon="false"}</label>
                {form_element field="phone" id="phone"}
              </div>
              <div class="col-12 col-md-4">
                <label class="form-label" for="mobilephone">{form_description field="mobilephone" colon="false"}</label>
                {form_element field="mobilephone" id="mobilephone"}
              </div>
              <div class="col-12 col-md-4">
                <label class="form-label" for="fax">{form_description field="fax" colon="false"}</label>
                {form_element field="fax" id="fax"}
              </div>
            </div>

            <div class="d-flex gap-2 mt-4">
              {form_element field="continue"}
              {form_element field="cancel"}
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>

{/form}

</div>
