<?php
/* Dokumenten Rootverzeichnis */
require_once('../../includes/server.php');

// DB-Konfiguration
include_once(DOCUROOT.'db'.'/dbconf.php');

// Verbindung herstellen
$verbindung = mysql_connect($host,$user,$password) or die ('Verbindungsaufnahme mit MySQL-Server fehlgeschlagen!');
mysql_select_db($db,$verbindung) or die ('Verbindungsaufnahme mit Datenbank fehlgeschlagen');
?>
