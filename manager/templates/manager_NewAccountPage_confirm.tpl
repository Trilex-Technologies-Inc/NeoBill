<div class="manager_content">

<p class="message alert alert-info"> 
  {echo phrase="ACCOUNT_CONFIRM"}
</p>

{form name="new_account_confirm"}

  <h2 class="mb-4">{echo phrase="CREATE_ACCOUNT"}</h2>

  <div class="properties">
    <div class="card">
      <div class="card-body">
        
        <div class="row">
          <!-- Column 1 -->
          <div class="col-md-6">
            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="ACCOUNT_NAME"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="accountname"}
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="ACCOUNT_TYPE"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="type"}
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="ACCOUNT_STATUS"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="status"}
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                [USERNAME]:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="user_dbo" field="username"}
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="BILLING_STATUS"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="billingstatus"}
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="BILLING_DAY"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="billingday"}
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="CONTACT_NAME"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="contactname"}
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="CONTACT_EMAIL"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="contactemail"}
              </div>
            </div>
          </div>

          <!-- Column 2 -->
          <div class="col-md-6">
            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="ADDRESS"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="address1"} <br/>
                {dbo_echo dbo="new_account_dbo" field="address2"} <br/>
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="CITY"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="city"}
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="STATE"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="state"}
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="ZIP_POSTAL_CODE"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="postalcode"}
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="COUNTRY"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo|country dbo="new_account_dbo" field="country"}
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="PHONE"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="phone"}
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="MOBILE_PHONE"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="mobilephone"}
              </div>
            </div>

            <div class="row mb-3">
              <div class="col-sm-5 fw-bold">
                {echo phrase="FAX"}:
              </div>
              <div class="col-sm-7">
                {dbo_echo dbo="new_account_dbo" field="fax"}
              </div>
            </div>
          </div>
        </div>

        <!-- Buttons -->
        <div class="row mt-4">
          <div class="col-12">
            <div class="d-flex gap-2 justify-content-center justify-content-md-start">
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