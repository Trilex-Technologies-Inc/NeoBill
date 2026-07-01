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
      <input type="hidden" name="priceid" id="subscription-priceid" value="{$selectedPriceID}"/>

      <div class="subscription-plan-list" role="listbox" aria-label="Subscription plans">
        {foreach from=$subscriptionOptions item=option}
          <button
            type="button"
            class="subscription-plan-option{if $selectedPriceID == $option.priceid} is-selected{/if}"
            data-priceid="{$option.priceid}"
            role="option"
            aria-selected="{if $selectedPriceID == $option.priceid}true{else}false{/if}">
            <span class="subscription-plan-check"></span>
            <span class="subscription-plan-main">
              <strong>{$option.plan_name}</strong>
              <small>#{$option.planid} / price #{$option.priceid}</small>
            </span>
            <span class="subscription-plan-detail">
              <small>Cycle</small>
              <strong>{$option.cycle_interval} {$option.billing_cycle}</strong>
            </span>
            <span class="subscription-plan-detail">
              <small>Base</small>
              <strong>{$option.amount}</strong>
            </span>
            <span class="subscription-plan-detail">
              <small>Usage</small>
              <strong>{$option.included_quantity} included / {$option.unit_amount} unit</strong>
            </span>
            <span class="subscription-plan-detail">
              <small>Trial</small>
              <strong>{$option.trial_days} days</strong>
            </span>
          </button>
        {/foreach}
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

  {literal}
  <script type="text/javascript">
    (function () {
      var input = document.getElementById("subscription-priceid");
      var options = document.querySelectorAll(".subscription-plan-option");
      if (!input || !options.length) return;

      function selectOption(option) {
        input.value = option.getAttribute("data-priceid");
        Array.prototype.forEach.call(options, function (item) {
          item.classList.remove("is-selected");
          item.setAttribute("aria-selected", "false");
        });
        option.classList.add("is-selected");
        option.setAttribute("aria-selected", "true");
      }

      Array.prototype.forEach.call(options, function (option) {
        option.onclick = function () {
          selectOption(this);
        };
      });
    })();
  </script>
  {/literal}
{/form}
