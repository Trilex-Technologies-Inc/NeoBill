<h2> {echo phrase="DOMAINS_SUMMARY"} </h2>
<div class="search">
  {form name="search_domaindbo_table"}
    <div class="table-responsive">
    <table class="table table-sm table-striped align-middle">
      <tr>
        <th> {echo phrase="SEARCH"} </th>
        <td> 
          {form_description field="domainname"} <br/>
          {form_element field="domainname"}
        </td>
        <td>
          {form_description field="tld"} <br/>
          {form_element field="tld"}
        </td>
        <td class="submit">
          {form_element field="search"}
        </td>
      </tr>
    </table>
    </div>
  {/form}
</div>
<p/>
<div class="properties">
  <div class="table-responsive">
  <table style="width: 90%" class="table table-sm table-striped align-middle">
    <tr>
      <th> {echo phrase="ACTIVE_DOMAINS"} </th>
      <td> <a href="manager_content.php?page=domains_browse">{$domains_count}</a> </td>
      <td class="action_cell">&raquo; <a href="manager_content.php?page=domains_register">{echo phrase="REGISTER_NEW_DOMAIN"}</a> </td>
    </tr>
    <tr>
      <th> {echo phrase="EXPIRED_DOMAINS"} </th>
      <td> <a href="manager_content.php?page=domains_expired">{$expired_domains_count}</a> </td>
    </tr>
  </table>
  </div>
</div>
