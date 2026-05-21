<div class="manager_content">
{form name="new_payment"}

  <div class="form">
    <div class="card shadow-sm">
      <div class="card-header bg-gradient bg-primary text-white">
        <div class="d-flex align-items-center">
          <i class="bi bi-credit-card fs-4 me-2"></i>
          <h5 class="mb-0">[ENTER_PAYMENT]</h5>
        </div>
      </div>
      
      <div class="card-body">
        
        <div class="row">
          <!-- Left Column -->
          <div class="col-md-6">
            <!-- Account -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {echo phrase="ACCOUNT"}:
              </label>
              <div class="col-sm-7">
                <p class="form-control-plaintext">
                  {dbo_echo dbo="account_dbo" field="accountname"}
                </p>
              </div>
            </div>

            <!-- Invoice -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="invoice"}
              </label>
              <div class="col-sm-7">
                {if isset($invoice_id)}
                  <p class="form-control-plaintext">
                    {echo phrase="INVOICE"} #{$invoice_id}
                  </p>
                {else}
                  {form_element field="invoice" class="form-select"}
                {/if}
              </div>
            </div>

            <!-- Date -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="date"}
              </label>
              <div class="col-sm-7">
                {form_element field="date" class="form-control"}
              </div>
            </div>

            <!-- Type -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="type"}
              </label>
              <div class="col-sm-7">
                {form_element field="type" class="form-select"}
              </div>
            </div>
          </div>

          <!-- Right Column -->
          <div class="col-md-6">
            <!-- Amount -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="amount"}
              </label>
              <div class="col-sm-7">
                <div class="input-group">
                  <span class="input-group-text">$</span>
                  {form_element field="amount" size="7" class="form-control"}
                </div>
              </div>
            </div>

            <!-- Transaction 1 -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="transaction1"}
              </label>
              <div class="col-sm-7">
                {form_element field="transaction1" size="20" class="form-control"}
              </div>
            </div>

            <!-- Transaction 2 -->
            <div class="row mb-3">
              <label class="col-sm-5 col-form-label fw-bold">
                {form_description field="transaction2"}
              </label>
              <div class="col-sm-7">
                {form_element field="transaction2" size="20" class="form-control"}
              </div>
            </div>

            <!-- Payment Summary Card -->
            <div class="card bg-light mt-2">
              <div class="card-body">
                <small class="text-muted">{echo phrase="PAYMENT_SUMMARY"}</small>
                <hr class="my-2">
                <div class="d-flex justify-content-between">
                  <span>{echo phrase="TOTAL_PAYMENT"}:</span>
                  <span class="fw-bold" id="payment_total">$0.00</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Buttons -->
        <div class="row mt-3">
          <div class="col-12">
            <hr>
            <div class="d-flex gap-2 justify-content-end">
              {form_element field="cancel" class="btn btn-outline-secondary"}
              {form_element field="continue" class="btn btn-primary px-4"}
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

{/form}
</div>