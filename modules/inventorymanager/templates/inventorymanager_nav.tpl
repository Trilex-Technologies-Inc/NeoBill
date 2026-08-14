<div class="subscriptionmanager-nav inventorymanager-nav">
  {foreach from=$inventoryManagerLinks item=link}
    <a class="subscriptionmanager-nav-link" href="{$link.url}">{$link.title}</a>
  {/foreach}
</div>
