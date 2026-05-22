<div class="manager_content">

<div class="alert alert-danger border-0 bg-danger bg-opacity-10 mb-4">
  <div class="d-flex align-items-center">
    <i class="bi bi-exclamation-octagon-fill fs-3 text-danger me-3"></i>
    <div>
      <strong class="fs-5">{echo phrase="DELETE_ACCOUNT"}</strong>
      <p class="mb-0 text-muted">Please review the account information below before confirming deletion.</p>
    </div>
  </div>
</div>

{form name="delete_account"}

  <h2 class="mb-4">
    <i class="bi bi-trash3-fill me-2 text-danger"></i>
    {echo phrase="ACCOUNT"} - {dbo_echo dbo="account_dbo" field="accountname"}
  </h2>

  <div class="properties">
    <div class="row g-4">
      <!-- Account Information Card -->
      <div class="col-lg-7">
        <div class="card shadow-sm h-100">
          <div class="card-header bg-white border-bottom">
            <h5 class="mb-0 text-danger">Account Details</h5>
          </div>
          
          <div class="card-body">
            
            <div class="row">
              <!-- Left Column -->
              <div class="col-md-6">
                <div class="mb-3">
                  <label class="text-muted small text-uppercase mb-1">{echo phrase="ACCOUNT_ID"}</label>
                  <div class="fw-bold">#{dbo_echo dbo="account_dbo" field="id"}</div>
                </div>
                
                <div class="mb-3">
                  <label class="text-muted small text-uppercase mb-1">{echo phrase="ACCOUNT_TYPE"}</label>
                  <div><span class="badge bg-info">{dbo_echo dbo="account_dbo" field="type"}</span></div>
                </div>
                
                <div class="mb-3">
                  <label class="text-muted small text-uppercase mb-1">{echo phrase="BILLING_STATUS"}</label>
                  <div><span class="badge bg-warning text-dark">{dbo_echo dbo="account_dbo" field="billingstatus"}</span></div>
                </div>
                
                <div class="mb-3">
                  <label class="text-muted small text-uppercase mb-1">{echo phrase="CONTACT_NAME"}</label>
                  <div><i class="bi bi-person me-1"></i> {dbo_echo dbo="account_dbo" field="contactname"}</div>
                </div>
              </div>
              
              <!-- Right Column -->
              <div class="col-md-6">
                <div class="mb-3">
                  <label class="text-muted small text-uppercase mb-1">{echo phrase="ACCOUNT_STATUS"}</label>
                  <div>
                    {if $account_dbo.status == 'active'}
                      <span class="badge bg-success">Active</span>
                    {else}
                      <span class="badge bg-secondary">{dbo_echo dbo="account_dbo" field="status"}</span>
                    {/if}
                  </div>
                </div>
                
                <div class="mb-3">
                  <label class="text-muted small text-uppercase mb-1">{echo phrase="BILLING_DAY"}</label>
                  <div><i class="bi bi-calendar me-1"></i> Day {dbo_echo dbo="account_dbo" field="billingday"}</div>
                </div>
                
                <div class="mb-3">
                  <label class="text-muted small text-uppercase mb-1">{echo phrase="CONTACT_EMAIL"}</label>
                  <div><i class="bi bi-envelope me-1"></i> {dbo_echo dbo="account_dbo" field="contactemail"}</div>
                </div>
              </div>
            </div>
            
            <hr>
            
            <div class="mb-3">
              <label class="text-muted small text-uppercase mb-1">{echo phrase="ADDRESS"}</label>
              <div>
                <i class="bi bi-house-door me-1"></i>
                {dbo_echo dbo="account_dbo" field="address1"}<br>
                {if $account_dbo.address2}{dbo_echo dbo="account_dbo" field="address2"}<br>{/if}
                {dbo_echo dbo="account_dbo" field="city"}, {dbo_echo dbo="account_dbo" field="state"} {dbo_echo dbo="account_dbo" field="postalcode"}<br>
                {dbo_echo dbo="account_dbo" field="country"}
              </div>
            </div>
            
            <hr>
            
            <div class="row">
              <div class="col-md-6">
                <div class="mb-3">
                  <label class="text-muted small text-uppercase mb-1">{echo phrase="PHONE"}</label>
                  <div><i class="bi bi-telephone me-1"></i> {dbo_echo dbo="account_dbo" field="phone"}</div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="mb-3">
                  <label class="text-muted small text-uppercase mb-1">{echo phrase="MOBILE_PHONE"}</label>
                  <div><i class="bi bi-phone me-1"></i> {dbo_echo dbo="account_dbo" field="mobilephone"}</div>
                </div>
              </div>
            </div>
            
          </div>
        </div>
      </div>
      
      <!-- Confirmation Card -->
      <div class="col-lg-5">
        <div class="card border-danger shadow-sm h-100">
          <div class="card-header bg-danger text-white">
            <h5 class="mb-0">
              <i class="bi bi-shield-exclamation me-2"></i>
              Confirm Deletion
            </h5>
          </div>
          
          <div class="card-body">
            <div class="text-center mb-3">
              <i class="bi bi-trash3 display-1 text-danger"></i>
            </div>
            
            <div class="alert alert-danger border-0 text-center">
              <strong>Warning!</strong>
              <p class="mb-0 small">This action is irreversible</p>
            </div>
            
            <div class="form-check mb-3">
              <input class="form-check-input" type="checkbox" id="confirm_del">
              <label class="form-check-label small" for="confirm_del">
                I confirm that I want to permanently delete this account
              </label>
            </div>
            
            <div class="mb-3">
              <label class="form-label small fw-bold">Additional Options:</label>
              <select class="form-select form-select-sm">
                <option>Delete all associated data</option>
                <option>Anonymize account data</option>
                <option>Archive data before deletion</option>
              </select>
            </div>
            
            <div class="d-flex gap-2 mt-4">
              {form_element field="cancel" class="btn btn-outline-secondary w-50"}
              {form_element field="delete" class="btn btn-danger w-50"}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

{/form}

</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const confirmCheckbox = document.getElementById('confirm_del');
  const deleteBtn = document.querySelector('input[name="delete"]');
  
  if (confirmCheckbox && deleteBtn) {
    deleteBtn.disabled = true;
    confirmCheckbox.addEventListener('change', function() {
      deleteBtn.disabled = !this.checked;
    });
  }
});
</script>