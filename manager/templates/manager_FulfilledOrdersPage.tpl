<div class="manager_content accounts-browser orders-browser">
  <div class="accounts-page-header">
    <div class="accounts-page-title">
      <span class="accounts-page-icon accounts-page-icon-success"><i class="ti ti-circle-check"></i></span>
      <div>
        <h2>{echo phrase="FULFILLED_ORDERS"}</h2>
        <p>Completed orders and fulfillment history.</p>
      </div>
    </div>
  </div>

  <div class="accounts-list">
    <div class="accounts-list-header">
      <h3>Fulfilled order list</h3>
      <p>Orders successfully processed and completed.</p>
    </div>
    <div class="table-responsive accounts-table-wrap orders-table-wrap">
      {form name="fulfilled_orders"}
        {form_table field="orders" size="10" class="table table-hover align-middle mb-0" empty="No fulfilled orders found."}
          {form_table_column columnid="id" header="[ID]"}
            <a href="manager_content.php?page=view_order&order={$orders.id}" class="account-id">#{$orders.id}</a>
          {/form_table_column}
          {form_table_column columnid="contactname" header="[CUSTOMER]"}
            <span class="account-name">
              <span class="account-avatar"><i class="ti ti-user"></i></span><span>{$orders.contactname}</span>
            </span>
          {/form_table_column}
          {form_table_column columnid="accounttype" header="[ACCOUNT]"}
            <a href="manager_content.php?page=accounts_view_account&account={$orders.accountid}" class="order-account">{$orders.accountname}</a>
          {/form_table_column}
          {form_table_column columnid="datecompleted" header="[ORDER_DATE]"}
            <span class="order-date">{$orders.datecompleted|datetime}</span>
          {/form_table_column}
          {form_table_column columnid="datefulfilled" header="[DATE_FULFILLED]"}
            <span class="order-date">{$orders.datefulfilled|datetime}</span>
          {/form_table_column}
          {form_table_column columnid="remoteip" header="[ORDER_IP]"}
            <code class="order-ip">{$orders.remoteipstring}</code>
          {/form_table_column}
          {form_table_column columnid="total" header="[ORDER_TOTAL]"}
            <span class="account-balance">{$orders.total|currency}</span>
          {/form_table_column}
          {form_table_column columnid="" header="Actions"}
            <a href="manager_content.php?page=view_order&order={$orders.id}" class="account-view-link">View <i class="ti ti-chevron-right"></i></a>
          {/form_table_column}
        {/form_table}
      {/form}
    </div>
  </div>
</div>
