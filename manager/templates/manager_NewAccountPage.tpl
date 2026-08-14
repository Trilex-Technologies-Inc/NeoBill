<div class="manager_content new-account-page">

{form name="new_account"}

  <div class="new-account-shell">
    <div class="new-account-header">
      <div class="new-account-heading">
        <span class="new-account-icon"><i class="ti ti-user-plus"></i></span>
        <div>
          <span class="new-account-kicker">Accounts</span>
          <h2>{echo phrase="CREATE_ACCOUNT"}</h2>
          <p>Create a customer profile, login credentials, billing settings, and contact details.</p>
        </div>
      </div>
      <a class="btn btn-outline-secondary btn-sm" href="manager_content.php?page=accounts_browse">
        <i class="ti ti-arrow-left"></i>
        Active Accounts
      </a>
    </div>

    <div class="row g-4 new-account-grid">
      <div class="col-12 col-lg-6">
        <div class="new-account-card">
          <div class="new-account-card-header">
            <span><i class="ti ti-id"></i></span>
            <div>
              <h3>[ACCOUNT_INFORMATION]</h3>
              <p>Choose the account type and create manager access.</p>
            </div>
          </div>
          <div class="new-account-card-body">

            <div class="new-account-field">
              <div class="form-label">{form_description field="type" colon="false"}</div>

              <div class="new-account-choice-group">
                <div class="new-account-choice">
                  {form_element field="type" option="Individual Account" id="type_individual" hideoption="true"}
                  <label for="type_individual">
                    <i class="ti ti-user"></i>
                    <span>Individual Account</span>
                  </label>
                </div>
                <div class="new-account-choice">
                  {form_element field="type" option="Non-Profit Account" id="type_nonprofit" hideoption="true"}
                  <label for="type_nonprofit">
                    <i class="ti ti-heart-handshake"></i>
                    <span>Non-Profit Account</span>
                  </label>
                </div>
                <div class="new-account-choice">
                  {form_element field="type" option="Business Account" id="type_business" hideoption="true"}
                  <label for="type_business">
                    <i class="ti ti-building-store"></i>
                    <span>Business Account</span>
                  </label>
                </div>
              </div>
            </div>

            <div class="new-account-field">
              <label class="form-label" for="businessname">{form_description field="businessname" colon="false"}</label>
              {form_element field="businessname" id="businessname"}
            </div>

            <div class="new-account-field">
              <label class="form-label" for="status">{form_description field="status" colon="false"}</label>
              {form_element field="status" id="status"}
            </div>

            <div class="new-account-field">
              <label class="form-label" for="username">{form_description field="username" colon="false"}</label>
              {form_element field="username" id="username"}
            </div>

            <div class="new-account-field">
              <label class="form-label" for="password">{form_description field="password" colon="false"}</label>
              {form_element field="password" id="password"}
            </div>

          </div>
        </div>
      </div>

      <div class="col-12 col-lg-6">
        <div class="new-account-card">
          <div class="new-account-card-header">
            <span><i class="ti ti-receipt"></i></span>
            <div>
              <h3>[BILLING_INFORMATION]</h3>
              <p>Set billing behavior for the new customer.</p>
            </div>
          </div>
          <div class="new-account-card-body">

            <div class="new-account-field">
              <label class="form-label" for="billingstatus">{form_description field="billingstatus" colon="false"}</label>
              {form_element field="billingstatus" id="billingstatus"}
            </div>

            <div class="new-account-field">
              <label class="form-label" for="billingday">{form_description field="billingday" colon="false"}</label>
              {form_element field="billingday" id="billingday"}
              <div class="form-text">Use a day from 1 to 31.</div>
            </div>

          </div>
        </div>

        <div class="new-account-card mt-4">
          <div class="new-account-card-header">
            <span><i class="ti ti-address-book"></i></span>
            <div>
              <h3>[CONTACT_INFORMATION]</h3>
              <p>Add the primary contact and service address.</p>
            </div>
          </div>
          <div class="new-account-card-body">

            <div class="new-account-field">
              <label class="form-label" for="contactname">{form_description field="contactname" colon="false"}</label>
              {form_element field="contactname" id="contactname"}
            </div>

            <div class="new-account-field">
              <label class="form-label" for="contactemail">{form_description field="contactemail" colon="false"}</label>
              {form_element field="contactemail" id="contactemail"}
            </div>

            <div class="new-account-field">
              <label class="form-label" for="address1">{form_description field="address1" colon="false"}</label>
              {form_element field="address1" id="address1"}
            </div>

            <div class="new-account-field">
              <label class="form-label" for="address2">{form_description field="address2" colon="false"}</label>
              {form_element field="address2" id="address2"}
            </div>

            <div class="row g-3">
              <div class="col-12 col-md-6">
                <div class="new-account-field">
                  <label class="form-label" for="city">{form_description field="city" colon="false"}</label>
                  {form_element field="city" id="city"}
                </div>
              </div>
              <div class="col-12 col-md-6">
                <div class="new-account-field">
                  <label class="form-label" for="state">{form_description field="state" colon="false"}</label>
                  {form_element field="state" id="state"}
                </div>
              </div>
            </div>

            <div class="row g-3">
              <div class="col-12 col-md-6">
                <div class="new-account-field">
                  <label class="form-label" for="postalcode">{form_description field="postalcode" colon="false"}</label>
                  {form_element field="postalcode" id="postalcode"}
                </div>
              </div>
              <div class="col-12 col-md-6">
                <div class="new-account-field">
                  <label class="form-label" for="country">{form_description field="country" colon="false"}</label>
                  {form_element field="country" id="country"}
                </div>
              </div>
            </div>

            <div class="row g-3">
              <div class="col-12 col-md-4">
                <div class="new-account-field">
                  <label class="form-label" for="phone">{form_description field="phone" colon="false"}</label>
                  {form_element field="phone" id="phone"}
                </div>
              </div>
              <div class="col-12 col-md-4">
                <div class="new-account-field">
                  <label class="form-label" for="mobilephone">{form_description field="mobilephone" colon="false"}</label>
                  {form_element field="mobilephone" id="mobilephone"}
                </div>
              </div>
              <div class="col-12 col-md-4">
                <div class="new-account-field">
                  <label class="form-label" for="fax">{form_description field="fax" colon="false"}</label>
                  {form_element field="fax" id="fax"}
                </div>
              </div>
            </div>

            <div class="new-account-actions">
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
