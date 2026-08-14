<?php
/*
 * @(#)install/pages/requirements.php
 *
 *    Version: 0.50.20090401
 * Written by: John Diamond <mailto:jdiamond@solid-state.org>
 * Written by: Yves Kreis <mailto:yves.kreis@hosting-skills.org>
 *
 * Copyright (C) 2006-2008 by John Diamond
 * Copyright (C) 2009 by Yves Kreis
 *
 * This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License 
 * as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty 
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program; if not, write to the 
 * Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 *
 */

  $filepath = dirname(__FILE__).'/../../';
  $minimumPhpVersion = '8.0.0';
  $checkfailed = false;
?>
        <div class="mb-4">
          <span class="text-uppercase text-success fw-semibold small">Step 2 of 6</span>
          <h1 class="h3 mt-1 mb-2"><?php echo _INSTALLERREQUIREMENTS; ?></h1>
          <p class="text-muted mb-0">Confirm that your server is ready before continuing.</p>
        </div>

        <section class="requirement-section mb-4" aria-labelledby="php-requirement-heading">
          <h2 id="php-requirement-heading" class="h5 mb-3"><?php echo _INSTALLERPHPVERSION; ?></h2>
          <ul class="systemrequirements mb-0">
<?php
  $phpversion = (strpos(phpversion(), '-') !== false)
                 ? substr(phpversion(), 0, strpos(phpversion(), '-')) : phpversion();
  if (version_compare($phpversion, $minimumPhpVersion, '>=')) {
    echo '          <li class="passed">', str_replace(array('%0', '%1'), array(htmlspecialchars($phpversion, ENT_QUOTES, 'UTF-8'), $minimumPhpVersion), _INSTALLERPHPVERSIONOK), '.</li>', "\n";
  } else {
    echo '          <li class="failed">', str_replace(array('%0', '%1'), array(htmlspecialchars($phpversion, ENT_QUOTES, 'UTF-8'), $minimumPhpVersion), _INSTALLERPHPVERSIONKO), '.</li>', "\n";
    $checkfailed = true;
  }

  if (extension_loaded('mysqli')) {
    echo '          <li class="passed">The mysqli extension is available.</li>', "\n";
  } else {
    echo '          <li class="failed">The mysqli extension is required for database access.</li>', "\n";
    $checkfailed = true;
  }
?>
          </ul>
        </section>
        <section class="requirement-section" aria-labelledby="permissions-heading">
        <h2 id="permissions-heading" class="h5 mb-3"><?php echo _INSTALLERPERMISSIONS; ?></h2>
        <ul class="systemrequirements mb-3">
          <li class="description"><?php echo _INSTALLERPERMISSIONSFILE, ':'; ?></li>
<?php
  $config_dir = $filepath . 'config/';
  $sample_file = $config_dir . 'config-sample.inc.php';
  $file = $config_dir . 'config.inc.php';

  if (!file_exists($file) && is_writable($config_dir) && file_exists($sample_file)) {
    create_config_file();
  }

  if (!file_exists($file)) {
    echo  '         <li class="failed">', $file, '</li>', "\n";
    echo '          <li class="failed">', "The configuration file does not exist, please make sure config.inc.php exists in directory config", '.</li>', "\n";
  }
  
  if (is_writable($file)) {
    echo '          <li class="passed"><span class="path-value">', htmlspecialchars($file, ENT_QUOTES, 'UTF-8'), '</span> ', _INSTALLERPERMISSIONSWRITABLEOK, '.</li>', "\n";
  } else {
    echo '          <li class="failed"><span class="path-value">', htmlspecialchars($file, ENT_QUOTES, 'UTF-8'), '</span></li>', "\n";
    echo '          <li class="failed">', _INSTALLERPERMISSIONSWRITABLEKOFILE, '.</li>', "\n";
    $checkfailed = true;
  }
?>
        </ul>
        <form action="index.php" method="post">
          <ul class="systemrequirements">
            <li class="description"><?php echo _INSTALLERPERMISSIONSDIRECTORY, ':'; ?></li>
<?php
  $compiled = '';
  if (isset($_POST['compiled']) && is_string($_POST['compiled'])) {
    $compiled = realpath($_POST['compiled']) ?: $_POST['compiled'];
  }
  if (empty($compiled)) {
    $compiled = realpath($filepath . 'solidworks/smarty/templates_c');
  }
  if (is_writable($compiled)) {
    echo '            <li class="passed"><input class="form-control path-input" type="text" name="compiled" aria-label="Compiled templates directory" value="', htmlspecialchars($compiled, ENT_QUOTES, 'UTF-8'), '" /> <span>', _INSTALLERPERMISSIONSWRITABLEOK, '.</span></li>', "\n";
  } else {
    echo '            <li class="failed"><input class="form-control path-input" type="text" name="compiled" aria-label="Compiled templates directory" value="', htmlspecialchars($compiled, ENT_QUOTES, 'UTF-8'), '" /></li>', "\n";
    echo '            <li class="failed">', _INSTALLERPERMISSIONSWRITABLEKODIRECTORY, '.</li>', "\n";
    $checkfailed = true;
  }
?>
          </ul>
          <ul class="systemrequirements">
            <li class="description"><?php echo _INSTALLERPERMISSIONSDIRECTORY, ':'; ?></li>
<?php
  $cache = '';
  if (isset($_POST['cache']) && is_string($_POST['cache'])) {
    $cache = realpath($_POST['cache']) ?: $_POST['cache'];
  }
  if (empty($cache)) {
    $cache= realpath($filepath . 'solidworks/smarty/cache');
  }
  if (is_writable($cache)) {
    echo '            <li class="passed"><input class="form-control path-input" type="text" name="cache" aria-label="Cache directory" value="', htmlspecialchars($cache, ENT_QUOTES, 'UTF-8'), '" /> <span>', _INSTALLERPERMISSIONSWRITABLEOK, '.</span></li>', "\n";
  } else {
    echo '            <li class="failed"><input class="form-control path-input" type="text" name="cache" aria-label="Cache directory" value="', htmlspecialchars($cache, ENT_QUOTES, 'UTF-8'), '" /></li>', "\n";
    echo '            <li class="failed">', _INSTALLERPERMISSIONSWRITABLEKODIRECTORY, '.</li>', "\n";
    $checkfailed = true;
  }
?>
          </ul>
          <div class="submit d-flex justify-content-end">
<?php
	  if ($checkfailed) {
	    echo '            <input type="hidden" name="install_step" value="2" />', "\n";
	    echo '            <input class="btn btn-secondary" type="submit" value="', _INSTALLERRECHECK, '" />', "\n";
	  } else {
	    echo '            <input type="hidden" name="function" value="config_system" />', "\n";
	    echo '            <input type="hidden" name="install_step" value="3" />', "\n";
	    echo '            <input class="btn btn-primary" type="submit" value="', _INSTALLERNEXT, '" />', "\n";
	  }
	?>
	          </div>
	        </form>
          </section>
