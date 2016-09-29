<?php
// mein Laptop
if (preg_match('/^hero/',$_SERVER['HTTP_HOST']) || $_SERVER['HTTP_HOST'] == 'localhost')  { 
	$dbtype     = 'mysqli';         // Datenbank-Server Typ
	$host       = 'localhost';      // Server
	$user       = 'root';           // BenutzerIn
	$password   = 'ayk61mz';        // Passwort
	$db         = 'cms_e-njoy';	// db-Name
}
elseif ($_SERVER['HTTP_HOST'] == 'www.publicdev.ch' || $_SERVER['HTTP_HOST'] == 'publicdev.ch') {
	$dbtype     = 'mysqli';         // Datenbank-Server Typ
	$host       = 'localhost';      // Server
	$user       = 'cmsuser1';       // BenutzerIn
	$password   = 'ayk61mz';        // Passwort
	$db         = 'cms_e-njoy';		// db-Name
} 
elseif ($_SERVER['HTTP_HOST'] == 'www.e-njoy.ch' || $_SERVER['HTTP_HOST'] == 'e-njoy.ch') {
	$dbtype     = 'mysqli';         // Datenbank-Server Typ
	$host       = 'localhost';      // Server
	$user       = 'enjoy_u1';       // BenutzerIn
	$password   = 'Wopowe26';       // Passwort
	$db         = 'enjoych_db1';	// db-Name
} 

$tab_prefix = TABLE_PREFIX;		// cms_
?>
