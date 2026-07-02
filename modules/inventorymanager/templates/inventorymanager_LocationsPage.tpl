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
      <div class="subscriptionmanager-card-header"><span><i class="ti ti-table"></i></span><div><h3>Locations</h3><p>Edit active inventory pools or remove unused locations.</p></div></div>
      <div class="subscriptionmanager-plan-list">
        {foreach from=$locations item=location}
          <div class="subscriptionmanager-plan-item">
            <div class="subscriptionmanager-plan-item-header">
              <div>
                <span class="subscriptionmanager-plan-meta">Location #{$location.id}</span>
                <strong>{$location.name}</strong>
              </div>
              <span class="subscriptionmanager-badge">{$location.location_type} / {$location.status}</span>
            </div>
            {form name="inventorymanager_location_update"}
              <input type="hidden" name="locationid" value="{$location.id}"/>
              <div class="subscriptionmanager-form-grid subscriptionmanager-plan-edit-grid">
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="name"}</label>{form_element field="name" value=$location.name size="30"}</div>
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="location_type"}</label>{form_element field="location_type" value=$location.location_type}</div>
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="status"}</label>{form_element field="status" value=$location.status}</div>
              </div>
              <div class="subscriptionmanager-plan-actions">{form_element field="save" class="btn btn-primary"}</div>
            {/form}
            {form name="inventorymanager_location_delete"}
              <input type="hidden" name="locationid" value="{$location.id}"/>
              <div class="subscriptionmanager-plan-delete">{form_element field="delete" class="btn btn-outline-danger" onclick="return confirm('Delete this inventory location?');"}</div>
            {/form}
          </div>
        {/foreach}
      </div>
    </section>
  </div>
</div>
