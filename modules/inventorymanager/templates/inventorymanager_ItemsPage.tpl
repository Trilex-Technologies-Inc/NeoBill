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
            <div class="subscriptionmanager-field"><label class="form-label">{form_description field="parent_itemid"}</label><select name="parent_itemid"><option value="">No parent item</option>{foreach from=$itemChoices item=choice}<option value="{$choice.id}">#{$choice.id} {$choice.sku} {$choice.name}</option>{/foreach}</select></div>
            <div class="subscriptionmanager-field"><label class="form-label">{form_description field="reorder_threshold"}</label>{form_element field="reorder_threshold" value="0" size="8"}</div>
            <div class="subscriptionmanager-field subscriptionmanager-field-wide"><label class="form-label">{form_description field="description"}</label>{form_element field="description" cols="70" rows="3"}</div>
          </div>
          <div class="subscriptionmanager-actions">{form_element field="save"}</div>
        {/form}
      </section>
      <section class="subscriptionmanager-card subscriptionmanager-card-table">
        <div class="subscriptionmanager-card-header"><span><i class="ti ti-table"></i></span><div><h3>Items</h3><p>Use item IDs when syncing invoices, subscriptions, variants, or bundles.</p></div></div>
        <div class="subscriptionmanager-plan-list">
          {foreach from=$items item=item}
            <div class="subscriptionmanager-plan-item">
              <div class="subscriptionmanager-plan-item-header">
                <div>
                  <span class="subscriptionmanager-plan-meta">Item #{$item.id} &middot; Stock {$item.total_quantity} &middot; Alert {$item.reorder_threshold}</span>
                  <strong>{$item.sku} {$item.name}</strong>
                </div>
                <span class="subscriptionmanager-badge">{$item.item_type} / {$item.status}</span>
              </div>
              {form name="inventorymanager_item_update"}
                <input type="hidden" name="itemid" value="{$item.id}"/>
                <div class="subscriptionmanager-form-grid subscriptionmanager-plan-edit-grid">
                  <div class="subscriptionmanager-field"><label class="form-label">{form_description field="sku"}</label>{form_element field="sku" value=$item.sku size="20"}</div>
                  <div class="subscriptionmanager-field"><label class="form-label">{form_description field="name"}</label>{form_element field="name" value=$item.name size="30"}</div>
                  <div class="subscriptionmanager-field"><label class="form-label">{form_description field="item_type"}</label>{form_element field="item_type" value=$item.item_type}</div>
                  <div class="subscriptionmanager-field"><label class="form-label">{form_description field="parent_itemid"}</label><select name="parent_itemid"><option value="">No parent item</option>{foreach from=$itemChoices item=choice}{if $choice.id != $item.id}<option value="{$choice.id}"{if $item.parent_itemid == $choice.id} selected="selected"{/if}>#{$choice.id} {$choice.sku} {$choice.name}</option>{/if}{/foreach}</select></div>
                  <div class="subscriptionmanager-field"><label class="form-label">{form_description field="reorder_threshold"}</label>{form_element field="reorder_threshold" value=$item.reorder_threshold size="8"}</div>
                  <div class="subscriptionmanager-field"><label class="form-label">{form_description field="status"}</label>{form_element field="status" value=$item.status}</div>
                  <div class="subscriptionmanager-field subscriptionmanager-field-wide"><label class="form-label">{form_description field="description"}</label>{form_element field="description" value=$item.description cols="60" rows="3"}</div>
                </div>
                <div class="subscriptionmanager-plan-actions">{form_element field="save" class="btn btn-primary"}</div>
              {/form}
              {form name="inventorymanager_item_delete"}
                <input type="hidden" name="itemid" value="{$item.id}"/>
                <div class="subscriptionmanager-plan-delete">{form_element field="delete" class="btn btn-outline-danger" onclick="return confirm('Delete this inventory item?');"}</div>
              {/form}
            </div>
          {/foreach}
        </div>
      </section>
    </div>
    <div class="subscriptionmanager-grid subscriptionmanager-grid-narrow">
      <section class="subscriptionmanager-card">
        <div class="subscriptionmanager-card-header"><span><i class="ti ti-link"></i></span><div><h3>Link Product</h3><p>When this product is ordered, stock is deducted for the linked item.</p></div></div>
        {form name="inventorymanager_product_map_create"}
          <div class="subscriptionmanager-form-grid">
            <div class="subscriptionmanager-field"><label class="form-label">{form_description field="productid"}</label><select name="productid">{foreach from=$products item=product}<option value="{$product.id}">#{$product.id} {$product.name}</option>{/foreach}</select></div>
            <div class="subscriptionmanager-field"><label class="form-label">{form_description field="itemid"}</label><select name="itemid">{foreach from=$itemChoices item=choice}<option value="{$choice.id}">#{$choice.id} {$choice.sku} {$choice.name}</option>{/foreach}</select></div>
            <div class="subscriptionmanager-field"><label class="form-label">{form_description field="locationid"}</label><select name="locationid"><option value="">Default location</option>{foreach from=$locations item=location}<option value="{$location.id}">#{$location.id} {$location.name}</option>{/foreach}</select></div>
            <div class="subscriptionmanager-field"><label class="form-label">{form_description field="quantity"}</label>{form_element field="quantity" value="1" size="8"}</div>
          </div>
          <div class="subscriptionmanager-actions">{form_element field="save"}</div>
        {/form}
      </section>
      <section class="subscriptionmanager-card subscriptionmanager-card-table">
        <div class="subscriptionmanager-card-header"><span><i class="ti ti-table"></i></span><div><h3>Product Links</h3><p>Product orders can deduct physical, variant, service, or bundle inventory.</p></div></div>
        <div class="subscriptionmanager-plan-list">
          {foreach from=$productMaps item=map}
            <div class="subscriptionmanager-plan-item">
              <div class="subscriptionmanager-plan-item-header">
                <div>
                  <span class="subscriptionmanager-plan-meta">Map #{$map.id} &middot; Product #{$map.productid}</span>
                  <strong>{$map.product_name}</strong>
                </div>
                <span class="subscriptionmanager-badge">{if $map.location_name}{$map.location_name}{else}Default{/if}</span>
              </div>
              {form name="inventorymanager_product_map_update"}
                <input type="hidden" name="mapid" value="{$map.id}"/>
                <div class="subscriptionmanager-form-grid subscriptionmanager-plan-edit-grid">
                  <div class="subscriptionmanager-field"><label class="form-label">{form_description field="productid"}</label><select name="productid">{foreach from=$products item=product}<option value="{$product.id}"{if $map.productid == $product.id} selected="selected"{/if}>#{$product.id} {$product.name}</option>{/foreach}</select></div>
                  <div class="subscriptionmanager-field"><label class="form-label">{form_description field="itemid"}</label><select name="itemid">{foreach from=$itemChoices item=choice}<option value="{$choice.id}"{if $map.itemid == $choice.id} selected="selected"{/if}>#{$choice.id} {$choice.sku} {$choice.name}</option>{/foreach}</select></div>
                  <div class="subscriptionmanager-field"><label class="form-label">{form_description field="locationid"}</label><select name="locationid"><option value="">Default location</option>{foreach from=$locations item=location}<option value="{$location.id}"{if $map.locationid == $location.id} selected="selected"{/if}>#{$location.id} {$location.name}</option>{/foreach}</select></div>
                  <div class="subscriptionmanager-field"><label class="form-label">{form_description field="quantity"}</label>{form_element field="quantity" value=$map.quantity size="8"}</div>
                  <div class="subscriptionmanager-field subscriptionmanager-field-wide"><label class="form-label">Current item</label><div class="subscriptionmanager-readonly">#{$map.itemid} {$map.sku} {$map.item_name}</div></div>
                </div>
                <div class="subscriptionmanager-plan-actions">{form_element field="save" class="btn btn-primary"}</div>
              {/form}
              {form name="inventorymanager_product_map_delete"}
                <input type="hidden" name="mapid" value="{$map.id}"/>
                <div class="subscriptionmanager-plan-delete">{form_element field="delete" class="btn btn-outline-danger" onclick="return confirm('Delete this product inventory link?');"}</div>
              {/form}
            </div>
          {/foreach}
        </div>
      </section>
    </div>
  </div>
</div>
