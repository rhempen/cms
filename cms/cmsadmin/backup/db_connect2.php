<?php
/* Dokumenten Rootverzeichnis */
require_once('../../includes/server.php');

require_once('../../includes/changedb.php');

// DB-Konfiguration
include_once(DBASEDIR.'/dbconf.php');

// Verbindung herstellen
$verbindung = mysql_connect($host,$user,$password) or die ('Verbindungsaufnahme mit MySQL-Server fehlgeschlagen!');
mysql_select_db($db,$verbindung) or die ('Verbindungsaufnahme mit Datenbank fehlgeschlagen');
?>
