<div class="manager_content subscriptionmanager-page inventorymanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header"><div class="subscriptionmanager-title"><span class="subscriptionmanager-title-icon"><i class="ti ti-building-warehouse"></i></span><div><span>Inventory Manager</span><h2>{echo phrase="INVENTORY_MANAGER_LOCATIONS"}</h2></div></div></div>
    {include file="../../modules/inventorymanager/templates/inventorymanager_nav.tpl"}
    <section class="subscriptionmanager-card">
      <div class="subscriptionmanager-card-header"><span><i class="ti ti-plus"></i></span><div><h3>Add Location</h3><p>Separate stock by warehouse, storefront, or virtual inventory pool.</p></div></div>
      {form name="inventorymanager_location_create"}
        <div class="subscriptionmanager-form-grid">
          <div class="subscriptionmanager-field"><label class="form-label">{form_description field="name"}</label>{form_element field="name" size="30"}</div>
          <div class="subscriptionmanager-field"><label class="form-label">{form_description field="location_type"}</label>{form_element field="location_type"}</div>
        </div>
        <div class="subscriptionmanager-actions">{form_element field="save"}</div>
      {/form}
    </section>
    <section class="subscriptionmanager-card subscriptionmanager-card-table">
      <div class="subscriptionmanager-table-wrap"><table class="table subscriptionmanager-table"><thead><tr><th>ID</th><th>Name</th><th>Type</th><th>Status</th></tr></thead><tbody>{foreach from=$locations item=location}<tr><td>{$location.id}</td><td><strong>{$location.name}</strong></td><td>{$location.location_type}</td><td>{$location.status}</td></tr>{/foreach}</tbody></table></div>
    </section>
  </div>
</div>
