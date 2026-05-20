{if isset($username) && $username != ""}
  <!-- Sidebar Start -->
  <aside class="left-sidebar">
    <div>
      <div class="brand-logo d-flex align-items-center justify-content-between">
        <a href="manager_content.php?page=home" class="text-nowrap logo-img">
          <img src="images/logo.gif" alt="NeoBill" style="height:40px;" />
        </a>
        <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
          <span class="fs-6">×</span>
        </div>
      </div>

      <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
        <ul id="sidebarnav">
          <li class="nav-small-cap">
            <span class="hide-menu">Navigation</span>
          </li>

          <li class="sidebar-item">
            <a class="sidebar-link" href="manager_content.php?page=home" aria-expanded="false">
              <span class="hide-menu">Home</span>
            </a>
          </li>

          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="#nb-accounts" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="nb-accounts">
              <span class="hide-menu">Accounts</span>
            </a>
            <ul id="nb-accounts" class="collapse first-level" data-bs-parent="#sidebarnav">
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=accounts_browse"><span class="hide-menu">Active Accounts</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=accounts_browse_pending"><span class="hide-menu">Pending Accounts</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=accounts_browse_inactive"><span class="hide-menu">Inactive Accounts</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=pending_orders"><span class="hide-menu">Pending Orders</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=fulfilled_orders"><span class="hide-menu">Fulfilled Orders</span></a></li>
            </ul>
          </li>

          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="#nb-billing" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="nb-billing">
              <span class="hide-menu">Billing &amp; Invoices</span>
            </a>
            <ul id="nb-billing" class="collapse first-level" data-bs-parent="#sidebarnav">
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=billing_invoices_outstanding"><span class="hide-menu">Outstanding Invoices</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=billing_invoices"><span class="hide-menu">All Invoices</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=billing_generate"><span class="hide-menu">Generate Invoices</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=billing_add_payment"><span class="hide-menu">Enter Payment</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=taxes"><span class="hide-menu">Taxes</span></a></li>
            </ul>
          </li>

          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="#nb-services" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="nb-services">
              <span class="hide-menu">Products &amp; Services</span>
            </a>
            <ul id="nb-services" class="collapse first-level" data-bs-parent="#sidebarnav">
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=services_web_hosting"><span class="hide-menu">Web Hosting Services</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=services_domain_services"><span class="hide-menu">Domain Services</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=services_products"><span class="hide-menu">Other Products</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=addon"><span class="hide-menu">Add-Ons</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=services_servers"><span class="hide-menu">Servers</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=services_ip_manager"><span class="hide-menu">IP Addresses</span></a></li>
            </ul>
          </li>

          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="#nb-domains" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="nb-domains">
              <span class="hide-menu">Domains</span>
            </a>
            <ul id="nb-domains" class="collapse first-level" data-bs-parent="#sidebarnav">
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=domains_browse"><span class="hide-menu">Registered Domains</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=domains_expired"><span class="hide-menu">Expired Domains</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=domains_register"><span class="hide-menu">Register New Domain</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=transfer_domain"><span class="hide-menu">Transfer Domain</span></a></li>
            </ul>
          </li>

          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="#nb-admin" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="nb-admin">
              <span class="hide-menu">Administration</span>
            </a>
            <ul id="nb-admin" class="collapse first-level" data-bs-parent="#sidebarnav">
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=log&amp;action=swtablesort&amp;swtablename=log&amp;swtableform=log&amp;swtablesortcol=date&amp;swtablesortdir=DESC"><span class="hide-menu">Log Info</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=settings"><span class="hide-menu">Settings</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=modules"><span class="hide-menu">Modules</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=config_users"><span class="hide-menu">Users</span></a></li>
            </ul>
          </li>

          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="#nb-about" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="nb-about">
              <span class="hide-menu">About NeoBill</span>
            </a>
            <ul id="nb-about" class="collapse first-level" data-bs-parent="#sidebarnav">
              <li class="sidebar-item"><a class="sidebar-link" href="http://www.neobill.net"><span class="hide-menu">NeoBill Website</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="http://www.neobill.net/wiki/"><span class="hide-menu">Help</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="http://www.neobill.net/wiki/doku.php/about:team"><span class="hide-menu">NeoBill Credit</span></a></li>
              <li class="sidebar-item"><a class="sidebar-link" href="manager_content.php?page=home&amp;action=logout"><span class="hide-menu">Logout</span></a></li>
            </ul>
          </li>

        </ul>
      </nav>
    </div>
  </aside>
  <!-- Sidebar End -->
{else}
  <div class="container-fluid py-3">
    <a href="index.php" class="d-inline-flex align-items-center gap-2 text-decoration-none">
      <img src="images/logo.gif" alt="NeoBill" style="height:48px;" />
    </a>
  </div>
{/if}
