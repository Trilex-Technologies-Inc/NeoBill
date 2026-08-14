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
    <div class="subscriptionmanager-grid subscriptionmanager-grid-narrow">
      <section class="subscriptionmanager-card">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-link"></i></span>
          <div>
            <h3>Link Product</h3>
            <p>When this product is ordered, a subscription is created for the selected plan price.</p>
          </div>
        </div>
        {form name="subscriptionmanager_product_map_create"}
          <div class="subscriptionmanager-form-grid">
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="productid"}</label>
              <select name="productid">
                <option value="">Select product</option>
                {foreach from=$products item=product}
                  <option value="{$product.id}">#{$product.id} {$product.name}</option>
                {/foreach}
              </select>
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="planid"}</label>
              <select name="planid">
                <option value="">Select plan</option>
                {foreach from=$planChoices item=plan}
                  <option value="{$plan.id}">#{$plan.id} {$plan.name}</option>
                {/foreach}
              </select>
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="priceid"}</label>
              <select name="priceid">
                <option value="">Select price</option>
                {foreach from=$priceChoices item=price}
                  <option value="{$price.priceid}">#{$price.priceid} {$price.plan_name} / {$price.billing_cycle} {$price.amount}</option>
                {/foreach}
              </select>
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="quantity"}</label>
              {form_element field="quantity" value="1" size="8"}
            </div>
          </div>
          <div class="subscriptionmanager-actions">{form_element field="save"}</div>
        {/form}
      </section>

      <section class="subscriptionmanager-card subscriptionmanager-card-table">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-table"></i></span>
          <div>
            <h3>Product Links</h3>
            <p>Linked product orders become subscription records during fulfillment.</p>
          </div>
        </div>
        <div class="subscriptionmanager-table-wrap">
          <table class="table subscriptionmanager-table">
            <thead><tr><th>Product</th><th>Plan</th><th>Price</th><th>Qty</th><th>Actions</th></tr></thead>
            <tbody>
              {foreach from=$productMaps item=map}
                <tr>
                  <td>#{$map.productid} {$map.product_name}</td>
                  <td>#{$map.planid} {$map.plan_name}</td>
                  <td>#{$map.priceid} {$map.billing_cycle} {$map.amount}</td>
                  <td>{$map.quantity}</td>
                  <td><span class="subscriptionmanager-table-action-note">Edit below</span></td>
                </tr>
                <tr class="subscriptionmanager-edit-row">
                  <td colspan="5">
                    {form name="subscriptionmanager_product_map_update"}
                      <input type="hidden" name="mapid" value="{$map.id}"/>
                      <div class="subscriptionmanager-inline-edit-grid">
                        <div class="subscriptionmanager-field">
                          <label class="form-label">{form_description field="productid"}</label>
                          <select name="productid">
                            {foreach from=$products item=product}
                              <option value="{$product.id}"{if $product.id == $map.productid} selected="selected"{/if}>#{$product.id} {$product.name}</option>
                            {/foreach}
                          </select>
                        </div>
                        <div class="subscriptionmanager-field">
                          <label class="form-label">{form_description field="planid"}</label>
                          <select name="planid">
                            {foreach from=$planChoices item=plan}
                              <option value="{$plan.id}"{if $plan.id == $map.planid} selected="selected"{/if}>#{$plan.id} {$plan.name}</option>
                            {/foreach}
                          </select>
                        </div>
                        <div class="subscriptionmanager-field">
                          <label class="form-label">{form_description field="priceid"}</label>
                          <select name="priceid">
                            {foreach from=$priceChoices item=price}
                              <option value="{$price.priceid}"{if $price.priceid == $map.priceid} selected="selected"{/if}>#{$price.priceid} {$price.plan_name} / {$price.billing_cycle} {$price.amount}</option>
                            {/foreach}
                          </select>
                        </div>
                        <div class="subscriptionmanager-field">
                          <label class="form-label">{form_description field="quantity"}</label>
                          {form_element field="quantity" value=$map.quantity size="8"}
                        </div>
                        <div class="subscriptionmanager-row-actions">
                          {form_element field="save" class="btn btn-primary"}
                        </div>
                      </div>
                    {/form}
                    {form name="subscriptionmanager_product_map_delete"}
                      <input type="hidden" name="mapid" value="{$map.id}"/>
                      <div class="subscriptionmanager-row-delete">
                        {form_element field="delete" class="btn btn-outline-danger" onclick="return confirm('Delete this product link?');"}
                      </div>
                    {/form}
                  </td>
                </tr>
              {/foreach}
            </tbody>
          </table>
        </div>
      </section>
    </div>
  </div>
</div>
