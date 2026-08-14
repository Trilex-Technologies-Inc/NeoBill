<?php
/**
 * LanguageValidator.class.php
 *
 * This file contains the definition of the LanguageValidator class.
 *
 * @package SolidWorks
 * @author John Diamond <jdiamond@solid-state.org>
 * @copyright John Diamond <jdiamond@solid-state.org>
 * @license http://www.opensource.org/licenses/gpl-license.php GNU Public License
 */

/**
 * LanguageValidator
 *
 * @package SolidWorks
 * @author John Diamond <jdiamond@solid-state.org>
 */
class LanguageValidator extends ChoiceValidator {
	/**
	 * Get Valid Choices
	 *
	 * Returns all the valid languages
	 *
	 * @return array An array of valid language choices
	 */
	function getValidChoices() {
		global $conf;

		$languages = array();
		$applicationDir = $conf['application_dir'] ?? getcwd();
		$languageDir = rtrim( (string)$applicationDir, DIRECTORY_SEPARATOR ) . DIRECTORY_SEPARATOR . "language";

		// Resolve the directory from the application, not PHP's process CWD.
		$langDir = @opendir( $languageDir );
		if ( $langDir === false ) {
			return $languages;
		}
		while ( false !== ($file = readdir( $langDir )) ) {
			if ( is_file( $languageDir . DIRECTORY_SEPARATOR . $file ) ) {
				$languages[$file] = $file;
			}
		}
		closedir( $langDir );

		return $languages;
	}
}
?>
