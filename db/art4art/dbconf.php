<?php
// mein Laptop
if (preg_match('/^hero/',$_SERVER['HTTP_HOST']) || $_SERVER['HTTP_HOST'] == 'localhost')  { 
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost';      // Server
	$user       = 'cmsuser';        // BenutzerIn 
	$password   = 'ayk61mz';        // Passwort 
	$db         = 'cms_art4art';	// db-Name
}
// www.publicdev.ch / beta-Version
elseif ($_SERVER['HTTP_HOST'] == 'www.publicdev.ch' || $_SERVER['HTTP_HOST'] == 'publicdev.ch') {
	$dbtype     = 'mysqli';        // Datenbank-Server Typ
	$host       = 'localhost'; 	   // Server
	$user       = 'cmsuser5';				 // BenutzerIn
	$password   = 'ayk61mz';      // Passwort
	$db         = 'cms_art4art';			 // db-Name
} 
elseif ($_SERVER['HTTP_HOST'] == 'www.art4art.ch' || $_SERVER['HTTP_HOST'] == 'art4art.ch') {
	$dbtype     = 'mysqli'; 		    // Datenbank-Server Typ
	$host       = 'localhost'; 	    // Server
	$user       = 'web496';		      // BenutzerIn 
	$password   = 'pov4qu3d2f';	    // Passwort 
	$db         = 'usr_web496_1';		// db-Name
} 

// tab_prefix wird im Backup-Programm ben�tigt
$tab_prefix = TABLE_PREFIX;		// cms_

?>
