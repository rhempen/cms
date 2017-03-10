<?php
// mein Laptop
if ($_SERVER['HTTP_HOST'] == 'hero')  { 
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'webprog10';	// BenutzerIn 
	$password   = 'prog10web';	// Passwort 
	$db         = 'herocms';		// db-Name
}
// www.birchler-architektur.ch
elseif ($_SERVER['HTTP_HOST'] == 'www.birchler-architektur.ch' || $_SERVER['HTTP_HOST'] == 'birchler-architektur.ch') {
	$dbtype     = 'mysqli'; 		     // Datenbank-Server Typ
  $host       = '93.189.65.129'; 	 // Server
	$user       = 'birchler';		     // BenutzerIn 
	$password   = '3D2sqbMn';	   	   // Passwort 
	$db         = 'birchler-architektur';		// db-Name
} 

// tab_prefix wird im Backup-Programm benötigt
$tab_prefix = TABLE_PREFIX;		// cms_

?>
