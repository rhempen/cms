<?php 
// Klassen includieren und instanziieren 
	require_once('cmsadmin.inc.php');

// Timestamp ermitteln
	$t = getdate();		
	$timestamp = $t['mday'].'.'.$t['mon'].'.'.$t['year'].' '.$t['hours'].':'.$t['minutes'].':'.$t['seconds'];
	
// $_GET-Parameter abholen
	$nav_id		= $_GET['nav_id'] ? $_GET['nav_id'] : '';
	$type		= $_GET['type'] ? $_GET['type'] : '';
	$seiten_id	= $_GET['seiten_id'] ? $_GET['seiten_id'] : '';
	$ukap		= $_GET['ukap'] ? $_GET['ukap'] : '';
	$kap		= $_GET['kap'] ? $_GET['kap'] : '';
	$action		= $_GET['action'] ? $_GET['action'] : '';
	$menutext	= $_GET['text'] ? $_GET['text'] : '';
	$thumbsdir	= $_GET['dir'] ? $_GET['dir'] : '';
	$srtids		= isset($_POST['srtids']) ? $_POST['srtids'] : '';
	$view		= ''; // steuert die Anzeige der Daten

	$_SESSION['ref_id'] = $nav_id;
	$_SESSION['type'] = $type;

	// Feldwert, welcher via InPlaceEditor / AJAX geändert wird -> Wert muss decodiert werden
	switch ($action) {
            case 'naviSave':
                $feldwert   = isset($_POST['value']) && trim($_POST['value']) != '' ? trim(stripslashes($_POST['value'])) : 'value';
                $feldname   = 'bezeichnung'; // Feldname, dessen wert geändert werden soll
                break;
            case 'startSave':
                $wert       = isset($_GET['wert']) ? $_GET['wert'] : '';
                $feldwert   = $wert == 'ja' ? 'n' : 'j';
                $feldname   = 'start'; // Feldname, dessen wert geändert werden soll
                break;
            case 'aktivSave':
                $wert       = isset($_GET['wert']) ? $_GET['wert'] : '';
                $feldwert   = $wert == 'ja' ? 'n' : 'j';
                $feldname   = 'aktiv'; // Feldname, dessen wert geändert werden soll
                break;
            case 'typeSave':
                $wert 	  = isset($_GET['wert']) ? $_GET['wert'] : '';
                if 	($wert == $GLOBALS['NAVI']['HORIZONTAL']) { $feldwert = $GLOBALS['NAVI']['VERTIKAL']; }
                elseif 	($wert == $GLOBALS['NAVI']['VERTIKAL']) { $feldwert = $GLOBALS['NAVI']['SERVICE']; }
                elseif 	($wert == $GLOBALS['NAVI']['SERVICE']) { $feldwert = $GLOBALS['NAVI']['HORIZONTAL']; }
                $feldname = 'nav_type'; // Feldname, dessen wert geändert werden soll
                break;
            case 'naviSort':
                $ele = preg_split('/\&?(navisDivs\[\]=)/', $srtids);
                $navi->navi_sortieren($ele);
    			$view = 'nothingToDo';
                break;
            default:
                $feldname   = '';
                break;
        }

/***********************************************************************************************
 * Verschiedene Funktionen auf der Uebersicht ausfuehren
 ***********************************************************************************************/
// wenn die nav_id bekannt ist wird der entsprechende Navigationspunkt hier zentral gelesen.
// $row ist danach in der $GLOBALS['row'] verf�gbar
	if ($nav_id > 0) {
		$row = $navi->read_navigation_by_id($nav_id);
	}

// Hauptnavigations-Punkt hochziehen
	if ($action == 'kap' && $nav_id > 0 && $kap > 1)
	{
		$message = $navi->kap_hochziehen($kap);
	}

// Unternavigations-Punkt hochziehen
	elseif ($action == 'ukap')
	{
		$message = $navi->ukap_hochziehen($nav_id);
	}		

// Neuen Unternavigationspunkt eroeffnen
	elseif ($action == 'neuUkap' && $nav_id != 0)
	{
		$message = $navi->neuer_ukap($nav_id);
	}

// Neuen Hauptnavigationspunkt eroeffnen
	elseif ($action == 'neu' && $kap == 0)
	{
		$message = $navi->neuer_kap($kap);
	}

// Navigationspunkt loeschen
	elseif ($action == 'del' && $nav_id != 0)
	{
		// Hauptnavigationspunkt: pr�fen, ob noch Unternavigationspunkte bestehen
		if ( $row['kap'] != 0 && $row['ukap'] == 0 ) {
			$unavis = $navi->read_navigation_by_kap($row['kap']);
			$count = 0;
			while ($page = $unavis->fetchRow(MDB2_FETCHMODE_ASSOC)) {
				$count = $count + $pages->count_pages($page['nav_id']);
			}
			// Wenn noch Unterseiten bestehen --> Meldung ausgeben, nichts l�schen
			if ($count > 0) {
				$message[] = 'error'; $message[] = sprintf($GLOBALS['MESSAGES']['MSG_NAVI_NICHT_LOESCHBAR'], $count);
			} else {
				// Alle Navigationspunkte und Seiten l�schen
				$unavis = $navi->read_navigation_by_kap($row['kap']);
				while ($row = $unavis->fetchRow(MDB2_FETCHMODE_ASSOC)) {				
					// 1. Alle Bilder auf der Disk l�schen
					// 2. Alle Bilddaten in der DB l�schen
					// 3. den Navigationspunkt l�schen
					$pfad 	= MEDIA_ROOT .'/'. $row['bildpfad'];
					$browser->deltree($pfad);
					$message = $bilddb->bilder_loeschen_pro_ref_id($row['nav_id'], 'N', $message); 
					$message = $navi->delete_navigationspunkt($row, $message);
				}
			}
		} else {
			// 1. Alle Bilder auf der Disk l�schen
			// 2. Alle Bilddaten in der DB l�schen
			// 3. den Navigationspunkt l�schen
			$pfad 	= MEDIA_ROOT .'/'. $row['bildpfad'];
			$browser->deltree($pfad);
			$message = $bilddb->bilder_loeschen_pro_ref_id($row['nav_id'], 'N', $message); 
			$message = $navi->delete_navigationspunkt($row, $message);			
		}			
	} 
	
// Navigationspunkt bearbeiten
	elseif ($action == 'edit' && $nav_id != 0) 	
	{
		$navigation = $row;
		$navi_page 	= $navi->read_navi_page($nav_id);
		$templates 	= $genmain->read_templates();
		$modules 	= $genmain->read_modules();
		$thumbnails = $browser->get_images($thumbsdir);
		$view = 'editPage';
	}  

// Navigationspunkt kopieren
	elseif ($action == 'copy' && $nav_id != 0) 	
	{
		$navigation = $row;
		$navi_page 	= $navi->read_navi_page($nav_id);
        $message    = $navi->copy_navi_page($navigation,$navi_page);
	}  
    
// Navigationspunkt nach dem Bearbeiten speichern
	elseif ($action == 'save' && $seiten_id != 0) 	
	{
		if (get_magic_quotes_gpc()) { $_POST = array_map('stripslashes', $_POST); }
		$message = $navi->save_navi_page($seiten_id);
	}  
		
// Einen Navigationspunkt updaten (wurde mittels InPlaceEditor editiert)
	elseif ($action == 'naviSave' && $feldwert != '')
	{
		// Kuerzel in cms_redirect updaten
		$redir->navi_update($nav_id, $feldwert);
		// Bezeichnung updaten
		$message = $navi->navi_update($nav_id, $feldname, $feldwert);
		// im gleichen Schritt soll nun auch noch gleich das Feld fach in Tabelle cms_pages upgedated werden.
		// Alle page_id's lesen, welche die nav_id im Record haben.
		if ($nav_id > 0) {
			$page_ids = $pages->read_fieldarray_from_pages('page_id', 'nav_id', $nav_id);
			while ($row = $page_ids->fetchRow(MDB2_FETCHMODE_ASSOC)) {
				if ($row['page_id'] > 0) {
			  		$pages->page_update($row['page_id'], 'fach', $feldwert);
				}
			}
		}
		echo $message;  // Ausgabe mit echo, da ja kein Server-Roundtrip die Seite neu aufbaut
		$view = 'nothingToDo';
	}

// Einen Navigationspunkt als Startseite festlegen (wird mittels Ajax gesichert)
	elseif ($action == 'startSave' && $nav_id > 0)
	{
		$message = $navi->navi_update($nav_id, $feldname, $feldwert);
		echo html_entity_decode($message);
		$view = 'nothingToDo';
	}		
	
// Einen Navigationspunkt als Service oder Hauptnavigation definieren (wird mittels Ajax gesichert)
	elseif ($action == 'typeSave' && $nav_id > 0)
	{
		$message = $navi->navi_update($nav_id, $feldname, $feldwert);
		echo html_entity_decode($message);
		$view = 'nothingToDo';
	}		
	
// Einen Navigationspunkt aktiv oder nicht setzen (wird mittels Ajax gesichert)
	elseif ($action == 'aktivSave' && $nav_id > 0)
	{
		$message = $navi->navi_update($nav_id, $feldname, $feldwert);
		echo html_entity_decode($message);
		$view = 'nothingToDo';
	}		
	
// Die Anzeige wird durch die Variable $view gesteuert. $view == 'single' zeigt einen Datensatz
// Ansonsten wird die Uebersicht angezeigt.
	
	switch($view) 
	{
/***********************************************************************************************
 * Eine einzelne Menuposition anzeigen (Aktion nach dem Bearbeiten mittels Ajax.InPlaceEditor
 * Das Nachladen der Uebersicht erfolgt via Javascript Reload
 ***********************************************************************************************/

		case 'nothingToDo':
			break;

/***********************************************************************************************
 * Eine einzelne Seite zum Bearbeiten anzeigen
 ***********************************************************************************************/

		case 'editPage':		
			// Anzeige einer einzelnen Seite zum Bearbeiten
			$pres->edit_page($navigation, $navi_page, $templates, $modules, $thumbnails);
			break;
		
/***********************************************************************************************
 * Alle Menupositionen einlesen und zur Bearbeitung darstellen
 ***********************************************************************************************/
		default: 
			// Alle Navigationspunkte inkl. Unternavigationspunkte in einen assoc. Array einlesen	
			$menu_arr=$navi->navigation_laden();
			// Nun die Navigationspunkte auflisten und Links zur Bearbeitung anbieten
			$pres->navigation_anzeigen($menu_arr, $message);
			break;	
	}
	
// Disconnect von der DB
	$db->disconnect();

?>
