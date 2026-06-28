<div class="subscriptionmanager-nav">
  {foreach from=$subscriptionManagerLinks item=link}
    <a href="{$link.url}" class="subscriptionmanager-nav-link">
      {if $link.title == "Create Plan"}
        <i class="ti ti-list-details"></i>
      {elseif $link.title == "Create Subscription"}
        <i class="ti ti-repeat"></i>
      {elseif $link.title == "Record Usage"}
        <i class="ti ti-chart-bar"></i>
      {elseif $link.title == "Run Billing"}
        <i class="ti ti-file-invoice"></i>
      {elseif $link.title == "Dunning Queue"}
        <i class="ti ti-alert-circle"></i>
      {elseif $link.title == "Settings"}
        <i class="ti ti-settings"></i>
      {/if}
      <span>{$link.title}</span>
    </a>
  {/foreach}
</div>
