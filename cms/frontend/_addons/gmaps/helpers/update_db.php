<?php
/*
 * @author      Roland Hempen - business [at] hempenweb [dot] ch
 * @copyright   you are free to use this code as long as you
 *              credit the author - and provide me with your improvements
 * @version     20120121
 * @abstract    sog. Helper-Programm, um die Filialdaten zu aktualisieren
 *              Das Programm nimmt einen Query-Parameter entgegen
 * 
 */

require("../dbconf.php");

function parseToXML($htmlStr) 
{ 
$xmlStr=str_replace('<','&lt;',$htmlStr); 
$xmlStr=str_replace('>','&gt;',$xmlStr); 
$xmlStr=str_replace('"','&quot;',$xmlStr); 
$xmlStr=str_replace("'",'&apos;',$xmlStr); 
$xmlStr=str_replace("&",'&amp;',$xmlStr); 
return $xmlStr; 
} 

$suche = urldecode($_GET['query']);


// Opens a connection to a mySQL server
$connection=mysql_connect (localhost, $user, $password);
if (!$connection) {
  die('Not connected : ' . mysql_error());
}

// Set the active mySQL database
$db_selected = mysql_select_db($db, $connection);
if (!$db_selected) {
  die ('Can\'t use db : ' . mysql_error());
}

// Select all the rows in the markers table
if ($suche == '') {
	$query = "SELECT * FROM cms_markers";
} else {	
	$query = "SELECT * FROM cms_markers WHERE address like '%".$suche."%'";
}

$result = mysql_query($query);
if (!$result) {
  die('Invalid query: ' . mysql_error());
}

header("Content-type: text/html");

$trans = get_html_translation_table(HTML_ENTITIES);
//print_r($trans); 
//echo("<br><br>");

// Start XML file, echo parent node
// Iterate through the rows, printing XML nodes for each
$anzahl = 0;
while ($row = @mysql_fetch_assoc($result))
{
	$anzahl++;
	$name = utf8_encode(addslashes($row['name']));
	$address = utf8_encode(addslashes($row['address']));
  $query = sprintf("UPDATE cms_markers " .
         " SET name = '%s', address = '%s' " . 
         " WHERE id = '%s' LIMIT 1;",
         mysql_real_escape_string($name),
         mysql_real_escape_string($address),
         mysql_real_escape_string($id));
  $update_result = mysql_query($query);

	var_dump($id." ".$name." ".$address. "<br>");
  
  if (!$update_result) {
    die("Invalid query: " . mysql_error());
  }

echo("Anzahl Rows: ". $anzahl);    
    
  // ADD TO XML DOCUMENT NODE
//  echo '<marker ';
//  echo 'name="' . parseToXML($row['name']) . '" ';
//  echo 'address="' . parseToXML($row['address']) . '" ';
//  echo 'lat="' . $row['lat'] . '" ';
//  echo 'lng="' . $row['lng'] . '" ';
//  echo 'type="' . $row['type'] . '" ';
//  echo '/>';

}
//// End XML file
//echo '</markers>';
mysql_close($connection);

?>