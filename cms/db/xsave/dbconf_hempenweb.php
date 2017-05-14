<?php

// mein Laptop
if ($_SERVER['HTTP_HOST'] == 'hero02' || $_SERVER['HTTP_HOST'] == 'localhost')  {
	$dbtype     = 'mysqli'; 	// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'cmsuser';           // BenutzerIn
	$password   = 'ayk61mz';	// Passwort
	$db         = 'herocms2';	// db-Name
}
// rhempen.publicdev.ch -> mein Beta-Testserver
elseif ($_SERVER['HTTP_HOST'] == 'rhempen.publicdev.ch') {
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'web2_u1';		// BenutzerIn 
	$password   = 'gu*8Rk+L';	  // Passwort 
	$db         = 'web2_db1';		// db-Name
} 
// www.publicdev.ch
elseif ($_SERVER['HTTP_HOST'] == 'www.publicdev.ch' || $_SERVER['HTTP_HOST'] == 'publicdev.ch') {
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'web1_u1';		// BenutzerIn 
	$password   = 'gu*8Rk+L';	  // Passwort 
	$db         = 'web1_db1';		// db-Name
} 
elseif ($_SERVER['HTTP_HOST'] == 'www.hempenweb.ch' || $_SERVER['HTTP_HOST'] == 'hempenweb.ch') {
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'web7u1';		  // BenutzerIn 
	$password   = 'ayk61mz';	  // Passwort 
	$db         = 'web7db1';		// db-Name
} 
elseif ($_SERVER['HTTP_HOST'] == 'www.hempen.ch' || $_SERVER['HTTP_HOST'] == 'hempen.ch') {
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost'; 	// Server
	$user       = 'web3u1';		  // BenutzerIn 
	$password   = 'h5(2kL1)';	  // Passwort 
	$db         = 'web3db1';		// db-Name
} 
// www.faerberei.ch
elseif ($_SERVER['HTTP_HOST'] == 'www.faerberei.ch') {
	$server    = 'localhost'; 	    // Server
	$benutzer  = 'web39_u1';		// BenutzerIn 
	$passwort  = 'r(8u1Qn-';	   	// Passwort 
	$datenbank = 'web39_db1';		// db-Name
} // mein Laptop

// Prefix f�r den Zugriff auf der DB
$tab_prefix = TABLE_PREFIX;		// cms_

?>
