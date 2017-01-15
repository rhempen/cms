<?php
// mein Laptop
if (preg_match('/^hero/',$_SERVER['HTTP_HOST']) || $_SERVER['HTTP_HOST'] == 'localhost')  { 
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost';      // Server
	$user       = 'root';        // BenutzerIn 
	$password   = 'ayk61mz';        // Passwort 
	$db         = 'cms_birchler';	// db-Name
}
// www.publicdev.ch / beta-Version
elseif ($_SERVER['HTTP_HOST'] == 'www.publicdev.ch' || $_SERVER['HTTP_HOST'] == 'publicdev.ch') {
	$dbtype     = 'mysqli';        // Datenbank-Server Typ
	$host       = 'localhost'; 	   // Server
	$user       = 'cmsuser6';				 // BenutzerIn
	$password   = 'ayk61mz';      // Passwort
	$db         = 'cms_birchler';			 // db-Name
} 
// www.birchler-architektur.ch
elseif ($_SERVER['HTTP_HOST'] == 'www.birchler-architektur.ch' || $_SERVER['HTTP_HOST'] == 'birchler-architektur.ch') {
	$dbtype     = 'mysqli'; 		     // Datenbank-Server Typ
  	$host       = '93.189.65.129'; 	 // Server
	$user       = 'birchler';		     // BenutzerIn 
	$password   = '3D2sqbMn';	   	   // Passwort 
	$db         = 'birchler-architektur';		// db-Name
} 

// tab_prefix wird im Backup-Programm benoetigt
$tab_prefix = defined('TABLE_PREFIX') ? TABLE_PREFIX : 'cms_';		// cms_

?>
