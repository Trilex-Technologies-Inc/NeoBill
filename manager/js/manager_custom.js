$(function () {
	function clearHash() {
		if (window.history && window.history.replaceState) {
			window.history.replaceState(null, document.title,
				window.location.pathname + window.location.search);
		}
	}

	function initialiseSettingsTabs() {
		$(".settings-tabs").each(function () {
			var $tabs = $(this);
			var $links = $tabs.children("ul").first().children("li").children("a[href^='#']");
			var validTabs = [];
			var initialPanel = $tabs.attr("data-initial-panel");

			$tabs.addClass("ui-tabs ui-widget ui-widget-content ui-corner-all");

			$links.each(function () {
				var link = this;
				var panelId = link.getAttribute("href").substring(1);
				var panel = document.getElementById(panelId);

				// A settings tab is valid only for its direct panel.
				if (!panel || panel.parentNode !== $tabs[0]) {
					$(link).closest("li").remove();
					return;
				}

				$(panel).addClass("ui-tabs-panel ui-widget-content ui-corner-bottom");
				validTabs.push({ link: link, panel: panel });
			});

			if (!validTabs.length) {
				if (window.location.hash) {
					clearHash();
				}
				return;
			}

			function activate(tab) {
				$.each(validTabs, function (_, item) {
					var active = item === tab;
					$(item.panel).toggle(active);
					$(item.link).closest("li").toggleClass("ui-tabs-active ui-state-active", active);
					$(item.link).attr("aria-selected", active ? "true" : "false");
				});
			}

			var activeTab = validTabs[0];
			var hashMatched = false;

			$.each(validTabs, function (_, item) {
				if (item.link.getAttribute("href") === window.location.hash) {
					activeTab = item;
					hashMatched = true;
					return false;
				}
				if (!hashMatched && initialPanel && $(item.panel).find("[id='" + initialPanel + "']").length) {
					activeTab = item;
				}
			});

			if (window.location.hash && !hashMatched) {
				clearHash();
			}

			$.each(validTabs, function (_, item) {
				$(item.link).on("click.settingsTabs", function (event) {
					event.preventDefault();
					activate(item);
					if (window.history && window.history.replaceState) {
						window.history.replaceState(null, document.title,
							window.location.pathname + window.location.search + item.link.getAttribute("href"));
					}
				});
			});

			activate(activeTab);
		});
	}

	initialiseSettingsTabs();

	// Other manager pages still use the legacy jQuery UI tabs widget.
	$('[id="tabs"]').not(".settings-tabs").each(function () {
		var $tabs = $(this);
		var $links = $tabs.children("ul").first().children("li").children("a[href^='#tabs-']");
		var hasPanels = $links.length > 0;

		$links.each(function () {
			var panelId = this.getAttribute("href").substring(1);
			var panel = document.getElementById(panelId);

			if (!panel || panel.parentNode !== $tabs[0]) {
				hasPanels = false;
				return false;
			}
		});

		if (hasPanels) {
			$tabs.tabs();
		}
	});
});

