<div class="manager_content">
<h2 class="mb-4">{echo phrase="BILLING_SUMMARY"}</h2>

<div class="properties">
  <div class="card shadow-sm">
    <div class="card-body p-0">
      <div class="table-responsive">
        <table class="table table-sm table-striped align-middle mb-0">
          <tbody>
            <tr>
              <th class="bg-light" style="width: 40%">{echo phrase="OUTSTANDING_INVOICES"}</th>
              <td style="width: 30%"><a href="manager_content.php?page=billing_invoices_outstanding" class="fw-bold">{$os_invoices_count}</a></td>
              <td class="action_cell" style="width: 30%">&raquo; <a href="manager_content.php?page=billing_generate" class="btn btn-sm btn-outline-primary">{echo phrase="GENERATE_INVOICES"}</a></td>
            </tr>
            <tr>
              <th class="bg-light">{echo phrase="TOTAL_OUTSTANDING_INVOICES"}</th>
              <td><a href="manager_content.php?page=billing_invoices_outstanding" class="fw-bold text-danger">{$os_invoices_total|currency}</a></td>
              <td class="action_cell"></td>
            </tr>
            <tr>
              <th class="bg-light">{echo phrase="PAST_DUE_INVOICES"}</th>
              <td><a href="manager_content.php?page=billing_invoices_outstanding" class="fw-bold text-warning">{$os_invoices_count_past_due}</a></td>
              <td class="action_cell"></td>
            </tr>
            <tr>
              <th class="bg-light">{echo phrase="TOTAL_PAST_DUE"}</th>
              <td><a href="manager_content.php?page=billing_invoices_outstanding" class="fw-bold text-danger">{$os_invoices_total_past_due|currency}</a></td>
              <td class="action_cell"></td>
            </tr>
            <tr>
              <th class="bg-light">{echo phrase="30_DAYS_PAST_DUE"}</th>
              <td><a href="manager_content.php?page=billing_invoices_outstanding" class="fw-bold">{$os_invoices_count_past_due_30}</a></td>
              <td class="action_cell"></td>
            </tr>
            <tr>
              <th class="bg-light">{echo phrase="TOTAL_30_PAST_DUE"}</th>
              <td><a href="manager_content.php?page=billing_invoices_outstanding" class="fw-bold text-danger">{$os_invoices_total_past_due_30|currency}</a></td>
              <td class="action_cell"></td>
            </tr>
            <tr>
              <th class="bg-light">{echo phrase="PAYMENTS_RECEIVED"} {$month}</th>
              <td><span class="fw-bold text-success">{$payments_count}</span></td>
              <td class="action_cell">&raquo; <a href="manager_content.php?page=billing_add_payment" class="btn btn-sm btn-outline-success">{echo phrase="Enter Payment"}</a></td>
            </tr>
            <tr>
              <th class="bg-light">{echo phrase="REVENUE_RECEIVED"} {$month}</th>
              <td colspan="2"><span class="fw-bold text-success h5 mb-0">{$payments_total|currency}</span></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</div>