<div class="manager_content subscriptionmanager-page inventorymanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header"><div class="subscriptionmanager-title"><span class="subscriptionmanager-title-icon"><i class="ti ti-box-multiple"></i></span><div><span>Inventory Manager</span><h2>{echo phrase="INVENTORY_MANAGER_BUNDLES"}</h2></div></div></div>
    {include file="../../modules/inventorymanager/templates/inventorymanager_nav.tpl"}
    <section class="subscriptionmanager-card">
      <div class="subscriptionmanager-card-header"><span><i class="ti ti-link-plus"></i></span><div><h3>Add Bundle Component</h3><p>Bundle SKUs decrement each component when invoiced or provisioned.</p></div></div>
      {form name="inventorymanager_bundle_component_create"}
        <div class="subscriptionmanager-form-grid">
          <div class="subscriptionmanager-field"><label class="form-label">{form_description field="bundle_itemid"}</label>{form_element field="bundle_itemid" size="8"}</div>
          <div class="subscriptionmanager-field"><label class="form-label">{form_description field="component_itemid"}</label>{form_element field="component_itemid" size="8"}</div>
          <div class="subscriptionmanager-field"><label class="form-label">{form_description field="quantity"}</label>{form_element field="quantity" value="1" size="8"}</div>
        </div>
        <div class="subscriptionmanager-actions">{form_element field="save"}</div>
      {/form}
    </section>
    <section class="subscriptionmanager-card subscriptionmanager-card-table">
      <div class="subscriptionmanager-table-wrap"><table class="table subscriptionmanager-table"><thead><tr><th>Bundle</th><th>Component</th><th>Quantity</th></tr></thead><tbody>{foreach from=$components item=component}<tr><td><strong>{$component.bundle_sku}</strong> {$component.bundle_name}</td><td><strong>{$component.component_sku}</strong> {$component.component_name}</td><td>{$component.quantity}</td></tr>{/foreach}</tbody></table></div>
    </section>
  </div>
</div>
