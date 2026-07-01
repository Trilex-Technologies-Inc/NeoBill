{form name="purchasesubscription"}
  <div class="order-page-heading">
    <span class="order-kicker">Subscribe</span>
    <h2>Choose a subscription plan</h2>
  </div>

  <div class="card mb-4">
    <div class="card-header">
      <h5 class="mb-0">Available plans</h5>
    </div>
    <div class="card-body">
      <div class="row mb-3">
        <div class="col-sm-4">{form_description field="priceid"}</div>
        <div class="col-sm-8">
          <select name="priceid" class="form-select">
            {foreach from=$subscriptionOptions item=option}
              <option value="{$option.priceid}"{if $selectedPriceID == $option.priceid} selected="selected"{/if}>
                {$option.plan_name} - {$option.billing_cycle} - {$option.amount}
              </option>
            {/foreach}
          </select>
        </div>
      </div>

      <div class="table-responsive">
        <table class="table table-sm align-middle">
          <thead>
            <tr>
              <th>Plan</th>
              <th>Cycle</th>
              <th>Base</th>
              <th>Usage</th>
              <th>Trial</th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$subscriptionOptions item=option}
              <tr>
                <td><strong>{$option.plan_name}</strong><br/><small class="text-muted">#{$option.planid} / price #{$option.priceid}</small></td>
                <td>{$option.cycle_interval} {$option.billing_cycle}</td>
                <td>{$option.amount}</td>
                <td>{$option.included_quantity} included / {$option.unit_amount} unit</td>
                <td>{$option.trial_days} days</td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <div class="d-flex justify-content-between">
    <div>
      {if !$orderDBO->isEmpty()}
        {form_element field="cancel"}
      {/if}
    </div>
    <div>{form_element field="continue"}</div>
  </div>
{/form}
