<div class="manager_content subscriptionmanager-page inventorymanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header"><div class="subscriptionmanager-title"><span class="subscriptionmanager-title-icon"><i class="ti ti-packages"></i></span><div><span>Inventory Manager</span><h2>{echo phrase="INVENTORY_MANAGER_ITEMS"}</h2></div></div></div>
    {include file="../../modules/inventorymanager/templates/inventorymanager_nav.tpl"}
    <div class="subscriptionmanager-grid">
      <section class="subscriptionmanager-card">
        <div class="subscriptionmanager-card-header"><span><i class="ti ti-plus"></i></span><div><h3>Create Item</h3><p>Track physical items, services, variants, and bundle SKUs.</p></div></div>
        {form name="inventorymanager_item_create"}
          <div class="subscriptionmanager-form-grid">
            <div class="subscriptionmanager-field"><label class="form-label">{form_description field="sku"}</label>{form_element field="sku" size="20"}</div>
            <div class="subscriptionmanager-field"><label class="form-label">{form_description field="name"}</label>{form_element field="name" size="30"}</div>
            <div class="subscriptionmanager-field"><label class="form-label">{form_description field="item_type"}</label>{form_element field="item_type"}</div>
            <div class="subscriptionmanager-field"><label class="form-label">{form_description field="parent_itemid"}</label>{form_element field="parent_itemid" size="8"}</div>
            <div class="subscriptionmanager-field"><label class="form-label">{form_description field="reorder_threshold"}</label>{form_element field="reorder_threshold" value="0" size="8"}</div>
            <div class="subscriptionmanager-field subscriptionmanager-field-wide"><label class="form-label">{form_description field="description"}</label>{form_element field="description" cols="70" rows="3"}</div>
          </div>
          <div class="subscriptionmanager-actions">{form_element field="save"}</div>
        {/form}
      </section>
      <section class="subscriptionmanager-card subscriptionmanager-card-table">
        <div class="subscriptionmanager-card-header"><span><i class="ti ti-table"></i></span><div><h3>Items</h3><p>Use item IDs when syncing invoices, subscriptions, variants, or bundles.</p></div></div>
        <div class="subscriptionmanager-table-wrap"><table class="table subscriptionmanager-table"><thead><tr><th>ID</th><th>SKU</th><th>Name</th><th>Type</th><th>Total Stock</th><th>Low Alert</th></tr></thead><tbody>
          {foreach from=$items item=item}<tr><td>{$item.id}</td><td><strong>{$item.sku}</strong></td><td>{$item.name}</td><td><span class="subscriptionmanager-badge">{$item.item_type}</span></td><td>{$item.total_quantity}</td><td>{$item.reorder_threshold}</td></tr>{/foreach}
        </tbody></table></div>
      </section>
    </div>
  </div>
</div>
