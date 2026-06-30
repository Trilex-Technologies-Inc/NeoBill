<div class="manager_content billing-summary-page">
  <div class="billing-summary-shell">
    <div class="billing-summary-header">
      <div class="billing-summary-title">
        <span class="billing-summary-icon"><i class="ti ti-receipt-2"></i></span>
        <div>
          <span class="billing-summary-kicker">{echo phrase="BILLING_INVOICES"}</span>
          <h2>{echo phrase="BILLING_SUMMARY"}</h2>
          <p>{echo phrase="INVOICES"} &amp; {echo phrase="PAYMENTS_RECEIVED"}</p>
        </div>
      </div>

      <div class="billing-summary-actions">
        <a href="manager_content.php?page=billing_generate" class="btn btn-primary">
          <i class="ti ti-file-stack"></i>
          {echo phrase="GENERATE_INVOICES"}
        </a>
        <a href="manager_content.php?page=billing_add_payment" class="btn btn-outline-success">
          <i class="ti ti-cash"></i>
          {echo phrase="ENTER_PAYMENT"}
        </a>
      </div>
    </div>

    <div class="billing-summary-grid">
      <a href="manager_content.php?page=billing_invoices_outstanding" class="billing-summary-stat billing-summary-stat-primary">
        <span>{echo phrase="OUTSTANDING_INVOICES"}</span>
        <strong>{$os_invoices_count}</strong>
        <em>{echo phrase="TOTAL_OUTSTANDING_INVOICES"}: {$os_invoices_total|currency}</em>
      </a>

      <a href="manager_content.php?page=billing_invoices_outstanding" class="billing-summary-stat billing-summary-stat-danger">
        <span>{echo phrase="TOTAL_OUTSTANDING_INVOICES"}</span>
        <strong>{$os_invoices_total|currency}</strong>
        <em>{echo phrase="OUTSTANDING_INVOICES"}: {$os_invoices_count}</em>
      </a>

      <a href="manager_content.php?page=billing_invoices_outstanding" class="billing-summary-stat billing-summary-stat-warning">
        <span>{echo phrase="PAST_DUE_INVOICES"}</span>
        <strong>{$os_invoices_count_past_due}</strong>
        <em>{echo phrase="TOTAL_PAST_DUE"}: {$os_invoices_total_past_due|currency}</em>
      </a>

      <a href="manager_content.php?page=billing_invoices_outstanding" class="billing-summary-stat billing-summary-stat-muted">
        <span>{echo phrase="30_DAYS_PAST_DUE"}</span>
        <strong>{$os_invoices_count_past_due_30}</strong>
        <em>{echo phrase="TOTAL_30_PAST_DUE"}: {$os_invoices_total_past_due_30|currency}</em>
      </a>
    </div>

    <div class="billing-summary-panels">
      <div class="billing-summary-card">
        <div class="billing-summary-card-header">
          <span><i class="ti ti-alert-circle"></i></span>
          <div>
            <h3>{echo phrase="OUTSTANDING_INVOICES"}</h3>
            <p>{echo phrase="PAST_DUE_INVOICES"}</p>
          </div>
        </div>

        <div class="billing-summary-list">
          <a href="manager_content.php?page=billing_invoices_outstanding" class="billing-summary-row">
            <span>{echo phrase="TOTAL_PAST_DUE"}</span>
            <strong class="billing-summary-danger">{$os_invoices_total_past_due|currency}</strong>
          </a>
          <a href="manager_content.php?page=billing_invoices_outstanding" class="billing-summary-row">
            <span>{echo phrase="30_DAYS_PAST_DUE"}</span>
            <strong>{$os_invoices_count_past_due_30}</strong>
          </a>
          <a href="manager_content.php?page=billing_invoices_outstanding" class="billing-summary-row">
            <span>{echo phrase="TOTAL_30_PAST_DUE"}</span>
            <strong class="billing-summary-danger">{$os_invoices_total_past_due_30|currency}</strong>
          </a>
        </div>
      </div>

      <div class="billing-summary-card">
        <div class="billing-summary-card-header">
          <span><i class="ti ti-report-money"></i></span>
          <div>
            <h3>{echo phrase="PAYMENTS_RECEIVED"} {$month}</h3>
            <p>{echo phrase="REVENUE_RECEIVED"} {$month}</p>
          </div>
        </div>

        <div class="billing-summary-payment">
          <span>{echo phrase="REVENUE_RECEIVED"} {$month}</span>
          <strong>{$payments_total|currency}</strong>
          <em>{echo phrase="PAYMENTS_RECEIVED"}: {$payments_count}</em>
        </div>
      </div>
    </div>
  </div>
</div>
