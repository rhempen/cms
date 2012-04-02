<?php 
// Klassen includieren und instanziieren 
	require_once('cmsadmin.inc.php');

// $_GET-Parameter abholen
	$action		= isset($_GET['action']) ? $_GET['action'] : '';
	$dbaction	= isset($_GET['dbaction']) ? $_GET['dbaction'] : '';
	$page_id	= isset($_GET['page_id']) ? $_GET['page_id'] : ''; 
	$fach		= isset($_GET['fach']) ? $_GET['fach'] : '';
	$domain		= isset($_GET['domain']) ? $_GET['domain'] : '';
	$area		= isset($_GET['area']) ? $_GET['area'] : $domain;	
	$view		= ''; // steuert die Anzeige der Daten

/***********************************************************************************************
 * Verschiedene Funktionen auf der �bersicht ausf�hren
 ***********************************************************************************************/
// falls $page_id gesetzt ist, wird hier gleich zentral der ganze Datensatz f�r die Seite gelesen
// �ber $GLOBALS kann dann jederzeit darauf zugegriffen werden.
	if ($page_id > 0) {
		$page = $pages->read_page($page_id);
		$row  = $page->fetchRow(MDB2_FETCHMODE_ASSOC);
	}

	// $area muss auf jeden Fall einen Wert erhalten, sonst klappt die Anzeige nicht
	if ($_SESSION['area'] == '') { $_SESSION['area'] = $navi->read_first_hauptnavi(); }
	$area = $area == '' ? $_SESSION['area'] : $area;
	
	switch ($action) {
		case 'create':
			$templates 	 = $genmain->read_templates();
			$next_id_kz  = $pages->create_page($area);
			$unavi		 = $genmain->read_navi_ukaps($area);
			$view        = 'newPage';
			break;
		case 'delete':
			// 1. Bilder auf der Disk l�schen
			// 2. Bilder in der DB l�schen
			// 3. Seite l�schen
			$pfad 	= MEDIA_ROOT .'/'. $row['kennzeichen'];
			$msg = $browser->deltree($pfad);
			$msg = $bilddb->bilder_loeschen_pro_ref_id($row['page_id'], 'P', $msg); 
			$msg = $pages->delete_page($page_id, $msg);
			$msg = $redir->page_delete_redirect($row);
			break;
		case 'save':
			if (get_magic_quotes_gpc()) { $_POST = array_map('stripslashes', $_POST); }	
			$msg = $pages->save_page($page_id, $action, $dbaction);
			// beim Insert einer neuen Seite wird auch gleich noch ein Verzeichnis auf der Disk angelegt,
			// um im Update-Modus Bilder dorthin hochzuladen.
			if ($dbaction == 'insert') {
				$_POST['dirs'] = MEDIA_ROOT;
				$_POST['verzeichnis'] = $_POST['kennzeichen'];
				$browser->create_directory();
				if ((int)$_POST['navid'] != 0 && (int)$_POST['page_id'] != 0) {
					$msg = $redir->page_save_redirect();
				}
			} elseif ($dbaction == 'update') {
				// Beim Update der Seite muss auch cms_redirect aktualisiert werden
				$akt_redir	= $redir->page_read_redirect($row['page_id'], $row['nav_id']);
				$msg = $redir->page_update_redirect();
				// zum Schluss soll der sortier-Index in cms_pages aktualisiert werden.
				$pages->reorg_sort_ids($row['nav_id']);
			}
			break;
		case 'edit':
			$unavi		 = $genmain->read_navi_ukaps($area);
			$templates 	 = $genmain->read_templates();
			$page        = $pages->read_page($page_id);
			$view        = 'editPage';
			// einlesen der verf�gbaren Thumbnails zur aktuellen Seite, aber nur im Update-Modus
			if ($dbaction != 'insert') {
				$query = 'SELECT kennzeichen FROM '.TABLE_PREFIX.'pages WHERE page_id='.$page_id;
				$kennzeichen = $db->queryOne($query);
				$verzeichnis = MEDIA_ROOT .'/'. $kennzeichen .'/_thumbs';
				$thumbnails  = $browser->get_images($verzeichnis);
			}
			break;
		case 'autoComplete':
			// AJAX AutoCompleter
			if (isset($_REQUEST['exp1'])) { $exp = $_REQUEST['exp1']; }
			elseif (isset($_REQUEST['exp2'])) { $exp = $_REQUEST['exp2']; }
			else { $exp = ''; }
			$resultlist = $pages->read_pages_per_domain($area, $exp);
			$html = '<ul>';
			while ($row = $resultlist->fetchRow(MDB2_FETCHMODE_ASSOC))
			{	
				$row = array_map('htmlentities', $row);
				$html .= '<li value="' . $row['page_id'] . '">' . $row['name'] . '</li>';
			}
			$html .= '</ul>';
			echo html_entity_decode($html);
//			echo urldecode($html);
			$view = 'nothingToDo';
			$resultlist->free();
			break;
		case 'aktivSave':
			// das Aktivflag via AJAX updaten
			if ($page_id > 0) {
				$wert 	  = isset($_GET['wert']) ? $_GET['wert'] : 'inaktiv';
				$feldwert = $wert == 'aktiv' ? 'n' : 'j';
				$feldname = 'aktiv'; // Feldname, dessen wert ge�ndert werden soll
				$message = $pages->page_update($page_id, $feldname, $feldwert);
				echo $message;
				$view = 'nothingToDo';
			}
			break;
		case 'nameSave':
			if ($page_id > 0) {
				$feldwert	= isset($_POST['value']) && trim($_POST['value']) != '' ? trim(stripslashes($_POST['value'])) : 'value';
				$feldname	= 'name'; // Feldname, dessen wert ge�ndert werden soll
				$message = $pages->page_update($page_id, $feldname, $feldwert);
				echo $message;
				$view = 'nothingToDo';
			}
			break;
		case 'moveUp':
			if ($page_id > 0 && $row['fach'] != '') {
				$msg = $pages->move_up_page($page_id, $row['sort_id'], $row['fach'], $row['name']);
			}
			break;
		default:
	}


// Die Anzeige wird durch die Variable $view gesteuert.
	switch($view) 
	{
/***********************************************************************************************
 * Eine einzelne Menuposition anzeigen (Aktion nach dem Bearbeiten mittels Ajax.InPlaceEditor
 * Das Nachladen der �bersicht erfolgt via Javascript Reload
 ***********************************************************************************************/

		case 'nothingToDo':
			break;

/***********************************************************************************************
 * Eine einzelne Seite zum Bearbeiten anbieten
 ***********************************************************************************************/

		case 'newPage':		
			// Anzeige eines leeren Formulars zum Erfassen einer neuen Seite
			$zeige->new_page($area, $next_id_kz, $templates, $unavi);
			break;
		
/***********************************************************************************************
 * Eine neue Seite zum Erfassen anbieten
 ***********************************************************************************************/

		case 'editPage':		
			// Anzeige einer einzelnen Seite zum Bearbeiten
			$zeige->edit_page($page, $templates, $unavi, $thumbnails, $area, $domain, $msg, $dbaction);
			unset($GLOBALS['formdata']);			
			break;
		
/***********************************************************************************************
 * Alle Menupositionen einlesen und zur Bearbeitung darstellen
 ***********************************************************************************************/
		default: 
			// �bersicht einlesen
			$overview = $pages->read_pages_overview($area);			
			// Seiten auflisten und Links zur Bearbeitung anbieten
			$zeige->show_pages_overview($overview, $area, $action, $msg);
			break;
	}

	
// Disconnect von der DB
	$db->disconnect();

?>
