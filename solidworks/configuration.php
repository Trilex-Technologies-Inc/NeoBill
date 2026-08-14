<?php
/**
 * configuration.php
 *
 * This file loads the application configuration (application.conf), then prepares
 * the execution environment for the rest of the application.
 *
 * @package SolidWorks
 * @author John Diamond <jdiamond@solid-state.org>
 * @copyright John Diamond <jdiamond@solid-state.org>
 * @license http://www.opensource.org/licenses/gpl-license.php GNU Public License
 */

// Load Exceptions
require_once "SWException.class.php";

require_once BASE_PATH . "solidworks/DBO.class.php";
require_once BASE_PATH . "DBO/UserDBO.class.php";
require_once "log.php";
require_once "ConfigParser.class.php";
require_once "DBConnection.class.php";
require_once "Translator.class.php";
require_once "TranslationParser.class.php";
require_once "ModuleRegistry.class.php";

// Load Smarty
require "smarty/Smarty.class.php";

// Load Page object
require "Page.class.php";

// Create a Smarty object
$smarty = new Smarty();

// Resolve application assets from the executing controller (manager, order,
// etc.), not from PHP's process working directory.
$applicationRoot = dirname($_SERVER['SCRIPT_FILENAME'] ?? '');
if ($applicationRoot === '' || !is_file($applicationRoot . '/application.conf')) {
	$applicationRoot = getcwd();
}

// Use absolute paths so Smarty works regardless of the web server's current
// working directory. Runtime directories may be absent from fresh deployments.
$smartyRuntimeDirs = array(
	BASE_PATH . "solidworks/smarty/templates_c",
	BASE_PATH . "solidworks/smarty/cache"
);
foreach ($smartyRuntimeDirs as $smartyRuntimeDir) {
	if (!is_dir($smartyRuntimeDir) && !mkdir($smartyRuntimeDir, 0770, true)) {
		throw new RuntimeException("Unable to create Smarty runtime directory: " . $smartyRuntimeDir);
	}
}

$smarty->template_dir = $applicationRoot . "/templates";
$smarty->compile_dir  = BASE_PATH . "solidworks/smarty/templates_c";
$smarty->cache_dir    = BASE_PATH . "solidworks/smarty/cache";
$smarty->config_dir   = BASE_PATH . "solidworks/smarty/configs";

// Register the translator's smarty output filte
$smarty->register_outputfilter( array( "Translator", "filter" ) );

// Install our own top-level exception handler
$oldHandler = set_exception_handler( "SWExceptionHandler" );

// Turn off notices
error_reporting( E_ALL ^ E_NOTICE );

// Load application configuration
$conf = load_config_file( $applicationRoot . "/application.conf" );
$conf['application_dir'] = $applicationRoot;

// Load the default language
TranslationParser::load( $applicationRoot . "/language/english" );

// Setup database confing
$conf['db'] = $db;

// Create the module registry
ModuleRegistry::createModuleRegistry( BASE_PATH . "modules/" );

// Load page classes
if ( isset( $conf['pages'] ) ) {
	if ( !isset( $_GET['page'] ) ) {
		$_GET['page'] = $conf['home_page'];
	}

	foreach ( $conf['pages'] as $class_name => $page_data ) {
		if ( isset( $page_data['class_file'] ) &&
				$_GET['page'] == $page_data['name'] ) {
			require BASE_PATH . $page_data['class_file'];
		}
	}
}

/**
 * Load Application Configuration
 *
 * Instantiates the ConfigParser to load the application.conf XML file.
 *
 * @param string $file Path to application.conf
 * @return array Configuration data
 */
function load_config_file( $file ) {
	$xml_parser = xml_parser_create();
	$config_parser = new ConfigParser();
	xml_set_object( $xml_parser, $config_parser );
	xml_set_element_handler( $xml_parser, "startElement", "endElement" );
	xml_set_character_data_handler( $xml_parser, "characterData" );

	if ( !($fp = @fopen( $file, "r" )) ) {
		return $config_parser->getConfig();
	}

	while( $data = fread( $fp, 4096 ) ) {
		xml_parse( $xml_parser, $data, feof( $fp ) )
				or die( sprintf( "<pre>There is an error in your application.conf:\n %s at line %d</pre>",
				xml_error_string( xml_get_error_code( $xml_parser ) ),
				xml_get_current_line_number( $xml_parser ) ) );
	}
	fclose( $fp );

	xml_parser_free( $xml_parser );

	return $config_parser->getConfig();
}

/**
 * Generate Location Stack
 *
 * Generate a location stack for each page.
 *
 * @param array &$conf Configuration
 */
function generate_location_stack( &$conf ) {
	if ( isset( $conf['pages'] ) ) {
		foreach( $conf['pages'] as $class_name => $page_data ) {
			$conf['pages'][$class_name]['location_stack'] =
					build_location_stack( $page_data['name'] );
		}
	}
}

/**
 * Build Location Stack
 *
 * Build a location stack for a given page (recursive)
 *
 * @return array A reference to the location stack.
 */
function build_location_stack( $page_name ) {
	global $conf;

	$pageClass = get_page_class( $page_name );
	if ($pageClass === null || !isset($conf['pages'][$pageClass])) {
		return array();
	}
	$page_data =& $conf['pages'][$pageClass];

	if ( !empty($page_data['parent']) ) {
		// Use recursion to build a stack of page names
		$stack = build_location_stack( $page_data['parent'] );

		// Replace Nav Vars with their values
		if ( !empty($_SESSION['nav_vars']) && is_array($_SESSION['nav_vars']) ) {
			foreach( $_SESSION['nav_vars'] as $name => $value ) {
				$name = "{" . $name . "}";
					$page_data['title'] =
							str_replace( $name, $value, $page_data['title'] ?? '' );
					$page_data['url']   = str_replace( $name, $value, $page_data['url'] ?? '' );
			}
		}

		// Push page onto nav stack
		array_push( $stack, array( "name" => $page_data['title'] ?? '',
				"url"  => $page_data['url'] ?? '' ) );

		return $stack;
	}
	else {
		// No more - allocate the stack and push this page on the bottom (top for now)
		$stack = array( array( "name" => $page_data['title'] ?? '',
						"url"  => $page_data['url'] ?? '' ) );
		return $stack;
	}
}

/**
 * Get Page Class
 *
 * Return the name of the class which implements a given page name.
 *
 * @return string Class name if found, null if not.
 */
function get_page_class( $name ) {
	global $conf;

	foreach( $conf['pages'] ?? array() as $class_name => $page_data ) {
		if ( ($page_data['name'] ?? null) == $name ) {
			return $class_name;
		}
	}

	// Class not found
	return null;
}

/**
 * SolidWorks Exception Handler
 *
 * @param Exception $e Exception to handle
 */
function SWExceptionHandler( $e ) {
	$fileinfo = pathinfo( $e->getFile() );

	echo "<h1>An uncaught " . get_class( $e ) . " has occured:</h1>";
	echo "<p>\n";
	echo "<b>Thrown from file:</b> " . $fileinfo['basename'];
	echo" <b>at line</b> " . $e->getLine();
	echo "<br/><br/><b>Message:</b> <pre>";
	echo Translator::getTranslator()->translateString( $e->__toString() );
	echo "</pre><br/><br/><b>Stack trace: </b></br>";
	echo "</p>\n<pre>\n";

	foreach( $e->getTrace() as $key => $trace ) {
		$fileinfo = pathinfo( $trace['file'] );
		printf( "#%d: %s at %d, function call: %s\n",
				$key,
				$fileinfo['basename'],
				$trace['line'],
				$trace['function'] );
	}

	echo "\n</pre>\n";
}

?>
