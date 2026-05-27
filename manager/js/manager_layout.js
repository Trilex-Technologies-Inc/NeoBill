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

  document.addEventListener("DOMContentLoaded", () => {
    applyInitialState();
    wireToggle();
  });
})();

