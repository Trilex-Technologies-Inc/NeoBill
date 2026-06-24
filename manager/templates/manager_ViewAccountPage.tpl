<div class="manager_content view-account-page">

<div class="view-account-header">
  <div class="view-account-title">
    <span class="view-account-avatar"><i class="ti ti-user-circle"></i></span>
    <div>
      <span class="view-account-kicker">Account profile</span>
      <h2>{dbo_echo dbo="account_dbo" field="accountname"}</h2>
      <p>
        <a href="manager_content.php?page=config_edit_user&user={dbo_echo dbo="account_dbo" field="username"}">{dbo_echo dbo="account_dbo" field="username"}</a>
        <span># {dbo_echo dbo="account_dbo" field="id"}</span>
      </p>
    </div>
  </div>
  <div class="view-account-header-actions">
    {form name="view_account_action"}
      {form_element field="edit" class="btn btn-primary btn-sm"}
      {form_element field="delete" class="btn btn-outline-danger btn-sm"}
    {/form}
  </div>
</div>

<div class="view-account-summary">
  <div class="view-account-stat">
    <span>{echo phrase="ACCOUNT_STATUS"}</span>
    <strong>{dbo_echo dbo="account_dbo" field="status"}</strong>
  </div>
  <div class="view-account-stat">
    <span>{echo phrase="BILLING_STATUS"}</span>
    <strong>{dbo_echo dbo="account_dbo" field="billingstatus"}</strong>
  </div>
  <div class="view-account-stat">
    <span>{echo phrase="ACCOUNT_BALANCE"}</span>
    <strong>{dbo_echo|currency dbo="account_dbo" field="balance"}</strong>
  </div>
  <div class="view-account-stat">
    <span>Services</span>
    <strong>{$hosting_count} / {$domain_count} / {$product_count}</strong>
  </div>
</div>

<div id="tabs" class="view-account-tabs">
	<ul>		
<li><a href="#tabs-1"><i class="ti ti-id"></i> Account</a></li>
<li><a href="#tabs-2"><i class="ti ti-notes"></i> Notes</a></li>
<li><a href="#tabs-3"><i class="ti ti-server"></i> Hostings</a></li>
<li><a href="#tabs-4"><i class="ti ti-world"></i> Domains</a></li>
<li><a href="#tabs-5"><i class="ti ti-package"></i> Products</a></li>
<li><a href="#tabs-6"><i class="ti ti-receipt"></i> Billing</a></li>
	</ul>

<div id="tabs-1">
<div id="info" name="[ACCOUNT_INFO]">

      <div class="row g-4">
        <div class="col-lg-6">
          <div class="card view-account-card h-100">
            <div class="card-body">
              <h3 class="view-account-section-title"><i class="ti ti-id"></i> {echo phrase="ACCOUNT_DETAILS"}</h3>
              <dl class="row view-account-definition-list mb-0">
                <dt class="col-sm-5 text-muted">{echo phrase="ACCOUNT_ID"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="id"}</dd>

                <dt class="col-sm-5 text-muted">{echo phrase="ACCOUNT_NAME"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="accountname"}</dd>

                <dt class="col-sm-5 text-muted">{echo phrase="ACCOUNT_TYPE"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="type"}</dd>

                <dt class="col-sm-5 text-muted">[USERNAME]:</dt>
                <dd class="col-sm-7"><a href="manager_content.php?page=config_edit_user&user={dbo_echo dbo="account_dbo" field="username"}">{dbo_echo dbo="account_dbo" field="username"}</a></dd>

                <dt class="col-sm-5 text-muted">{echo phrase="ACCOUNT_STATUS"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="status"}</dd>

                <dt class="col-sm-5 text-muted">{echo phrase="BILLING_STATUS"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="billingstatus"}</dd>

                <dt class="col-sm-5 text-muted">{echo phrase="BILLING_DAY"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="billingday"}</dd>
              </dl>
            </div>
          </div>
        </div>

        <div class="col-lg-6">
          <div class="card view-account-card h-100">
            <div class="card-body">
              <h3 class="view-account-section-title"><i class="ti ti-address-book"></i> {echo phrase="CONTACT_INFORMATION"}</h3>
              <dl class="row view-account-definition-list mb-0">
                <dt class="col-sm-5 text-muted">{echo phrase="CONTACT_NAME"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="contactname"}</dd>

                <dt class="col-sm-5 text-muted">{echo phrase="CONTACT_EMAIL"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="contactemail"}</dd>

                <dt class="col-sm-5 text-muted">{echo phrase="ADDRESS"}:</dt>
                <dd class="col-sm-7">
                  {dbo_echo dbo="account_dbo" field="address1"}<br/>
                  {dbo_echo dbo="account_dbo" field="address2"}
                </dd>

                <dt class="col-sm-5 text-muted">{echo phrase="CITY"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="city"}</dd>

                <dt class="col-sm-5 text-muted">{echo phrase="STATE"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="state"}</dd>

                <dt class="col-sm-5 text-muted">{echo phrase="ZIP_POSTAL_CODE"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="postalcode"}</dd>

                <dt class="col-sm-5 text-muted">{echo phrase="COUNTRY"}:</dt>
                <dd class="col-sm-7">{dbo_echo|country dbo="account_dbo" field="country"}</dd>

                <dt class="col-sm-5 text-muted">{echo phrase="PHONE"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="phone"}</dd>

                <dt class="col-sm-5 text-muted">{echo phrase="MOBILE_PHONE"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="mobilephone"}</dd>

                <dt class="col-sm-5 text-muted">{echo phrase="FAX"}:</dt>
                <dd class="col-sm-7">{dbo_echo dbo="account_dbo" field="fax"}</dd>
              </dl>
            </div>
          </div>
        </div>
      </div>

</div>
</div>

<div id="tabs-2">
    <div class="card view-account-card mb-4">
      <div class="card-body">
        <div class="view-account-panel-header">
          <div>
            <h2><i class="ti ti-notes"></i> {echo phrase="NOTES"}</h2>
            <p>Internal account notes and history.</p>
          </div>
        </div>
        {form name="view_account_note"}
          <div class="table-responsive">
            {form_table field="notes"}

              {form_table_column columnid=""}
                <div class="text-center">{form_table_checkbox option=$notes.id}</div>
              {/form_table_column}

              {form_table_column columnid="updated" header="[POSTED]"}
                <div class="small text-muted">[BY]: {$notes.username}</div>
                {$notes.updated|datetime}
              {/form_table_column}

              {form_table_column columnid="text" header="[NOTE]"}
                {$notes.text}
              {/form_table_column}

              {form_table_footer}
                {form_element field="remove" class="btn btn-outline-danger btn-sm"}
              {/form_table_footer}

            {/form_table}
          </div>
        {/form}
      </div>
    </div>

    <div class="card view-account-card">
      <div class="card-body">
        <h3 class="view-account-section-title"><i class="ti ti-message-plus"></i> [ADD_NOTE]</h3>
        {form name="view_account_add_note"}
          <div class="mb-3">
            <label class="form-label">{form_description field="text"}</label>
            {form_element field="text" cols="45" rows="5" class="form-control"}
          </div>
          <div class="text-end">
            {form_element field="add" class="btn btn-primary"}
          </div>
        {/form}
      </div>
    </div>
</div>

<div id="tabs-3">
  <div class="card view-account-card mb-4">
    <div class="card-body">
      <div class="view-account-panel-header">
        <div>
          <h2><i class="ti ti-server"></i> {echo phrase="WEB_HOSTING_SERVICES"}</h2>
          <p>{$hosting_count} hosting purchase(s) attached to this account.</p>
        </div>
        {form name="view_account_hosting"}
          {form_element field="add" class="btn btn-primary btn-sm"}
        {/form}
      </div>
      <div class="table-responsive">
        {form name="hosting_purchases"}
          {form_table field="services"}

            {form_table_column columnid=""}
              <div class="text-center">{form_table_checkbox option=$services.id}</div>
            {/form_table_column}

            {form_table_column columnid="title" header="[SERVICE_NAME]"}
              <a href="manager_content.php?page=edit_hosting_purchase&hspurchase={$services.id}">{$services.title}</a>
            {/form_table_column}

            {form_table_column columnid="domainname" header="[DOMAIN]"}
              {$services.domainname}
            {/form_table_column}

            {form_table_column columnid="term" header="[TERM]"}
              {$services.term} [MONTHS]
            {/form_table_column}

            {form_table_column columnid="hostname" header="[SERVER]"}
              {if $services.serverid < 1}
                {$services.hostname}
              {else}
                <a href="manager_content.php?page=services_view_server&server={$services.serverid}">{$services.hostname}</a>
              {/if}
            {/form_table_column}

            {form_table_column columnid="date" header="[PURCHASED]"}
              {$services.date|datetime:date}
            {/form_table_column}

            {form_table_column columnid="nextbillingdate" header="[NEXT_BILLING_DATE]"}
              {$services.nextbillingdate|datetime:date}
            {/form_table_column}

            {form_table_footer}
              {form_element field="remove" class="btn btn-outline-danger btn-sm"}
            {/form_table_footer}

          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>

<div id="tabs-4">
  <div class="card view-account-card mb-4">
    <div class="card-body">
      <div class="view-account-panel-header">
        <div>
          <h2><i class="ti ti-world"></i> {echo phrase="DOMAINS"}</h2>
          <p>{$domain_count} domain service(s) attached to this account.</p>
        </div>
        {form name="view_account_domains"}
          {form_element field="add" class="btn btn-primary btn-sm"}
        {/form}
      </div>
      <div class="table-responsive">
        {form name="domain_purchases"}
          {form_table field="domains"}

            {form_table_column columnid=""}
              <div class="text-center">{form_table_checkbox option=$domains.id}</div>
            {/form_table_column}

            {form_table_column columnid="fulldomainname" header="[DOMAIN_NAME]"}
              <a href="manager_content.php?page=domains_edit_domain&dpurchase={$domains.id}">{$domains.fulldomainname}</a>
            {/form_table_column}

            {form_table_column columnid="term" header="[TERM]"}
              {$domains.term} [MONTHS]
            {/form_table_column}

            {form_table_column columnid="date" header="[PURCHASED]"}
              {$domains.date|datetime:date}
            {/form_table_column}

            {form_table_column columnid="expiredate" header="[EXPIRES]"}
              {$domains.expiredate|datetime:date}
            {/form_table_column}

            {form_table_column columnid="nextbillingdate" header="[NEXT_BILLING_DATE]"}
              {$domains.nextbillingdate|datetime:date}
            {/form_table_column}

            {form_table_footer}
              {form_element field="remove" class="btn btn-outline-danger btn-sm"}
            {/form_table_footer}

          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>

<div id="tabs-5">
  <div class="card view-account-card mb-4">
    <div class="card-body">
      <div class="view-account-panel-header">
        <div>
          <h2><i class="ti ti-package"></i> {echo phrase="OTHER_PRODUCTS"}</h2>
          <p>{$product_count} product purchase(s) attached to this account.</p>
        </div>
        {form name="view_account_products"}
          {form_element field="add" class="btn btn-primary btn-sm"}
        {/form}
      </div>
      <div class="table-responsive">
        {form name="product_purchases"}
          {form_table field="products"}

            {form_table_column columnid=""}
              <div class="text-center">{form_table_checkbox option=$products.id}</div>
            {/form_table_column}

            {form_table_column columnid="productname" header="[PRODUCT_NAME]"}
              <a href="manager_content.php?page=edit_product_purchase&ppurchase={$products.id}">{$products.productname}</a>
            {/form_table_column}

            {form_table_column columnid="term" header="[TERM]"}
              {if $products.term != 0}
                {$products.term} [MONTHS]
              {else}
                [N/A]
              {/if}
            {/form_table_column}

            {form_table_column columnid="date" header="[DATE]"}
              {$products.date|datetime:date}
            {/form_table_column}

            {form_table_column columnid="nextbillingdate" header="[NEXT_BILLING_DATE]"}
              {$products.nextbillingdate|datetime:date}
            {/form_table_column}

            {form_table_footer}
              {form_element field="remove" class="btn btn-outline-danger btn-sm"}
            {/form_table_footer}

          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>

<div id="tabs-6">

  <div class="card view-account-card mb-4">
    <div class="card-body">
      <div class="view-account-panel-header">
        <div>
          <h2><i class="ti ti-receipt"></i> {echo phrase="BILLING"}</h2>
          <p>Invoices, payments, and account balance.</p>
        </div>
        {form name="view_account_billing_action"}
          {form_element field="add_invoice" class="btn btn-primary btn-sm"}
          {form_element field="add_payment" class="btn btn-success btn-sm"}
        {/form}
      </div>

      <div class="row g-3 mb-4">
        <div class="col-md-4">
          <div class="view-account-mini-stat h-100">
            <div class="card-body p-3">
              <h6 class="text-muted">{echo phrase="BILLING_STATUS"}</h6>
              <p class="mb-0">{dbo_echo dbo="account_dbo" field="billingstatus"}</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="view-account-mini-stat h-100">
            <div class="card-body p-3">
              <h6 class="text-muted">{echo phrase="BILLING_DAY"}</h6>
              <p class="mb-0">{dbo_echo dbo="account_dbo" field="billingday"}</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="view-account-mini-stat h-100">
            <div class="card-body p-3">
              <h6 class="text-muted">{echo phrase="ACCOUNT_BALANCE"}</h6>
              <p class="mb-0">{dbo_echo|currency dbo="account_dbo" field="balance"}</p>
            </div>
          </div>
        </div>
      </div>

      <div class="table-responsive">
        {form name="view_account_invoices"}
          {form_table field="invoices"}

            {form_table_column columnid="id" header="[ID]"}
              <a href="./manager_content.php?page=billing_view_invoice&invoice={$invoices.id}">{$invoices.id}</a>
            {/form_table_column}

            {form_table_column columnid="date" header="[INVOICE_DATE]"}
              {$invoices.date|datetime:date}
            {/form_table_column}

            {form_table_column columnid="periodbegin" header="[BILLING_PERIOD]"}
              {$invoices.periodbegin|datetime:date} - {$invoices.periodend|datetime:date}
            {/form_table_column}

            {form_table_column columnid="total" header="[INVOICE_TOTAL]"}
              {$invoices.total|currency}
            {/form_table_column}

            {form_table_column columnid="totalpayments" header="[AMOUNT_PAID]"}
              {$invoices.totalpayments|currency}
            {/form_table_column}

            {form_table_column columnid="balance" header="[AMOUNT_DUE]"}
              {$invoices.balance|currency}
            {/form_table_column}

          {/form_table}
        {/form}
      </div>
    </div>
  </div>

</div>

</div>
</div>
