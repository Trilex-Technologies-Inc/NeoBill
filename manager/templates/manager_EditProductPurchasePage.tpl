{form name="edit_product_purchase"}
  <div class="card">
    <div class="card-header bg-primary text-white">
      <h3 class="h6 mb-0">{echo phrase="EDIT_PRODUCT_PURCHASE"}</h3>
    </div>
    <div class="card-body">
      
      <!-- Account -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {echo phrase="ACCOUNT"}:
        </div>
        <div class="col-md-8 p-2">
          <span class="fw-bold text-primary">{$purchaseDBO->getAccountName()}</span>
        </div>
      </div>
      
      <!-- Product -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {echo phrase="PRODUCT"}:
        </div>
        <div class="col-md-8 p-2">
          <span class="badge bg-info">{$purchaseDBO->getTitle()}</span>
        </div>
      </div>
      
      <!-- Purchased Date -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {echo phrase="PURCHASED"}:
        </div>
        <div class="col-md-8 p-2">
          <span class="badge bg-secondary">{$purchaseDBO->getDate()|datetime:date}</span>
        </div>
      </div>
      
      <!-- Term -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="term"}
        </div>
        <div class="col-md-8 p-2">
          {form_element field="term" value=$purchaseDBO->getTermID() class="form-select"}
        </div>
      </div>
      
      <!-- Next Billing Date -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="nextbillingdate"}
        </div>
        <div class="col-md-8 p-2">
          {form_element field="nextbillingdate" value=$purchaseDBO->getNextBillingDate() class="form-control"}
        </div>
      </div>
      
      <!-- Note -->
      <div class="row mb-3">
        <div class="col-md-4 fw-bold bg-light p-2 rounded">
          {form_description field="note"}
        </div>
        <div class="col-md-8 p-2">
          {form_element field="note" size="40" rows="4" cols="50" value=$purchaseDBO->getNote() class="form-control"}
        </div>
      </div>
      
    </div>
    <div class="card-footer d-flex justify-content-between">
      <div class="left">
        {form_element field="cancel" class="btn btn-secondary"}
      </div>
      <div class="right">
        {form_element field="save" class="btn btn-primary"}
      </div>
    </div>
  </div>
{/form}