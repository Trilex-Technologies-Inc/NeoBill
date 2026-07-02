<div class="manager_content subscriptionmanager-page inventorymanager-page">
  <div class="subscriptionmanager-shell">
    <div class="subscriptionmanager-header"><div class="subscriptionmanager-title"><span class="subscriptionmanager-title-icon"><i class="ti ti-arrows-exchange"></i></span><div><span>Inventory Manager</span><h2>{echo phrase="INVENTORY_MANAGER_ADJUSTMENTS"}</h2></div></div></div>
    {include file="../../modules/inventorymanager/templates/inventorymanager_nav.tpl"}
    <section class="subscriptionmanager-card">
      <div class="subscriptionmanager-card-header"><span><i class="ti ti-adjustments"></i></span><div><h3>Adjust Stock</h3><p>Use positive numbers to receive stock and negative numbers to remove stock.</p></div></div>
      {form name="inventorymanager_stock_adjust"}
        <div class="subscriptionmanager-form-grid">
          <div class="subscriptionmanager-field"><label class="form-label">{form_description field="itemid"}</label><select name="itemid">{foreach from=$itemChoices item=choice}<option value="{$choice.id}">#{$choice.id} {$choice.sku} {$choice.name}</option>{/foreach}</select></div>
          <div class="subscriptionmanager-field"><label class="form-label">{form_description field="locationid"}</label><select name="locationid">{foreach from=$locations item=location}<option value="{$location.id}">#{$location.id} {$location.name}</option>{/foreach}</select></div>
          <div class="subscriptionmanager-field"><label class="form-label">{form_description field="quantity_change"}</label>{form_element field="quantity_change" size="8"}</div>
          <div class="subscriptionmanager-field"><label class="form-label">{form_description field="note"}</label>{form_element field="note" size="30"}</div>
        </div>
        <div class="subscriptionmanager-actions">{form_element field="save"}</div>
      {/form}
    </section>
    <section class="subscriptionmanager-card subscriptionmanager-card-table">
      <div class="subscriptionmanager-card-header"><span><i class="ti ti-stack"></i></span><div><h3>Current Stock</h3><p>Edit exact stock records or delete unused item/location rows.</p></div></div>
      <div class="subscriptionmanager-plan-list">
        {foreach from=$stock item=row}
          <div class="subscriptionmanager-plan-item">
            <div class="subscriptionmanager-plan-item-header">
              <div>
                <span class="subscriptionmanager-plan-meta">Stock #{$row.id} &middot; Alert {$row.reorder_threshold}</span>
                <strong>{$row.sku} {$row.item_name}</strong>
              </div>
              <span class="subscriptionmanager-badge">{$row.location_name}</span>
            </div>
            {form name="inventorymanager_stock_update"}
              <input type="hidden" name="stockid" value="{$row.id}"/>
              <div class="subscriptionmanager-form-grid subscriptionmanager-plan-edit-grid">
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="itemid"}</label><select name="itemid">{foreach from=$itemChoices item=choice}<option value="{$choice.id}"{if $row.itemid == $choice.id} selected="selected"{/if}>#{$choice.id} {$choice.sku} {$choice.name}</option>{/foreach}</select></div>
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="locationid"}</label><select name="locationid">{foreach from=$locations item=location}<option value="{$location.id}"{if $row.locationid == $location.id} selected="selected"{/if}>#{$location.id} {$location.name}</option>{/foreach}</select></div>
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="quantity"}</label>{form_element field="quantity" value=$row.quantity size="8"}</div>
              </div>
              <div class="subscriptionmanager-plan-actions">{form_element field="save" class="btn btn-primary"}</div>
            {/form}
            {form name="inventorymanager_stock_delete"}
              <input type="hidden" name="stockid" value="{$row.id}"/>
              <div class="subscriptionmanager-plan-delete">{form_element field="delete" class="btn btn-outline-danger" onclick="return confirm('Delete this stock row?');"}</div>
            {/form}
          </div>
        {/foreach}
      </div>
    </section>
    <section class="subscriptionmanager-card subscriptionmanager-card-table">
      <div class="subscriptionmanager-card-header"><span><i class="ti ti-history"></i></span><div><h3>Recent Movements</h3><p>Edit or remove the latest inventory movement records.</p></div></div>
      <div class="subscriptionmanager-plan-list">
        {foreach from=$movements item=row}
          <div class="subscriptionmanager-plan-item">
            <div class="subscriptionmanager-plan-item-header">
              <div>
                <span class="subscriptionmanager-plan-meta">Movement #{$row.id} &middot; {$row.created}</span>
                <strong>{$row.sku} {$row.item_name}</strong>
              </div>
              <span class="subscriptionmanager-badge">{$row.quantity_change}</span>
            </div>
            {form name="inventorymanager_movement_update"}
              <input type="hidden" name="movementid" value="{$row.id}"/>
              <div class="subscriptionmanager-form-grid subscriptionmanager-plan-edit-grid">
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="itemid"}</label><select name="itemid">{foreach from=$itemChoices item=choice}<option value="{$choice.id}"{if $row.itemid == $choice.id} selected="selected"{/if}>#{$choice.id} {$choice.sku} {$choice.name}</option>{/foreach}</select></div>
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="locationid"}</label><select name="locationid">{foreach from=$locations item=location}<option value="{$location.id}"{if $row.locationid == $location.id} selected="selected"{/if}>#{$location.id} {$location.name}</option>{/foreach}</select></div>
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="quantity_change"}</label>{form_element field="quantity_change" value=$row.quantity_change size="8"}</div>
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="reference_type"}</label>{form_element field="reference_type" value=$row.reference_type size="16"}</div>
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="reference_id"}</label>{form_element field="reference_id" value=$row.reference_id size="8"}</div>
                <div class="subscriptionmanager-field"><label class="form-label">{form_description field="note"}</label>{form_element field="note" value=$row.note size="30"}</div>
                <div class="subscriptionmanager-field subscriptionmanager-field-wide"><label class="form-label">Current location</label><div class="subscriptionmanager-readonly">{$row.location_name}</div></div>
              </div>
              <div class="subscriptionmanager-plan-actions">{form_element field="save" class="btn btn-primary"}</div>
            {/form}
            {form name="inventorymanager_movement_delete"}
              <input type="hidden" name="movementid" value="{$row.id}"/>
              <div class="subscriptionmanager-plan-delete">{form_element field="delete" class="btn btn-outline-danger" onclick="return confirm('Delete this movement record?');"}</div>
            {/form}
          </div>
        {/foreach}
      </div>
    </section>
  </div>
</div>
