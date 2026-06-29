<div class="manager_content subscriptionmanager-page inventorymanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header"><div class="subscriptionmanager-title"><span class="subscriptionmanager-title-icon"><i class="ti ti-arrows-exchange"></i></span><div><span>Inventory Manager</span><h2>{echo phrase="INVENTORY_MANAGER_ADJUSTMENTS"}</h2></div></div></div>
    {include file="../../modules/inventorymanager/templates/inventorymanager_nav.tpl"}
    <section class="subscriptionmanager-card">
      <div class="subscriptionmanager-card-header"><span><i class="ti ti-adjustments"></i></span><div><h3>Adjust Stock</h3><p>Use positive numbers to receive stock and negative numbers to remove stock.</p></div></div>
      {form name="inventorymanager_stock_adjust"}
        <div class="subscriptionmanager-form-grid">
          <div class="subscriptionmanager-field"><label class="form-label">{form_description field="itemid"}</label>{form_element field="itemid" size="8"}</div>
          <div class="subscriptionmanager-field"><label class="form-label">{form_description field="locationid"}</label>{form_element field="locationid" size="8"}</div>
          <div class="subscriptionmanager-field"><label class="form-label">{form_description field="quantity_change"}</label>{form_element field="quantity_change" size="8"}</div>
          <div class="subscriptionmanager-field"><label class="form-label">{form_description field="note"}</label>{form_element field="note" size="30"}</div>
        </div>
        <div class="subscriptionmanager-actions">{form_element field="save"}</div>
      {/form}
    </section>
    <section class="subscriptionmanager-card subscriptionmanager-card-table">
      <h3>Current Stock</h3><div class="subscriptionmanager-table-wrap"><table class="table subscriptionmanager-table"><thead><tr><th>SKU</th><th>Item</th><th>Location</th><th>Qty</th><th>Alert At</th></tr></thead><tbody>{foreach from=$stock item=row}<tr><td>{$row.sku}</td><td>{$row.item_name}</td><td>{$row.location_name}</td><td>{$row.quantity}</td><td>{$row.reorder_threshold}</td></tr>{/foreach}</tbody></table></div>
      <h3>Recent Movements</h3><div class="subscriptionmanager-table-wrap"><table class="table subscriptionmanager-table"><thead><tr><th>Date</th><th>SKU</th><th>Location</th><th>Change</th><th>Reference</th><th>Note</th></tr></thead><tbody>{foreach from=$movements item=row}<tr><td>{$row.created}</td><td>{$row.sku}</td><td>{$row.location_name}</td><td>{$row.quantity_change}</td><td>{$row.reference_type} {$row.reference_id}</td><td>{$row.note}</td></tr>{/foreach}</tbody></table></div>
    </section>
  </div>
</div>
