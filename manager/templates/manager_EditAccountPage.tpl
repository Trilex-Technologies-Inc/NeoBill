<div class="manager_content new-account-page edit-account-page">

{form name="edit_account"}

  <div class="new-account-shell">
    <div class="new-account-header">
      <div class="new-account-heading">
        <span class="new-account-icon"><i class="ti ti-user-edit"></i></span>
        <div>
          <span class="new-account-kicker">Accounts</span>
          <h2>Edit Account</h2>
          <p>Update profile, billing, and contact details for account #{dbo_echo dbo="account_dbo" field="id"}.</p>
        </div>
      </div>
      <a class="btn btn-outline-secondary btn-sm" href="manager_content.php?page=accounts_view_account&amp;account={dbo_echo dbo="account_dbo" field="id"}">
        <i class="ti ti-arrow-left"></i>
        View Account
      </a>
    </div>

    <div class="row g-4 new-account-grid">
      <div class="col-12 col-lg-6">
        <div class="new-account-card">
          <div class="new-account-card-header">
            <span><i class="ti ti-id"></i></span>
            <div>
              <h3>{echo phrase="ACCOUNT_INFORMATION"}</h3>
              <p>Adjust the account type, name, and operational status.</p>
            </div>
          </div>
          <div class="new-account-card-body">

            <div class="new-account-field">
              <div class="form-label">{form_description field="type" colon="false"}</div>

              <div class="new-account-choice-group">
                <div class="new-account-choice">
                  {form_element dbo="account_dbo" field="type" option="Individual Account" id="type_individual" hideoption="true"}
                  <label for="type_individual">
                    <i class="ti ti-user"></i>
                    <span>Individual Account</span>
                  </label>
                </div>
                <div class="new-account-choice">
                  {form_element dbo="account_dbo" field="type" option="Non-Profit Account" id="type_nonprofit" hideoption="true"}
                  <label for="type_nonprofit">
                    <i class="ti ti-heart-handshake"></i>
                    <span>Non-Profit Account</span>
                  </label>
                </div>
                <div class="new-account-choice">
                  {form_element dbo="account_dbo" field="type" option="Business Account" id="type_business" hideoption="true"}
                  <label for="type_business">
                    <i class="ti ti-building-store"></i>
                    <span>Business Account</span>
                  </label>
                </div>
              </div>
            </div>

            <div class="new-account-field">
              <label class="form-label" for="businessname">{form_description field="businessname" colon="false"}</label>
              {form_element dbo="account_dbo" field="businessname" id="businessname" size="60"}
            </div>

            <div class="new-account-field">
              <label class="form-label" for="status">{form_description field="status" colon="false"}</label>
              {form_element dbo="account_dbo" field="status" id="status"}
            </div>

          </div>
        </div>
      </div>

      <div class="col-12 col-lg-6">
        <div class="new-account-card">
          <div class="new-account-card-header">
            <span><i class="ti ti-receipt"></i></span>
            <div>
              <h3>{echo phrase="BILLING_INFORMATION"}</h3>
              <p>Control billing status and the monthly billing day.</p>
            </div>
          </div>
          <div class="new-account-card-body">

            <div class="new-account-field">
              <label class="form-label" for="billingstatus">{form_description field="billingstatus" colon="false"}</label>
              {form_element dbo="account_dbo" field="billingstatus" id="billingstatus"}
            </div>

            <div class="new-account-field">
              <label class="form-label" for="billingday">{form_description field="billingday" colon="false"}</label>
              {form_element dbo="account_dbo" field="billingday" id="billingday" size="2"}
              <div class="form-text">Use a day from 1 to 31.</div>
            </div>

          </div>
        </div>

        <div class="new-account-card mt-4">
          <div class="new-account-card-header">
            <span><i class="ti ti-address-book"></i></span>
            <div>
              <h3>{echo phrase="CONTACT_INFORMATION"}</h3>
              <p>Keep the primary contact and service address current.</p>
            </div>
          </div>
          <div class="new-account-card-body">

            <div class="new-account-field">
              <label class="form-label" for="contactname">{form_description field="contactname" colon="false"}</label>
              {form_element dbo="account_dbo" field="contactname" id="contactname" size="30"}
            </div>

            <div class="new-account-field">
              <label class="form-label" for="contactemail">{form_description field="contactemail" colon="false"}</label>
              {form_element dbo="account_dbo" field="contactemail" id="contactemail" size="30"}
            </div>

            <div class="new-account-field">
              <label class="form-label" for="address1">{form_description field="address1" colon="false"}</label>
              {form_element dbo="account_dbo" field="address1" id="address1" size="40"}
            </div>

            <div class="new-account-field">
              <label class="form-label" for="address2">{form_description field="address2" colon="false"}</label>
              {form_element dbo="account_dbo" field="address2" id="address2" size="40"}
            </div>

            <div class="row g-3">
              <div class="col-12 col-md-6">
                <div class="new-account-field">
                  <label class="form-label" for="city">{form_description field="city" colon="false"}</label>
                  {form_element dbo="account_dbo" field="city" id="city" size="30"}
                </div>
              </div>
              <div class="col-12 col-md-6">
                <div class="new-account-field">
                  <label class="form-label" for="state">{form_description field="state" colon="false"}</label>
                  {form_element dbo="account_dbo" field="state" id="state" size="20"}
                </div>
              </div>
            </div>

            <div class="row g-3">
              <div class="col-12 col-md-6">
                <div class="new-account-field">
                  <label class="form-label" for="postalcode">{form_description field="postalcode" colon="false"}</label>
                  {form_element dbo="account_dbo" field="postalcode" id="postalcode" size="10"}
                </div>
              </div>
              <div class="col-12 col-md-6">
                <div class="new-account-field">
                  <label class="form-label" for="country">{form_description field="country" colon="false"}</label>
                  {form_element dbo="account_dbo" field="country" id="country"}
                </div>
              </div>
            </div>

            <div class="row g-3">
              <div class="col-12 col-md-4">
                <div class="new-account-field">
                  <label class="form-label" for="phone">{form_description field="phone" colon="false"}</label>
                  {form_element dbo="account_dbo" field="phone" id="phone" size="15"}
                </div>
              </div>
              <div class="col-12 col-md-4">
                <div class="new-account-field">
                  <label class="form-label" for="mobilephone">{form_description field="mobilephone" colon="false"}</label>
                  {form_element dbo="account_dbo" field="mobilephone" id="mobilephone" size="15"}
                </div>
              </div>
              <div class="col-12 col-md-4">
                <div class="new-account-field">
                  <label class="form-label" for="fax">{form_description field="fax" colon="false"}</label>
                  {form_element dbo="account_dbo" field="fax" id="fax" size="15"}
                </div>
              </div>
            </div>

            <div class="new-account-actions">
              {form_element field="save"}
              {form_element field="cancel"}
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>

{/form}

</div>
