<div class="manager_content subscriptionmanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header">
      <div class="subscriptionmanager-title">
        <span class="subscriptionmanager-title-icon"><i class="ti ti-list-details"></i></span>
        <div>
          <span>Subscription Manager</span>
          <h2>{echo phrase="SUBSCRIPTION_MANAGER_PLANS"}</h2>
        </div>
      </div>
    </div>

    {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

    <div class="subscriptionmanager-grid">
      <section class="subscriptionmanager-card">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-plus"></i></span>
          <div>
            <h3>Create Plan</h3>
            <p>Define the plan, cycle, price, trial, and usage rules.</p>
          </div>
        </div>
        {form name="subscriptionmanager_plan_create"}
          <div class="subscriptionmanager-form-grid">
            <div class="subscriptionmanager-field subscriptionmanager-field-wide">
              <label class="form-label">{form_description field="name"}</label>
              {form_element field="name" size="40"}
            </div>
            <div class="subscriptionmanager-field subscriptionmanager-field-wide">
              <label class="form-label">{form_description field="description"}</label>
              {form_element field="description" cols="70" rows="4"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="billing_type"}</label>
              {form_element field="billing_type"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="billing_cycle"}</label>
              {form_element field="billing_cycle"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="cycle_interval"}</label>
              {form_element field="cycle_interval" value="1" size="5"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="amount"}</label>
              {form_element field="amount" value="0.00" size="10"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="included_quantity"}</label>
              {form_element field="included_quantity" value="0" size="10"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="unit_amount"}</label>
              {form_element field="unit_amount" value="0.0000" size="10"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="trial_days"}</label>
              {form_element field="trial_days" value="0" size="5"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="intro_amount"}</label>
              {form_element field="intro_amount" size="10"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="intro_cycles"}</label>
              {form_element field="intro_cycles" value="0" size="5"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="taxable"}</label>
              {form_element field="taxable"}
            </div>
          </div>
          <div class="subscriptionmanager-actions">{form_element field="save"}</div>
        {/form}
      </section>

      <section class="subscriptionmanager-card subscriptionmanager-card-table subscriptionmanager-plan-editor-card">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-table"></i></span>
          <div>
            <h3>{echo phrase="SUBSCRIPTION_MANAGER_EXISTING_PLANS"}</h3>
            <p>Edit plan details, pricing, status, or remove unused plans.</p>
          </div>
        </div>
        <div class="subscriptionmanager-plan-list">
          {foreach from=$plans item=plan}
            <div class="subscriptionmanager-plan-item">
              <div class="subscriptionmanager-plan-item-header">
                <div>
                  <span class="subscriptionmanager-plan-meta">
                    {echo phrase="SUBSCRIPTION_MANAGER_PLAN_ID"} #{$plan.id} &middot;
                    {echo phrase="SUBSCRIPTION_MANAGER_PRICE_ID"} #{$plan.priceid}
                  </span>
                  <strong>{$plan.name}</strong>
                </div>
                <span class="subscriptionmanager-badge">{$plan.status}</span>
              </div>

              {form name="subscriptionmanager_plan_update"}
                <input type="hidden" name="planid" value="{$plan.id}"/>
                <input type="hidden" name="priceid" value="{$plan.priceid}"/>
                <div class="subscriptionmanager-form-grid subscriptionmanager-plan-edit-grid">
                  <div class="subscriptionmanager-field">
                    <label class="form-label">{form_description field="name"}</label>
                    {form_element field="name" value=$plan.name size="30"}
                  </div>
                  <div class="subscriptionmanager-field">
                    <label class="form-label">{form_description field="status"}</label>
                    {form_element field="status" value=$plan.status}
                  </div>
                  <div class="subscriptionmanager-field subscriptionmanager-field-wide">
                    <label class="form-label">{form_description field="description"}</label>
                    {form_element field="description" value=$plan.description cols="60" rows="3"}
                  </div>
                  <div class="subscriptionmanager-field">
                    <label class="form-label">{form_description field="billing_type"}</label>
                    {form_element field="billing_type" value=$plan.billing_type}
                  </div>
                  <div class="subscriptionmanager-field">
                    <label class="form-label">{form_description field="billing_cycle"}</label>
                    {form_element field="billing_cycle" value=$plan.billing_cycle}
                  </div>
                  <div class="subscriptionmanager-field">
                    <label class="form-label">{form_description field="cycle_interval"}</label>
                    {form_element field="cycle_interval" value=$plan.cycle_interval size="5"}
                  </div>
                  <div class="subscriptionmanager-field">
                    <label class="form-label">{form_description field="amount"}</label>
                    {form_element field="amount" value=$plan.amount size="10"}
                  </div>
                  <div class="subscriptionmanager-field">
                    <label class="form-label">{form_description field="included_quantity"}</label>
                    {form_element field="included_quantity" value=$plan.included_quantity size="10"}
                  </div>
                  <div class="subscriptionmanager-field">
                    <label class="form-label">{form_description field="unit_amount"}</label>
                    {form_element field="unit_amount" value=$plan.unit_amount size="10"}
                  </div>
                  <div class="subscriptionmanager-field">
                    <label class="form-label">{form_description field="trial_days"}</label>
                    {form_element field="trial_days" value=$plan.trial_days size="5"}
                  </div>
                  <div class="subscriptionmanager-field">
                    <label class="form-label">{form_description field="intro_amount"}</label>
                    {form_element field="intro_amount" value=$plan.intro_amount size="10"}
                  </div>
                  <div class="subscriptionmanager-field">
                    <label class="form-label">{form_description field="intro_cycles"}</label>
                    {form_element field="intro_cycles" value=$plan.intro_cycles size="5"}
                  </div>
                  <div class="subscriptionmanager-field">
                    <label class="form-label">{form_description field="taxable"}</label>
                    {form_element field="taxable" value=$plan.taxable}
                  </div>
                </div>
                <div class="subscriptionmanager-plan-actions">
                  {form_element field="save" class="btn btn-primary"}
                </div>
              {/form}

              {form name="subscriptionmanager_plan_delete"}
                <input type="hidden" name="planid" value="{$plan.id}"/>
                <div class="subscriptionmanager-plan-delete">
                  {form_element field="delete" class="btn btn-outline-danger" onclick="return confirm('Delete this subscription plan?');"}
                </div>
              {/form}
            </div>
          {/foreach}
        </div>
      </section>
    </div>
  </div>
</div>
