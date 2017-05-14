<?php
/**
 * @author      Roland Hempen - business [at] hempenweb [dot] ch
 * @copyright   you are free to use this code as long as you
 *              credit the author - and provide me with your improvements
 * @version     20120203
 * @abstract    this PHP-File is dedicated to update a row in the Database
 *              triggered by jQuery dataTables editables
 *
 **/

// Gesamten Seiten inhalt buffern (und zippen)
function my_obstart() {
  $encode = getenv('HTTP_ACCEPT_ENCODING');
  if (ereg('gzip',$encode)) {
      ob_start('ob_gzhandler');
  } else {
      ob_start();
  }
}
my_obstart();

// DB-Configuration einlesen
require("dbconf.php");

// Konstanten definieren
define("MAPS_HOST", "maps.google.ch");
define("KEY", "ABQIAAAAR0TWf73rulOP_SnETQPFKxRj5djmSsmVAgDaRb1psFcJlThRhxSjxifqM96NjrBsBn2XrZWSE-QQqQ");
//define("MARKER_TABLE", "cms_markers2"); // already defined in dbconf.php

// Query-Parameter uebernehmen
$search = $_GET['query'];
// alle Sonderzeichen ersetzen mit % für DB.Zugriff
$suche = $search != '' ? preg_replace('/[^a-zA-Z0-9_-]\/u/','%',$search) : '';
$dista = intval($_GET['dista']);
$dista = $dista == 0 ? 5 : $dista;  // Mindestdistanz = 5Km
$dista = $suche != '' ? $dista : 500; // ganze Schweiz
// DB-Select mit Flag aktiv fürs Frontend, sonst alles selektieren
$http_referer = $_SERVER['HTTP_REFERER'];
preg_match('/maint/',$http_referer,$referer);
$modus =  $referer[0] == 'maint' ? 'maint' : 'front';
$lookForActiv = $modus == 'front' ? ' and act="aktiv"' : '';

function parseToXML($htmlStr) { 
  $xmlStr=str_replace('<','&lt;',$htmlStr); 
  $xmlStr=str_replace('>','&gt;',$xmlStr); 
  $xmlStr=str_replace('"','&quot;',$xmlStr); 
  $xmlStr=str_replace("'",'&apos;',$xmlStr); 
  $xmlStr=str_replace("&",'&amp;',$xmlStr); 
  return $xmlStr; 
} 

// Ermitteln der Geo-Koordinaten bei Google anhand Adresse
function getCoordinatesFromGoogle($adresse) {
  // Initialize delay in geocode speed
  $delay = 0;
  $base_url = "http://" . MAPS_HOST . "/maps/geo?output=xml" . "&key=" . KEY;  
  $adresse = utf8_encode($adresse);
  $geocode_pending = true;
  while ($geocode_pending) {
    $request_url = $base_url . "&q=" . $adresse;
    $xml = simplexml_load_file($request_url) or die("url not loading");		
    $status = $xml->Response->Status->code;
    if (strcmp($status, "200") == 0) {
      // Successful geocode
      $geocode_pending = false;
      $coordinates = $xml->Response->Placemark->Point->coordinates;
      $coordinatesSplit = split(",", $coordinates);
      // Format: Longitude, Latitude, Altitude
      // $lng = $coordinatesSplit[0]; $lat = $coordinatesSplit[1];
      return $coordinatesSplit;
    } else if (strcmp($status, "620") == 0) {
      // sent geocodes too fast
      $delay += 100000;
    } else {
      // failure to geocode
      $geocode_pending = false;
      echo "Address " . $adr.",".$ort. " failed to be geocoded. ";
      echo "Received status " . $status . "\n";
    }
    usleep($delay);
  }  
}

// Ermitteln der Geo-Koordinaten aus der DB
function getCoordinatesFromDb($suche) {
  $query = "SELECT distinct * FROM " . MARKER_TABLE . " WHERE ort LIKE '%".$suche."%'";
  $result = mysql_query($query);
  if (!$result) { die('Invalid query: ' . mysql_error()); }
  $row = @mysql_fetch_assoc($result);
  if ($row) {
    $coordinates[0] = $row['lng'];
    $coordinates[1] = $row['lat'];
  } else {
    $coordinates[0] = 0;
    $coordinates[1] = 0;    
  }
  return $coordinates;
}

// DB-Abfrage mit Umkreisermittlung durchfuehren
function dbAbfrageMitUmkreis($lat,$lng) {
  global $dista, $lookForActiv;
  $query = "SELECT * , ( 6371 * ACOS( COS( RADIANS(".$lat.") ) * COS( RADIANS( lat ) ) * COS( RADIANS( lng ) -
            RADIANS(".$lng.") ) + SIN( RADIANS(".$lat.") ) * SIN( RADIANS( lat ) ) ) ) AS distance
            FROM ".MARKER_TABLE." HAVING distance <= $dista $lookForActiv ORDER BY distance;";  
  $result = mysql_query($query);
  if (!$result) { die('Invalid query: ' . mysql_error()); }
  return $result;
}

// DB-Abfrage ohne Umkreisermittlung durchfuehren
function dbAbfrageOhneUmkreis($suche) {
  $query = "SELECT * FROM ".MARKER_TABLE." WHERE ort LIKE '%".$suche."%'";
  $result = mysql_query($query);
  if (!$result) { die('Invalid query: ' . mysql_error()); }
  return $result;
}

// ADD TO XML DOCUMENT NODE   
function fillMarkerXml($row) {
  echo '<marker ';
  echo 'mid="' . $row['mid'] . '" ';
  echo 'typ="' . $row['typ'] . '" ';
  echo 'nam="' . parseToXML($row['nam']) . '" ';
  echo 'adr="' . parseToXML($row['adr']) . '" ';
  echo 'ort="' . parseToXML($row['ort']) . '" ';
  echo 'lat="' . $row['lat'] . '" ';
  echo 'lng="' . $row['lng'] . '" ';
  echo 'act="' . parseToXML($row['act']) . '" ';
  echo '/>';  
}

// Spezial-Marker, wenn keine Daten im gesuchten Ort gefunden wurde
function fillMarkerXmlNotFound($lat, $lng) {
  global $search, $flag_not_found;
  $flag_not_found = false;
  $row['mid'] = '';
  $row['nam'] = 'Keine Verkaufsstelle gefunden';
  $row['adr'] = 'in ' . $search;
  $row['lat'] = $lat;
  $row['lng'] = $lng;
  $row['typ'] = 'notfound';
  $row['act'] = 'inaktiv';
  fillMarkerXml($row);
}

// Select all the rows in the markers table - Googlemaps inkl. Umkreisermittlung 
// http://www.phpro.org/tutorials/Geo-Targetting-With-PHP-And-MySQL.html#4
if ($suche == '') {
// lat = 46.80758, lng = 8.234138 -> Mittelpunkt der CH = Älggi-Alp bei Sachseln
  $lat = 46.80758; $lng = 8.234138;
  $result = dbAbfrageMitUmkreis($lat,$lng);
} else {
  // erst schauen, ob der gesuchte Ort in der DB mit $lat/$lng enthalten ist
  $coordinates = getCoordinatesFromDb($suche);
  // Wenn Db-Suche nicht erfolreich war, Google fragen
  if ($coordinates[0] == '0' || $coordinates[1] == '0') { 
    $coordinates = getCoordinatesFromGoogle($search);
  }
  $lng = $coordinates[0];
  $lat = $coordinates[1];
  
  // Wenn die Geo-Koordinaten gefunden wurden, wird die Suche mit "Umkreis" 
  // gesucht, sonst ohne Umkreisermittlung!
  if ($lat != '0' && $lng != '0') { 
    $result = dbAbfrageMitUmkreis($lat,$lng);
  } else {
    $result = dbAbfrageOhneUmkreis($suche);    
  }
}

// Anzahl gefundener Records
$anzahl = mysql_affected_rows($connection);

// Ab hier erfolgt die XML-Ausgabe 
header("Content-type: text/xml");

// Initialize
$flag_not_found = true;

// Start XML file, echo parent node
echo '<markers>';
// 1. Knoten: Anzahl Found Records und Modus (maintain oder front)
echo '<anzahl found="'. $anzahl . '" modus="'. $modus .'" />';  
// 2. Knoten: $Lat und $Lng zum Zentrieren der Karte
echo '<coords lat="'. $lat . '" lng="'. $lng .'" />';  

if ($anzahl == 0) 
{
  // wenn Keine Daten gefunden wurden, wird ein Pseudo-Datensatz angelegt
  fillMarkerXmlNotFound($lat,$lng);
} else {
  // Iterate through the rows, printing XML nodes for each
  while ($row = @mysql_fetch_assoc($result)){
	$geocode_pending = true;
    $adr = $row["adr"];
    $ort = $row["ort"];
    $mid = $row["mid"];        
	// Geo-Koordinaten ermitteln und DB-Update durchführen, falls sie noch nicht 
    // in der DB gespeichert waren 
	if ($row['lat'] == '0' || $row['lng'] == '0') {
      $coordinates = getCoordinatesFromGoogle($adr.",".$ort);
      $lat = $coordinates[1];
      $lng = $coordinates[0];
      // wenn Geo-Koordinaten gefunden wurden, kann die DB aktualisiert werden
      if ($lat != '0' && $lng != '0') {
        $query = sprintf("UPDATE cms_markers2 " .
               " SET lat = '%s', lng = '%s' " .
               " WHERE mid = '%s' LIMIT 1;",
               mysql_real_escape_string($lat),
               mysql_real_escape_string($lng),
               mysql_real_escape_string($mid));
        $update_result = mysql_query($query);
        if (!$update_result) {
          die("Invalid query: " . mysql_error());
        }        
      }
	} else {
      $lat = $row['lat'];
      $lng = $row['lng'];
	}    
    // ADD TO XML DOCUMENT NODE 
    fillMarkerXml($row);
    if ($lat == $coordinates[1] && $lng == $coordinates[0]) {
      $flag_not_found = false;
    }
  }
}

// falls in der gesuchten Ortschaft kein Eintrag gefunden wurde, wird ein
// Not_Found-Satz geschrieben, mit dem der gesuchte Ort markiert wird
if ($flag_not_found) { fillMarkerXmlNotFound($coordinates[1],$coordinates[0]); }
// End XML file
echo '</markers>';

ob_end_flush();
?>