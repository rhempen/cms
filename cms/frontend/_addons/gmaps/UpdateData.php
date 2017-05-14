<?php
/**
 * @author      Roland Hempen - business [at] hempenweb [dot] ch
 * @copyright   you are free to use this code as long as you
 *              credit the author - and provide me with your improvements
 * @version     20120203
 * @abstract    this PHP-File is dedicated to update an existing row in the Database
 *              triggered by jQuery dataTables editables
 **/

// Parameter entgegennehmen
$value  = $_POST['value'];
$mid    = $_POST['id'];
$rowid  = $_POST['rowId'];
$colpos = $_POST['columnPosition'];
$colid  = $_POST['columnId'];
$colnam = $_POST['columnName'];


// DB-Connection und Defintion MARKER_TABLE
include_once 'dbconf.php';

// Datensatz mit $rowid lesen
function readDataset($mid) {
  $query = "SELECT * FROM " . MARKER_TABLE . " WHERE mid = '". $mid . "'";
  $result = mysql_query($query);
  if (!$result) { return false; }
  $row = @mysql_fetch_assoc($result);
  return true;
}

function updateDataset($mid, $colnam, $value) {
  $query = sprintf("UPDATE " . MARKER_TABLE . " " .
         " SET " .$colnam . " = '%s' " .
         " WHERE mid = '%s' LIMIT 1;",
         mysql_real_escape_string($value),
         mysql_real_escape_string($mid));
  $update_result = mysql_query($query);
  if (!$update_result) { return false; }
  return true;
}

// Update durchführen
if (readDataset($mid)) {
  if (updateDataset($mid, $colnam, $value)) {
    echo $value; 
  } else {
    echo "update ist misslungen!";
  }  
}

// DB wieder schliessen
mysql_close($connection);

?>