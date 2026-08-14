<div class="manager_content">

<p class="message alert alert-info"> 
  {echo phrase="CONFIRM_HOSTING"}
</p>

{form name="new_hosting_confirm"}

  <h2 class="mb-4">{echo phrase="ADD_HOSTING"}</h2>

  <div class="properties">
    <div class="card shadow-sm">
      <div class="card-body">
        
        <!-- Title -->
        <div class="row mb-3">
          <div class="col-sm-4 col-md-3 fw-bold">
            {echo phrase="TITLE"}:
          </div>
          <div class="col-sm-8 col-md-9">
            {dbo_echo dbo="new_hosting_dbo" field="title"}
          </div>
        </div>

        <!-- Description -->
        <div class="row mb-3">
          <div class="col-sm-4 col-md-3 fw-bold">
            {echo phrase="DESCRIPTION"}:
          </div>
          <div class="col-sm-8 col-md-9">
            <textarea class="form-control bg-light" cols="40" rows="3" readonly="readonly">{dbo_echo dbo="new_hosting_dbo" field="description"}</textarea>
          </div>
        </div>

        <hr class="my-3">

        <!-- Setup Prices Section -->
        <div class="row mb-2">
          <div class="col-12">
            <h5 class="text-muted mb-3">{echo phrase="SETUP_PRICES"}</h5>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-sm-4 col-md-3 fw-bold">
            {echo phrase="SETUP_PRICE"} (1 {echo phrase="MONTH"}):
          </div>
          <div class="col-sm-8 col-md-9">
            <span class="fw-bold text-primary">{dbo_echo|currency dbo="new_hosting_dbo" field="setupprice1mo"}</span>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-sm-4 col-md-3 fw-bold">
            {echo phrase="SETUP_PRICE"} (3 {echo phrase="MONTHS"}):
          </div>
          <div class="col-sm-8 col-md-9">
            <span class="fw-bold text-primary">{dbo_echo|currency dbo="new_hosting_dbo" field="setupprice3mo"}</span>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-sm-4 col-md-3 fw-bold">
            {echo phrase="SETUP_PRICE"} (6 {echo phrase="MONTHS"}):
          </div>
          <div class="col-sm-8 col-md-9">
            <span class="fw-bold text-primary">{dbo_echo|currency dbo="new_hosting_dbo" field="setupprice6mo"}</span>
          </div>
        </div>

        <div class="row mb-4">
          <div class="col-sm-4 col-md-3 fw-bold">
            {echo phrase="SETUP_PRICE"} (12 {echo phrase="MONTHS"}):
          </div>
          <div class="col-sm-8 col-md-9">
            <span class="fw-bold text-primary">{dbo_echo|currency dbo="new_hosting_dbo" field="setupprice12mo"}</span>
          </div>
        </div>

        <hr class="my-3">

        <!-- Recurring Prices Section -->
        <div class="row mb-2">
          <div class="col-12">
            <h5 class="text-muted mb-3">{echo phrase="RECURRING_PRICES"}</h5>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-sm-4 col-md-3 fw-bold">
            {echo phrase="RECURRING_PRICE"} (1 {echo phrase="MONTH"}):
          </div>
          <div class="col-sm-8 col-md-9">
            <span class="fw-bold text-success">{dbo_echo|currency dbo="new_hosting_dbo" field="price1mo"}</span>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-sm-4 col-md-3 fw-bold">
            {echo phrase="RECURRING_PRICE"} (3 {echo phrase="MONTHS"}):
          </div>
          <div class="col-sm-8 col-md-9">
            <span class="fw-bold text-success">{dbo_echo|currency dbo="new_hosting_dbo" field="price3mo"}</span>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-sm-4 col-md-3 fw-bold">
            {echo phrase="RECURRING_PRICE"} (6 {echo phrase="MONTHS"}):
          </div>
          <div class="col-sm-8 col-md-9">
            <span class="fw-bold text-success">{dbo_echo|currency dbo="new_hosting_dbo" field="price6mo"}</span>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-sm-4 col-md-3 fw-bold">
            {echo phrase="RECURRING_PRICE"} (12 {echo phrase="MONTHS"}):
          </div>
          <div class="col-sm-8 col-md-9">
            <span class="fw-bold text-success">{dbo_echo|currency dbo="new_hosting_dbo" field="price12mo"}</span>
          </div>
        </div>

        <!-- Taxable -->
        <div class="row mb-4">
          <div class="col-sm-4 col-md-3 fw-bold">
            {echo phrase="TAXABLE"}:
          </div>
          <div class="col-sm-8 col-md-9">
            {dbo_echo dbo="new_hosting_dbo" field="taxable"}
          </div>
        </div>

        <!-- Buttons -->
        <div class="row mt-4">
          <div class="col-12">
            <div class="d-flex gap-2 justify-content-center justify-content-md-start">
              {form_element field="continue"}
              {form_element field="goback"}
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

{/form}

</div>