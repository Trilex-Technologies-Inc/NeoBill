(() => {
  const STORAGE_KEY = "neobill|sidebar-toggled";

  function applyInitialState() {
    try {
      if (localStorage.getItem(STORAGE_KEY) === "1") {
        document.body.classList.add("sb-sidenav-toggled");
      }
    } catch {
      // Ignore storage access issues (e.g. privacy mode)
    }
  }

  function wireToggle() {
    const toggle = document.getElementById("sidebarToggle");
    if (!toggle) return;

    toggle.addEventListener("click", (event) => {
      event.preventDefault();
      const toggled = document.body.classList.toggle("sb-sidenav-toggled");
      try {
        localStorage.setItem(STORAGE_KEY, toggled ? "1" : "0");
      } catch {
        // Ignore storage access issues
      }
    });
  }

  function activateSidebarSection() {
    const currentPage = new URL(window.location.href).searchParams.get("page");
    if (!currentPage) {
      return;
    }

    const nestedLinks = document.querySelectorAll(
      ".sb-sidenav-menu .sb-sidenav-menu-nested .nav-link"
    );

    nestedLinks.forEach((link) => {
      const linkPage = new URL(link.href, window.location.origin).searchParams.get(
        "page"
      );
      if (linkPage === currentPage) {
        link.classList.add("active");

        const collapseParent = link.closest(".collapse");
        if (collapseParent) {
          const collapseTrigger = document.querySelector(
            `[data-bs-target="#${collapseParent.id}"]`
          );
          if (collapseTrigger) {
            collapseTrigger.classList.remove("collapsed");
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
      }
    });
  }

  document.addEventListener("DOMContentLoaded", () => {
    applyInitialState();
    wireToggle();
    activateSidebarSection();
  });
})();

