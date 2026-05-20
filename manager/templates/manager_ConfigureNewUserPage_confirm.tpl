<div class="manager_content">
<p class="message"> 

  {echo phrase="CONFIRM_NEW_USER"}

</p>

{form name="new_user_confirm"}

  <h2> {echo phrase="ADD_NEW_USER"} </h2>

  <div class="properties">

    <div class="table-responsive">
    <table style="width: 60%" class="table table-sm table-striped align-middle">

      <tr>

        <th> {echo phrase="USERNAME"}: </th>

        <td> {dbo_echo dbo="new_user_dbo" field="username"} </td>

      </tr>

      <tr>

        <th> {echo phrase="PASSWORD"}: </th>

        <td> {dbo_echo|password dbo="new_user_dbo" field="password"}</td>

      </tr>

      <tr>

        <th> {echo phrase="TYPE"}: </th>

        <td> {dbo_echo dbo="new_user_dbo" field="type"}</td>

      </tr>

      <tr>

        <th> {echo phrase="NAME"}: </th>

        <td> 

          {dbo_echo dbo="new_user_dbo" field="contactname"}

        </td>

      </tr>

      <tr>

        <th> {echo phrase="EMAIL"}: </th>

        <td> {dbo_echo|mailto dbo="new_user_dbo" field="email"} </td>

      </tr>

      <tr class="footer">

        <th class="footer"> 

          {form_element field="continue"}

          {form_element field="goback"}

        </th>

        <td/>

      </tr>

    </table>
    </div>

  </div>

{/form}
</div>
