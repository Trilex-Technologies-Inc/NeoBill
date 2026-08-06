{if isset($username) && $username != ""}
  <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <a class="navbar-brand ps-3" href="manager_content.php?page=home">NeoBill Manager</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0 sidebar-toggle" id="sidebarToggle" type="button" aria-label="Toggle navigation" aria-controls="layoutSidenav_nav" aria-expanded="true">
      <i class="ti ti-menu-2"></i>
    </button>

    <div class="ms-auto d-flex align-items-center gap-2">
      <a class="nav-link manager-notification-bell" href="manager_content.php?page=pending_orders" aria-label="Pending orders">
        <i class="ti ti-bell"></i>
        {if isset($pending_orders_count) && $pending_orders_count > 0}
          <span class="manager-notification-badge">{$pending_orders_count}</span>
        {/if}
      </a>
      <span class="d-none d-sm-inline text-white-50 small">{$username}</span>
    </div>
    <ul class="navbar-nav me-3">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          <i class="ti ti-user-circle"></i>
        </a>
        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
          <li><a class="dropdown-item" href="manager_content.php?page=home&amp;action=logout">Logout</a></li>
        </ul>
      </li>
    </ul>
  </nav>

  <div id="layoutSidenav">
    <div id="layoutSidenav_nav">
      <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
          <div class="nav">
            <div class="sb-sidenav-menu-heading">Main</div>
            <a class="nav-link" href="manager_content.php?page=home">
              <div class="sb-nav-link-icon"><i class="ti ti-home"></i></div>
              Dashboard
            </a>

            <div class="sb-sidenav-menu-heading">Management</div>

            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseAccounts" aria-expanded="false" aria-controls="collapseAccounts">
              <div class="sb-nav-link-icon"><i class="ti ti-users"></i></div>
              Accounts
              <div class="sb-sidenav-collapse-arrow"><i class="ti ti-chevron-down"></i></div>
            </a>
            <div class="collapse" id="collapseAccounts" data-bs-parent="#sidenavAccordion">
              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="manager_content.php?page=accounts_browse">Active Accounts</a>
                <a class="nav-link" href="manager_content.php?page=accounts_browse_pending">Pending Accounts</a>
                <a class="nav-link" href="manager_content.php?page=accounts_browse_inactive">Inactive Accounts</a>
                <a class="nav-link d-flex justify-content-between align-items-center gap-2" href="manager_content.php?page=pending_orders">
                  <span>Pending Orders</span>
                  {if isset($pending_orders_count) && $pending_orders_count > 0}
                    <span class="badge text-bg-warning rounded-pill">{$pending_orders_count}</span>
                  {/if}
                </a>
                <a class="nav-link" href="manager_content.php?page=fulfilled_orders">Fulfilled Orders</a>
              </nav>
            </div>

            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseBilling" aria-expanded="false" aria-controls="collapseBilling">
              <div class="sb-nav-link-icon"><i class="ti ti-receipt"></i></div>
              Billing &amp; Invoices
              <div class="sb-sidenav-collapse-arrow"><i class="ti ti-chevron-down"></i></div>
            </a>
            <div class="collapse" id="collapseBilling" data-bs-parent="#sidenavAccordion">
              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="manager_content.php?page=billing_invoices_outstanding">Outstanding Invoices</a>
                <a class="nav-link" href="manager_content.php?page=billing_invoices">All Invoices</a>
                <a class="nav-link" href="manager_content.php?page=billing_generate">Generate Invoices</a>
                <a class="nav-link" href="manager_content.php?page=billing_add_payment">Enter Payment</a>
                <a class="nav-link" href="manager_content.php?page=taxes">Taxes</a>
              </nav>
            </div>

            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseServices" aria-expanded="false" aria-controls="collapseServices">
              <div class="sb-nav-link-icon"><i class="ti ti-package"></i></div>
              Products &amp; Services
              <div class="sb-sidenav-collapse-arrow"><i class="ti ti-chevron-down"></i></div>
            </a>
            <div class="collapse" id="collapseServices" data-bs-parent="#sidenavAccordion">
              <nav class="sb-sidenav-menu-nested nav service-links">
                <a class="nav-link service-link service-link-products" href="manager_content.php?page=services_products">
                  <span class="service-link-icon"><i class="ti ti-package"></i></span>
                  <span class="service-link-label">Other Products</span>
                </a>
                <a class="nav-link service-link service-link-products" href="manager_content.php?page=inventorymanager_items">
                  <span class="service-link-icon"><i class="ti ti-packages"></i></span>
                  <span class="service-link-label">Inventory Items</span>
                </a>
                <a class="nav-link service-link service-link-products" href="manager_content.php?page=subscriptionmanager_plans">
                  <span class="service-link-icon"><i class="ti ti-repeat"></i></span>
                  <span class="service-link-label">Create Plan</span>
                </a>
              </nav>
            </div>

            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseAdmin" aria-expanded="false" aria-controls="collapseAdmin">
              <div class="sb-nav-link-icon"><i class="ti ti-settings"></i></div>
              Administration
              <div class="sb-sidenav-collapse-arrow"><i class="ti ti-chevron-down"></i></div>
            </a>
            <div class="collapse" id="collapseAdmin" data-bs-parent="#sidenavAccordion">
              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="manager_content.php?page=log&amp;action=swtablesort&amp;swtablename=log&amp;swtableform=log&amp;swtablesortcol=date&amp;swtablesortdir=DESC">Log Info</a>
                <a class="nav-link" href="manager_content.php?page=settings">Settings</a>
                <a class="nav-link" href="manager_content.php?page=modules">Modules</a>
                <a class="nav-link" href="manager_content.php?page=config_users">Users</a>
              </nav>
            </div>

            <div class="sb-sidenav-menu-heading">Support</div>
            <a class="nav-link" href="http://www.neobill.net">
              <div class="sb-nav-link-icon"><i class="ti ti-world-www"></i></div>
              NeoBill Website
            </a>
            <a class="nav-link" href="http://www.neobill.net/wiki/">
              <div class="sb-nav-link-icon"><i class="ti ti-help"></i></div>
              Help
            </a>
            <a class="nav-link" href="http://www.neobill.net/wiki/doku.php/about:team">
              <div class="sb-nav-link-icon"><i class="ti ti-info-circle"></i></div>
              Credits
            </a>
          </div>
        </div>
      </nav>
    </div>
{else}
  <div class="container-fluid py-3">
    <a href="index.php" class="d-inline-flex align-items-center gap-2 text-decoration-none">
      <img src="images/logo.gif" alt="NeoBill" style="height:48px;" />
    </a>
  </div>
{/if}
