<?php

require_once('db_connect2.php');

$path = './backups/';
$filetype = 'txt';
$filetype2 = 'sql';

function get_def($db, $table) {
    global $verbindung;
    $def = '';
    $def .= "DROP TABLE IF EXISTS $table;\n";
    $def .= "CREATE TABLE $table (\n";
    $result = $verbindung->query('SHOW FIELDS FROM '.$table);
//    $result = mysqli_query($db, 'SHOW FIELDS FROM '.$table, $verbindung);
    while($row = mysqli_fetch_array($result)) {
        $def .= '    '.$row['Field'].' '.$row['Type'];
        if ($row['Default'] != '') $def .= ' DEFAULT "'.$row['Default'].'"';
        if ($row['Null'] != 'YES') $def .= ' NOT NULL';
        if ($row['Extra'] != '') $def .= ' '.$row['Extra'];
        $def .= ",\n";
     }
     $def = preg_replace('/,\n$/','', $def);
     $result = $verbindung->query('SHOW KEYS FROM '.$table);
     while($row = mysqli_fetch_array($result)) {
          $kname=$row['Key_name'];
          if(($kname != 'PRIMARY') && ($row['Non_unique'] == 0)) $kname='UNIQUE|'.$kname;
          if(!isset($index[$kname])) $index[$kname] = array();
          $index[$kname][] = $row['Column_name'];
     }
     while(list($x, $columns) = @each($index)) {
          $def .= ",\n";
          if($x == 'PRIMARY') $def .= '   PRIMARY KEY ('.implode($columns, ', ') . ')';
          else if (substr($x,0,6) == 'UNIQUE') $def .= '   UNIQUE '.substr($x,7).' (' . implode($columns, ', ') . ')';
          else $def .= '   KEY '.$x.' (' . implode($columns, ', ') . ')';
     }
     $def .= "\n);";
     return (stripslashes($def));
}

function get_content($db, $table) {
    global $verbindung;
    $content='';
    $result = $verbindung->query('SELECT * FROM '.$table);
    while($row = mysqli_fetch_row($result)) {
        $insert = 'INSERT INTO '.$table.' VALUES (';
        for($j=0; $j<mysqli_num_fields($result);$j++) {
           if(!isset($row[$j])) $insert .= 'NULL,';
           else if($row[$j] != '') $insert .= '"'.addslashes($row[$j]).'",';
           else $insert .= '"",';
        }
        $insert = preg_replace("/,$/",'',$insert);
        $insert .= ");\n";
        $content .= $insert;
    }
    return $content;
}

function get_tables() {
    global $verbindung;
    global $db;
    $tables = array_column(mysqli_fetch_all($verbindung->query('SHOW TABLES')),0);
    return $tables;
}

$newfile = '';
$cur_time=date('d.m.Y H:i');
$newfile.="#----------------------------------------------\n";
$newfile.="# Backup der Datenbank ".$db."\n";
$newfile.="# Erstellt am ".$cur_time."\n";
$newfile.="#----------------------------------------------\n\n\n";

$tables = get_tables();  
$i = 0;
foreach($tables as $table) {
    echo "<p style='background-color:#dedede'>Sicherung der Tabelle: ".$table."</p>\n";
    $newfile .= "\n# ----------------------------------------------------------\n#\n";
    $newfile .= "# Struktur von Tabelle '$table'\n#\n";
    $newfile .= get_def($db,$table);
    $newfile .= "\n\n";
    $newfile .= "#\n# Daten von Tabelle '$table'\n#\n";
    $newfile .= get_content($db,$table);
    $newfile .= "\n\n";
    $i++;
}

$datei = $path.date('Ymd').'backup_'.WEBSITE.'.'.$filetype;
$datei_neu = $path.date('Ymd').'backup_'.WEBSITE.'.'.$filetype2;
$fp = fopen ($datei,'w');
fwrite ($fp,$newfile);
fclose ($fp);
@rename($datei,$datei_neu);
clearstatcache();  
chmod ($datei_neu, 0777);
clearstatcache();  
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<!-------------------------------------------------------------------->
<!--  (c) KLIK! Klein Informatik  www.klik-info.ch  rklein@mus.ch   -->
<!-------------------------------------------------------------------->
<meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
<title>Backup</title>
<link rel="SHORTCUT ICON" href="favicon.ico" title="external:favicon.ico">
</head>
<body  bgcolor="#cccccc" text="black" link="#006699" alink="#ff9900" vlink="#006699" marginwidth="30" marginheight="20" topmargin="20" leftmargin="30">
    <table width="443" border="0" cellpadding="3" cellspacing="2" bgcolor="white">
        <tr>
            <td bgcolor="white" class="titel">
            <?php
                if (file_exists($datei_neu))
                {
                    echo '<font color="green">Der Backup hat geklappt!</font>';
                }
                else 
                {
                    echo '<font color="red">Der Backup hat nicht geklappt!</font><br>&Uuml;berpr&uuml;fen Sie die Zugriffsrechte des Ordners "backup".';
                }
            ?>
            </td>
        </tr>	
    </table>
</body>
</html>	
