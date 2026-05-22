<div class="manager_content">

<h2 class="mb-4">{echo phrase="TRANSFER_DOMAIN"}</h2>

{form name="transfer_domain_confirm"}
  
  <div class="card">
    <div class="card-header bg-info text-white">
      <h3 class="h6 mb-0">{echo phrase="CONFIRM_DOMAIN_TRANSFER"}</h3>
    </div>
    <div class="card-body">
      
      <div class="properties">
        
        <div class="alert alert-info mb-4">
          {echo phrase="TRANSFER_DOMAIN_CONFIRM"}
        </div>
        
        <!-- Account Name -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="ACCOUNT_NAME"}:</div>
          <div class="col-md-8 p-2">
            <span class="fw-bold text-primary">{dbo_echo dbo="dspdbo" field="accountname"}</span>
          </div>
        </div>
        
        <!-- Domain Name -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="DOMAIN_NAME"}:</div>
          <div class="col-md-8 p-2">
            <span class="badge bg-info fs-6">{dbo_echo dbo="dspdbo" field="fulldomainname"}</span>
          </div>
        </div>
        
        <!-- Registration Terms -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="REGISTRATION_TERMS"}:</div>
          <div class="col-md-8 p-2">
            <span class="badge bg-secondary">{dbo_echo dbo="dspdbo" field="term"} {echo phrase="YEAR"}(s)</span>
          </div>
        </div>
        
        <!-- Name Servers -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="NAME_SERVERS"}:</div>
          <div class="col-md-8 p-2">
            {foreach from=$nameservers item=ns}
              <code class="d-block mb-1">{$ns}</code>
            {/foreach}
          </div>
        </div>
        
        <!-- Name -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="NAME"}:</div>
          <div class="col-md-8 p-2">
            <span class="fw-bold">{dbo_echo dbo="accountdbo" field="contactname"}</span>
          </div>
        </div>
        
        <!-- Company -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="COMPANY"}:</div>
          <div class="col-md-8 p-2">
            {assign var="businessname" value={dbo_echo dbo="accountdbo" field="businessname"}}
            {if $businessname}
              <span class="badge bg-secondary">{$businessname}</span>
            {else}
              <span class="text-muted">-</span>
            {/if}
          </div>
        </div>
        
        <!-- Email -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="EMAIL"}:</div>
          <div class="col-md-8 p-2">
            <a href="mailto:{dbo_echo dbo='accountdbo' field='contactemail'}" class="text-decoration-none">
              {dbo_echo dbo="accountdbo" field="contactemail"}
            </a>
          </div>
        </div>
        
        <!-- Address -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="ADDRESS"}:</div>
          <div class="col-md-8 p-2">
            {dbo_echo dbo="accountdbo" field="address1"}<br>
            {if {dbo_echo dbo="accountdbo" field="address2"}}
              {dbo_echo dbo="accountdbo" field="address2"}<br>
            {/if}
          </div>
        </div>
        
        <!-- City -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="CITY"}:</div>
          <div class="col-md-8 p-2">
            <span class="badge bg-light text-dark">{dbo_echo dbo="accountdbo" field="city"}</span>
          </div>
        </div>
        
        <!-- State -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="STATE"}:</div>
          <div class="col-md-8 p-2">
            <span class="badge bg-light text-dark">{dbo_echo dbo="accountdbo" field="state"}</span>
          </div>
        </div>
        
        <!-- Country -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="COUNTRY"}:</div>
          <div class="col-md-8 p-2">
            <span class="badge bg-info">{dbo_echo dbo="accountdbo" field="country"}</span>
          </div>
        </div>
        
        <!-- Phone -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="PHONE"}:</div>
          <div class="col-md-8 p-2">
            <span class="fw-bold">{dbo_echo dbo="accountdbo" field="phone"}</span>
          </div>
        </div>
        
        <!-- Fax -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="FAX"}:</div>
          <div class="col-md-8 p-2">
            {assign var="fax" value={dbo_echo dbo="accountdbo" field="fax"}}
            {if $fax}
              {$fax}
            {else}
              <span class="text-muted">-</span>
            {/if}
          </div>
        </div>
        
      </div>
      
    </div>
    <div class="card-footer d-flex gap-2 justify-content-end">
      {form_element field="continue" class="btn btn-success"}
      {form_element field="cancel" class="btn btn-secondary"}
    </div>
  </div>

{/form}

</div>