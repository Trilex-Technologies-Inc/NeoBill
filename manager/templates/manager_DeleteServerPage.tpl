<h2> {echo phrase="DELETE_SERVER"} </h2>

<p class="message">
  {echo phrase="DELETE_SERVER_NOTICE"}
</p>

<div class="properties">
  <div class="table-responsive">
  <table class="table table-sm table-striped align-middle">
    <tr>
      <th> {echo phrase="HOSTNAME"}: </th>
      <td> {dbo_echo dbo="server_dbo" field="hostname"} </td>
    </tr>
    <tr>
      <th> {echo phrase="LOCATION"}: </th>
      <td> {dbo_echo dbo="server_dbo" field="location"} </td>
    </tr>
    <tr class="footer">
       <td colspan="2">
         {form name="delete_server"}
           {form_element field="delete"}
           {form_element field="cancel"}
         {/form}
       </td>
    </tr>
  </table>
  </div>
</div>
