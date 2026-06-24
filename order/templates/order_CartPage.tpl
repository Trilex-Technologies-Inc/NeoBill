<div class="order-page-heading">
  <span class="order-kicker">Cart</span>
  <h2>{echo phrase="YOUR_ORDER"}</h2>
</div>

{form name="cart_mod"}
  <div class="order-cart-shell">
    <div class="order-cart-panel">
      <div class="order-cart-panel-header">
        <div>
          <span class="order-kicker">Selected items</span>
          <h3>{echo phrase="YOUR_ORDER"}</h3>
        </div>
      </div>

      <div class="cart table-responsive order-cart-table">
        {form_table field="cart"}

          {form_table_column columnid=""}
            <div class="order-table-check">{form_table_checkbox option=$cart.orderitemid}</div>
          {/form_table_column}

          {form_table_column columnid="description" header="[ITEM]"}
            {$cart.description}
          {/form_table_column}

          {form_table_column columnid="term" header="[TERM]"}
            {$cart.term}
          {/form_table_column}

          {form_table_column columnid="setupfee" header="[SETUP_FEE]"}
            {$cart.setupfee|currency}
          {/form_table_column}

          {form_table_column columnid="price" header="[PRICE]"}
            {$cart.price|currency}
          {/form_table_column}

          {form_table_footer}
            <div class="order-cart-table-actions">
              {form_element field="addhosting"}
              {form_element field="adddomain"}
              {form_element field="remove"}
            </div>
          {/form_table_footer}

        {/form_table}
      </div>
    </div>

    <div class="cart_total order-total-card">
      <span class="order-kicker">Summary</span>
      <h3>{echo phrase="CART_TOTAL"}</h3>

      <dl class="order-total-list">
        <div>
          <dt>{echo phrase="RECURRING_TOTAL"}</dt>
          <dd>{$recurring_total|currency}</dd>
        </div>
        <div>
          <dt>{echo phrase="NONRECURRING_TOTAL"}</dt>
          <dd>{$nonrecurring_total|currency}</dd>
        </div>
        <div class="order-total-grand">
          <dt>{echo phrase="CART_TOTAL"}</dt>
          <dd>{$cart_total|currency}</dd>
        </div>
      </dl>

      <p>{echo phrase="DOES_NOT_INCLUDE_TAXES"}</p>
    </div>
  </div>
{/form}

{form name="cart_nav"}
  <div class="buttoncontainer order-actions order-cart-nav">
    <div>{form_element field="startover"}</div>
    <div>{form_element field="checkout"}</div>
  </div>
{/form}
