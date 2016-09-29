<?php

// ev. GET-Parameter abholden
$act  = isset($_GET['act']) ? strtolower($_GET['act']) : '';
$file = isset($_GET['file']) ? $_GET['file'] : '';

/* Das Backupverzeichnis nach Backups durchsuchen */
function read_backups() {	
	$backupdir = preg_replace('/\/\//','/',BACKUPDIR);   /* "//" durch "/" ersetzen */
	$file = '';
	
	echo 'Backupdir: ' . $backupdir . '<br />';
	if (!file_exists($backupdir)) {
		echo '<p class="error">'.sprintf($GLOBALS['BACKUP']['VERZEICHNIS_EXISTIERT_NICHT'], $backupdir).'</p>';
		exit();
	}
	
	// dann wird das Verzeichnis ge�ffnet und durchsucht
	$handle  = opendir($backupdir);
	while (false !== ($file = readdir($handle)))
	{
		if ($file != '.' && $file != '..') {
			$srcfile = BACKUPDIR . $file;
			if (is_file($srcfile)) {
				// p=0 -> absoluter Dateiname p=1 -> Dateiname allein
				$sf['datei'] = $file;
				// Statistische Daten zur Datei lesen
				$sst = stat($srcfile);
				// last modified
				$fmt = filemtime($srcfile); 
				$sf['fmt'] = $fmt; 
				// die Filesize in Kb umgerechnet
				$fsz = $sst['size'];  
				$sf['fsz'] = round($fsz / 1024);
			}
			// Array f�llen
			$fs[] = $sf;
			// Variable l�schen
			unset($sf);
		}
		
	}
	if (count($fs) > 0) { rsort($fs); }
	return $fs;
}

/* Ein Backupfile l�schen */
function delete_backupfile($file) {
	$backupfile = BACKUPDIR . $file;
	if (file_exists($backupfile)) {
		if (unlink($backupfile)) {
			$meldung = '<p class="success">'.sprintf($GLOBALS['MESSAGES']['MSG_DATEI_GELOESCHT'], $file).'</p>';
		}
		else {
			$meldung= '<p class="error">'.sprintf($GLOBALS['MESSAGES']['MSG_DATEI_NICHT_GELOESCHT'], $file).'</p>';
		}
		return $meldung;
	}
}


/* Formatieren von Datum und Zeit */
function set_date_time($mtime) {
//	echo date(I);
	/* hier wird die Berechnung der Zeit korrigiert */
	if (date('I') == 1) { // Sommerzeit 
		if (date('I', $mtime) == 1) { // Sommerzeit
			$mtime -= 3600;
		} else {
			$mtime += 3600;			
		}
	} else { // Winterzeit
		if (date('I', $mtime) == 0) { // Winterzeit
			$mtime += 3600;
		} else {
			$mtime -= 3600;			
		}
	}
	return gmdate('d.m.Y H:i', $mtime);
}

?>

<div id="backups">
	<p>
	<?php 
	
		// Ein Backupfile l�schen
		if ($act == 'delete' && $file != '')
		{
			$meldung = delete_backupfile($file);
			echo $meldung;
		}
		
	
		// vorhandene Backupfiles lesen und ausgeben
		$fs = read_backups(); 
		if (is_array($fs)) 
		{ 
	?> 
	
	<table cellpadding="5" cellspacing="1" border="0" width="80%">
	  <tr class="navi_overview_titel">
	    <th width="30%"><?php echo $GLOBALS['BACKUP']['DATEI'];?></th>
	    <th width="30%"><?php echo $GLOBALS['BACKUP']['ERSTELLT'];?></th>
	    <th width="20%"><?php echo $GLOBALS['BACKUP']['DATEIGROESSE'];?></th>
	    <th width="10%">&nbsp;</th>
	    <th width="10%">&nbsp;</th>
	  </tr>
	
	  <?php 
			foreach($fs as $index => $file) {						
				// Klasse, File mit Pfad, Extension
				$class = $index % 2 == 0 ? 'even' : 'odd'; 
//				$srcfile = BACKUPDIR . $file['datei'];	
				$srcfile = 'backups/'.$file['datei'];
				// $ext = txt oder sql
				$ext = strrchr($file['datei'], '.');
				$icon_dwl = '<img src="../gifs/download.png" alt="'.$GLOBALS['TEXTE']['DOWNLOAD'].'" title="'.$GLOBALS['TEXTE']['DOWNLOAD'].'" />';
				$icon_lup = '<img src="../gifs/view_16.png" alt="'.$GLOBALS['TEXTE']['TEXT_SHOW'].'" title="'.$GLOBALS['TEXTE']['TEXT_SHOW'].'" />';
				$icon = $ext == '.sql' ? $icon_dwl : $icon_lup;		
				$jscript = "return confirm('".$GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE_FILE']."');";
	  ?>
	  <tr class="<?php echo $class;?>">
	  	<td><?php echo $file['datei']; ?></td>
	  	<td align="right"><?php echo set_date_time($file['fmt']); ?></td>
	  	<td align="right"><?php echo $file['fsz']; ?></td>
	  	<td align="center"><?php echo '<a href="'.$srcfile.'">'.$icon.'</a>'; ?></td>
	  	<td align="center"><?php echo '<a href="'.$_SERVER['PHP_SELF'].'?act=delete&file='.$file['datei'].'"><img src="../gifs/delete.gif" alt="delete" title="delete" onclick="'.$jscript.'"' ?></td>
	  </tr>
	  <?php 
			}
	  ?>
	</table>	
	  <?php 
		}
	  ?>
</div>
