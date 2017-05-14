<?php

// hoststar  art4art
if ($_SERVER['HTTP_HOST'] == 'www.art4art.ch' || $_SERVER['HTTP_HOST'] == 'art4art.ch') {
    ini_set('include_path', ini_get('include_path') . ':/home/www/web496/phptmp/pear/:/usr/local/php/lib/php/');
    $login_file = $_SERVER[DOCUMENT_ROOT] . '/db/db_login_pear.php';
}
// publicdev
elseif ($_SERVER['HTTP_HOST'] == 'www.publicdev.ch' || $_SERVER['HTTP_HOST'] == 'publicdev.ch') {
    ini_set('include_path', ini_get('include_path'));
    $login_file = '/home/httpd/vhosts/publicdev.ch/httpdocs/' . ROOTDIR . 'db/db_login_pear.php';
}
// zu Hause
else {
    ini_set('include_path', ini_get('include_path') . ';c:\xampp711\php\PEAR;e:\xampp\htdocs\\' . ROOTDIR);
    $login_file = '\\xampp711\\htdocs\\' . ROOTDIR . '\\db\\db_login_pear.php';
}

require_once($login_file);

// Einbinden des PEAR-Paketes MDB2
// gesucht wird im Include-Pfad, der in der php.ini gesetzt ist
require_once 'MDB2.php';

/**
 * Setzen des PEAR_ERROR_CALLBACK auf die funktion handle_pear_error()
 *  (siehe ende skript)
 */
PEAR::setErrorHandling(PEAR_ERROR_CALLBACK, 'bearbeite_pear_fehler');

$dsn = array(
    'phptype' => $dbtype,
    'username' => $user,
    'password' => $password,
    'hostspec' => $host,
    'database' => $db
);

$options = array(
    'debug' => 2,
    // Anzahl Records kann nur mit numRows() bestimmt werden, wenn result_buffering aktiv ist
    'result_buffering' => true
);

$db = MDB2::connect($dsn, $options);
?>
