{form name="order"}
  {dbo_assign dbo="orderdbo" field="accounttype" var="accounttype"}
  {dbo_assign dbo="orderdbo" field="acceptedtos" var="accepted"}

  <div class="manager_content view-account-page order-detail">
    <div class="view-account-header">
      <div class="view-account-title">
        <span class="view-account-avatar"><i class="ti ti-shopping-cart"></i></span>
        <div>
          <span class="view-account-kicker">Order detail</span>
          <h2>{echo phrase="ORDER"} #{dbo_echo dbo="orderdbo" field="id"}</h2>
          <p>
            <span>{dbo_echo|datetime dbo="orderdbo" field="datecreated"}</span>
            <span><code>{dbo_echo dbo="orderdbo" field="remoteipstring"}</code></span>
            <span class="account-badge account-badge-default">{$accounttype}</span>
            {if $accepted == "Yes"}
              <span class="account-status account-status-active"><i></i>{echo phrase="ACCEPTED_TOS"}</span>
            {else}
              <span class="account-status account-status-warning"><i></i>{echo phrase="ACCEPTED_TOS"}</span>
            {/if}
          </p>
        </div>
      </div>

      <div class="view-account-header-actions">
        {form_element field="execute" class="btn btn-success"}
        {form_element field="delete" class="btn btn-outline-danger"}
      </div>
    </div>

    <div class="view-account-summary">
      <div class="view-account-stat">
        <span>{echo phrase="SUB_TOTAL"}</span>
        <strong>{dbo_echo|currency dbo="orderdbo" field="subtotal"}</strong>
      </div>
      <div class="view-account-stat">
        <span>{echo phrase="TAXES"}</span>
        <strong>{dbo_echo|currency dbo="orderdbo" field="taxtotal"}</strong>
      </div>
      <div class="view-account-stat">
        <span>{echo phrase="TOTAL"}</span>
        <strong>{dbo_echo|currency dbo="orderdbo" field="total"}</strong>
      </div>
      <div class="view-account-stat">
        <span>{echo phrase="ORDER_ID"}</span>
        <strong>#{dbo_echo dbo="orderdbo" field="id"}</strong>
      </div>
    </div>

    <div class="p-4">
    <div class="row g-4">
      <div class="col-xl-8">
        <div class="card view-account-card h-100">
          <div class="card-body">
            <h3 class="view-account-section-title"><i class="ti ti-address-book"></i> {echo phrase="CONTACT_INFORMATION"}</h3>
            {if $accounttype == "New Account"}
              <div class="row g-3">
                <div class="col-md-6">
                  <label class="form-label">{form_description field="businessname"}</label>
                  {form_element dbo="orderdbo" field="businessname" size="40" class="form-control"}
                </div>
                <div class="col-md-6">
                  <label class="form-label">{form_description field="contactname"}</label>
                  {form_element dbo="orderdbo" field="contactname" size="30" class="form-control"}
                </div>
                <div class="col-md-6">
                  <label class="form-label">{form_description field="contactemail"}</label>
                  {form_element dbo="orderdbo" field="contactemail" size="30" class="form-control"}
                </div>
                <div class="col-md-6">
                  <label class="form-label">{form_description field="phone"}</label>
                  {form_element dbo="orderdbo" field="phone" size="15" class="form-control"}
                </div>
                <div class="col-md-6">
                  <label class="form-label">{form_description field="mobilephone"}</label>
                  {form_element dbo="orderdbo" field="mobilephone" size="15" class="form-control"}
                </div>
                <div class="col-md-6">
                  <label class="form-label">{form_description field="fax"}</label>
                  {form_element dbo="orderdbo" field="fax" size="15" class="form-control"}
                </div>
                <div class="col-12">
                  <label class="form-label">{form_description field="address1"}</label>
                  {form_element dbo="orderdbo" field="address1" size="40" class="form-control"}
                </div>
                <div class="col-12">
                  <label class="form-label">{form_description field="address2"}</label>
                  {form_element dbo="orderdbo" field="address2" size="40" class="form-control"}
                </div>
                <div class="col-md-4">
                  <label class="form-label">{form_description field="city"}</label>
                  {form_element dbo="orderdbo" field="city" size="30" class="form-control"}
                </div>
                <div class="col-md-4">
                  <label class="form-label">{form_description field="state"}</label>
                  {form_element dbo="orderdbo" field="state" size="20" class="form-control"}
                </div>
                <div class="col-md-4">
                  <label class="form-label">{form_description field="postalcode"}</label>
                  {form_element dbo="orderdbo" field="postalcode" size="10" class="form-control"}
                </div>
                <div class="col-md-6">
                  <label class="form-label">{form_description field="country"}</label>
                  {form_element dbo="orderdbo" field="country" class="form-select"}
                </div>
              </div>
            {else}
              <div class="row g-3">
                <div class="col-md-7">
                  <div class="text-muted small mb-1">{echo phrase="ACCOUNT"}</div>
                  <a href="manager_content.php?page=accounts_view_account&account={dbo_echo dbo="accountdbo" field="id"}" class="fs-5 fw-semibold text-decoration-none">
                    {dbo_echo dbo="accountdbo" field="accountname"}
                  </a>
                </div>
                <div class="col-md-5">
                  <div class="text-muted small mb-1">{echo phrase="BALANCE"}</div>
                  <div class="fs-5 fw-semibold text-danger">{dbo_echo|currency dbo="accountdbo" field="balance"}</div>
                </div>
              </div>
            {/if}
          </div>
        </div>
      </div>

      <div class="col-xl-4">
        <div class="card view-account-card h-100">
          <div class="card-body">
            <h3 class="view-account-section-title"><i class="ti ti-id-badge-2"></i> {echo phrase="ACCOUNT_INFORMATION"}</h3>
            {if $accounttype == "New Account"}
              <div class="mb-3">
                <label class="form-label">{form_description field="username"}</label>
                {form_element dbo="orderdbo" field="username" size="10" class="form-control"}
              </div>
              <div>
                <label class="form-label">{form_description field="password"}</label>
                {form_element field="password" size="10" class="form-control"}
                <div class="form-text">{echo phrase="ONLY_SUPPLY_A_PASSWORD"}</div>
              </div>
            {else}
              <div class="d-flex align-items-center gap-3">
                <span class="account-avatar"><i class="ti ti-user"></i></span>
                <div>
                  <div class="text-muted small">{echo phrase="ACCOUNT"}</div>
                  <a href="manager_content.php?page=accounts_view_account&account={dbo_echo dbo="accountdbo" field="id"}" class="fw-semibold text-decoration-none">
                    {dbo_echo dbo="accountdbo" field="accountname"}
                  </a>
                </div>
              </div>
            {/if}

            <hr/>
            <label class="form-label">{echo phrase="CUSTOMER_NOTE"}</label>
            <textarea class="form-control bg-light" rows="7" readonly="true">{dbo_echo dbo="orderdbo" field="note"}</textarea>
          </div>
        </div>
      </div>
    </div>
    </div>

    <div class="accounts-list">
      <div class="accounts-list-header">
        <div>
          <h3><i class="ti ti-list-check"></i> {echo phrase="ORDER_ITEMS"}</h3>
          <p>Products and services included in this order.</p>
        </div>
      </div>
      <div class="table-responsive accounts-table-wrap orders-table-wrap">
        <table class="table table-hover align-middle mb-0">
          <thead class="table-light">
            <tr>
              <th class="text-center" style="width: 64px">{echo phrase="ACCEPT"}</th>
              <th>{echo phrase="ITEM"}</th>
              <th>{echo phrase="TERM"}</th>
              <th class="text-end">{echo phrase="SETUP_PRICE"}</th>
              <th class="text-end">{echo phrase="RECURRING_PRICE"}</th>
            </tr>
          </thead>
          <tbody>
            {form_table field="items"}
              <tr>
                <td class="text-center">{form_table_checkbox option=$items.orderitemid}</td>
                <td class="fw-semibold">{$items.description}</td>
                <td><span class="badge text-bg-light">{$items.term}</span></td>
                <td class="text-end">{$items.setupfee|currency}</td>
                <td class="text-end fw-semibold">{$items.price|currency}</td>
              </tr>
            {/form_table}
          </tbody>
          {form_table_footer}
            <tfoot>
              <tr>
                <td colspan="5" class="bg-light p-3 text-end">
                  {form_element field="save" class="btn btn-primary"}
                </td>
              </tr>
            </tfoot>
          {/form_table_footer}
        </table>
      </div>
    </div>

    <div class="accounts-list">
      <div class="accounts-list-header">
        <div>
          <h3><i class="ti ti-credit-card"></i> {echo phrase="PAYMENTS"}</h3>
          <p>Payment records attached to this order.</p>
        </div>
      </div>
      <div class="table-responsive accounts-table-wrap orders-table-wrap">
        <table class="table table-hover align-middle mb-0">
          <thead class="table-light">
            <tr>
              <th>{echo phrase="ID"}</th>
              <th>{echo phrase="DATE_RECEIVED"}</th>
              <th class="text-end">{echo phrase="AMOUNT"}</th>
              <th>{echo phrase="PAYMENT_TYPE"}</th>
              <th>{echo phrase="MODULE"}</th>
              <th>{echo phrase="PAYMENT_STATUS"}</th>
            </tr>
          </thead>
          <tbody>
            {form_table field="payments"}
              <tr>
                <td><a href="manager_content.php?page=edit_payment&payment={$payments.id}" class="fw-semibold text-decoration-none">#{$payments.id}</a></td>
                <td>{$payments.date|datetime:date}</td>
                <td class="text-end fw-semibold text-success">{$payments.amount|currency}</td>
                <td>{$payments.type}</td>
                <td>{$payments.module}</td>
                <td>
                  {if $payments.status == "Completed"}
                    <span class="badge text-bg-success">{$payments.status}</span>
                  {elseif $payments.status == "Pending"}
                    <span class="badge text-bg-warning">{$payments.status}</span>
                  {else}
                    <span class="badge text-bg-secondary">{$payments.status}</span>
                  {/if}
                </td>
              </tr>
            {/form_table}
          </tbody>
        </table>
      </div>
    </div>
  </div>
{/form}
