<div class="manager_content">
  <h2>{echo phrase="SUBSCRIPTION_MANAGER"}</h2>
  {include file="../../modules/subscriptionmanager/templates/subscriptionmanager_nav.tpl"}

  {form name="subscriptionmanager_config"}
    <div class="form">
      <table>
        <tr>
          <th>{form_description field="invoice_terms"}</th>
          <td>{form_element field="invoice_terms" value="$invoice_terms" size="5"}</td>
        </tr>
        <tr>
          <th>{form_description field="retry_schedule"}</th>
          <td>{form_element field="retry_schedule" value="$retry_schedule" size="30"}</td>
        </tr>
        <tr>
          <th>{form_description field="failed_payment_subject"}</th>
          <td>{form_element field="failed_payment_subject" value="$failed_payment_subject" size="60"}</td>
        </tr>
        <tr>
          <th>{form_description field="failed_payment_email"}</th>
          <td>{form_element field="failed_payment_email" value="$failed_payment_email" cols="70" rows="8"}</td>
        </tr>
        <tr>
          <th>{form_description field="card_update_url"}</th>
          <td>{form_element field="card_update_url" value="$card_update_url" size="60"}</td>
        </tr>
        <tr class="footer">
          <td colspan="2">{form_element field="save"}</td>
        </tr>
      </table>
    </div>
  {/form}

  <h3>{echo phrase="SUBSCRIPTION_MANAGER_INSTALL_FILES"}</h3>
  <p>Install SQL: modules/subscriptionmanager/sql/install.sql</p>
  <p>Uninstall SQL: modules/subscriptionmanager/sql/uninstall.sql</p>
</div>
