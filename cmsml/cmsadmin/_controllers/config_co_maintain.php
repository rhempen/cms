<?php 
/**
  * Controller fuer alle Funktionen, die mit der CMS-Konfiguration zu tun haben.
  *
  * Dieser Controller steuert alle Funktionen, welche im CMS und der Menu-Position
  * Konfiguration erfolgen können
  *
  * * Markdown style lists function too
  * * Just try this out once
  *
  * @author  Roland Hempen <info@hempenweb.ch>
  *
  * @since 1.0
  *
  * @param $action - 
  * @param $cat 
  * @param $catid
  * @param $param  
  */

// Klassen includieren und instanziieren 
	require_once('cmsadmin.inc.php');
	
// $_GET-Parameter abholen
	$action	= isset($_GET['action']) ? $_GET['action'] : '';
	$cat	= isset($_GET['cat']) ? $_GET['cat'] : '';
	$catid	= isset($_GET['id']) ? $_GET['id'] : '';
	$param	= isset($_GET['param']) ? $_GET['param'] : '';
	$thema	= isset($_GET['thema']) ? $_GET['thema'] : '';
	$view		= ''; // steuert die Anzeige der Daten

	switch ($action) {      
//      case 'saveLanguTra': // Save der eingestellten Sprache für Übersetzungen in $_SESSION['language_tra']        
//        $cfg->setLanguageTra();
//        $_SESSION['language_tra'] = isset($_GET['langu']) ? strtolower($_GET['langu_tra']) : '';
//        $message = $GLOBALS['TEXTE']['LANGUAGE'].": ".strtoupper($_SESSION['language_tra']);
//        echo $message;
//        $view = 'nothingToDo';          
//        break;
           
      case 'saverb': // Save von Radiobuttons
        // Funktion darf nur ausgefuehrt werden, wenn die Werte �bergeben wurden
        if ($_REQUEST['value'] != null && $_REQUEST['alternative'] != null) {
            $feldwert	 = isset($_REQUEST['value']) && $_REQUEST['value'] != null ? stripslashes($_REQUEST['value']) : '';
            $alternative = isset($_REQUEST['alternative']) && $_REQUEST['alternative'] != null ? stripslashes($_REQUEST['alternative']) : '';
        } else {
            $action = '';
            $view = 'nothingToDo';
            echo 'Fehler bei der Wertübergabe!! Funktion wird nicht ausgeführt.';
        }
        break;

      // Feldwert, welcher via InPlaceEditor / AJAX geaendert wird -> Wert muss decodiert werden
      case 'save': 
        $feldwert	= isset($_REQUEST['value']) && trim($_REQUEST['value']) != '' ? stripslashes($_REQUEST['value']) : 'val';
        // Feldname, dessen wert ge�ndert werden soll			
        $feldname	= 'value'; 
        break;
      
      case 'savethema': // das gewählte Thema
          $feldwert	= isset($_REQUEST['thema']) && trim($_REQUEST['thema']) != '' ? stripslashes($_REQUEST['thema']) : 'val';
          // Feldname, dessen wert ge�ndert werden soll			
          $feldname	= 'value'; 
          break;

      case 'save_ltxt': // Feld longtext speichern
          $feldwert	= isset($_POST['value']) && $_POST['value'] != '' ? stripslashes($_POST['value']) : 'val';
          // Feldname, dessen wert ge�ndert werden soll			
          $feldname	= 'longvalue'; 
          break;

      case 'save_spez': // Feld longtext speichern
          $feldwert	= isset($_POST['value']) && $_POST['value'] != '' ? stripslashes($_POST['value']) : 'val';
          // Feldname, dessen wert ge�ndert werden soll
          list($name,$feld) = explode('_', $catid);
          $feldname = 'wert'.$feld;
          break;

      case 'aktivSaveSpez': // Feld aktiv speichern
          $wert       = isset($_GET['wert']) ? $_GET['wert'] : '';
          $feldwert   = $wert == 'ja' ? 'n' : 'j';
          list($name,$feld) = explode('_', $catid);
          $feldname = 'aktiv';
          break;
          
        // Index-Tabelle cms_redirect aktualisieren (aus den Navigations und Pages-Eintr�gen)	
      case 'smurl_refresh': // Tabelle cms_redirection aktualisieren
          $message = $redir->smurl_update();
          $action = '';
          $cat    = 'menu';
          $view   = 'printMessages';
          break;

      // Galerie-Tabelle cms_galerien mit den Bilddateien auf der Disk abgleichen
      case 'disk_db_adjustment': 
          $message = $pictdb->disk_db_adjustment();
          $action = '';
          $cat    = 'pictures';
          $view   = 'printMessages';
          break;

      // Media-Verzeichnis mit gewähltem THEME abgleichen
      case 'media_root_adjustment':
          $message =  $confmain->update_website_media();
          $action = '';
          $cat    = 'pictures';
          $view 	= 'printMessages';
          break;

      default: 
          $feldname = '';
          break;		
	}

/***********************************************************************************************
 * Verschiedene Funktionen auf der �bersicht ausf�hren
 ***********************************************************************************************/
	
// Einen Konfigurationswert in cms_config updaten (wurde mittels InPlaceEditor editiert)
	if (($action == 'save' || $action == 'save_ltxt' || $action == 'savethema') && $feldwert != '')
	{
		// Wert updaten
		$message = $confmain->config_update($catid, $feldname, $feldwert);
		// wenn der Parameter THEME geändert wird, muss ein Server-Roundtrip gemacht werden
		if ($param == 'THEME') { 
			// dabei wird 1. die Datei includes/website.php aktualisiert
			$confmain->update_website($feldwert);
			unset($message);
			// und 2. wird das Media-Verzeichnis gem. THEMA angepasst (zB. media_feednsmile)
			$confmain->update_website_media();
		} else { 
		// Ausgabe mit echo, da ja kein Server-Roundtrip die Seite neu aufbaut
			echo $message;  
			$view = 'nothingToDo'; 
		}
	}

    // Einen Konfigurationswert in cms_spezial updaten (wurde mittels InPlaceEditor editiert)
	if ($action == 'save_spez' && $feldwert != '' && $name != '')
	{
		// Wert updaten
		$message = $confmain->spezial_update($name, $feldname, $feldwert);
		// Ausgabe mit echo, da ja kein Server-Roundtrip die Seite neu aufbaut
		$return[] = $message;
		$return[] = $thema;
		echo $message;   
		$view = 'nothingToDo';
	}

    // Einen Konfigurationswert in cms_spezial updaten (wurde mittels Button aktiv/inaktiv ausgelöst)
	if ($action == 'aktivSaveSpez' && $feldwert != '' && $name != '')
	{
		// Wert updaten
		$message = $confmain->spezial_aktiv_update($name, $feldname, $feldwert);
		// Ausgabe mit echo, da ja kein Server-Roundtrip die Seite neu aufbaut
		echo $message;   
		$view = 'nothingToDo';
	}

// Einen Konfigurationswert updaten (wurde mittels Radiobutton  ausgew�hlt)
	if ($action == 'saverb' && $feldwert != '')
	{
		// Wert updaten
		$message = $confmain->config_update_rb($catid, $feldwert, $alternative);
		// Ausgabe mit echo, da ja kein Server-Roundtrip die Seite neu aufbaut
		echo $message;  
		$view = 'nothingToDo';
	}


/***********************************************************************************************
 * Pr�sentation abhaengig von der Variable $view
 ***********************************************************************************************/
	switch($view) 
	{
		case 'nothingToDo':
			break;
		case 'printMessages':
			$categories = $confmain->config_category_lesen();
			$confpres->show_messages($categories, $cat, $message);
			break;
		default: 
			// Kategorien aus der cms_config lesen und den Namen der ersten Kategorie f�r Anzeige setzen
			if ($cat == '') { 
				$categories = $confmain->config_category_lesen();
				$row = $categories->fetchRow(MDB2_FETCHMODE_ASSOC); 
				$cat = $row['category'];
			}
			// Alle Kategorien auslesen f�r Tab-Anzeige 
			$categories = $confmain->config_category_lesen();
			// Alle Eintr�ge zur ersten Kategorie lesen	
			$config	= $confmain->config_lesen($cat);
			// neu werden auch die Eintr�ge in der Tabelle cms_spezial dazugelesen und zur Bearbeitung angeboten
			$spezial = $confmain->spezial_lesen(THEME);
			$count 	= $spezial->numRows();
			$spez 	= $count > 0 ? THEME : '';
			// Nun die Konfigurationsdaten anzeigen
			$confpres->config_anzeigen($config, $categories, $cat, $message, $spezial, $spez);
			break;	
	}

// Disconnect von der DB
	$db->disconnect();

?>
