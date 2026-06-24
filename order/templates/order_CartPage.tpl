<div class="order-page-heading">
  <span class="order-kicker">Cart</span>
  <h2>{echo phrase="YOUR_ORDER"}</h2>
</div>
{form name="cart_mod"}
  <div class="cart table-responsive">
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
        {form_element field="addhosting"}
        {form_element field="adddomain"}
        {form_element field="remove"}
      {/form_table_footer}
    
    {/form_table}
  </div>

  <div class="cart_total order-total-card">
      <table>
        <tr>
          <th>{echo phrase="RECURRING_TOTAL"}:</th>
          <td>{$recurring_total|currency}</td>
        </tr>
        <tr>
          <th>{echo phrase="NONRECURRING_TOTAL"}:</th>
          <td>{$nonrecurring_total|currency}</td>
        </tr>
        <tr>
          <th>{echo phrase="CART_TOTAL"}:</th>
          <td>{$cart_total|currency}</td>
        </tr>
      </table>
      <p>({echo phrase="DOES_NOT_INCLUDE_TAXES"})</p>
  </div>
{/form}

{form name="cart_nav"}
  <div class="buttoncontainer order-actions">
    <div>{form_element field="startover"}</div>
    <div>{form_element field="checkout"}</div>
  </div>
{/form}
