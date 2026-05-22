<div class="manager_content">

{form name="edit_account"}

  <!-- Account Type Section -->
  <div class="card mb-4">
    <div class="card-header bg-primary text-white">
      <h3 class="h6 mb-0">{echo phrase="ACCOUNT"} ({echo phrase="ID"}: {dbo_echo dbo="account_dbo" field="id"})</h3>
    </div>
    <div class="card-body">
      
      <!-- Account Type Radio Buttons -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="type"}
        </div>
        <div class="col-md-9 p-2">
          <div class="form-check mb-2">
            {form_element dbo="account_dbo" field="type" option="Business Account" class="form-check-input"}
            <label class="form-check-label">{echo phrase="BUSINESS_ACCOUNT"}</label>
          </div>
          <div class="form-check mb-2">
            {form_element dbo="account_dbo" field="type" option="Non-Profit Account" class="form-check-input"}
            <label class="form-check-label">{echo phrase="NON_PROFIT_ACCOUNT"}</label>
          </div>
          
          <!-- Business Name (indented) -->
          <div class="ms-4 mt-3">
            {form_description field="businessname"}
            {form_element dbo="account_dbo" field="businessname" size="60" class="form-control"}
          </div>
          
          <div class="form-check mt-2">
            {form_element dbo="account_dbo" field="type" option="Individual Account" class="form-check-input"}
            <label class="form-check-label">{echo phrase="INDIVIDUAL_ACCOUNT"}</label>
          </div>
        </div>
      </div>
      
      <!-- Status -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="status"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="status" class="form-select"}
        </div>
      </div>
      
    </div>
  </div>

  <!-- Billing Information Section -->
  <div class="card mb-4">
    <div class="card-header bg-secondary text-white">
      <h3 class="h6 mb-0">{echo phrase="BILLING_INFORMATION"}</h3>
    </div>
    <div class="card-body">
      
      <!-- Billing Status -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="billingstatus"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="billingstatus" class="form-select"}
        </div>
      </div>
      
      <!-- Billing Day -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="billingday"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="billingday" size="2" class="form-control w-auto"}
        </div>
      </div>
      
    </div>
  </div>

  <!-- Contact Information Section -->
  <div class="card mb-4">
    <div class="card-header bg-secondary text-white">
      <h3 class="h6 mb-0">{echo phrase="CONTACT_INFORMATION"}</h3>
    </div>
    <div class="card-body">
      
      <!-- Contact Name -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="contactname"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="contactname" size="30" class="form-control"}
        </div>
      </div>
      
      <!-- Contact Email -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="contactemail"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="contactemail" size="30" class="form-control"}
        </div>
      </div>
      
      <!-- Address 1 -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="address1"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="address1" size="40" class="form-control"}
        </div>
      </div>
      
      <!-- Address 2 -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="address2"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="address2" size="40" class="form-control"}
        </div>
      </div>
      
      <!-- City -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="city"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="city" size="30" class="form-control"}
        </div>
      </div>
      
      <!-- State -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="state"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="state" size="20" class="form-control"}
        </div>
      </div>
      
      <!-- Postal Code -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="postalcode"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="postalcode" size="10" class="form-control"}
        </div>
      </div>
      
      <!-- Country -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="country"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="country" class="form-select"}
        </div>
      </div>
      
      <!-- Phone -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="phone"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="phone" size="15" class="form-control"}
        </div>
      </div>
      
      <!-- Mobile Phone -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="mobilephone"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="mobilephone" size="15" class="form-control"}
        </div>
      </div>
      
      <!-- Fax -->
      <div class="row mb-3">
        <div class="col-md-3 fw-bold bg-light p-2 rounded">
          {form_description field="fax"}
        </div>
        <div class="col-md-9 p-2">
          {form_element dbo="account_dbo" field="fax" size="15" class="form-control"}
        </div>
      </div>
      
    </div>
  </div>
  
  <!-- Form Actions -->
  <div class="d-flex gap-2 justify-content-end">
    {form_element field="cancel" class="btn btn-secondary"}
    {form_element field="save" class="btn btn-primary"}
  </div>

{/form}

</div>