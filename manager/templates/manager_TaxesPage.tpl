<div class="manager_content taxes-page">
  <div class="taxes-shell">
    <div class="taxes-header">
      <div class="taxes-title">
        <span class="taxes-icon"><i class="ti ti-receipt-tax"></i></span>
        <div>
          <span class="taxes-kicker">{echo phrase="BILLING_INVOICES"}</span>
          <h2>{echo phrase="TAXES"}</h2>
          <p>{echo phrase="TAX_RULES"}</p>
        </div>
      </div>

      <div class="taxes-actions">
        {form name="taxes_action"}
          {form_element field="add" class="btn btn-primary"}
        {/form}
      </div>
    </div>

    <div class="taxes-table-card">
      <div class="taxes-table-header">
        <div>
          <span>{echo phrase="TAX_RULES"}</span>
          <h3>{echo phrase="TAXES"}</h3>
        </div>
        <a class="taxes-link-button" href="manager_content.php?page=add_tax_rule">
          <i class="ti ti-plus"></i>
          {echo phrase="NEW_TAX_RULE"}
        </a>
      </div>

      <div class="table-responsive taxes-table-wrap">
        {form name="tax_rules"}
          {form_table field="rules" class="table table-sm table-hover align-middle mb-0"}

            {form_table_column columnid=""}
              <span class="taxes-check">{form_table_checkbox option=$rules.id}</span>
            {/form_table_column}

            {form_table_column columnid="id" header="[ID]"}
              <span class="taxes-id">#{$rules.id}</span>
            {/form_table_column}

            {form_table_column columnid="country" header="[COUNTRY]"}
              <span class="taxes-country">{$rules.country|country}</span>
            {/form_table_column}

            {form_table_column columnid="state" header="[STATE]"}
              {if $rules.allstates == "Yes"}
                <span class="taxes-state taxes-state-all">[ALL]</span>
              {else}
                <span class="taxes-state">{$rules.state}</span>
              {/if}
            {/form_table_column}

            {form_table_column columnid="description" header="[DESCRIPTION]"}
              <span class="taxes-description">{$rules.description}</span>
            {/form_table_column}

            {form_table_column columnid="rate" header="[TAX_RATE]"}
              <span class="taxes-rate">{$rules.rate}%</span>
            {/form_table_column}

            {form_table_footer}
              <div class="taxes-remove-actions">
                {form_element field="remove" class="btn btn-outline-danger"}
              </div>
            {/form_table_footer}

          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>
