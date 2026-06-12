<h2>Please Review Your Order</h2>

<div class="card mb-4">
  <div class="card-header"><h5 class="mb-0">{echo phrase="CONTACT_EMAIL"}</h5></div>
  <div class="card-body">
    <dl class="row mb-0">
      <dt class="col-sm-4">{echo phrase="EMAIL"}:</dt>
      <dd class="col-sm-8">{dbo_echo dbo="order" field="contactemail"}</dd>
    </dl>
  </div>
</div>

<div class="card mb-4">
  <div class="card-header"><h5 class="mb-0">Account Information</h5></div>
  <div class="card-body">
    <dl class="row mb-0">
      <dt class="col-sm-4">{echo phrase="BUSINESS_NAME"}:</dt>
      <dd class="col-sm-8">{dbo_echo dbo="order" field="businessname"}</dd>

      <dt class="col-sm-4">{echo phrase="CONTACT_NAME"}:</dt>
      <dd class="col-sm-8">{dbo_echo dbo="order" field="contactname"}</dd>

      <dt class="col-sm-4">{echo phrase="ADDRESS"}:</dt>
      <dd class="col-sm-8">{dbo_echo dbo="order" field="address1"}</dd>

      <dt class="col-sm-4"></dt>
      <dd class="col-sm-8">{dbo_echo dbo="order" field="address2"}</dd>

      <dt class="col-sm-4">{echo phrase="CITY"}:</dt>
      <dd class="col-sm-8">{dbo_echo dbo="order" field="city"}</dd>

      <dt class="col-sm-4">{echo phrase="STATE"}:</dt>
      <dd class="col-sm-8">{dbo_echo dbo="order" field="state"}</dd>

      <dt class="col-sm-4">{echo phrase="ZIP_POSTAL_CODE"}:</dt>
      <dd class="col-sm-8">{dbo_echo dbo="order" field="postalcode"}</dd>

      <dt class="col-sm-4">{echo phrase="COUNTRY"}:</dt>
      <dd class="col-sm-8">{dbo_echo|country dbo="order" field="country"}</dd>

      <dt class="col-sm-4">{echo phrase="PHONE"}:</dt>
      <dd class="col-sm-8">{dbo_echo dbo="order" field="phone"}</dd>

      <dt class="col-sm-4">{echo phrase="MOBILE_PHONE"}:</dt>
      <dd class="col-sm-8">{dbo_echo dbo="order" field="mobilephone"}</dd>

      <dt class="col-sm-4">{echo phrase="FAX"}:</dt>
      <dd class="col-sm-8">{dbo_echo dbo="order" field="fax"}</dd>
    </dl>
  </div>
</div>

<div class="card mb-4">
  <div class="card-header"><h5 class="mb-0">{echo phrase="LOGIN_INFORMATION"}</h5></div>
  <div class="card-body">
    <dl class="row mb-0">
      <dt class="col-sm-4">{echo phrase="USERNAME"}:</dt>
      <dd class="col-sm-8">{dbo_echo dbo="order" field="username"}</dd>

      <dt class="col-sm-4">{echo phrase="PASSWORD"}:</dt>
      <dd class="col-sm-8"><i>{echo phrase="NOT_SHOWN"}</i></dd>
    </dl>
  </div>
</div>

{form name="review"}
  <div class="table-responsive mb-4">
    {form_table field="cart"}

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

    {/form_table}
  </div>

  {dbo_assign dbo="order" field="accounttype" var="accounttype"}
  {* {if $accounttype == "New Account"} *}
    <div class="card mb-4">
      <div class="card-body">
        <dl class="row mb-2">
          <dt class="col-sm-6">{echo phrase="RECURRING_TOTAL"}:</dt>
          <dd class="col-sm-6">{dbo_echo|currency dbo="order" field="recurringtotal"}</dd>

          <dt class="col-sm-6">{echo phrase="NONRECURRING_TOTAL"}:</dt>
          <dd class="col-sm-6">{dbo_echo|currency dbo="order" field="nonrecurringtotal"}</dd>

          <dt class="col-sm-6">{echo phrase="SUB_TOTAL"}:</dt>
          <dd class="col-sm-6">{dbo_echo|currency dbo="order" field="subtotal"}</dd>

          <dt class="col-sm-6">{echo phrase="TAXES"}:</dt>
          <dd class="col-sm-6">{dbo_echo|currency dbo="order" field="taxtotal"}</dd>

          <dt class="col-sm-6">{echo phrase="TOTAL"}:</dt>
          <dd class="col-sm-6">{dbo_echo|currency dbo="order" field="total"}</dd>

          <dt class="col-sm-6">{form_description field="module"}&nbsp;&nbsp;</dt>
          <dd class="col-sm-6">{form_element field="module"}</dd>
        </dl>
        {if $tos_required}
          <div class="form-check">
            {form_element field="accept_tos" option="true"}
            [I_HAVE_READ_AND_AGREE_TO_THE]
            <a href="{$tos_url}" target="_blank">[TERMS_OF_SERVICE]</a>
          </div>
        {/if}
      </div>
    </div>
  {* {else}
      <p> <b>{echo phrase="YOUR_ACCOUNT_WILL_BE_BILLED"}</b> </p>
     {/if} *}

  <p/>

  <div class="d-flex justify-content-between">
    <div>{form_element field="startover"}</div>
    <div class="btn-group">
      {form_element field="back"}
      {form_element field="checkout"}
    </div>
  </div>
{/form}

<p/>
