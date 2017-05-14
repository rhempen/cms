<?php
/**
 * @author      Roland Hempen - business [at] hempenweb [dot] ch
 * @copyright   you are free to use this code as long as you
 *              credit the author - and provide me with your improvements
 * @version     20120203
 * @abstract    this PHP-File is dedicated to delete a row in the Database
 *              triggered by jQuery dataTables editables
 **/


$mid = intval($_POST['id']);

// DB-Connection und Defintion MARKER_TABLE
include_once 'dbconf.php';

// delete a Row in the DB
function deleteDataset($mid) {
  $query = "DELETE FROM " . MARKER_TABLE . " WHERE mid = '". $mid . "'";
  $result = mysql_query($query);
  if (!$result) { return false; }
  return true;
}


if (deleteDataset($mid)) {
  echo "ok";
}

// DB wieder schliessen
mysql_close($connection);

?>