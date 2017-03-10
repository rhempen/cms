<?php

// mein Laptop
if (preg_match('/^hero/',$_SERVER['HTTP_HOST']) || $_SERVER['HTTP_HOST'] == 'localhost')  { 
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'cmsuser';	// BenutzerIn 
	$password   = 'ayk61mz';	// Passwort 
	$db         = 'cms_hempen';		// db-Name
}
elseif ($_SERVER['HTTP_HOST'] == 'www.publicdev.ch' || $_SERVER['HTTP_HOST'] == 'publicdev.ch') {
	$dbtype     = 'mysqli';        // Datenbank-Server Typ
	$host       = 'localhost'; 	   // Server
	$user       = 'cmsuser3';				 // BenutzerIn
	$password   = 'ayk61mz';      // Passwort
	$db         = 'cms_hempenweb';			 // db-Name
} 
// www.hempen.ch
elseif ($_SERVER['HTTP_HOST'] == 'www.hempen.ch' || $_SERVER['HTTP_HOST'] == 'hempen.ch') {
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'hempenc_u1';		  // BenutzerIn 
	$password   = '7awq3LEV';	  // Passwort 
	$db         = 'hempenc_db1';		// db-Name
} 

// Prefix f�r den Zugriff auf der DB
$tab_prefix = TABLE_PREFIX;		// cms_

?>
