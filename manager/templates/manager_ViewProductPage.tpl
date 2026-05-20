{form name="view_product_action"}
  <h2> {echo phrase="PRODUCT"} </h2>
  <div class="properties">
    <div class="table-responsive">
    <table style="width: 575px" class="table table-sm table-striped align-middle">
      <tr>
        <th> {echo phrase="PRODUCT_NAME"}: </th>
        <td> {dbo_echo dbo="product_dbo" field="name"} </td>
      </tr>
      <tr>
        <th> {echo phrase="DESCRIPTION"}: </th>
        <td>
          <textarea cols="40" rows="3" readonly="readonly">{dbo_echo dbo="product_dbo" field="description"}</textarea>
        </td>
      </tr>
      <tr>
        <th> {echo phrase="PRICE"}: </th>
        <td> {dbo_echo|currency dbo="product_dbo" field="price"} </td>
      </tr>
      <tr>
        <th> {echo phrase="TAXABLE"}: </th>
        <td> {dbo_echo dbo="product_dbo" field="taxable"} </td>
      </tr>
      <tr class="footer">
        <th class="footer">
          {form_element field="edit"}
          {form_element field="delete"}
        </th>
        <td/>
      </tr>
    </table>
    </div>
  </div>
{/form}
