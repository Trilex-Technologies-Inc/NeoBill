<div class="manager_content add-tax-rule-page">
  <div class="add-tax-rule-shell">
    {form name="new_tax_rule"}
      <div class="add-tax-rule-header">
        <div class="add-tax-rule-title">
          <span class="add-tax-rule-icon"><i class="ti ti-receipt-tax"></i></span>
          <div>
            <span class="add-tax-rule-kicker">{echo phrase="TAXES"}</span>
            <h2>{echo phrase="NEW_TAX_RULE"}</h2>
            <p>{echo phrase="TAX_RULES"}</p>
          </div>
        </div>

        <a class="add-tax-rule-back" href="manager_content.php?page=taxes">
          <i class="ti ti-arrow-left"></i>
          {echo phrase="TAXES"}
        </a>
      </div>

      <div class="add-tax-rule-grid">
        <div class="add-tax-rule-card">
          <div class="add-tax-rule-card-header">
            <span><i class="ti ti-percentage"></i></span>
            <div>
              <h3>{form_description field="rate"}</h3>
              <p>{form_description field="country"}</p>
            </div>
          </div>

          <div class="add-tax-rule-card-body">
            <div class="add-tax-rule-field">
              <label class="form-label">{form_description field="rate"}</label>
              <div class="add-tax-rule-rate">
                {form_element field="rate" size="4" class="form-control"}
                <span>%</span>
              </div>
            </div>

            <div class="add-tax-rule-field">
              <label class="form-label">{form_description field="country"}</label>
              <div class="add-tax-rule-input-icon">
                <i class="ti ti-world"></i>
                {form_element field="country" class="form-select"}
              </div>
            </div>

            <div class="add-tax-rule-field add-tax-rule-check-field">
              <label>
                {form_element field="allstates" option="true" class="form-check-input"}
                <span>{form_description field="allstates"}</span>
              </label>
            </div>

            <div class="add-tax-rule-field">
              <label class="form-label">{form_description field="state"}</label>
              <div class="add-tax-rule-input-icon">
                <i class="ti ti-map-pin"></i>
                {form_element field="state" size="20" class="form-control"}
              </div>
            </div>
          </div>
        </div>

        <div class="add-tax-rule-card">
          <div class="add-tax-rule-card-header">
            <span><i class="ti ti-notes"></i></span>
            <div>
              <h3>{form_description field="description"}</h3>
              <p>{echo phrase="DESCRIPTION"}</p>
            </div>
          </div>

          <div class="add-tax-rule-card-body">
            <div class="add-tax-rule-field">
              <label class="form-label">{form_description field="description"}</label>
              <div class="add-tax-rule-input-icon">
                <i class="ti ti-file-description"></i>
                {form_element field="description" size="40" class="form-control"}
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="add-tax-rule-actions">
        {form_element field="cancel" class="btn btn-outline-secondary"}
        {form_element field="continue" class="btn btn-primary"}
      </div>
    {/form}
  </div>
</div>
