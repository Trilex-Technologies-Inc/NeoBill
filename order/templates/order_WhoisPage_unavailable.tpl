<div class="order-page-heading">
  <span class="order-kicker">Domain search</span>
  <h2>{$fqdn} [IS_ALREADY_REGISTERED]</h2>
</div>

{form name="whois"}
  <div class="domainoption order-form-card">
    <table>
      <tr class="reverse">
        <th> [TRY_ANOTHER_DOMAIN] </th>
      </tr>
      <tr>
        <td class="indent"> [DOMAIN_NAME]: {form_element field="domain"}.{form_element field="tld"} </td>
      </tr>
    </table>
  </div>

  <div class="buttoncontainer order-actions justify-content-end">
    <div>{form_element field="submit"}</div>
  </div>
{/form}
