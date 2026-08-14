<div class="manager_content subscriptionmanager-page inventorymanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header"><div class="subscriptionmanager-title"><span class="subscriptionmanager-title-icon"><i class="ti ti-alert-triangle"></i></span><div><span>Inventory Manager</span><h2>{echo phrase="INVENTORY_MANAGER_ALERTS"}</h2></div></div></div>
    {include file="../../modules/inventorymanager/templates/inventorymanager_nav.tpl"}
    <section class="subscriptionmanager-card subscriptionmanager-card-table">
      <div class="subscriptionmanager-card-header"><span><i class="ti ti-bell"></i></span><div><h3>Low-Stock Alerts</h3><p>Items listed here are at or below their custom reorder threshold.</p></div></div>
      <div class="subscriptionmanager-table-wrap"><table class="table subscriptionmanager-table"><thead><tr><th>ID</th><th>SKU</th><th>Name</th><th>Total Stock</th><th>Threshold</th></tr></thead><tbody>{foreach from=$alerts item=alert}<tr><td>{$alert.id}</td><td><strong>{$alert.sku}</strong></td><td>{$alert.name}</td><td>{$alert.total_quantity}</td><td>{$alert.reorder_threshold}</td></tr>{/foreach}</tbody></table></div>
    </section>
  </div>
</div>
