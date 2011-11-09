<?php
// mein Laptop
if ($_SERVER['HTTP_HOST'] == 'hero')  { 
	$dbtype     = 'mysqli'; 	// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'root';           // BenutzerIn
	$password   = 'ayk61mz';	// Passwort
	$db         = 'herocms2';	// db-Name
}
elseif ($_SERVER['HTTP_HOST'] == 'www.feednsmile.ch' || $_SERVER['HTTP_HOST'] == 'feednsmile.ch') {
	$dbtype     = 'mysqli';        // Datenbank-Server Typ
	$host       = 'localhost'; 	   // Server
	$user       = 'fns_u1';  // BenutzerIn
	$password   = 'ktRD3hH1';       // Passwort 
	$db         = 'fns_db1'; // db-Name
} 

$tab_prefix = TABLE_PREFIX;		// cms_
?>
