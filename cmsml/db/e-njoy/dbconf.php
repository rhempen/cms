<?php
// mein Laptop
if (preg_match('/^hero/',$_SERVER['HTTP_HOST']) || $_SERVER['HTTP_HOST'] == 'localhost')  { 
	$dbtype     = 'mysqli';         // Datenbank-Server Typ
	$host       = 'localhost';      // Server
	$user       = 'root';           // BenutzerIn
	$password   = 'ayk61mz';        // Passwort
	$db         = 'cms_e-njoy_ml';	// db-Name
}
elseif ($_SERVER['HTTP_HOST'] == 'www.publicdev.ch' || $_SERVER['HTTP_HOST'] == 'publicdev.ch') {
	$dbtype     = 'mysqli';         // Datenbank-Server Typ
	$host       = 'localhost';      // Server
	$user       = 'cmsuser7';       // BenutzerIn
	$password   = 'ayk61mz';        // Passwort
	$db         = 'cms_e-njoy_ml';		// db-Name
} 
elseif ($_SERVER['HTTP_HOST'] == 'www.e-njoy.ch' || $_SERVER['HTTP_HOST'] == 'e-njoy.ch') {
	$dbtype     = 'mysqli';         // Datenbank-Server Typ
	$host       = 'localhost';      // Server
	$user       = 'enjoyml_u1';       // BenutzerIn
	$password   = 'Wopowe26';       // Passwort
	$db         = 'enjoychml_db1';	// db-Name
} 

$tab_prefix = TABLE_PREFIX;		// cms_
?>
