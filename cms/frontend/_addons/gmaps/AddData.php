<?php
/**
 * @author      Roland Hempen - business [at] hempenweb [dot] ch
 * @copyright   you are free to use this code as long as you
 *              credit the author - and provide me with your improvements
 * @version     20120203
 * @abstract    this PHP-File is dedicated to add a new row in the Database
 *              triggered by jQuery dataTables editables
 **/

// POST-Paramter aus dem Formular übernehmen
$nam = $_POST['nam'];
$adr = $_POST['adr'];
$ort = $_POST['ort'];
$lat = $_POST['lat'];
$lng = $_POST['lng'];
$typ = $_POST['typ'];

// DB-Connection und Defintion MARKER_TABLE
include_once 'dbconf.php';

// Insert new Row
function insertDataset() {
  $mid = 0; // autoincrement
  $nam = $_POST['nam'];
  $adr = $_POST['adr'];
  $ort = $_POST['ort'];
  $lat = $_POST['lat'] != '' ? $_POST['lat'] : 0;
  $lng = $_POST['lng'] != '' ? $_POST['lng'] : 0;
  $typ = $_POST['typ'];
  
  $insert = sprintf("INSERT INTO " . MARKER_TABLE . " ".
              " (mid,nam,adr,ort,lat,lng,typ,act) " .
              " VALUES (%s,'%s','%s','%s',%s,%s,'%s','%s'); ",
              mysql_real_escape_string($mid),
              mysql_real_escape_string($nam),
              mysql_real_escape_string($adr),
              mysql_real_escape_string($ort),
              mysql_real_escape_string($lat),
              mysql_real_escape_string($lng),
              mysql_real_escape_string($typ),
              mysql_real_escape_string($act));
							
  $insert_result = mysql_query($insert);
  
  if (!$insert_result) {
    die("Invalid query: " . mysql_error());
    return false;
  } else {
    return true;
  }
  
}

if (insertDataset() == true) {
  echo mysql_insert_id(); // die gerade erstellte ID zurückgeben
} else {
  echo "insert ist misslungen!";
}


  
// DB wieder schliessen
mysql_close($connection);
  
?>