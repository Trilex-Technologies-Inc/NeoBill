<div class="manager_content subscriptionmanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header">
      <div class="subscriptionmanager-title">
        <span class="subscriptionmanager-title-icon"><i class="ti ti-repeat"></i></span>
        <div>
          <span>Subscription Manager</span>
          <h2>{echo phrase="SUBSCRIPTION_MANAGER_SUBSCRIPTIONS"}</h2>
        </div>
      </div>
    </div>

    {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

    <div class="subscriptionmanager-grid">
      <section class="subscriptionmanager-card">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-user-plus"></i></span>
          <div>
            <h3>{echo phrase="SUBSCRIPTION_MANAGER_CREATE_SUBSCRIPTION"}</h3>
            <p>Attach an account to a plan and start its billing cycle.</p>
          </div>
        </div>
        {form name="subscriptionmanager_subscription_create"}
          <div class="subscriptionmanager-form-grid">
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="accountid"}</label>
              <select name="accountid">
                <option value="">Select account</option>
                {foreach from=$accounts item=account}
                  <option value="{$account.id}">#{$account.id} {$account.account_name}</option>
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
                {foreach from=$plans item=plan}
                  <option value="{$plan.priceid}">#{$plan.priceid} {$plan.name} / {$plan.billing_cycle} {$plan.amount}</option>
                {/foreach}
              </select>
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="quantity"}</label>
              {form_element field="quantity" value="1" size="8"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="status"}</label>
              {form_element field="status"}
            </div>
            <div class="subscriptionmanager-field">
              <label class="form-label">{form_description field="start_date"}</label>
              {form_element field="start_date"}
            </div>
          </div>
          <div class="subscriptionmanager-actions">{form_element field="save"}</div>
        {/form}
      </section>

      <section class="subscriptionmanager-card subscriptionmanager-card-table subscriptionmanager-available-plans-card">
        <div class="subscriptionmanager-card-header">
          <span><i class="ti ti-list-search"></i></span>
          <div>
            <h3>{echo phrase="SUBSCRIPTION_MANAGER_AVAILABLE_PLANS"}</h3>
            <p>Choose one of these plans and prices in the subscription form.</p>
          </div>
        </div>
        <div class="subscriptionmanager-available-plan-list">
          {foreach from=$plans item=plan}
            <div class="subscriptionmanager-available-plan">
              <div class="subscriptionmanager-available-plan-main">
                <strong>{$plan.name}</strong>
                <span>{$plan.billing_cycle}</span>
              </div>
              <div class="subscriptionmanager-available-plan-meta">
                <span>Plan <strong>{$plan.name}</strong></span>
                <span>Price <strong>{$plan.billing_cycle}</strong></span>
                <span>Amount <strong>{$plan.amount}</strong></span>
              </div>
            </div>
          {/foreach}
        </div>
      </section>
    </div>

    <section class="subscriptionmanager-card subscriptionmanager-card-table">
      <div class="subscriptionmanager-card-header">
        <span><i class="ti ti-users"></i></span>
        <div>
          <h3>{echo phrase="SUBSCRIPTION_MANAGER_EXISTING_SUBSCRIPTIONS"}</h3>
          <p>Track status, next billing date, and current period end.</p>
        </div>
      </div>
      <div class="subscriptionmanager-table-wrap">
        <table class="table subscriptionmanager-table">
          <thead><tr><th>ID</th><th>Account</th><th>Plan</th><th>Status</th><th>Next Billing</th><th>Period End</th><th>Actions</th></tr></thead>
          <tbody>
            {foreach from=$subscriptions item=subscription}
              <tr>
                <td>{$subscription.id}</td>
                <td>#{$subscription.accountid} {$subscription.account_name}</td>
                <td><strong>{$subscription.planname}</strong></td>
                <td><span class="subscriptionmanager-badge">{$subscription.status}</span></td>
                <td>{$subscription.nextbillingdate}</td>
                <td>{$subscription.current_period_end}</td>
                <td><span class="subscriptionmanager-table-action-note">Edit below</span></td>
              </tr>
              <tr class="subscriptionmanager-edit-row">
                <td colspan="7">
                  {form name="subscriptionmanager_subscription_update"}
                    <input type="hidden" name="subscriptionid" value="{$subscription.id}"/>
                    <div class="subscriptionmanager-inline-edit-grid subscriptionmanager-inline-edit-grid-wide">
                      <div class="subscriptionmanager-field">
                        <label class="form-label">{form_description field="accountid"}</label>
                        <select name="accountid">
                          {foreach from=$accounts item=account}
                            <option value="{$account.id}"{if $account.id == $subscription.accountid} selected="selected"{/if}>#{$account.id} {$account.account_name}</option>
                          {/foreach}
                        </select>
                      </div>
                      <div class="subscriptionmanager-field">
                        <label class="form-label">{form_description field="planid"}</label>
                        <select name="planid">
                          {foreach from=$planChoices item=plan}
                            <option value="{$plan.id}"{if $plan.id == $subscription.planid} selected="selected"{/if}>#{$plan.id} {$plan.name}</option>
                          {/foreach}
                        </select>
                      </div>
                      <div class="subscriptionmanager-field">
                        <label class="form-label">{form_description field="priceid"}</label>
                        <select name="priceid">
                          {foreach from=$plans item=plan}
                            <option value="{$plan.priceid}"{if $plan.priceid == $subscription.priceid} selected="selected"{/if}>#{$plan.priceid} {$plan.name} / {$plan.billing_cycle} {$plan.amount}</option>
                          {/foreach}
                        </select>
                      </div>
                      <div class="subscriptionmanager-field">
                        <label class="form-label">{form_description field="quantity"}</label>
                        {form_element field="quantity" value=$subscription.quantity size="8"}
                      </div>
                      <div class="subscriptionmanager-field">
                        <label class="form-label">{form_description field="status"}</label>
                        {form_element field="status" value=$subscription.status}
                      </div>
                      <div class="subscriptionmanager-field">
                        <label class="form-label">{form_description field="current_period_start"}</label>
                        {form_element field="current_period_start" value=$subscription.current_period_start}
                      </div>
                      <div class="subscriptionmanager-field">
                        <label class="form-label">{form_description field="current_period_end"}</label>
                        {form_element field="current_period_end" value=$subscription.current_period_end}
                      </div>
                      <div class="subscriptionmanager-field">
                        <label class="form-label">{form_description field="nextbillingdate"}</label>
                        {form_element field="nextbillingdate" value=$subscription.nextbillingdate}
                      </div>
                      <div class="subscriptionmanager-row-actions">
                        {form_element field="save" class="btn btn-primary"}
                      </div>
                    </div>
                  {/form}
                  {form name="subscriptionmanager_subscription_delete"}
                    <input type="hidden" name="subscriptionid" value="{$subscription.id}"/>
                    <div class="subscriptionmanager-row-delete">
                      {form_element field="delete" class="btn btn-outline-danger" onclick="return confirm('Delete this subscription and related usage/dunning rows?');"}
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
