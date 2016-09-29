<?php
// mein Laptop
if (preg_match('/^hero/',$_SERVER['HTTP_HOST']) || $_SERVER['HTTP_HOST'] == 'localhost')  { 
	$dbtype     = 'mysqli'; 	// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'root';           // BenutzerIn
	$password   = 'ayk61mz';	// Passwort
	$db         = 'cms_hempenweb';	// db-Name
}
elseif ($_SERVER['HTTP_HOST'] == 'www.publicdev.ch' || $_SERVER['HTTP_HOST'] == 'publicdev.ch') {
	$dbtype     = 'mysqli';        // Datenbank-Server Typ
	$host       = 'localhost'; 	   // Server
	$user       = 'cmsuser3';				 // BenutzerIn
	$password   = 'ayk61mz';      // Passwort
	$db         = 'cms_hempenweb';			 // db-Name
} 
elseif ($_SERVER['HTTP_HOST'] == 'www.hempenweb.ch' || $_SERVER['HTTP_HOST'] == 'hempenweb.ch') {
	$dbtype     = 'mysqli';        // Datenbank-Server Typ
	$host       = 'localhost'; 	   // Server
	$user       = 'hempenweb_u1';  // BenutzerIn 
	$password   = 'ayk61mz';       // Passwort 
	$db         = 'hempenweb_db1'; // db-Name
} 

$tab_prefix = TABLE_PREFIX;		// cms_
?>
