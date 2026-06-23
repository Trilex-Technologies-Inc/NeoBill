(() => {
  const STORAGE_KEY = "neobill|sidebar-toggled";
  const MOBILE_QUERY = "(max-width: 991.98px)";

  function updateToggleState() {
    const toggle = document.getElementById("sidebarToggle");
    if (!toggle) return;

    const toggled = document.body.classList.contains("sb-sidenav-toggled");
    const sidebarVisible = window.matchMedia(MOBILE_QUERY).matches
      ? toggled
      : !toggled;
    toggle.setAttribute("aria-expanded", sidebarVisible ? "true" : "false");
  }

  function applyInitialState() {
    if (window.matchMedia(MOBILE_QUERY).matches) {
      document.body.classList.remove("sb-sidenav-toggled");
      updateToggleState();
      return;
    }

    try {
      if (localStorage.getItem(STORAGE_KEY) === "1") {
        document.body.classList.add("sb-sidenav-toggled");
      }
    } catch {
      // Ignore storage access issues (e.g. privacy mode)
    }
    updateToggleState();
  }

  function wireToggle() {
    const toggle = document.getElementById("sidebarToggle");
    if (!toggle) return;

    toggle.addEventListener("click", (event) => {
      event.preventDefault();
      const toggled = document.body.classList.toggle("sb-sidenav-toggled");
      updateToggleState();
      try {
        localStorage.setItem(STORAGE_KEY, toggled ? "1" : "0");
      } catch {
        // Ignore storage access issues
      }
    });
  }

  function activateSidebarSection() {
    const currentPage = new URL(window.location.href).searchParams.get("page");
    const pageName = currentPage || "home";
    const links = document.querySelectorAll(".sb-sidenav-menu a.nav-link[href]");
    let matchedLink = false;

    function openSection(collapseParent) {
      if (!collapseParent) return;

      const collapseTrigger = document.querySelector(
        `[data-bs-target="#${collapseParent.id}"]`
      );
      if (collapseTrigger) {
        collapseTrigger.classList.remove("collapsed");
        collapseTrigger.classList.add("active-section");
        collapseTrigger.setAttribute("aria-expanded", "true");
      }
      if (window.bootstrap && window.bootstrap.Collapse) {
        window.bootstrap.Collapse.getOrCreateInstance(collapseParent, {
          toggle: false,
        }).show();
      } else {
        collapseParent.classList.add("show");
      }
    }

    links.forEach((link) => {
      const linkPage = new URL(link.href, window.location.origin).searchParams.get(
        "page"
      );
      if (linkPage === pageName) {
        matchedLink = true;
        link.classList.add("active");
        link.setAttribute("aria-current", "page");
        openSection(link.closest(".collapse"));
      }
    });

    if (!matchedLink) {
      const routeGroups = [
        { id: "collapseAccounts", pattern: /^(accounts_|pending_orders|fulfilled_orders|view_order)/ },
        { id: "collapseBilling", pattern: /^(billing_|taxes|edit_payment|add_invoice|delete_invoice)/ },
        { id: "collapseServices", pattern: /^(services_|edit_hosting_purchase|edit_product_purchase)/ },
        { id: "collapseDomains", pattern: /^(domains_|transfer_domain)/ },
        { id: "collapseAdmin", pattern: /^(log|view_log_message|settings|modules|config_)/ },
      ];
      const activeGroup = routeGroups.find((group) => group.pattern.test(pageName));
      if (activeGroup) {
        openSection(document.getElementById(activeGroup.id));
      }
    }
  }

  function wireMobileDismiss() {
    const content = document.getElementById("layoutSidenav_content");
    const links = document.querySelectorAll(
      ".sb-sidenav-menu-nested .nav-link, .sb-sidenav-menu > .nav > .nav-link:not([data-bs-toggle])"
    );

    function closeMobileSidebar() {
      if (window.matchMedia(MOBILE_QUERY).matches) {
        document.body.classList.remove("sb-sidenav-toggled");
        updateToggleState();
      }
    }

    if (content) {
      content.addEventListener("click", closeMobileSidebar);
    }
    links.forEach((link) => link.addEventListener("click", closeMobileSidebar));
  }

  document.addEventListener("DOMContentLoaded", () => {
    applyInitialState();
    wireToggle();
    activateSidebarSection();
    wireMobileDismiss();
  });
})();
