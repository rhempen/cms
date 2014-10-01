<?php
// mein Laptop
if (preg_match('/^hero/',$_SERVER['HTTP_HOST']) || $_SERVER['HTTP_HOST'] == 'localhost')  { 
	$dbtype     = 'mysqli';         // Datenbank-Server Typ
	$host       = 'localhost';      // Server
	$user       = 'root';           // BenutzerIn
	$password   = 'ayk61mz';        // Passwort
	$db         = 'cms_apvn_ml';	// db-Name
}
elseif ($_SERVER['HTTP_HOST'] == 'www.publicdev.ch' || $_SERVER['HTTP_HOST'] == 'publicdev.ch') {
	$dbtype     = 'mysqli';         // Datenbank-Server Typ
	$host       = 'localhost';      // Server
	$user       = 'cmsuser8';       // BenutzerIn
	$password   = 'ayk61mz';        // Passwort
	$db         = 'cms_apvn_ml';		// db-Name
} 
elseif ($_SERVER['HTTP_HOST'] == 'www.apvn.ch' || $_SERVER['HTTP_HOST'] == 'apvn.ch') {
	$dbtype     = 'mysqli';         // Datenbank-Server Typ
	$host       = 'localhost';      // Server
	$user       = 'apvn_u1';       // BenutzerIn
	$password   = 'Wopowe26';       // Passwort
	$db         = 'apvn_db1';				// db-Name
} 

$tab_prefix = TABLE_PREFIX;		// cms_
?>
