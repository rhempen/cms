<?php
/* Dokumenten Rootverzeichnis */
require_once('../../includes/server.php');

require_once('../../includes/changedb.php');

// DB-Konfiguration
include_once(DBASEDIR .'/dbconf.php');

// Verbindung herstellen
$verbindung = mysqli_connect($host,$user,$password) or die ('Verbindungsaufnahme mit MySQL-Server fehlgeschlagen!');
mysqli_select_db($verbindung, $db) or die ('Verbindungsaufnahme mit Datenbank fehlgeschlagen');
?>
