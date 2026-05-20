<div class="manager_content">
<h2>{echo phrase="CONFIRM_IP"} {dbo_echo dbo="server_dbo" field="hostname"}</h2>

<div class="properties">

  {form name="add_ip_confirm"}

    <div class="table-responsive">
    <table class="table table-sm table-striped align-middle">

      <tr>

        <th> {echo phrase="BEGINNING_ADDRESS"}: </th>

        <td> {dbo_echo dbo="begin_ip" field="ipstring"} </td>

      </tr>

      <tr>

        <th> {echo phrase="END_ADDRESS"}: </th>

        <td> {dbo_echo dbo="end_ip" field="ipstring"} </td>

      </tr>

      <tr class="footer">

        <td colspan="2">

          {form_element field="continue"}

          {form_element field="cancel"}

        </th>

      </tr>

    </table>
    </div>

  {/form}

</div>

