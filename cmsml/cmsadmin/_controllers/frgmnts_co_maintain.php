<?php
// Klassen includieren und instanziieren 
	require_once('cmsadmin.inc.php');

// $_GET-Parameter abholen
	$action		= isset($_GET['action']) ? $_GET['action'] : '';
	$srtids		= isset($_POST['srtids']) ? $_POST['srtids'] : '';
	$tab		= isset($_GET['tab']) ? $_GET['tab'] : $GLOBALS['TEXTE']['FRAGMENTE'];
	$frgid		= isset($_GET['frgid']) ? $_GET['frgid'] : '';
	$view		= ''; // steuert die Anzeige der Daten

// Wenn eine einzelne Frgid ankommt, gleich den Satz lesen 
	if ($frgid !== '') { $frgrow = $frgmain->read_single_frgmnt($frgid); }

// Nun die Action auswerten und durchführen
	switch ($action) {
		case 'newSort':
			$ele = preg_split('/\&?(frgmnts\[\]=)/', $srtids);
			$frgmain->fragmente_sortieren($ele);
			$view = 'nothingToDo';
			break;
			
		case 'workMenu':
			$workmenu = $frgpres->compose_workmenu($frgid);
			$view = 'nothingToDo';
			echo $workmenu;
			break;

		case 'edit':
			$content = $frgmain->read_single_content($frgid);
			$view = 'edit';
			break;

		case 'save':
			if (get_magic_quotes_gpc()) { $_POST = array_map('stripslashes', $_POST); }
			$message = $frgmain->fragment_speichern($frgid);
			break;

		case 'copy':
			$message = $frgmain->fragment_kopieren($frgid);
			break;

		case 'dele':
			$message = $frgmain->fragment_loeschen($frgid);
			break;

		case 'crea':
			$message = $frgmain->fragment_anlegen($frgid);
			break;

		case 'frgNameSave':
			$frgname = isset($_POST['value']) && $_POST['value'] != '' ? stripslashes($_POST['value']) : 'bitte eine Bezeichnung eingeben';
			$message = $frgmain->fragment_name_save($frgid, $frgname);
			$view = 'nothingToDo';
			echo $message;
			break;

		case 'csssave':
			$message = $frgmain->save_cssfile();
			break;

		default:
			$srtids	= 'frgmnts[]=002&frgmnts[]=001&frgmnts[]=003&frgmnts[]=004&frgmnts[]=005';
			$ele = preg_split('/\&?(frgmnts\[\]=)/', $srtids);
//		  	print_r($ele);
//		  	$frgmain->fragmente_sortieren($ele);
			$feldname = '';
			break;		
	}

/***********************************************************************************************
 * Präsentation abhängig von der Variable $view
 ***********************************************************************************************/
	switch($view) 
	{
		case 'nothingToDo':
			break;
		case 'edit':
			$frgpres->output('frgcontent', $content);
			break;
		default:
			if ($tab == $GLOBALS['TEXTE']['FRAGMENTE']) {
				// Alle Fragmente auslesen für Tab-Anzeige
				$frgmnts = $frgmain->fragmente_lesen();
				// Nun die Fragmente anzeigen
				$frgpres->fragmente_anzeigen($frgmnts, $tab, $message);
			} elseif ($tab == $GLOBALS['TEXTE']['CSS']) {
				// Dateiinhalt von fragmente.css einlesen
				$csscontent = $frgmain->read_css();
				$message = $GLOBALS['message'];
				$frgpres->css_editieren($message);
				unset($GLOBALS['message']);
			}
			break;	
	}

// Disconnect von der DB
	$db->disconnect();

?>
