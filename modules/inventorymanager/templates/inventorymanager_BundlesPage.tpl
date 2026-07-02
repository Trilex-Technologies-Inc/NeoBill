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
      <div class="subscriptionmanager-card-header"><span><i class="ti ti-table"></i></span><div><h3>Bundle Components</h3><p>Edit component quantities or remove unused bundle links.</p></div></div>
      <div class="subscriptionmanager-plan-list">
        {foreach from=$components item=component}
          <div class="subscriptionmanager-plan-item">
            <div class="subscriptionmanager-plan-item-header">
              <div>
                <span class="subscriptionmanager-plan-meta">Component #{$component.id} &middot; Quantity {$component.quantity}</span>
                <strong>{$component.bundle_sku} {$component.bundle_name}</strong>
              </div>
              <span class="subscriptionmanager-badge">{$component.component_sku}</span>
            </div>
            {form name="inventorymanager_bundle_component_update"}
              <input type="hidden" name="componentid" value="{$component.id}"/>
              <div class="subscriptionmanager-form-grid subscriptionmanager-plan-edit-grid">
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="bundle_itemid"}</label>{form_element field="bundle_itemid" value=$component.bundle_itemid size="8"}</div>
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="component_itemid"}</label>{form_element field="component_itemid" value=$component.component_itemid size="8"}</div>
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="quantity"}</label>{form_element field="quantity" value=$component.quantity size="8"}</div>
                <div class="subscriptionmanager-field subscriptionmanager-field-wide"><label class="form-label">Current component</label><div class="subscriptionmanager-readonly">{$component.component_sku} {$component.component_name}</div></div>
              </div>
              <div class="subscriptionmanager-plan-actions">{form_element field="save" class="btn btn-primary"}</div>
            {/form}
            {form name="inventorymanager_bundle_component_delete"}
              <input type="hidden" name="componentid" value="{$component.id}"/>
              <div class="subscriptionmanager-plan-delete">{form_element field="delete" class="btn btn-outline-danger" onclick="return confirm('Delete this bundle component?');"}</div>
            {/form}
          </div>
        {/foreach}
      </div>
    </section>
  </div>
</div>
