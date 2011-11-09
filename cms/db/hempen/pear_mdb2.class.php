<?php
// zu Hause
if ($_SERVER['HTTP_HOST'] == 'a4a' || $_SERVER['HTTP_HOST'] == 'hero') 
{ 
	ini_set('include_path', ini_get('include_path') . ';c:\xampp\xampp\php\pear;c:\xampp\xampp\htdocs\cms');
	$login_file = '\xampp\xampp\htdocs\cms\db\db_login_pear.php';
} 
// www.hempen.ch
elseif ($_SERVER['HTTP_HOST'] == 'www.hempen.ch' || $_SERVER['HTTP_HOST'] == 'hempen.ch') 
{ 
	ini_set('include_path', ini_get('include_path'));
//	ini_set('include_path', '/home/httpd/vhosts/hempen.ch/httpdocs/phppear');
	$login_file = '/home/httpd/vhosts/hempen.ch/httpdocs/db/db_login_pear.php';
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

//$dsn = 'mysqli://hempenc_u1:7awq3LEV@localhost/hempenc_db1';
$dsn = array(
    'phptype'  => $dbtype,
    'username' => $user,
    'password' => $password,
    'hostspec' => $host,
    'database' => $db
);

$db =& MDB2::factory($dsn);

$options = array(
    'debug'       => 2,
    // Anzahl Records kann nur mit numRows() bestimmt werden, wenn result_buffering aktiv ist
    'result_buffering' => true
);

$db =& MDB2::connect($dsn, $options);

?>
