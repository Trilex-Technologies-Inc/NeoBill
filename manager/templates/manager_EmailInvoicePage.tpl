{form name="email_invoice"}
  <div class="form">
    <div class="table-responsive">
    <table class="table table-sm table-striped align-middle">
      <thead>
        <tr>
          <th colspan="2"> [EMAIL_INVOICE] </th>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td class="left">
            {form_element field="cancel"}
          </td>
          <td class="right">
            {form_element field="continue"}
          </td>
        </tr>
      </tfoot>
      <tbody>
        <tr>
          <th> {form_description field="email"} </th>
          <td> {form_element field="email" size="30" value="$email"} </td>
        </tr>
        <tr>
          <th> {form_description field="subject"} </th>
          <td> {form_element field="subject" size="60" value="$subject"} </td>
        </tr>
        <tr>
          <th colspan="2"> {form_description field="invoice"} </th>
        </tr>
        <tr>
          <td colspan="2"> {form_element field="invoice" cols="80" rows="20" value="$body"} </td>
        </tr>
      </tbody>
    </table>
    </div>
  </div>
{/form}
