{if isset($username) && $username != ""}
  <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <a class="navbar-brand ps-3" href="manager_content.php?page=home">NeoBill</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
      <i class="ti ti-menu-2"></i>
    </button>

    <div class="d-none d-md-inline-block ms-auto me-3">
      <span class="text-white-50 small">{$username}</span>
    </div>

    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
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
            <div class="sb-sidenav-menu-heading">Core</div>
            <a class="nav-link" href="manager_content.php?page=home">
              <div class="sb-nav-link-icon"><i class="ti ti-home"></i></div>
              Home
            </a>

            <div class="sb-sidenav-menu-heading">NeoBill</div>

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
                <a class="nav-link" href="manager_content.php?page=pending_orders">Pending Orders</a>
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
              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="manager_content.php?page=services_web_hosting">Web Hosting</a>
                <a class="nav-link" href="manager_content.php?page=services_domain_services">Domain Services</a>
                <a class="nav-link" href="manager_content.php?page=services_products">Other Products</a>
                <a class="nav-link" href="manager_content.php?page=services_servers">Servers</a>
                <a class="nav-link" href="manager_content.php?page=services_ip_manager">IP Addresses</a>
              </nav>
            </div>

            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseDomains" aria-expanded="false" aria-controls="collapseDomains">
              <div class="sb-nav-link-icon"><i class="ti ti-world"></i></div>
              Domains
              <div class="sb-sidenav-collapse-arrow"><i class="ti ti-chevron-down"></i></div>
            </a>
            <div class="collapse" id="collapseDomains" data-bs-parent="#sidenavAccordion">
              <nav class="sb-sidenav-menu-nested nav">
                <a class="nav-link" href="manager_content.php?page=domains_browse">Registered Domains</a>
                <a class="nav-link" href="manager_content.php?page=domains_expired">Expired Domains</a>
                <a class="nav-link" href="manager_content.php?page=domains_register">Register New Domain</a>
                <a class="nav-link" href="manager_content.php?page=transfer_domain">Transfer Domain</a>
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

            <div class="sb-sidenav-menu-heading">About</div>
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
              NeoBill Credit
            </a>
          </div>
        </div>
        <div class="sb-sidenav-footer">
          <div class="small">Logged in as:</div>
          {$username}
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

