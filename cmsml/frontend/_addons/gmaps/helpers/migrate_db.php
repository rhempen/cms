<?php
/*
 * @author      Roland Hempen - business [at] hempenweb [dot] ch
 * @copyright   you are free to use this code as long as you
 *              credit the author - and provide me with your improvements
 * @version     20120121
 * @abstract    sog. Helper-Programm, um die Filialdaten von einer Tabelle in 
 *              die andere zu transferieren und ev. noch Anpassungen zu machen
 * 
 */

require("../dbconf.php");

// einen Row in die neue Tabelle schreiben
function insertRow() {
  global $mid, $nam, $adr, $ort, $lat, $lng, $typ;
  $insert = sprintf("INSERT INTO cms_markers2 " .
                          " (mid,nam,adr,ort,lat,lng,typ) " .
                          " VALUES (%s,'%s','%s','%s',%s,%s,'%s'); ",
                          mysql_real_escape_string($mid),
                          mysql_real_escape_string($nam),
                          mysql_real_escape_string($adr),
                          mysql_real_escape_string($ort),
                          mysql_real_escape_string($lat),
                          mysql_real_escape_string($lng),
                          mysql_real_escape_string($typ));
							
  $insert_result = mysql_query($insert);
  
  if (!$insert_result) {
    die("Invalid query: " . mysql_error());
  }
}

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
$query = "SELECT * FROM cms_markers";

$result = mysql_query($query);
if (!$result) {
  die('Invalid query: ' . mysql_error());
}

header("Content-type: text/html");

// Iterate through the rows, migrating each row to table cms_markers2
$anzahl = 0;
echo '<table border="1">';
while ($row = @mysql_fetch_assoc($result))
{
    echo '<tr>';
    $name = $nam = $ort = $mid = $lat = $lng = $typ = '';
	$anzahl++;
	$address = explode(',',$row['address']);
    $anzelem = count($address);
    if ($anzelem > 2) 
    {
      $anzelem--;
//      var_dump("vorher: ".$row['id']." ".utf8_encode($row['name'])." ".utf8_encode($row['address']));      
      foreach ($address as $key => $value) {
        if ($key == $anzelem) break;        
        $name .= $name == '' ? $value : ",".$value; 
      }
      $ort = array_pop($address); // letztes Element 
      $ort = utf8_encode(addslashes($ort)); 
      $nam = utf8_encode(addslashes($name));
//      var_dump("nachher: ".$row['id']." ".$nam." ".$adr." ".$ort);  
    } else {	
      $nam = utf8_encode(addslashes($row['name']));
      $adr = utf8_encode(addslashes($address[0]));
      $ort = utf8_encode(addslashes($address[1]));
    }
    $mid = $anzahl;
	$lat = $row['lat'];
	$lng = $row['lng'];
	$typ = $row['type'];
    
    // Row in die DB einfuegen
    insertRow() ;
    // Protokollausgabe
    echo '<td>'.$mid.'</td><td>'.$nam.'</td><td>'.$adr.'</td><td>'.$ort.'</td>';
    echo '<td>'.$lat.'</td><td>'.$lng.'</td><td>'.$typ.'</td>';    
    echo '</tr>';
}

echo '</table>';
echo("Anzahl Rows: ". $anzahl);    
mysql_close($connection);

?>