<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 * Klasse fuer die Praesentation von Medien am Bildschirm 
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2007-08-18
 * @package     CMSADMIN/Pictures
 * 
 */
 
class picturesPresent
{
	private $mTpl;

    function __construct($tpl) 
    {
		$this->mTpl	= $tpl;
		
    }                                                                          

	/************************************************************************************************
	 *  Dateien und Verzeichnisse anlegen
	 *  @params: $aktdir - aktuell gew�hltes Verzeichnis
	 *  @params: $files  - Array der gelesenen Files
	 *  @params: $message - Meldungstext
	 ************************************************************************************************/
	public function bilder_anzeigen($aktdir, $files, $message, $zeige_bilder)
	{
		global $general, $navi, $pages;
		global $tpl;
		
		// der GET-Parameter 'ref_id' steuert die Navigation innerhalb des Browsers.
		// wenn der Medienbrowser von der Seitenverwaltung aufgerufen wurde, soll sich der Benutzer 
		// nur im Verzeichnis der zugeh�rigen Seite bewegen k�nnen. dh. $dir_up darf nie = MEDIA_ROOT sein.
		// bzw. das hoechste Verzeichnis hat zB. die Form MEDIA_ROOT/art0001 .
		// Entsprechend wird hier festgelegt, ob der Up-Button angezeigt und ob der Paramter den 
		// anderen Buttons mitgegeben werden soll
		if (isset($_GET['ref_id']) && $_GET['ref_id'] > 0) {
			$p_ref_id = '&ref_id='.$_GET['ref_id'];
		}
        $type = $_SESSION['type'];
		
		// current_dir = $aktdir - MEDIA_ROOT
		$current_dir = substr($aktdir, strlen(MEDIA_ROOT), strlen($aktdir));
		$tpl->loadTemplatefile('browser.tpl.html', true, true);
		// horizontales Menu anzeigen
		$tmenu[0] = 'neutral'; $tmenu[1] = $GLOBALS['TEXTE']['TEXT_BASIS_BILDER'];
		$this->show_menue($aktdir, $tmenu, 'yes', $zeige_bilder);
		// ev. Meldung ausgeben
		$this->print_message($message);

		// Hauptblock aktivieren
		$tpl->setCurrentBlock('main_block');

		// Platzhalter f�llen
		$tpl->setVariable('class', 'navi_overview_titel');
		// fuer welche Seite erfolgt diese Aktion?
		$general->print_seiten_info();
		
		$tpl->setVariable('text_current_folder', $GLOBALS['TEXTE']['TEXT_AKT_VERZEICHNIS']);
		$tpl->setVariable('media_base', MEDIA_BASE);
		$tpl->setVariable('current_dir', $current_dir);

		// das naechsthoehere Verzeichnis bestimmen
		$dir_up = $this->bilder_verzeichnis($aktdir);
        $parentDirLink = $_SERVER['PHP_SELF'].'?action=images&dir='.$dir_up;
        if ($type != '') { $parentDirLink .= '&type='.$type; }
        if ($p_ref_id != '') { $parentDirLink .= $p_ref_id; } 
		$tpl->setVariable('parent_dir_link', $parentDirLink );
		
		// wenn $current_dir leer ist -> up-Button nicht anzeigen
		$current_dir == '' ? $hide = 'hide' : $hide = '';
		$tpl->setVariable('display_up_arrow', $hide);
		$tpl->setVariable('text_up', $GLOBALS['TEXTE']['TEXT_AUFWAERTS']);
		
		// up-Button verstecken, wenn p_ref_id gesetzt ist und das n�chsth�here Verzeichnis MEDIA_ROOT ist.
		if (isset($p_ref_id) && $dir_up == MEDIA_ROOT) {			
			$tpl->setVariable('display_up_arrow', 'hide');		
		}
		$tpl->parseCurrentBlock();

		// Dateien und Verzeichnisse auflisten
		if (count($files) > 0) 
		{ 
		  foreach($files as $index => $file) {
			$tpl->setCurrentBlock('list_block');

            // Type bestimmt, falls noetig
            $row_navi = $navi->read_navigation_by_bildpfad($file['datei']); 
            if ($row_navi['bildpfad'] != '') { $type = 'N'; }
            if ($type == '') { 
              $row_page = $pages->read_page_per_kennzeichen($file['datei']); 
              if ($row_page['kennzeichen'] != '') { $type = 'P'; }            
            }
            
			// Dateiname und Klasse
			$class = $index % 2 == 0 ? 'even' : 'odd'; 
			$tpl->setVariable('class', $class);
			$tpl->setVariable('filename', $file['datei']);			

			// Filetype: Datei
			if ($file['filetype'] == 'file') {
				$link_show = $_SERVER['PHP_SELF'].'?action=imageShow&dir='.$aktdir.'&filename='.$file['datei'];
				$tpl->setVariable('link_show', $link_show);
				$tpl->setVariable('link_show_target', '_self');
				$tpl->setVariable('filetype_icon', '../gifs/blank.gif');
				$tpl->setVariable('display_filetype_icon', 'hide');
				$tpl->setVariable('filelastmodified', $this->set_date_time($file['fmt']));
				// Alt-Texte f�r Icon Show und Delete 
				$tpl->setVariable('text_bild_show', $GLOBALS['TEXTE']['TEXT_BILD_SHOW']);
				$tpl->setVariable('text_bild_delete', $GLOBALS['TEXTE']['TEXT_BILD_DELETE']);
				
				// Sortkey aus der tabelle art_galerien 
				$tpl->setVariable('sortkey', $file['sortkey']);

				if ($file['extension'] != '.pdf') { $tpl->setVariable('filedimensions', $file['imgsize']); }
				$tpl->setVariable('filesize', $file['fsz'].' KB');
				$tpl->setVariable('link_delete', $_SERVER['PHP_SELF'].'?action=delete&dir='.$aktdir.'&filename='.$file['datei'].'&type='.$type. $p_ref_id);
				$tpl->setVariable('confirm_delete', $GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE_FILE']);
				// Bilder anzeigen, falls erw�nscht und der Dateityp nicht .pdf ist
				if ($zeige_bilder == 'yes' && $file['extension'] != '.pdf') {
					$tpl->setVariable('show_bild', '');
					$tpl->setVariable('pfad_und_bild', $aktdir .'/'. $file['datei']); 
					$dimensions = $this->berechne_breite_hoehe($file['imgsize']);
					$tpl->setVariable('breite', $dimensions[0]);
					$tpl->setVariable('hoehe', $dimensions[1]);
					$tpl->setVariable('show_filename', 'hide');					
				} else {
					$tpl->setVariable('show_bild', 'hide');
				}
			}
			// Filetype: Verzeichnis
			else if ($file['filetype'] == 'dir') {
				$tpl->setVariable('link', $_SERVER['PHP_SELF'].'?action=images&dir='.$aktdir.'/'.$file['datei'].'&type='.$type.$p_ref_id  );
				$tpl->setVariable('filetype_icon', '../gifs/folder_16.png');
				$tpl->setVariable('text_filetype', $GLOBALS['TEXTE']['TEXT_FILETYPE']);			
				$tpl->setVariable('show_bild', 'hide');
				$tpl->setVariable('display_show', 'hide');
				$tpl->setVariable('text_bild_delete', $GLOBALS['TEXTE']['TEXT_DIR_DELETE']);			
				$tpl->setVariable('link_delete', $_SERVER['PHP_SELF'].'?action=delete&dir='.$aktdir.'&filename='.$file['datei'].'&type='.$type.$p_ref_id);
				$tpl->setVariable('confirm_delete', $GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE_DIR']);	
				$tpl->setVariable('permissions', $file['fileperms']);			
				$tpl->setVariable('filegroup', $file['filegroup']) .'/';			
				$tpl->setVariable('fileowner', $file['fileowner']);			

			}
		    $tpl->parseCurrentBlock();
		  }
		}
		$tpl->show();
	}
	
	
	/* n�chst h�heres Verzeichnis festlegen */
	private function bilder_verzeichnis($dir){
		$verzeichnis = explode('/', $dir);
		for ($i=0; $i < count($verzeichnis)-1; $i++) {
			if ($i>0) { $dir_up .= '/'; }
			$dir_up .= $verzeichnis[$i];			
		}
		return $dir_up;		 
	}

	/* Formatieren von Datum und Zeit */
	private function set_date_time($mtime) {
		/* hier wird die Berechnung der Zeit korrigiert */
		if (date('I') == 1) {
			// Win DST is enabled, adjust standard time
			// files back to 'real' file UTC.
			if (date('I', $mtime) == 0) {
				$mtime -= 3600;
			}
		} else {
			// Win DST is disabled, adjust daylight time
			// files forward to 'real' file UTC.
			if (date('I', $mtime) == 1) {
				$mtime += 3600;
			}
		}
		return gmdate('d.m.Y H:i', $mtime);
	}
	
	/* Breite und H�he eines Bildes auf die max. anzuzeigenden Gr�ssen verkleinern  
	 * Das Bild wird dabei NICHT verkleinert, sondern nur in kleineren Massen angezeigt
 	 */
	private function berechne_breite_hoehe($imgsize) {
		$sizes = explode('x', $imgsize);		
		// $sizes[0] = Breite, $sizes[1] = H�he 
		// 1. Ratio berechnen anhand der Bildbreite berechnet
    	$ratio = ($sizes[0] > IMAGE_SHOW_MAX_WIDTH) ? (real)(IMAGE_SHOW_MAX_WIDTH  / $sizes[0]) : 1;
 		$sizes[0]  = ((int)($sizes[0] * $ratio));    //full-size widt
 		$sizes[1]  = ((int)($sizes[1] * $ratio));    //full-size height

		// 2. falls Breite oder H�he noch immer zu gross ist, wird jetzt die Ratio anhand der H�he berechnet
  		if ($sizes[0] > IMAGE_SHOW_MAX_WIDTH || $sizes[1] > IMAGE_SHOW_MAX_HEIGHT) {
			$ratio = ($sizes[1] > IMAGE_SHOW_MAX_HEIGHT) ? (real)(IMAGE_SHOW_MAX_HEIGHT  / $sizes[1]) : 1;
	 		$sizes[0]  = ((int)($sizes[0] * $ratio));    //full-size widt
  	 		$sizes[1]  = ((int)($sizes[1] * $ratio));    //full-size height
		}
		return $sizes;		 
	}

	/************************************************************************************************
	 * Dialog f�r das Pflegen der Bildkommentare
	 ************************************************************************************************/
	public function kommentare_anzeigen($filelist, $aktdir, $message, $zeige_bilder, $type, $ref_id) 
	{	
		global $tpl, $row, $cfg, $general, $language;
		$tpl->loadTemplatefile('browser.tpl.html', true, true);
		global $general;
		// horizontales Menu anzeigen
		$tmenu[0] = 'neutral'; $tmenu[1] = $GLOBALS['TEXTE']['TEXT_KOMMENTARE_ERFASSEN'];
		$this->show_menue($aktdir, $tmenu, 'yes', $zeige_bilder);
		// ev. Meldung ausgeben
		$this->print_message($message);

		// Hauptblock aktivieren
		$tpl->setCurrentBlock('main_block');
		// Platzhalter f�llen
		$tpl->setVariable('class', 'navi_overview_titel');

		// f�r welche Seite erfolgt diese Aktion?
		$general->print_seiten_info();
		// Verzeichnis 
		$tpl->setVariable('text_current_folder', $GLOBALS['TEXTE']['TEXT_AKT_VERZEICHNIS']);
		$tpl->setVariable('media_base', MEDIA_BASE);
		$current_dir = str_replace(MEDIA_ROOT, '', $aktdir);
		$tpl->setVariable('current_dir', $current_dir);
		$tpl->setVariable('display_up_arrow', 'hide');

		// Refresh-Button
		$html_refresh  = '<a href="'.$_SERVER['PHP_SELF'].'?action=refreshSortkey&dir='.$aktdir.'&type='.$type.'&ref_id='.$ref_id.'">';
		$html_refresh .= '<img src="../gifs/reload_16.png" with="16" height="16" border="0" alt="'.$GLOBALS['TEXTE']['INDEX_AKTUALISIEREN'].'" title="'.$GLOBALS['TEXTE']['INDEX_AKTUALISIEREN'].'" /></a>';
		$tpl->setVariable('refresh_link', $html_refresh);		
		$tpl->parseCurrentBlock();
		
		// $filelist ausgeben
		if (count($filelist) > 0) 
		{
			$index = 0; 	
			foreach ($filelist as $file) {
				$index++;
				$tpl->setCurrentBlock('list_edit_block');
				// Dateiname und Klasse 
				$class = $index % 2 == 0 ? 'even' : 'odd'; 
				$tpl->setVariable('class', $class);
				
				$tpl->setVariable('sortkey', $file['sortkey']);
				if ($zeige_bilder == 'yes') {
					// es kann sein, dass nur ein image aber kein thumbnail existiert, darum hier die Pr�fung, ob das Thumbnail existiert
					if (file_exists($file['thumbnail'])) {
						$tpl->setVariable('pfad_und_bild', $file['thumbnail']);
						$comment = '';
					} else {
						$tpl->setVariable('pfad_und_bild', $file['bild']);
						$comment = $GLOBALS['TEXTE']['NO_THUMBNAIL'];
					}
					$tpl->setVariable('show_filename', 'hide');				
				} else {
					$tpl->setVariable('show_bild_pfad', 'hide');				
				}
				$bild = array_pop(explode('/',$file['bild']));
				
				$tpl->setVariable('filename', $comment.' '.$bild);
                // Kommentare abhängig von den definierten Sprachen anzeigen
                if (!is_array($GLOBALS['sprachcodes'])) $cfg->sprachen_lesen();
                $sprachen = $GLOBALS['sprachcodes'];
                if (count($sprachen) == 0) $sprachen[0] = $language;	
                $tpl->setVariable('hide_show_de', 'hide');
                $tpl->setVariable('hide_show_en', 'hide');
                $tpl->setVariable('hide_show_fr', 'hide');
                $tpl->setVariable('hide_show_it', 'hide');
                foreach($sprachen as $key => $sprache) {
                  $tpl->setVariable('lang_'.$sprache, strtoupper($sprache).': ');
                  $tpl->setVariable('kid', $file['bildid']);
                  $tpl->setVariable('kommentar_'.$sprache, $general->reslash($file['kommentar_'.$sprache]));
                  $tpl->setVariable('hide_show_'.$sprache, 'display_inline');
                }
                
				// Link zum Reihenfolge aendern
				if ($index == 1) { $tpl->setVariable('display_up', hide); }
				$tpl->setVariable('link_up', $_SERVER['PHP_SELF'].'?action=bildup&ref_id='.$file['ref_id'].'&sortkey='.$file['sortkey'].'&type='.$type.'&dir='.$aktdir);		
				$tpl->setVariable('text_bild_up', $GLOBALS['TEXTE']['TEXT_REIHENFOLGE']);
				$tpl->parseCurrentBlock();		
			}
		}
		$tpl->show();		
	}

	/************************************************************************************************
	 * Ein Bild anzeigen
	 ************************************************************************************************/
	public function bild_anzeigen($bild) 
	{	
		global $tpl;
		$pipe = '| ';
		$tpl->loadTemplatefile('browser.tpl.html', true, true);
		// Horizontale Menuzeile
		$link_zurueck = 'javascript:history.go(-1);';
		$this->show_tabnav($link_zurueck, $GLOBALS['MENUE']['TEXT_ZURUECK']);
		// Block show_bild aktivieren
		$tpl->setCurrentBlock('show_bild');
        if (preg_match('/pdf/',$bild)) {
          $img = '<iframe frameborder="0" width="100%" height="500" src="'.$bild.'"></iframe>';
        } else {
          $img = '<img src="'.$bild.'" border="0" alt="'.$bild.'" title="'.$bild.'" />';
        }
		$tpl->setVariable('bild', $img);
		// Block parsen
		$tpl->parseCurrentBlock();
		// Anzeigen
		$tpl->show();		
	}
		
	/************************************************************************************************
	 * Dialog f�r das Anlegen eines neuen Verzeichnisses
	 ************************************************************************************************/
	public function verzeichnis_anlegen($dirs, $aktdir) 
	{	
		$selectbox_dirs = $this->create_dirs_selectbox($dirs, $aktdir);
		// Template laden
		global $tpl;
		$tpl->loadTemplatefile('browser.tpl.html', true, true);
				
		// Menue aktivieren
		$tmenu[] = 'neutral'; $tmenu[] = $GLOBALS['MENUE']['TEXT_CREATE_DIR'];
		$this->show_menue($aktdir, $tmenu);
		$this->print_message($message);
		
		// Block aktivieren
		$tpl->setCurrentBlock('create_directory');
		$tpl->setVariable('class', 'navi_overview_titel');
		$tpl->setVariable('text_verzeichnisse', $GLOBALS['TEXTE']['TEXT_VORHANDENE_DIRS']);		
		$tpl->setVariable('text_ziel_verzeichnis', $GLOBALS['TEXTE']['TEXT_ZIELVERZEICHNIS']);		
		$tpl->setVariable('text_neues_verzeichnis', $GLOBALS['TEXTE']['TEXT_NEUES_VERZEICHNIS']);		
		$tpl->setVariable('dirs_selectbox', $selectbox_dirs);
		$tpl->setVariable('class_even', 'even');
		$tpl->setVariable('class_odd', 'odd');
		$tpl->setVariable('create_dir_link', $_SERVER['PHP_SELF'].'?action=createDir');
		$tpl->parseCurrentBlock();

		// Alles anzeigen
		$tpl->show();
	}
	
	/* Eine Selektbox mit den eingelesenen Verzeichnisnamen erstellen */
	private function create_dirs_selectbox($dirs, $aktdir)
	{
		// wenn $aktdir den String _thumbs oder _images enth�lt, wird dieser abgeschnitten
		// dies, weil diese Verzeichnisse nicht als Upload-Verzeichnisse angeboten werden sollen
		if (basename($aktdir) == '_thumbs' || basename($aktdir) == '_images') {
			$aktdir = substr($aktdir, 0, strlen($aktdir) - strlen(basename($aktdir))-1);
		}
		// zusammensetzen des Javascript-Codes f�r das onchange Event
		$change = 'onchange="javascript:location.href=';
		$value  = '+this.options[selectedIndex].value;';
		$href   = $_SERVER['PHP_SELF'] . '?action=' . $_SESSION['action'] . '&dir=';
		
		$selectbox_start = '<select id="dirs" name="dirs" size="1" style="width:605px;" ';
		$onchange = $change . "'" . $href . "'" . $value . '">';
		$selectbox_start .= $onchange;
		$selectbox_ende  = '</select>';

		// options zusammensetzen. Wenn $aktdir vorkommt, wird dieses als selected markiert
		$option = '';
		if (count($dirs) > 0) {
			foreach($dirs as $index => $directory)
			{
				if ($directory == $aktdir) {
					$option .=  '<option selected ';
				} else {
					$option .= '<option ';						
				}
				$dir_anz = str_replace('../../','/', $directory);
				$option .= 'value="'.$directory.'">'.$dir_anz.'</option>' . "\n"; 
			}	
		} else {
				$option = '<option value="'.MEDIA_ROOT.'">/'.MEDIA_BASE.'</option>' . "\n"; 		
		}
		
		// Selectbox zusammensetzen
		$selectbox = $selectbox_start . $option . $selectbox_ende;
		return $selectbox;	
	}

	/************************************************************************************************
	 * Dialog f�r das Hochladen von Dateien
	 ************************************************************************************************/
	public function dateien_hochladen($dirs, $message, $aktdir, $thumbsize) 
	{	
		// Template laden
		global $tpl, $general, $row;
		$tpl->loadTemplatefile('browser.tpl.html', true, true);
				
		// Menue aktivieren
		$tmenu[] = 'neutral'; $tmenu[] = $GLOBALS['TEXTE']['TEXT_DATEIEN_LADEN'];
		$this->show_menue($aktdir, $tmenu);
		$this->print_message($message);
				
		// Block aktivieren
		$tpl->setCurrentBlock('upload_files');
		$tpl->setVariable('class', 'navi_overview_titel');
		$tpl->setVariable('class_even', 'even');
		$tpl->setVariable('class_odd', 'odd');

		if (isset($_SESSION['ref_id'])) { 
			$akt_verzeichnis = str_replace('../../', '', $aktdir);
			$tpl->setVariable('text_verzeichnisse', $GLOBALS['TEXTE']['TEXT_AKT_VERZEICHNIS'] . ': '. $akt_verzeichnis);		
			$tpl->setVariable('style_ziel_verzeichnis', 'display:none;');
			// fuer welche Seite erfolgt diese Aktion?
			$general->print_seiten_info();
		} else {
			$tpl->setVariable('text_verzeichnisse', $GLOBALS['TEXTE']['TEXT_AKT_VERZEICHNIS']);		
			$tpl->setVariable('text_ziel_verzeichnis', $GLOBALS['TEXTE']['TEXT_ZIELVERZEICHNIS']);		
		}
		
		// Selectbox f�r Thumbnailgr�ssen erstellen
		$tpl->setVariable('text_thumbnails_erstellen', $GLOBALS['TEXTE']['TEXT_THUMBNAILS_ERSTELLEN']);		
		$tpl->setVariable('selectbox_groessen', $this->selectbox_thumbnail_groessen($thumbsize)); 

		// Selectbox der verf�gbaren Verzeichnisse erstellen und ausgeben
		$selectbox_dirs = $this->create_dirs_selectbox($dirs, $aktdir);
		$tpl->setVariable('dirs_selectbox', $selectbox_dirs); 

		$tpl->parseCurrentBlock();

		// Alles anzeigen
		$tpl->show();
	}
	
	/* Selectbox fuer verschiedene Groessen der Thumbnails erstellen */
	private function selectbox_thumbnail_groessen($thumbsize) {
		global $cfg;
		// Die Selectbox fuer Bildergroessen werden neu abhaengig vom Thema ausgegeben.
		// Die Bildgroessen werden aus der Tabelle cms_spezial ausgelesen 
		$bildgroessen = $cfg->bildgroessen_lesen();
		
        // falls keine Bildgroessen in cms_spezial gepflegt wurden, werden die Masse aus cms_templates gelesen
        if (count($bildgroessen) == 0) {
          $bildgroessen = $cfg->bildgroessen_lesen_from_templates();
        }
        
		$selectbox_start = '<select id="thumbdimensions" name="thumbdim" size="1" style="width:100px;">';
		$selectbox_ende  = '</select>';

        // Wurden Bildmasse in cms_spezial gepflegt, übersteuern diese die Masse in cms_templates
        // Es kann in diesem Fall nicht mit Sicherheit eine Option als selected markiert werden
        // ausser eine Grösse ist identisch zur Grösse, welche im aktuelle Template gepflegt ist.
		if (count($bildgroessen) > 0) {  
			foreach ($bildgroessen as $index => $bild) {
				$value_page = $bild['wert1'].'x'.$bild['wert2'];
				$option .= $value_page == $thumbsize ? '<option selected ' : '<option ';				
				$option .= 'value="'.$value_page.'">'.$value_page.'</option>' . "\n"; 				
			}
		} else {
        // Es wurden keine Bildmasse in cms_spezial oder cms_template gepflegt 
        // --> dann werden die Bildmasse aus der cms_config angezeigt
			$option = '';
			// Thumbnails f�r Unterseiten sollen 98x98 px gross sein.
			$option .= $_SESSION['type'] == 'P' ?  '<option selected ' : '<option ';				
			$value_page = THUMB_PAGE_MAX_WIDTH.'x'.THUMB_PAGE_MAX_HEIGHT;
			$option .= 'value="'.$value_page.'">'.$value_page.'</option>' . "\n"; 
			
			// Thumbnails f�r Navigationsseiten sollen 300x300 px gross sein.
			$option .=  $_SESSION['type'] == 'N' ? '<option selected ' : '<option ';				
			$value_navi = THUMB_NAVI_MAX_WIDTH.'x'.THUMB_NAVI_MAX_HEIGHT;
			$option .= 'value="'.$value_navi.'">'.$value_navi.'</option>' . "\n"; 
		}
		// Selectbox zusammensetzen
		$selectbox = $selectbox_start . $option . $selectbox_ende;
		return $selectbox;				
	}
	
	
	/************************************************************************************************
	 * Von verschiedenen Funktionen, aufrufbare private Funktionen
	 ************************************************************************************************/
	 
	/* Eine Meldung ausgeben */
	private function print_message($message)
	{
		global $general;
		$general->print_message($message);
	}
	
	/* horizontale Menupositionen anzeigen */
	private function show_menue($aktdir, $tmenu, $show_link_zeige_bilder='no', $zeige_bilder='no') 
	{
		$pipe = ' | ';
		global $tpl;
		$tpl->setCurrentBlock('menue_block');		
		
		// Abh�ngig davon, ob diese Seite aus der Seitenverwaltung aufgerufen wurde, oder nicht,
		// werden unterschiedliche Menupositionen angeboten
		if ($_SESSION['ref_id'] == '') {			
			$p_ref_id = '';
			// Links bereitstellen
			$upload_files = $_SERVER['PHP_SELF'].'?action=uploadFiles&dir='.$aktdir.'&type='. $_SESSION['type'];
			$create_dir	  = $_SERVER['PHP_SELF'].'?action=createDir&dir='.$aktdir;
			$gogo_pics 	  = $_SERVER['PHP_SELF'].'?action=images&dir='.$aktdir.'&type='.$_SESSION['type'].$p_ref_id;
			// Links abh�ngig von der Action ausgeben
			switch (strtolower($GLOBALS['action'])) {
				case 'uploadfiles':
					$this->show_tabnav($create_dir,$GLOBALS['MENUE']['TEXT_CREATE_DIR']);
					$this->show_tabnav($gogo_pics,$GLOBALS['MENUE']['TEXT_GOTO_PICS']);
					break;
				case 'createdir':
					$this->show_tabnav($upload_files,$GLOBALS['MENUE']['TEXT_UPLOAD_PICS']);
					$this->show_tabnav($gogo_pics,$GLOBALS['MENUE']['TEXT_GOTO_PICS']);
					break;
				case 'images':
					$this->show_tabnav($create_dir,$GLOBALS['MENUE']['TEXT_CREATE_DIR']);
					$this->show_tabnav($upload_files,$GLOBALS['MENUE']['TEXT_UPLOAD_PICS']);
					break;
			}
		} else {
			$p_ref_id = '&ref_id='.$_GET['ref_id'];
		
			if (!preg_match('/_thumbs/',$aktdir) && !preg_match('/_images/',$aktdir)) {
				$aktdir = $aktdir.'/_images'; 
			}
			
			$editdir = $aktdir;
			if (preg_match('/_thumbs/', $editdir)) {
				$editdir = str_replace('_thumbs','_images',$editdir);
			}
		

			// links erstellen
			$link_images_edit 	= '../_controllers/pictures_co_maintain.php?action=imagesEdit&dir='.$editdir.'&type='. $_SESSION['type'] . $p_ref_id;
			$aktdir = str_replace('/_images/','_thumbs',$aktdir);
			$link_upload_files 	= $_SERVER['PHP_SELF'].'?action=uploadFiles&dir='.$aktdir.'&type='. $_SESSION['type'] . $p_ref_id;
			$link_goto_pics		= $_SERVER['PHP_SELF'].'?action=images&dir='.$aktdir.'&type='.$_SESSION['type'].$p_ref_id;
			
			switch (strtolower($GLOBALS['action'])) {
				case 'uploadfiles':
					$this->show_tabnav($link_images_edit, $GLOBALS['MENUE']['TEXT_EDIT_COMMENTS']);
					$this->show_tabnav($link_goto_pics, $GLOBALS['MENUE']['TEXT_GOTO_PICS']);
					break;
				case 'imagesedit':
					$this->show_tabnav($link_upload_files,$GLOBALS['MENUE']['TEXT_UPLOAD_PICS']);					
					$this->show_tabnav($link_goto_pics,$GLOBALS['MENUE']['TEXT_GOTO_PICS']);
					break;
				case 'images':
					$this->show_tabnav($link_upload_files,$GLOBALS['MENUE']['TEXT_UPLOAD_PICS']);					
					$this->show_tabnav($link_images_edit, $GLOBALS['MENUE']['TEXT_EDIT_COMMENTS']);					
					break;
			}
		
		}
				
		// falls der Link f�r die Bildervorschau angezeigt werden soll....
		if ($show_link_zeige_bilder == 'yes') {
			if ($zeige_bilder == 'yes') {
				$text = $GLOBALS['MENUE']['TEXT_HIDE_PICS'];
				$zeige_bilder = 'no';
			} else {
				$text = $GLOBALS['MENUE']['TEXT_SHOW_PICS'];
				$zeige_bilder = 'yes';
			}
			$link_bilder = $_SERVER['PHP_SELF'].'?action='.$_SESSION['action'].'&dir='.$aktdir.'&bilder='.$zeige_bilder .'&type='.$_SESSION['type'].$p_ref_id;
			$this->show_tabnav($link_bilder, $text);
		}
	
		// falls die Funktion Bilder hochladen aus der Seitenverwaltung oder Navigation aufgerufen wurde, wird ein Link 
		// angeboten, mit dem man aus der Bilderverwaltung direkt zur entsprechenden Seitenbearbeitung zur�ckspringen kann.
		if ($_SESSION['ref_id'] > 0 && $_SESSION['type'] != '') {
			switch ($_SESSION['type']){
				case 'N':
					$link = '../_controllers/navi_co_maintain.php';
					$this->show_tabnav($link,$GLOBALS['MENUE']['TEXT_ZURUECK']);
					break;
				default:
					$link = '../_controllers/pages_co_maintain.php';
					$this->show_tabnav($link,$GLOBALS['MENUE']['TEXT_ZURUECK']);
					break;
			}
		}
		// zum Schluss den Menutext andrucken, sofern einer mitgegeben wurde
		$tpl->setVariable('class_menu',  $tmenu[0]);
		$tpl->setVariable('menu_text',  $tmenu[1]);		
		$tpl->parseCurrentBlock();
	}
	
	private function show_tabnav($href,$text) {
		global $tpl;
		$link = '<a href="'.$href.'">&nbsp;'.$text.'&nbsp;</a>';
		$tpl->setCurrentBlock('tabnav');		
		$tpl->setVariable('link', $link);
		$tpl->parseCurrentBlock();			
	}
	
	public function xx()
	{
	
	}
} 


?>