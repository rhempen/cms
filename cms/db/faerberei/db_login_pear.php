<?php

// mein Laptop
if ($_SERVER['HTTP_HOST'] == 'hero')  { 
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost'; 	    // Server
	$user       = 'webprog10';		// BenutzerIn 
	$password   = 'prog10web';	    // Passwort 
	$db         = 'herocms';		// db-Name
}
// rhempen.publicdev.ch
elseif ($_SERVER['HTTP_HOST'] == 'rhempen.publicdev.ch') {
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost'; 	    // Server
	$user       = 'root';			// BenutzerIn 
	$password   = '8F+g6P/q';	   	// Passwort 
	$db         = 'web2_db1';		// db-Name
} 
// www.publicdev.ch
elseif ($_SERVER['HTTP_HOST'] == 'www.publicdev.ch') {
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost'; 	    // Server
	$user       = 'web2_u1';		// BenutzerIn 
	$password   = 'gu*8Rk+L';	   	// Passwort 
	$db         = 'web2_db1';		// db-Name
} 
elseif ($_SERVER['HTTP_HOST'] == 'www.faerberei.ch') {
	$dbtype     = 'mysqli'; 		// Datenbank-Server Typ
	$host       = 'localhost'; 	    // Server
	$user       = 'web39_u1';		// BenutzerIn 
	$password   = 'r(8u1Qn-';	   	// Passwort 
	$db         = 'web39_db1';		// db-Name
} 

$tab_prefix = TABLE_PREFIX;		// cms_

/**
* Funktion fuer die Fehler-Behandlung
*
* @param   obj  $error_obj  Aufgetretener Fehler
* @return  - Programm stoppt bei die()
*/
function bearbeite_pear_fehler ($error_obj)
{
    if (get_class($error_obj) == 'db_error')
    {
        print "Datenbank-Fehler:<br />\n";
    }
    else
    {
        print "Sonstiger PEAR-Fehler:<br />\n";
    }
    // die("Verarbeitungsfehler: Die Seite kann nicht angezeigt werden.");
    die ($error_obj->getMessage()."\n<br />".$error_obj->getDebugInfo());
}
?>