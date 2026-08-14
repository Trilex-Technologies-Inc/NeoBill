<div class="manager_content transfer-domain-page">
  <div class="transfer-domain-shell">
    <div class="transfer-domain-header">
      <div class="transfer-domain-title">
        <span class="transfer-domain-icon"><i class="ti ti-transfer-in"></i></span>
        <div>
          <span class="transfer-domain-kicker">Domains</span>
          <h2>{echo phrase="CONFIRM_DOMAIN_TRANSFER"}</h2>
          <p>Review the transfer details before it is submitted.</p>
        </div>
      </div>
    </div>

    {form name="transfer_domain_confirm"}
      <div class="transfer-domain-card card">
        <div class="card-header transfer-domain-card-header">
          <div>
            <span>Confirmation</span>
            <h3>{echo phrase="TRANSFER_DOMAIN_CONFIRM"}</h3>
          </div>
        </div>
        <div class="card-body">
          <div class="transfer-domain-confirm-note">
            {echo phrase="TRANSFER_DOMAIN_CONFIRM"}
          </div>

          <div class="transfer-domain-confirm-grid">
            <div class="transfer-domain-confirm-item">
              <span class="transfer-domain-confirm-label">{echo phrase="DOMAIN_NAME"}</span>
              <strong>{dbo_echo dbo="dspdbo" field="fulldomainname"}</strong>
            </div>
            <div class="transfer-domain-confirm-item">
              <span class="transfer-domain-confirm-label">{echo phrase="ACCOUNT_NAME"}</span>
              <strong>{dbo_echo dbo="dspdbo" field="accountname"}</strong>
            </div>
            <div class="transfer-domain-confirm-item">
              <span class="transfer-domain-confirm-label">{echo phrase="REGISTRATION_TERMS"}</span>
              <strong>{dbo_echo dbo="dspdbo" field="term"} {echo phrase="YEAR"}(s)</strong>
            </div>
          </div>

          <div class="transfer-domain-contact-card">
            <h4>Contact Profile</h4>
            <dl class="transfer-domain-contact-list">
              <div><dt>{echo phrase="NAME"}</dt><dd>{dbo_echo dbo="accountdbo" field="contactname"}</dd></div>
              {assign var="businessname" value={dbo_echo dbo="accountdbo" field="businessname"}}
              <div><dt>{echo phrase="COMPANY"}</dt><dd>{if $businessname}{$businessname}{else}<span class="text-muted">-</span>{/if}</dd></div>
              <div><dt>{echo phrase="EMAIL"}</dt><dd><a href="mailto:{dbo_echo dbo='accountdbo' field='contactemail'}">{dbo_echo dbo="accountdbo" field="contactemail"}</a></dd></div>
              <div><dt>{echo phrase="ADDRESS"}</dt><dd>{dbo_echo dbo="accountdbo" field="address1"}{if {dbo_echo dbo="accountdbo" field="address2"}}<br>{dbo_echo dbo="accountdbo" field="address2"}{/if}</dd></div>
              <div><dt>{echo phrase="CITY"}</dt><dd>{dbo_echo dbo="accountdbo" field="city"}</dd></div>
              <div><dt>{echo phrase="STATE"}</dt><dd>{dbo_echo dbo="accountdbo" field="state"}</dd></div>
              <div><dt>{echo phrase="COUNTRY"}</dt><dd>{dbo_echo dbo="accountdbo" field="country"}</dd></div>
              <div><dt>{echo phrase="PHONE"}</dt><dd>{dbo_echo dbo="accountdbo" field="phone"}</dd></div>
              <div><dt>{echo phrase="FAX"}</dt><dd>{assign var="fax" value={dbo_echo dbo="accountdbo" field="fax"}}{if $fax}{$fax}{else}<span class="text-muted">-</span>{/if}</dd></div>
            </dl>
          </div>

          <div class="transfer-domain-nameservers">
            <h4>{echo phrase="NAME_SERVERS"}</h4>
            <div class="transfer-domain-nameserver-list">
              {foreach from=$nameservers item=ns}
                <code>{$ns}</code>
              {/foreach}
            </div>
          </div>
        </div>
        <div class="card-footer transfer-domain-footer transfer-domain-footer-split">
          <div>{form_element field="cancel" class="btn btn-outline-secondary transfer-domain-cancel"}</div>
          <div>{form_element field="continue" class="btn btn-success transfer-domain-submit"}</div>
        </div>
      </div>
    {/form}
  </div>
</div>
