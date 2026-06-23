<div class="manager-dashboard">
  <div class="dashboard-hero mb-4">
    <div>
      <span class="dashboard-eyebrow">NeoBill Manager</span>
      <h1 class="dashboard-title">Dashboard</h1>
      <p class="dashboard-subtitle mb-0">A quick view of billing activity and customer accounts.</p>
    </div>
    <div class="dashboard-hero-actions">
      <a class="btn btn-light" href="manager_content.php?page=accounts_new_account">
        <i class="ti ti-user-plus"></i>
        {echo phrase="CREATE_NEW_ACCOUNT"}
      </a>
      <a class="btn btn-dashboard-ghost" href="manager_content.php?page=billing_add_payment">
        <i class="ti ti-cash"></i>
        {echo phrase="ENTER_PAYMENT"}
      </a>
    </div>
  </div>

  <div class="row g-3 mb-4">
    <div class="col-sm-6 col-xl-3">
      <a class="dashboard-stat dashboard-stat-primary" href="manager_content.php?page=billing_invoices_outstanding">
        <span class="dashboard-stat-icon"><i class="ti ti-file-invoice"></i></span>
        <span class="dashboard-stat-copy">
          <span class="dashboard-stat-label">{echo phrase="OUTSTANDING_INVOICES"}</span>
          <strong class="dashboard-stat-value">{$os_invoices_count}</strong>
          <span class="dashboard-stat-meta">{$os_invoices_total|currency} total</span>
        </span>
        <i class="ti ti-arrow-up-right dashboard-stat-arrow"></i>
      </a>
    </div>

    <div class="col-sm-6 col-xl-3">
      <a class="dashboard-stat dashboard-stat-danger" href="manager_content.php?page=billing_invoices_outstanding">
        <span class="dashboard-stat-icon"><i class="ti ti-alert-triangle"></i></span>
        <span class="dashboard-stat-copy">
          <span class="dashboard-stat-label">{echo phrase="PAST_DUE_INVOICES"}</span>
          <strong class="dashboard-stat-value">{$os_invoices_count_past_due}</strong>
          <span class="dashboard-stat-meta">{$os_invoices_total_past_due|currency} overdue</span>
        </span>
        <i class="ti ti-arrow-up-right dashboard-stat-arrow"></i>
      </a>
    </div>

    <div class="col-sm-6 col-xl-3">
      <div class="dashboard-stat dashboard-stat-success">
        <span class="dashboard-stat-icon"><i class="ti ti-wallet"></i></span>
        <span class="dashboard-stat-copy">
          <span class="dashboard-stat-label">{echo phrase="REVENUE_RECEIVED"} {$month}</span>
          <strong class="dashboard-stat-value dashboard-stat-value-currency">{$payments_total|currency}</strong>
          <span class="dashboard-stat-meta">{$payments_count} payments received</span>
        </span>
      </div>
    </div>

    <div class="col-sm-6 col-xl-3">
      <a class="dashboard-stat dashboard-stat-info" href="manager_content.php?page=accounts_browse">
        <span class="dashboard-stat-icon"><i class="ti ti-users"></i></span>
        <span class="dashboard-stat-copy">
          <span class="dashboard-stat-label">{echo phrase="ACTIVE_ACCOUNTS"}</span>
          <strong class="dashboard-stat-value">{$active_accounts_count}</strong>
          <span class="dashboard-stat-meta">{$total_accounts} active and inactive</span>
        </span>
        <i class="ti ti-arrow-up-right dashboard-stat-arrow"></i>
      </a>
    </div>
  </div>

  <div class="row g-4">
    <div class="col-xl-8">
      <section class="dashboard-panel h-100">
        <div class="dashboard-panel-header">
          <div>
            <span class="dashboard-panel-kicker">Financial health</span>
            <h2>{echo phrase="BILLING_SUMMARY"}</h2>
          </div>
          <a class="btn btn-sm btn-outline-primary" href="manager_content.php?page=billing_invoices_outstanding">
            View invoices
            <i class="ti ti-arrow-right"></i>
          </a>
        </div>

        <div class="dashboard-billing-list">
          <a class="dashboard-billing-row" href="manager_content.php?page=billing_invoices_outstanding">
            <span class="dashboard-list-icon text-primary"><i class="ti ti-receipt"></i></span>
            <span class="dashboard-list-copy">
              <strong>{echo phrase="TOTAL_OUTSTANDING_INVOICES"}</strong>
              <small>{$os_invoices_count} invoices currently open</small>
            </span>
            <span class="dashboard-list-value">{$os_invoices_total|currency}</span>
          </a>

          <a class="dashboard-billing-row" href="manager_content.php?page=billing_invoices_outstanding">
            <span class="dashboard-list-icon text-danger"><i class="ti ti-clock"></i></span>
            <span class="dashboard-list-copy">
              <strong>{echo phrase="TOTAL_PAST_DUE"}</strong>
              <small>{$os_invoices_count_past_due} invoices need attention</small>
            </span>
            <span class="dashboard-list-value text-danger">{$os_invoices_total_past_due|currency}</span>
          </a>

          <a class="dashboard-billing-row" href="manager_content.php?page=billing_invoices_outstanding">
            <span class="dashboard-list-icon text-warning"><i class="ti ti-calendar-time"></i></span>
            <span class="dashboard-list-copy">
              <strong>{echo phrase="TOTAL_30_PAST_DUE"}</strong>
              <small>{$os_invoices_count_past_due_30} invoices are over 30 days late</small>
            </span>
            <span class="dashboard-list-value text-warning-emphasis">{$os_invoices_total_past_due_30|currency}</span>
          </a>

          <div class="dashboard-billing-row">
            <span class="dashboard-list-icon text-success"><i class="ti ti-circle-check"></i></span>
            <span class="dashboard-list-copy">
              <strong>{echo phrase="PAYMENTS_RECEIVED"} {$month}</strong>
              <small>Revenue collected during the current month</small>
            </span>
            <span class="dashboard-list-value text-success">{$payments_total|currency}</span>
          </div>
        </div>

        <div class="dashboard-panel-footer">
          <a href="manager_content.php?page=billing_generate">
            <i class="ti ti-file-plus"></i>
            {echo phrase="GENERATE_INVOICES"}
          </a>
          <a href="manager_content.php?page=billing_add_payment">
            <i class="ti ti-cash-banknote"></i>
            {echo phrase="ENTER_PAYMENT"}
          </a>
          <a href="manager_content.php?page=billing_invoices">
            <i class="ti ti-list-details"></i>
            All invoices
          </a>
        </div>
      </section>
    </div>

    <div class="col-xl-4">
      <section class="dashboard-panel h-100">
        <div class="dashboard-panel-header">
          <div>
            <span class="dashboard-panel-kicker">Customer base</span>
            <h2>{echo phrase="ACCOUNTS_SUMMARY"}</h2>
          </div>
        </div>

        <div class="account-overview">
          <div class="account-total">
            <span>Total accounts</span>
            <strong>{$total_accounts}</strong>
            <small>Active and inactive customers</small>
          </div>

          <div class="account-status-list">
            <a href="manager_content.php?page=accounts_browse">
              <span><i class="account-status-dot bg-success"></i>{echo phrase="ACTIVE_ACCOUNTS"}</span>
              <strong>{$active_accounts_count}</strong>
            </a>
            <a href="manager_content.php?page=accounts_browse_pending">
              <span><i class="account-status-dot bg-warning"></i>{echo phrase="PENDING_ACCOUNTS"}</span>
              <strong>{$pending_accounts_count}</strong>
            </a>
            <a href="manager_content.php?page=accounts_browse_inactive">
              <span><i class="account-status-dot bg-secondary"></i>{echo phrase="INACTIVE_ACCOUNTS"}</span>
              <strong>{$inactive_accounts_count}</strong>
            </a>
          </div>
        </div>

        <a class="dashboard-create-account" href="manager_content.php?page=accounts_new_account">
          <span class="dashboard-list-icon text-primary"><i class="ti ti-user-plus"></i></span>
          <span>
            <strong>{echo phrase="CREATE_NEW_ACCOUNT"}</strong>
            <small>Add a new customer to NeoBill</small>
          </span>
          <i class="ti ti-chevron-right ms-auto"></i>
        </a>
      </section>
    </div>
  </div>
</div>
