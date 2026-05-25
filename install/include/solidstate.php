<?php
/*
 * @(#)install/include/solidstate.php
 *
 *    Version: 0.50.20090331
 * Written by: Mark Chaney (MACscr) <mailto:mchaney@maximstudios.com>
 * Written by: Yves Kreis <mailto:yves.kreis@hosting-skills.org>
 *
 * Copyright (C) 2001-2008 by Mark Chaney
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

function check_installed()
{
    $file = fopen('../config/config.inc.php', 'r');
    if (!$file) {
        return false;
    }

    $buffer = array();
    $installed = false;
    while (!feof($file)) {
        $buffer = preg_replace('| |', '', strtolower(fgets($file, 4096)));
        if (!stristr($buffer, '$config[\'installed\']=1;') === false) {
            $installed = true;
        }
    }
    fclose($file);
    return $installed;
}

function modify_config_install()
{
    $config_php = join('', file('../config/config.inc.php'));

    $config_php = preg_replace('/\[\'installed\'\]\s*=\s*(.*);/', "['installed'] = 1;", $config_php);

    $fp = fopen('../config/config.inc.php', 'w+');
    fwrite($fp, $config_php);
    fclose($fp);
}

function modify_config_db()
{
    $config_php = join('', file('../config/config.inc.php'));

    if (get_magic_quotes_gpc()) {
        $hostname = stripslashes($_POST['hostname']);
        $username = stripslashes($_POST['username']);
        $password = base64_encode(stripslashes($_POST['password']));
        $database = stripslashes($_POST['database']);
    } else {
        $hostname = $_POST['hostname'];
        $username = $_POST['username'];
        $password = base64_encode($_POST['password']);
        $database = $_POST['database'];
    }

    $config_php = preg_replace('/\[\'hostname\'\]\s*=\s*(\'|\")(.*)(\'|\");/', "['hostname'] = '$hostname';", $config_php);
    $config_php = preg_replace('/\[\'username\'\]\s*=\s*(\'|\")(.*)(\'|\");/', "['username'] = '$username';", $config_php);
    $config_php = preg_replace('/\[\'password\'\]\s*=\s*(\'|\")(.*)(\'|\");/', "['password'] = '$password';", $config_php);
    $config_php = preg_replace('/\[\'database\'\]\s*=\s*(\'|\")(.*)(\'|\");/', "['database'] = '$database';", $config_php);

    $fp = fopen('../config/config.inc.php', 'w+');
    fwrite($fp, $config_php);
    fclose($fp);
}

function modify_config_system()
{
    $config_php = join('', file('../config/config.inc.php'));

    if (get_magic_quotes_gpc()) {
        $cache    = stripslashes($_POST['cache']);
        $compiled = stripslashes($_POST['compiled']);
    } else {
        $cache    = $_POST['cache'];
        $compiled = $_POST['compiled'];
    }

    $config_php = preg_replace('/\[\'cache\'\]\s*=\s*(\'|\")(.*)(\'|\");/', "['cache']     = '$cache';", $config_php);
    $config_php = preg_replace('/\[\'compiled\'\]\s*=\s*(\'|\")(.*)(\'|\");/', "['compiled']  = '$compiled';", $config_php);

    $fp = fopen('../config/config.inc.php', 'w+');
    fwrite($fp, $config_php);
    fclose($fp);
}

function init_db()
{
    require_once '../config/config.inc.php';

    if (!mysql_connect($db['hostname'], $db['username'], base64_decode($db['password']))) {
        return _INSTALLERDBCONNECTFAILED . ': ' . mysql_error();
    }

    if (!mysql_query("set names 'utf8' collate 'utf8_general_ci';")) {
        return _INSTALLERDBNAMESFAILED . ': ' . mysql_error();
    }

    if (!mysql_select_db($db['database'])) {
        if (isset($_POST['create']) && $_POST['create'] == 'on') {
            if (!mysql_query('create database ' . $db['database'] . ';')) {
                return _INSTALLERDBCREATEFAILED . ': ' . mysql_error();
            }
            if (!mysql_select_db($db['database'])) {
                return _INSTALLERDBSELECTFAILED . ': ' . mysql_error();
            }
        } else {
            return _INSTALLERDBSELECTFAILED . ': ' . mysql_error();
        }
    }

    $sql_file = implode('', file('database/solidstate.mysql'));
    $sql_queries = explode(";\n", $sql_file);
    for ($i = 0; $i < count($sql_queries); $i++) {
        if (!mysql_query($sql_queries[$i])) {
            if (mysql_errno() != 1065) {
                return _INSTALLERDBQUERYFAILED . ': ' . mysql_error();
            }
        }
    }

    mysql_close();

    return '';
}

function valid_email($_email)
{
    return preg_match('/^[A-Za-z0-9\&\'\+\-\_]+(\.[A-Za-z0-9\&\'\+\-\_]+)*@[A-Za-z0-9\-]+\.([A-Za-z0-9\-]+\.)*?[A-Za-z]+$/', stripslashes($_email));
}

function valid_currency_code($_currency)
{
    return preg_match('/^[A-Za-z]{3}$/', $_currency);
}

function valid_nameserver($_nameserver, $required = true)
{
    if (!$required && $_nameserver === '') {
        return true;
    }

    // Allow hostname-ish strings and IPv4 literals; block obvious injection characters.
    if (!preg_match('/^[A-Za-z0-9\\.\\-]+$/', $_nameserver)) {
        return false;
    }

    // Basic sanity: disallow consecutive dots.
    if (strpos($_nameserver, '..') !== false) {
        return false;
    }

    return true;
}

function create_admin()
{
    global $message;

    if ('' == $_POST['username'] || '' == $_POST['password-1'] || '' == $_POST['email']) {
        $_POST['install_step'] = '4';
        $message = _INSTALLERREQUIREDFIELDSKO;
        return;
    }

    if (strlen($_POST['username']) > 64 || !preg_match('/^[A-Za-z0-9_\\.\\-]+$/', $_POST['username'])) {
        $_POST['install_step'] = '4';
        $message = _INSTALLERREQUIREDFIELDSKO;
        return;
    }

    if ($_POST['password-1'] != $_POST['password-2']) {
        $_POST['install_step'] = '4';
        $message = _INSTALLERPASSWORDSMATCHKO;
        return;
    }

    if (!valid_email($_POST['email'])) {
        $_POST['install_step'] = '4';
        $message = _INSTALLERVALIDEMAILKO;
        return;
    }

    require_once '../config/config.inc.php';
    $dbh = mysql_connect($db['hostname'], $db['username'], base64_decode($db['password'])) or die(_INSTALLERDBCONNECTFAILED . ': ' . mysql_error());
    mysql_query("set names 'utf8' collate 'utf8_general_ci';", $dbh) or die(_INSTALLERDBNAMESFAILED . ': ' . mysql_error());
    mysql_select_db($db['database'], $dbh) or die(_INSTALLERDBSELECTFAILED . ': ' . mysql_error());

    $firstname_raw = isset($_POST['firstname']) ? $_POST['firstname'] : '';
    $lastname_raw  = isset($_POST['lastname']) ? $_POST['lastname'] : '';
    $username_raw  = isset($_POST['username']) ? $_POST['username'] : '';
    $email_raw     = isset($_POST['email']) ? $_POST['email'] : '';

    if (get_magic_quotes_gpc()) {
        $firstname_raw = stripslashes($firstname_raw);
        $lastname_raw  = stripslashes($lastname_raw);
        $username_raw  = stripslashes($username_raw);
        $email_raw     = stripslashes($email_raw);
    }

    $firstname = mysql_real_escape_string($firstname_raw, $dbh);
    $lastname  = mysql_real_escape_string($lastname_raw, $dbh);
    $username  = mysql_real_escape_string($username_raw, $dbh);
    $email     = mysql_real_escape_string($email_raw, $dbh);

    $password_raw = isset($_POST['password-1']) ? $_POST['password-1'] : '';
    if (get_magic_quotes_gpc()) {
        $password_raw = stripslashes($password_raw);
    }
    $password = md5($password_raw);

    $contactname_raw = trim($firstname_raw . ' ' . $lastname_raw);
    $contactname = mysql_real_escape_string($contactname_raw, $dbh);

    $allowed_languages = get_languages_installer();
    $language_cookie = isset($_COOKIE['language']) ? $_COOKIE['language'] : '';
    if (!in_array($language_cookie, $allowed_languages)) {
        $language_cookie = count($allowed_languages) > 0 ? $allowed_languages[0] : 'english';
    }
    $language = mysql_real_escape_string($language_cookie, $dbh);

    mysql_query("INSERT INTO `user` (`username`, `password`, `type`, `contactname`, `email`, `language`) VALUES ('$username', '$password', 'Administrator', '$contactname', '$email', '$language');", $dbh) or die(_INSTALLERDBQUERYFAILED . ': ' . mysql_error());
    mysql_close($dbh);
}

function create_company()
{
    global $message;

    if ('' == $_POST['company'] || '' == $_POST['email'] || '' == $_POST['currency'] || '' == $_POST['nameserver-1'] || '' == $_POST['nameserver-2']) {
        $_POST['install_step'] = '5';
        $message = _INSTALLERREQUIREDFIELDSKO;
        return;
    }

    if (strlen($_POST['company']) > 255) {
        $_POST['install_step'] = '5';
        $message = _INSTALLERREQUIREDFIELDSKO;
        return;
    }

    if (!valid_email($_POST['email'])) {
        $_POST['install_step'] = '5';
        $message = _INSTALLERVALIDEMAILKO;
        return;
    }

    if (!valid_currency_code($_POST['currency'])) {
        $_POST['install_step'] = '5';
        $message = _INSTALLERREQUIREDFIELDSKO;
        return;
    }

    if (!valid_nameserver($_POST['nameserver-1'], true) || !valid_nameserver($_POST['nameserver-2'], true) || !valid_nameserver($_POST['nameserver-3'], false) || !valid_nameserver($_POST['nameserver-4'], false)) {
        $_POST['install_step'] = '5';
        $message = _INSTALLERREQUIREDFIELDSKO;
        return;
    }

    if (get_magic_quotes_gpc()) {
        $company_raw      = stripslashes($_POST['company']);
        $email_raw        = stripslashes($_POST['email']);
        $currency_raw     = stripslashes($_POST['currency']);
        $nameserver_1_raw = stripslashes($_POST['nameserver-1']);
        $nameserver_2_raw = stripslashes($_POST['nameserver-2']);
        $nameserver_3_raw = stripslashes($_POST['nameserver-3']);
        $nameserver_4_raw = stripslashes($_POST['nameserver-4']);
    } else {
        $company_raw      = $_POST['company'];
        $email_raw        = $_POST['email'];
        $currency_raw     = $_POST['currency'];
        $nameserver_1_raw = $_POST['nameserver-1'];
        $nameserver_2_raw = $_POST['nameserver-2'];
        $nameserver_3_raw = $_POST['nameserver-3'];
        $nameserver_4_raw = $_POST['nameserver-4'];
    }

    require_once '../config/config.inc.php';
    $dbh = mysql_connect($db['hostname'], $db['username'], base64_decode($db['password'])) or die(_INSTALLERDBCONNECTFAILED . ': ' . mysql_error());
    mysql_query("set names 'utf8' collate 'utf8_general_ci';", $dbh) or die(_INSTALLERDBNAMESFAILED . ': ' . mysql_error());
    mysql_select_db($db['database'], $dbh) or die(_INSTALLERDBSELECTFAILED . ': ' . mysql_error());

    $company      = mysql_real_escape_string($company_raw, $dbh);
    $email        = mysql_real_escape_string($email_raw, $dbh);
    $currency     = mysql_real_escape_string($currency_raw, $dbh);
    $nameserver_1 = mysql_real_escape_string($nameserver_1_raw, $dbh);
    $nameserver_2 = mysql_real_escape_string($nameserver_2_raw, $dbh);
    $nameserver_3 = mysql_real_escape_string($nameserver_3_raw, $dbh);
    $nameserver_4 = mysql_real_escape_string($nameserver_4_raw, $dbh);

    $allowed_languages = get_languages_installer();
    $language_cookie = isset($_COOKIE['language']) ? $_COOKIE['language'] : '';
    if (!in_array($language_cookie, $allowed_languages)) {
        $language_cookie = count($allowed_languages) > 0 ? $allowed_languages[0] : 'english';
    }
    $language = mysql_real_escape_string($language_cookie, $dbh);

    mysql_query("INSERT INTO `settings` (`setting`, `value`) VALUES ('company_name', '$company');", $dbh) or die(_INSTALLERDBQUERYFAILED . ': ' . mysql_error());
    mysql_query("INSERT INTO `settings` (`setting`, `value`) VALUES ('email_contact', '$email');", $dbh) or die(_INSTALLERDBQUERYFAILED . ': ' . mysql_error());
    mysql_query("INSERT INTO `settings` (`setting`, `value`) VALUES ('email_notification', '$email');", $dbh) or die(_INSTALLERDBQUERYFAILED . ': ' . mysql_error());
    mysql_query("INSERT INTO `settings` (`setting`, `value`) VALUES ('locale_language', '$language');", $dbh) or die(_INSTALLERDBQUERYFAILED . ': ' . mysql_error());
    mysql_query("INSERT INTO `settings` (`setting`, `value`) VALUES ('locale_currency', '$currency');", $dbh) or die(_INSTALLERDBQUERYFAILED . ': ' . mysql_error());
    mysql_query("INSERT INTO `settings` (`setting`, `value`) VALUES ('nameserver_1', '$nameserver_1');", $dbh) or die(_INSTALLERDBQUERYFAILED . ': ' . mysql_error());
    mysql_query("INSERT INTO `settings` (`setting`, `value`) VALUES ('nameserver_2', '$nameserver_2');", $dbh) or die(_INSTALLERDBQUERYFAILED . ': ' . mysql_error());
    mysql_query("INSERT INTO `settings` (`setting`, `value`) VALUES ('nameserver_3', '$nameserver_3');", $dbh) or die(_INSTALLERDBQUERYFAILED . ': ' . mysql_error());
    mysql_query("INSERT INTO `settings` (`setting`, `value`) VALUES ('nameserver_4', '$nameserver_4');", $dbh) or die(_INSTALLERDBQUERYFAILED . ': ' . mysql_error());
    mysql_close($dbh);
}

function get_languages_installer()
{
    $languages = array();

    $inifile = dirname(__FILE__) . "/../languages/accepted.ini";
    if (file_exists($inifile)) {
        $languages_ini = parse_ini_file($inifile);
        $languages = $languages_ini['languages'];
    }

    return $languages;
}

if (check_installed()) {
    unset($_POST['function']);
    $_POST['install_step'] = '6';
}

if (isset($_POST['function'])) {
    switch ($_POST['function']) {
        case 'config_system':
            modify_config_system();
            break;
        case 'config_db':
            modify_config_db();
            break;
        case 'create_admin':
            create_admin();
            break;
        case 'create_company':
            create_company();
            break;
    }
}

if (isset($_POST['install_step'])) {
    switch ($_POST['install_step']) {
        case '0':
            $page = 'welcome';
            $percent = '0%';
            break;
        case '1':
            $page = 'license';
            $percent = '0%';
            break;
        case '2':
            $page = 'requirements';
            $percent = '20%';
            break;
        case '3':
            if (isset($_POST['function']) && $_POST['function'] == 'config_db') {
                $page = 'database_init';
            } else {
                $page = 'database_config';
            }
            $percent = '40%';
            break;
        case '4':
            $page = 'create_admin';
            $percent = '60%';
            break;
        case '5':
            $page = 'create_company';
            $percent = '80%';
            break;
        case '6':
            $page = 'complete';
            $percent = '100%';
            break;
    }
}
