<?php
// mein Laptop
if ($_SERVER['HTTP_HOST'] == 'hero')  { 
	$dbtype     = 'mysqli'; 	// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'root';           // BenutzerIn
	$password   = 'ayk61mz';	// Passwort
	$db         = 'herocms2';	// db-Name
}
elseif ($_SERVER['HTTP_HOST'] == 'www.hempenweb.ch' || $_SERVER['HTTP_HOST'] == 'hempenweb.ch') {
	$dbtype     = 'mysqli';        // Datenbank-Server Typ
	$host       = 'localhost'; 	   // Server
	$user       = 'hempenweb_u2';  // BenutzerIn 
	$password   = 'ayk61mz';       // Passwort 
	$db         = 'hempenweb_db2'; // db-Name
} 

$tab_prefix = TABLE_PREFIX;		// cms_
?>
