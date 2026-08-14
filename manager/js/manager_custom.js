$(function () {
	var $tabs = $("#tabs");
	if ($tabs.length && $tabs.find("ul > li > a[href^='#tabs-']").length && $tabs.find("div[id^='tabs-']").length) {
		$tabs.tabs();
	}
});

