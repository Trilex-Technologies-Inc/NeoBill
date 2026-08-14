<?php

/**
 * solidworks.php
 *
 * This file contains the primary functions of the SolidWorks framework
 *
 * @package SolidWorks
 * @author John Diamond <jdiamond@solid-state.org>
 * @copyright John Diamond <jdiamond@solid-state.org>
 * @license http://www.opensource.org/licenses/gpl-license.php GNU Public License
 */

// Load the application configuration (including Page definitions)
require "configuration.php";

// Load support libraries
require "smarty_extensions.php";
require "security.php";

// Change the charset to UTF-8
header("Content-type: text/html; charset=utf-8");

// Open the session
session_start();

/**
 * SolidWorks (entry point)
 *
 * This function serves as the entry point for the entire application.  It opens
 * the session, loads the Page object, processes any forms, and invokes any actions
 * for the page.
 *
 * @package SolidWorks
 * @author John Diamond <jdiamond@solid-state.org>
 */
function solidworks(&$conf, $smarty)
{
	global $page; // Make the Page object available to smarty_extensions
	global $translations;

	// Make sure the client is logged in as a valid user before proceeding
	validate_client();

	// Module links are omitted from the menu when disabled, but bookmarks and
	// manually entered URLs still need the same protection.
	guard_module_page_request($conf);

	// Load the user's language preference
	$language = !empty($_SESSION['client']['userdbo']) ?
		$_SESSION['client']['userdbo']->getLanguage() : null;
	if ($language != null) {
		TranslationParser::load(($conf['application_dir'] ?? getcwd()) . "/language/" . $language);
		Translator::getTranslator()->setActiveLanguage($language);
	}

	$currentPage = $_SESSION['currentpage'] ?? null;
	if ($currentPage != ($_GET['page'] ?? null)) {
		$_SESSION['lastpage'] = $currentPage;
	}

	// Get a Page object for the page being requested
	$page = null;
	$page = get_page_object($conf, $smarty);
	if ($page == null) {
		// Delete current session
		session_destroy();

		// Instantiate a generic page object
		$page = new Page;
	}

	// Make sure the client has access to this page
	if (!$page->control_access()) {
		// Access denied
		$page->setError(array("type" => "ACCESS_DENIED"));
		$page->goback(1);
	}

	// Process any forms
	if (($_SERVER['REQUEST_METHOD'] ?? 'GET') == "POST") {
		handle_post_request();
	}

	// Execute any action if present in the URL
	if (isset($_GET['action'])) {

		$page->action($_GET['action']);
	}

	// Display
	display_page($page);

	// Push page onto the navigation stack
	$_SESSION['navstack'][] = array(
		"page" => $page->getName(),
		"url" => $page->getURL()
	);
}

/**
 * Prevent disabled or missing modules from serving manager pages directly.
 *
 * Known module pages are tracked while module.conf files are loaded. An unknown
 * URL containing an underscore is also treated as a possibly removed module
 * route, instead of exposing the framework's internal "page not found" error.
 */
function guard_module_page_request(&$conf)
{
	$requestedPage = $_GET['page'] ?? ($conf['home_page'] ?? 'home');
	$registry = ModuleRegistry::getModuleRegistry();
	$moduleName = $registry->getPageModule($requestedPage);
	$unavailable = false;
	$corePageModules = array(
			'purchasesubscription' => 'subscriptionmanager'
	);
	if ($moduleName === null && isset($corePageModules[$requestedPage])) {
		$moduleName = $corePageModules[$requestedPage];
	}

	if ($moduleName !== null) {
		try {
			$unavailable = !$registry->getModule($moduleName)->isEnabled();
		} catch (ModuleDoesNotExistException $e) {
			$unavailable = true;
		}
	} elseif (get_page_class($requestedPage) === null && strpos($requestedPage, '_') !== false) {
		// A removed module cannot contribute its module.conf, so its exact page
		// mapping is no longer available. Handle module-shaped legacy URLs safely.
		$unavailable = true;
	}

	if (!$unavailable) {
		return;
	}

	$_SESSION['errors'][] = array(
			'type' => 'The requested module is not installed or enabled.'
	);
	$_GET['page'] = get_page_class('modules') !== null ? 'modules' : $conf['home_page'];
	unset($_GET['action'], $_GET['submit']);
	$_SERVER['REQUEST_METHOD'] = 'GET';
}

function display_page($page)
{
	$conf = $page->conf;
	$smarty = $page->smarty;
	$enabledModules = array();
	foreach (ModuleRegistry::getModuleRegistry()->getAllModules() as $moduleName => $module) {
		$enabledModules[$moduleName] = $module->isEnabled();
	}

	// Update page variables - they may need to be filled in with run-time info
	generate_location_stack($conf);
	$pageData = $conf['pages'][$page->getClassName()] ?? array();
	$page->setLocationStack($pageData['location_stack'] ?? array());
	$pageTitle = $pageData['title'] ?? '';
	$pageUrl = $pageData['url'] ?? '';
	if (!empty($_SESSION['nav_vars']) && is_array($_SESSION['nav_vars'])) {
		foreach ($_SESSION['nav_vars'] as $name => $value) {
			$placeholder = "{" . $name . "}";
			$pageTitle = str_replace($placeholder, $value, $pageTitle);
			$pageUrl = str_replace($placeholder, $value, $pageUrl);
		}
	}
	$page->setTitle($pageTitle);
	$page->setUrl($pageUrl);

	// Set template variables
	$smarty->assign("location", $page->getTitle());
	$smarty->assign("location_stack", $page->getLocationStack());
	$smarty->assign("company_name", $conf['company']['name'] ?? 'NeoBill');
	$smarty->assign("client_ip", $_SERVER['REMOTE_ADDR'] ?? '');
	$smarty->assign("content_template", $page->getTemplateFile());
	$smarty->assign("url", $page->getUrl());
	$smarty->assign("version", $conf['application_name'] ?? 'NeoBill');
	$smarty->assign("machine", $_SERVER['SERVER_NAME'] ?? '');
	$smarty->assign("enabled_modules", $enabledModules);
	if (!empty($_SESSION['client']['userdbo'])) {
		$smarty->assign("username", $_SESSION['client']['userdbo']->getUsername());
	}

	// Invoke any javascript
	if (isset($_SESSION['jsFunction'])) {
		$smarty->assign("jsFunction", $_SESSION['jsFunction']);
		unset($_SESSION['jsFunction']);
	}

	if (intval($_GET['no_headers'] ?? 0) == 1) {
		// Display without headers
		$output = $smarty->fetch($page->getTemplateFile());
	} else {
		// Display with headers
		$output = $smarty->fetch(Page::selectTemplateFile($conf['main_template']));
	}
	// Some legacy Smarty display paths bypass registered output filters.
	echo Translator::getTranslator()->translateString($output);

	// Remove messages and errors from session
	$session = &$page->getPageSession();
	if (is_array($session)) {
		unset($session['errors']);
		unset($session['messages']);
	}
}

/**
 * Handle Post Request
 *
 * Process a POST form according to the rules defined in the application config
 * file.
 */
function handle_post_request()
{
	global $page, $conf;

	// Reset form errors
	unset($_SESSION[$page->getName()]['form_errors']);

	// Prefer the original query parameter, but accept the hidden POST marker
	// when a web-server rewrite or proxy has stripped the query string.
	$form_name = $_GET['submit'] ?? ($_POST['_sw_form'] ?? null);
	unset($_POST['_sw_form']);
	if (!is_string($form_name) || $form_name === '') {
		// A POST that cannot be associated with a configured form must not be
		// processed. Return to the page using GET instead of exposing an exception.
		header("Location: " . $page->getURL(), true, 303);
		exit();
	}

	// Validate the form
	if ($page->processForm($form_name)) {
		// No errors in form - go ahead and process
		try {
			$page->action($form_name);
		} catch (SWUserException $e) {
			// User Exceptions are meant to be displayed on the page
			$page->exception($e);
			$page->reload();
		}
	}
}

/**
 * Get Page Object
 *
 * Instantiates a Page object for the request page provided by the
 * 'page' parameter in the URL.
 *
 * @param array $conf Configuration data
 * @param object $smarty Smarty template object
 * @return Page A reference to the page object.  If the page parameter is invalid, null is returned.
 */
function &get_page_object($conf, $smarty)
{
	if (!isset($_GET['page'])) {
		// No page parameter is provided, set to home page
		$_GET['page'] = $conf['home_page'];
	}

	// Find the requested Page object
	$requested_page_name = $_GET['page'];
	$page_class = get_page_class($requested_page_name);

	// Verify the requested page was found
	if ($page_class == null) {
		throw new SWException("Could not find the requested page name: " .
			$requested_page_name);
	}

	// A module guard may select a fallback after configuration.php performed
	// its one-time, request-specific class include.
	if (!class_exists($page_class, false)) {
		$pageData = $conf['pages'][$page_class] ?? array();
		$classFile = $pageData['class_file'] ?? null;
		if ($classFile !== null && is_file(BASE_PATH . $classFile)) {
			require_once BASE_PATH . $classFile;
		}
	}
	if (!class_exists($page_class, false)) {
		throw new SWException("Could not load the requested page class: " . $page_class);
	}

	// Instantiate an object for the requested page and return as a reference

	$page_obj = new $page_class;

	// Set the class name - workaround for PHP 5 get_class behavior.
	$page_obj->class_name = $page_class;

	$page_obj->load($conf, $smarty);

	if ($page_obj->isDisabled()) {
		throw new SWException("This page has been disabled");
	}

	if (method_exists($page_obj, 'init')) {
		// init() function takes on the role of a contructor for Page objects
		$page_obj->init();
	}

	// Remove any page data from the session of Pages other than this one
	foreach ($conf['pages'] as $page_class_name => $page_conf) {
		if ($page_conf['name'] != $requested_page_name) {
			// Not data for this page - remove from session
			unset($_SESSION[$page_conf['name']]);
		}
	}

	return $page_obj;
}

/**
 * Dump Session
 *
 * Prints $_SESSION inside 'pre' tags
 */
function dump_session()
{
	echo "<pre>";
	print_r($_SESSION);
	echo "</pre>";
}
