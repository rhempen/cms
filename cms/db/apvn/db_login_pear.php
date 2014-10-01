<?php
// DB-Configs
include(DBASEDIR . 'dbconf.php');

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
