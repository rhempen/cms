<?php

// mein Laptop
if (preg_match('/^hero/',$_SERVER['HTTP_HOST']) || $_SERVER['HTTP_HOST'] == 'localhost')  { 
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'root';	// BenutzerIn 
	$password   = 'ayk61mz';	// Passwort 
	$db         = 'cms_hempenweb';		// db-Name
}
// www.publicdev.ch
elseif ($_SERVER['HTTP_HOST'] == 'www.publicdev.ch' || $_SERVER['HTTP_HOST'] == 'publicdev.ch') {
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'pd_u1';		  // BenutzerIn 
	$password   = 'gu*8Rk+L';	  // Passwort 
	$db         = 'pd_db1';		  // db-Name
} 

$tab_prefix = TABLE_PREFIX;		// cms_

?>
