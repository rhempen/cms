<?php 
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse fuer die Praesentation der Navigation am Bildschirm 
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2007-07-14
 * @package     CMSADMIN/Pictures
 * 
 */
// Klassen includieren und instanziieren 
	require_once('cmsadmin.inc.php');

// Timestamp ermitteln
	$t = getdate();		
	$timestamp = $t['mday'].'.'.$t['mon'].'.'.$t['year'].' '.$t['hours'].':'.$t['minutes'].':'.$t['seconds'];

// $_GET-Parameter abholen
	$action		= isset($_GET['action']) ? $_GET['action'] : 'images';
	$aktdir		= isset($_GET['dir']) ? $_GET['dir'] : MEDIA_ROOT;	
	$delete 	= isset($_GET['delete']) ? $_GET['delete'] : '';
	$rename 	= isset($_GET['rename']) ? $_GET['rename'] : '';
	$filename	= isset($_GET['filename']) ? $_GET['filename'] : '';
	$fileold 	= isset($_GET['fileold']) ? $_GET['fileold'] : '';
	$creadir	= isset($_GET['verzeichnis']) ? $_GET['verzeichnis'] : '';
	$ref_id 	= isset($_GET['ref_id']) ? $_GET['ref_id'] : 0;
	$sortkey	= isset($_GET['sortkey']) ? $_GET['sortkey'] : 0;	
	$type	 	= isset($_GET['type']) ? $_GET['type'] : '';
	$bild_id 	= isset($_GET['bild_id']) ? $_GET['bild_id'] : '';
	$kommentar 	= isset($_GET['kommentar']) ? stripslashes($_GET['kommentar']) : '';
	$zeige_bilder = isset($_GET['bilder']) ? $_GET['bilder'] : $_SESSION['zeige_bilder'];
	$view		= ''; // steuert die Anzeige der Daten
    $langu_tra  = $cfg->set_language_tra();    
    $language   = $_SESSION['language'] ? $_SESSION['language'] : strtolower(LANGUAGE);
	global $msg;
	
// Session-Cookies setzen
	$_SESSION['zeige_bilder'] = $zeige_bilder;
	$_SESSION['action'] = $action;
	$_SESSION['ref_id'] = $ref_id; // ref_id = id der Aktuellen Seite der Navigation oder Pages
	$_SESSION['type'] 	= $type;   // Type N = Navigation / P = Pages
    $_SESSION['language'] = strtolower($language);
	
// die Seiteninformationen brauchen wir praktisch auf jeder Seite -> also gleich am Anfang lesen
	if ($ref_id > 0) {
      if ($type == 'N') {
          $row = $navi->read_navi_page($ref_id);            
      } else {
          $row = $pages->read_page($ref_id);
      }
	} else {
      // es wurde der Medienbrowser aufgerufen, der ohne ref_id daherkommt.
      // stattdessen versuchen wir hier, anhand des Verzeichnisses die richtige ref_id zu finden
      if ($aktdir != MEDIA_ROOT && $aktdir != '') {
          $pfad = array_pop(explode('/',$aktdir));
          if ($type == 'N') {
              $row = $navi->read_navigation_by_bildpfad($pfad);
          } else {				
              $row = $pages->read_page_per_kennzeichen($pfad);
          }
      }
	}
	
/***********************************************************************************************
 * Verschiedene Funktionen auf der �bersicht ausf�hren
 ***********************************************************************************************/
// Reihenfolge aendern
	if ($action == 'bildup') {
		if ($ref_id > 0 && $sortkey > 0) {
			$msg = $bilddb->bild_hochziehen($ref_id, $sortkey);
		}
		$action  = 'imagesEdit';		
	}

// Umbenennen eines Verzeichnisses oder einer Datei -> ist nicht aktiv!!
	if ($action == 'rename' && $filename != '' && $fileold != '')
	{
		$msg = $browser->rename_file($aktdir, $filename, $fileold);
		$view = 'nothingToDo';
	}		

// L�schen eines Verzeichnisses oder einer Datei
	if ($action == 'delete' && $filename != '')
	{
		$msg = $browser->delete_file($aktdir, $filename);
		$action  = 'images';
		$view = '';
	}

// Ein Verzeichnis anlegen
	if ($action == 'createDir')
	{
		if (isset($_POST['dirs']) && isset($_POST['verzeichnis']) && $_POST['dirs'] != '' && $_POST['verzeichnis'] != '' ) {
			// jetzt wird das Verzeichnis angelegt
			$dir_to_create = $_POST['dirs'] .'/'. $_POST['verzeichnis']; 
			$msg = $browser->create_directory();
			// danach zur�ck zur �bersicht
			$aktdir = $_POST['dirs'];
			$action  = 'images';
			$view = '';
			// falls gesetzt, muss das Session-Cookie $_SESSION['action'] gel�scht werden
			unset($_SESSION['action']);
		} else {
			// alle Verzeichnisse ab /media = MEDIA_ROOT nach weiteren Verzeichnissen scannen
			$verzeichnisse = $browser->scan_directories();
			$view = 'create_dir';
		}
	}

// Dateien hochladen
	if ($action == 'uploadFiles')
	{
		if (count($_FILES) > 0) {
			// Hochladen durchf�hren
			$msg = $browser->upload_files($aktdir);
		}
		$verzeichnisse = array();
		$verzeichnisse = $browser->scan_directories();
		// falls das aktuelle Verzeichnis nicht existiert, kann es hier angelegt werden
		if (!in_array($aktdir, $verzeichnisse)) {
			$msg = $browser->create_directory($aktdir);
		}
		$view = 'upload_files'; 
	}

// Directory auslesen (oberstes Verzeichnis ist /media (MEDIA_BASE)
	if ($action == 'images')
	{
		// Dateien im Verzeichnis lesen und als Array empfangen --> Doku in der Klasse!
		$files = $browser->dirlst($aktdir, strlen($aktdir)+1, 1, 1, 1, 0);
		if (count($files) == 0) { $msg[] = 'error'; $msg[] = $GLOBALS['MESSAGES']['MSG_KEINE_DATEIEN_GEFUNDEN']; }
		$view = '';
	}
	
// Ein Bild in der ganzen Groesse anzeigen
	if ($action == 'imageShow')
	{
		$bild = $aktdir .'/'. $filename;
		if (is_file($bild)) { $view = 'showBild'; } else { $view = ''; }
	}
	
// den Sortkey der Bilder in der DB neu aufbauen 
	if ($action == 'refreshSortkey')
	{
		$msg = $pictdb->refresh_sortkey($ref_id, $type);
		$action = 'imagesEdit';
		$view = 'edit_comments';
	}

	// Bilddirectories auslesen und zum Bearbeiten der Kommentare darstellen
	if ($action == 'imagesEdit')
	{
		// Images und Thumbnails im Verzeichnis lesen und als Array empfangen --> Doku in der Klasse!
		$images = $browser->get_images($aktdir); // Bilder einlesen
		$thumbdir = str_replace('_images', '_thumbs', $aktdir);
		$thumbnails = $browser->get_images($thumbdir); // Thumbnails einlesen
		
		if (count($images) == 0) { 			
			$msg[] ='error'; $msg[] = $GLOBALS['MESSAGES']['MSG_NOTHING_FOUND']; 
		} else {
			$files_in_db = $bilddb->bilder_aus_db_lesen($ref_id, $images, $type);
			if (count($files_in_db) == 0) {
				$msg[] ='error'; $msg[] = $GLOBALS['MESSAGES']['MSG_NOTHING_FOUND']; 
			}
		}
		$view = 'edit_comments';
	}
		
// Bilddirectories auslesen und zum Bearbeiten der Kommentare darstellen
	if ($action == 'kommentarSave')
	{
		if (isset($bild_id)) {
			$message = $bilddb->bild_kommentar_speichern($bild_id, $kommentar);
			echo $message;
		} else {
			echo $GLOBALS['MESSAGES']['MSG_FEHLER'];
		}
		$view = 'nothingToDo';
	}

// Die Action wurde bis hierher ev. umgesetzt, daher hier nochmals die Session-Variable setzen	
	$_SESSION['action'] = $action;

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
 * Verzeichnisse anlegen
 ***********************************************************************************************/
		case 'create_dir':
			$show->verzeichnis_anlegen($verzeichnisse, $aktdir);
			break;

/***********************************************************************************************
 * Dateien hochladen
 ***********************************************************************************************/
		case 'upload_files':
			if ($row != '') {
				if ($type == 'P') { $seite = $navi->read_navi_page($row['nav_id']); }                
				$thumbsize = $frontget->read_thumbsize_by_tplid($row['template']);
			}
			$show->dateien_hochladen($verzeichnisse, $msg, $aktdir, $thumbsize);
			break;

/***********************************************************************************************
 * Kommentare editieren
 ***********************************************************************************************/
		case 'edit_comments':			
			$show->kommentare_anzeigen($files_in_db, $aktdir, $msg, $zeige_bilder, $type, $ref_id);
			break;

/***********************************************************************************************
 * Ein Bild anzeigen
 ***********************************************************************************************/
		case 'showBild':			
			$show->bild_anzeigen($bild);
			break;

/***********************************************************************************************
 * Alle Menupositionen einlesen und zur Bearbeitung darstellen
 ***********************************************************************************************/
		default: 
			// Nun die Dateien und Verzeichnisse auflisten und Links zur Bearbeitung anbieten
			$show->bilder_anzeigen($aktdir, $files, $msg, $zeige_bilder);
			break;	
	}
	
// Disconnect von der DB
	$db->disconnect();

?>
