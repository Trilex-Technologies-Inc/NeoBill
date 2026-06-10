<div class="manager_content">

  {form name="new_invoice"}

    <div class="form">

      <div class="mb-4">
        <h4>[CREATE_INVOICE]</h4>
      </div>

      <div class="mb-3 row">
        <label class="col-sm-3 col-form-label">{form_description field="account"}</label>
        <div class="col-sm-9">
          {if isset($account_name)}
            <p class="form-control-plaintext">{$account_name}</p>
            <input type="hidden" name="account" value="{$account}"/>
          {else}
            {form_element field="account"}
          {/if}
        </div>
      </div>

      <div class="mb-3 row">
        <label class="col-sm-3 col-form-label">{form_description field="date"}</label>
        <div class="col-sm-9">
          {form_element field="date" type="date" class="form-control"}
        </div>
      </div>

      <div class="mb-3 row">
        <label class="col-sm-3 col-form-label">[INVOICE_PERIOD]</label>
        <div class="col-sm-9 d-flex gap-2">
          {form_element field="periodbegin" type="date" class="form-control"} to {form_element field="periodend" type="date" value=$nextMonth class="form-control"}
        </div>
      </div>

      <div class="mb-3 row">
        <label class="col-sm-3 col-form-label">{form_description field="terms"}</label>
        <div class="col-sm-9">
          {form_element field="terms" size="2"}
        </div>
      </div>

      <div class="mb-3 row">
        <label class="col-sm-3 col-form-label">{form_description field="note"}</label>
        <div class="col-sm-9">
          {form_element field="note" cols="45" rows="13" class="form-control"}
        </div>
      </div>

      <div class="d-flex justify-content-between mt-4">
        <div>{form_element field="cancel"}</div>
        <div>{form_element field="continue"}</div>
      </div>

    </div>

  {/form}

</div>