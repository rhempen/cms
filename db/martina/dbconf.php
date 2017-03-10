<?php
// mein Laptop
if (preg_match('/^hero/',$_SERVER['HTTP_HOST']) || $_SERVER['HTTP_HOST'] == 'localhost')  { 
	$dbtype     = 'mysqli';					// Datenbank-Server Typ
	$host       = 'localhost';			// Server
	$user       = 'cmsuser';				// BenutzerIn 
	$password   = 'ayk61mz';				// Passwort 
	$db         = 'cms_martina';		// db-Name
}
elseif ($_SERVER['HTTP_HOST'] == 'www.publicdev.ch' || $_SERVER['HTTP_HOST'] == 'publicdev.ch') {
	$dbtype     = 'mysqli';					// Datenbank-Server Typ
	$host       = 'localhost';			// Server
	$user       = 'cmsuser4';				// BenutzerIn
	$password   = 'ayk61mz';				// Passwort
	$db         = 'cms_martina';			 // db-Name
} 
elseif ($_SERVER['HTTP_HOST'] == 'www.physio-allschwil.ch' || $_SERVER['HTTP_HOST'] == 'physio-allschwil.ch') {
	$dbtype     = 'mysqli';					// Datenbank-Server Typ
	$host       = 'localhost';			// Server
	$user       = 'martina_u1';			// BenutzerIn 
	$password   = 'kpcs96';					// Passwort 
	$db         = 'martina_db1';		// db-Name
} 

$tab_prefix = TABLE_PREFIX;		// cms_
?>
