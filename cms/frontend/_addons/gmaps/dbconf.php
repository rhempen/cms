<?php
/**
 * @author      Roland Hempen - business [at] hempenweb [dot] ch
 * @copyright   you are free to use this code as long as you
 *              credit the author - and provide me with your improvements
 * @version     20120203
 * @abstract    this PHP-File is dedicated to open Database
 **/

// mein Laptop
if (preg_match('/^hero/',$_SERVER['HTTP_HOST']) || $_SERVER['HTTP_HOST'] == 'localhost')  { 
	$dbtype     = 'mysqli'; 	// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'root';           // BenutzerIn
	$password   = 'ayk61mz';	// Passwort
	$db         = 'cms_e-njoy';	// db-Name
}
elseif ($_SERVER['HTTP_HOST'] == 'www.publicdev.ch' || $_SERVER['HTTP_HOST'] == 'publicdev.ch') {
	$dbtype     = 'mysqli';        // Datenbank-Server Typ
	$host       = 'localhost'; 	   // Server
	$user       = 'cmsuser1';				 // BenutzerIn
	$password   = 'ayk61mz';      // Passwort
	$db         = 'cms_e-njoy';			 // db-Name
} 
elseif ($_SERVER['HTTP_HOST'] == 'www.hempenweb.ch' || $_SERVER['HTTP_HOST'] == 'hempenweb.ch') {
	$dbtype     = 'mysqli';        // Datenbank-Server Typ
	$host       = 'localhost'; 	   // Server
	$user       = 'cmsuser';  // BenutzerIn 
	$password   = 'ayk61mz';       // Passwort 
	$db         = 'cms_e-njoy'; // db-Name
} 

define('MARKER_TABLE','cms_markers2');

// Opens a connection to a mySQL server
$connection=mysql_connect (localhost, $user, $password);
if (!$connection) { die('Not connected : ' . mysql_error()); }

// Set the active mySQL database
$db_selected = mysql_select_db($db, $connection);
if (!$db_selected) { die ('Can\'t use db : ' . mysql_error()); }

?>
