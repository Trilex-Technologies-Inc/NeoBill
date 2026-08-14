<?php
/**
 * Compatibility helpers for APIs removed from modern PHP releases.
 *
 * Keep this file dependency-free: config/config.inc.php loads it before the
 * rest of the application and the installer.
 */

if (!defined('MYSQL_ASSOC')) {
    define('MYSQL_ASSOC', MYSQLI_ASSOC);
    define('MYSQL_NUM', MYSQLI_NUM);
    define('MYSQL_BOTH', MYSQLI_BOTH);
}

if (!function_exists('mysql_connect')) {
    $GLOBALS['_neobill_mysql_connection'] = null;
    mysqli_report(MYSQLI_REPORT_OFF);

    function mysql_connect($hostname = null, $username = null, $password = null)
    {
        $connection = mysqli_connect($hostname, $username, $password);
        $GLOBALS['_neobill_mysql_connection'] = $connection;
        return $connection;
    }

    function mysql_pconnect($hostname = null, $username = null, $password = null)
    {
        return mysql_connect($hostname === null ? null : 'p:' . $hostname, $username, $password);
    }

    function mysql_select_db($database, $connection = null)
    {
        return mysqli_select_db(_neobill_mysql_link($connection), $database);
    }

    function mysql_query($query, $connection = null)
    {
        return mysqli_query(_neobill_mysql_link($connection), $query);
    }

    function mysql_fetch_array($result, $resultType = MYSQL_BOTH)
    {
        return mysqli_fetch_array($result, $resultType);
    }

    function mysql_fetch_assoc($result) { return mysqli_fetch_assoc($result); }
    function mysql_fetch_row($result) { return mysqli_fetch_row($result); }
    function mysql_num_rows($result) { return mysqli_num_rows($result); }
    function mysql_insert_id($connection = null) { return mysqli_insert_id(_neobill_mysql_link($connection)); }
    function mysql_affected_rows($connection = null) { return mysqli_affected_rows(_neobill_mysql_link($connection)); }
    function mysql_real_escape_string($value, $connection = null)
    {
        return mysqli_real_escape_string(
            _neobill_mysql_link($connection),
            $value === null ? '' : (string) $value
        );
    }
    function mysql_error($connection = null)
    {
        $connection = $connection ?? ($GLOBALS['_neobill_mysql_connection'] ?? null);
        return $connection instanceof mysqli ? mysqli_error($connection) : mysqli_connect_error();
    }

    function mysql_errno($connection = null)
    {
        $connection = $connection ?? ($GLOBALS['_neobill_mysql_connection'] ?? null);
        return $connection instanceof mysqli ? mysqli_errno($connection) : mysqli_connect_errno();
    }

    function mysql_close($connection = null)
    {
        $connection = $connection ?? ($GLOBALS['_neobill_mysql_connection'] ?? null);
        return $connection instanceof mysqli ? mysqli_close($connection) : false;
    }

    function mysql_create_db($database, $connection = null)
    {
        return mysql_query('CREATE DATABASE `' . str_replace('`', '``', $database) . '`', $connection);
    }

    function _neobill_mysql_link($connection = null)
    {
        $connection = $connection ?? ($GLOBALS['_neobill_mysql_connection'] ?? null);
        if (!$connection instanceof mysqli) {
            throw new RuntimeException('No active MySQL connection');
        }
        return $connection;
    }
}

if (!function_exists('each')) {
    function each(&$array)
    {
        $key = key($array);
        if ($key === null) {
            return false;
        }
        $value = current($array);
        next($array);
        return array(1 => $value, 'value' => $value, 0 => $key, 'key' => $key);
    }
}

if (!function_exists('get_magic_quotes_gpc')) {
    function get_magic_quotes_gpc() { return false; }
}

if (!function_exists('get_magic_quotes_runtime')) {
    function get_magic_quotes_runtime() { return false; }
}

if (!function_exists('set_magic_quotes_runtime')) {
    function set_magic_quotes_runtime($enabled) { return false; }
}
