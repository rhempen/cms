<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse f�r die Pr�sentation der Navigation am Bildschirm 
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2007-07-14
 */
 
class configPresent
{
	private $mTpl;

    function __construct($tpl) 
    {
		$this->mTpl	= $tpl; 
    }                                                                          

    /* Neue Methode implementieren */	
	/* config_anzeigen */
	public function show_messages($categories, $cat, $message)
	{
		global $general;
		global $tpl;
		$tpl->loadTemplatefile('config_overview.tpl.html', true, true);
		$tpl->setVariable('titel', $GLOBALS['TEXTE']['CONFIGURATION']);
		$tpl->setVariable('formurl', $_SERVER['PHP_SELF']);
		
		// Menuposition f�r neuen Hauptnavigationspunkt
		$this->show_menu($categories, $cat, '');
		
		// Meldungen ausgeben
		$general->print_message($message);

		// Block parsen und anzeigen
		$tpl->parseCurrentBlock();
		$tpl->show();
	}
	
	/* config_anzeigen */
	public function config_anzeigen($config, $categories, $cat, $message, $spezial, $spez)
	{
		global $general;
		global $tpl;
		$tpl->loadTemplatefile('config_overview.tpl.html', true, true);
		$tpl->setVariable('titel', $GLOBALS['TEXTE']['CONFIGURATION']);
		$tpl->setVariable('formurl', $_SERVER['PHP_SELF']);
		
		// Menuposition f�r neuen Hauptnavigationspunkt
		$this->show_menu($categories, $cat, $spez);
		
		// Meldungen ausgeben
		$general->print_message($message);

		// Inhalt von cms_spezial anzeigen
		if ($cat == $spez) {
			$this->present_spezial($spezial);
		} else {
			$this->present_config($config);
		}
		
	// Die Methode show() beendet die Template-Verarbeitung und startet die Auslieferung der 
	// erzeugten Seite an den Browser. Bis zu diesem Zeitpunkt befindet sich die produzierte 
	// HTML-Seite im Cache-Speicher des Servers 
		$tpl->show();
	}

	/* Anzeigen des Menus */
	private function show_menu($categories, $cat, $spez) {
		global $tpl;
		$tpl->setCurrentBlock('tabnav');
		
		// Kategorien aus cms_config
		while ($row = $categories->fetchRow(MDB2_FETCHMODE_ASSOC)) 
		{
			$action = 'lesen';
			$text   = $row['category'];
			$class  = 'passivnav';
			if ($text == $cat) { $class='aktivnav'; }
			$link = '<a class="'.$class.'" href="'.$_SERVER['PHP_SELF'].'?cat='.$text.'">&nbsp;'.$text.'&nbsp;</a>';
			$tpl->setVariable('link',$link);
			$tpl->parseCurrentBlock();		
		}
		
		// Zusatz-Kategorie aus cms_spezial gem. selektiertem Thema
		if ($spez != '') {
			$text   = $spez;
			$class  = 'passivnav';
			if ($text == $cat) { $class='aktivnav'; }
			$link = '<a class="'.$class.'" href="'.$_SERVER['PHP_SELF'].'?cat='.$text.'">&nbsp;'.$text.'&nbsp;</a>';
			$tpl->setVariable('link',$link);
			$tpl->setVariable('id', ' id="spezi"');			
			$tpl->parseCurrentBlock();		
		}
	}
	
	/* Anzeigen des cms_spezial */
	private function present_spezial($spezial) {
		global $tpl;
		// Titelzeile
		$tpl->setCurrentBlock('titel_spez');
		$tpl->setVariable('class', 'navi_overview_titel');
		$tpl->setVariable('label_name', $GLOBALS['TEXTE']['CONFIG_PARAM']);
		$tpl->setVariable('label_wert1', $GLOBALS['TEXTE']['CONFIG_VALUE'].' 1');
		$tpl->setVariable('label_wert2', $GLOBALS['TEXTE']['CONFIG_VALUE'].' 2');
		$tpl->setVariable('label_wert3', $GLOBALS['TEXTE']['CONFIG_VALUE'].' 3');
		$tpl->setVariable('label_aktiv', $GLOBALS['TEXTE']['TEXT_AKTIV']);
		$tpl->parseCurrentBlock();
		
		// Datenzeilen 
		$tpl->setCurrentBlock('zeile_spez');
		while ($row = $spezial->fetchRow(MDB2_FETCHMODE_ASSOC)) 
		{
			$i++;
			// CSS-Klasse festlegen
			$class = $class == 'odd' ? 'even' : 'odd'; 
			$tpl->setVariable('class', $class);
			// Style Background-color, falls in einem Feld ein HEX-Farbwert in der Form #FFF... steht.
			$background = ' style="background-color:%s;"';
			if (preg_match('/#/', $row['wert1'])) $tpl->setVariable('style1', sprintf($background,$row['wert1']));
			if (preg_match('/#/', $row['wert2'])) $tpl->setVariable('style2', sprintf($background,$row['wert2']));
			if (preg_match('/#/', $row['wert3'])) $tpl->setVariable('style3', sprintf($background,$row['wert3']));

			$tpl->setVariable('name', $row['name']);			
			$tpl->setVariable('wert1', $row['wert1']);
			$tpl->setVariable('wert2', $row['wert2']);
			$tpl->setVariable('wert3', $row['wert3']);
            
            // Aktiv-Inaktiv-Button erstellen und anzeigen
            $button_freed = $this->create_button("freed");
            $button_blocked = $this->create_button("blocked");
            $aktiv = $row['aktiv'] == "j" ? $button_freed : $button_blocked; 
            $tpl->setVariable('aktiv', $aktiv);
            
			$tpl->setVariable('classedit', 'spezial');
			$tpl->setVariable('configid1', $row['name'].'_1');
			$tpl->setVariable('configid2', $row['name'].'_2');
			$tpl->setVariable('configid3', $row['name'].'_3');
			$tpl->setVariable('configid4', $row['name'].'_4');
			// die Zeile parsen
			$tpl->parseCurrentBlock();
		}		
	}

	/**
	 * Das Code-Snippet für einen Button zusammenstellen
	 * @param:	$type = Type des Buttons: Submit, Button, Reset
	 * @param:  $row  = der Datensatz der Seite, um den Link zusammenzustellen
     * @return: $button = das HTML-Snippet
	*/
	private function create_button($class,$row=NULL)      
	{
      global $language;
      $script = $title = $confrm = '';
      $click  = ' onclick="%s"';
      $type   = 'button';
      $button = '<button type="%s" class="%s" title="%s" %s></button>';
      switch($class) {
        case 'freed':
          $title = $GLOBALS['TEXTE']['TEXT_AKTIV'];
          break;
        case 'blocked':
          $title = $GLOBALS['TEXTE']['TEXT_INAKTIV'];
          break;
      }
      $button = sprintf($button,$type,$class,$title,$script);
      return $button;
    }
	
	/* Anzeigen des cms_spezial */
	private function present_config($config) {
		global $tpl;
		// Titelzeile
		$tpl->setCurrentBlock('titel');
		$tpl->setVariable('class', 'navi_overview_titel');
		$tpl->setVariable('label_descr', $GLOBALS['TEXTE']['CONFIG_DESCR']);
		$tpl->setVariable('label_param', $GLOBALS['TEXTE']['CONFIG_PARAM']);
		$tpl->setVariable('label_value', $GLOBALS['TEXTE']['CONFIG_VALUE']);
		$tpl->parseCurrentBlock();
		
		// Datenzeilen 
		$tpl->setCurrentBlock('zeile');
		while ($row = $config->fetchRow(MDB2_FETCHMODE_ASSOC)) 
		{
			$i++;
			// CSS-Klasse festlegen
			$class = $class == 'odd' ? 'even' : 'odd'; 
			$tpl->setVariable('class', $class);
			//var_dump($row['param']);
			// Variablen des Templates mit Werten belegen
			switch ($row['param']) {
				// Selectbox mit verf�gbaren Werten erstellen
				case 'THEME':
					$themesdir = $this->read_themes();
					$themes = $this->create_selectbox($themesdir, $row);
					$tpl->setVariable('value', $themes);
					$tpl->setVariable('classedit', 'selbox');
					break;	
				case 'TEMPLATE_DIR':
					//$themesdir = $this->read_themes();
					$themes = $this->create_selectbox_tpldir($themesdir, $row);
					$tpl->setVariable('value', $themes);
					$tpl->setVariable('classedit', 'selbox');
					break;	
				case 'HMENU_RICHTUNG':
					$this->show_radiobuttons($row);
					break;
				case 'HMENU_SUBMENU':
					$this->show_radiobuttons($row);
					break;
				case 'SUBMENU_DIR':
					$this->show_radiobuttons($row);
					break;
				case 'SUBNAV_SOFORT':
					$this->show_radiobuttons($row);
					break;
				case 'SMURL':
					$this->show_radiobuttons($row);
					break;
				case 'SMURL_REFRESH':
					$this->show_pushbutton($row);
					break;
				case 'DISK_DB_ADJUSTMENT':
					$this->show_pushbutton($row);
					break;
				case 'MEDIA_ROOT_ADJUSTMENT':
					$this->show_pushbutton($row);
					break;
				case 'LANGUAGE':
					$languages = $this->read_languages();
					$langs = $this->create_selectbox($languages, $row);
					$tpl->setVariable('value', $langs);
					$tpl->setVariable('classedit', 'selbox2');
					break;	
				case 'DESCRIPTION':
					$tpl->setVariable('value', $row['longvalue']);
					$tpl->setVariable('classedit', 'ltxt');
					break;	
				case 'KEYWORDS':
					$tpl->setVariable('value', $row['longvalue']);
					$tpl->setVariable('classedit', 'ltxt');
					break;	
				case 'PAGE_TOPIC':
					$tpl->setVariable('value', $row['longvalue']);
					$tpl->setVariable('classedit', 'ltxt');
					break;	
				case 'PUBLISHER':
					$tpl->setVariable('value', $row['longvalue']);
					$tpl->setVariable('classedit', 'ltxt');
					break;	
				case 'GOOGLE_VERIFY':
					$tpl->setVariable('value', $row['longvalue']);
					$tpl->setVariable('classedit', 'ltxt');
					break;	
				default:
					$tpl->setVariable('value', $row['value']);
					// die ID f�r das Editieren Wertes setzen
					$tpl->setVariable('classedit', 'wert');
					break;
			}
		
			$tpl->setVariable('descr', $GLOBALS['TEXTE'][$row['param']]);			
			$tpl->setVariable('param', $row['param']);
			$tpl->setVariable('configid', $row['id']);

			// die Zeile parsen
			$tpl->parseCurrentBlock();
		}
		
	}
	
	/* Das Themes-Verzeichnis auslesen */
	private function read_themes() {
		$themesdir = THEMESDIR;
		$handle  = opendir($themesdir);
		while (false !== ($file = readdir($handle)))
		{
			if ($file == '.' || $file == '..') { continue; }
			// Pfad und Datei
			$srcfile = $themesdir.$file;
			if (is_dir($srcfile)) {
				$td[] = $file;
			}
		}
		asort($td);
		return $td;		
	}
	
	/* Das Languages-Verzeichnis auslesen */
	private function read_languages() {
		$langdir = LANGUDIR;
		$handle  = opendir($langdir);
		while (false !== ($file = readdir($handle)))
		{
			if ($file == '.' || $file == '..') { continue; }
			// Pfad und Datei
			$srcfile = $langdir.$file;
			if (is_file($srcfile)) {
				// nur den Sprachcode aus dem Filenamen herausnehmen --> DE.php -> DE
				$lg[] = substr($file,0,2);
			}
		}
		return $lg;		
	}	
	
	/* Selectbox erstellen, wobei der von der Seite eingelesene Wert vorselektiert sein soll.*/
	private function create_selectbox($werte, $row)
	{
		$param = $row['param'];
		if ($param == 'THEME') {
			$script = "update_selbox_themes(this.id, this.value);";			
		} else {
			$script = "update_selbox(this.id, this.value);";			
		}
		$selectbox_start = '<select id="sb'.$row['id'].'" name="'.$row['value'].'" size="1" class="selbox" onchange="'.$script.'">' . "\n";
		$selectbox_ende  = '</select>';
		$option = '';
		foreach ($werte as $wert => $value) 
		{
			$value == $row['value'] ? $option .= '<option selected ' : $option .= '<option ';
			$option .= 'value="'.$value.'">'.$value.'</option>' . "\n"; 
		}	
		$selectbox = $selectbox_start . $option . $selectbox_ende;
		return $selectbox;	
	}


	/* Selectbox mit den TPL-dirs erstellen, wobei der von der Seite eingelesene Wert vorselektiert sein soll.*/
	private function create_selectbox_tpldir($werte, $row)
	{
		$selectbox_start = '<select id="sb'.$row['id'].'" name="'.$row['value'].'" size="1" class="selbox" onchange="update_selbox(this.id, this.value);">' . "\n";
		$selectbox_ende  = '</select>';
		$option = '';
		// 1. Eintrag ist das tpl-Verzeichnis direkt unterhalb frontend
		$tplval = FRONTEND . 'tpl';
		if (is_dir($tplval)) {
			$tplval = TEMPLATES . 'tpl';
			$tplval == $row['value'] ? $option .= '<option selected ' : $option .= '<option ';
			$option .= 'value="'.$tplval.'">'.$tplval.'</option>' . "\n"; 			
		}
		// jetzt Loop �ber die vorhandenen Themes
		foreach ($werte as $wert => $value) 
		{
			$tpldir = THEMESDIR . $value . '/tpl';
			if (is_dir($tpldir)) {
				$tplval = THEMES_DIR . $value . '/tpl';
				$tplval == $row['value'] ? $option .= '<option selected ' : $option .= '<option ';
				$option .= 'value="'.$tplval.'">'.$tplval.'</option>' . "\n"; 
			}
		}	
		$selectbox = $selectbox_start . $option . $selectbox_ende;
		return $selectbox;	
	}

	
	// Radiobuttons erstellen, wobei der von der Seite eingelesene Wert vorselektiert sein soll.
	private function create_radiobuttons($row)
	{
		// Value und Alternative-Value in einen Array �bertragen
		$werte[] = $row['value'];
		$werte[] = $row['alternative'];
		// Je Array-Eintrag einen Radiobutton erstellen
		foreach ($werte as $wert => $value) 
		{
			// der aktuelle Wert soll aktiv sein
			$checked = $value == $row['value'] ? 'checked="checked" ' : '';
			// ID des Input-Tags wird zusammengesetzt aus rb + index(Array) + RowID --> damit wird die ID einmalig
			// Es wird sowohl der aktuell angeklickte Wert, als auch der Alternativwert an die AJAX-Funktion �bergeben
			// Die Werte m�ssen beim Speichern auf der DB entsprechend vertauscht abgespeichert werden.
			$alternative = $value == $row['value'] ?  "'".$row['alternative']."'" : "'".$row['value']."'";
			$js = 'update_radiobutton(this.id, this.value, ' .$alternative. ');';
			$radiobutton = '<span id="rb'.$wert.$row['id'].'"><input type="radio" id="rb'.$wert.$row['id'].'" name="rb'.$row['id'].'" value="'.$value.'" '.$checked.' onclick="'.$js.'" />'.$value.'&nbsp;'."</span>\n";			
			$radiobuttons .= $radiobutton;
		}	
		return $radiobuttons;	
	}
	
	/* Funktion zum Anzeigen der Radiobuttons */
	private function show_radiobuttons($row) 
	{
		global $tpl;
		if ($row['value'] != null && $row['alternative'] != null) {
			$radiobuttons = $this->create_radiobuttons($row);
			$tpl->setVariable('value', $radiobuttons);
			$tpl->setVariable('classedit', 'dummy');
		} else {
			$tpl->setVariable('value', $row['value']);
			// die ID f�r das Editieren Wertes setzen
			$tpl->setVariable('classedit', 'wert');
		}
	}
	
	
	/* Funktion zum Anzeigen eines Pushbuttons */
	public function show_pushbutton($row) 
	{
		global $tpl;
		if ($row['value'] != null) {
			$pushbutton = $this->create_pushbutton($row);
			$tpl->setVariable('value', $pushbutton);
			$tpl->setVariable('classedit', 'dummy');
		} else {
			$tpl->setVariable('value', $row['value']);
			// die ID f�r das Editieren Wertes setzen
			$tpl->setVariable('classedit', 'wert');
		}
	}

	/* Funktion zum Anzeigen eines Pushbuttons */
	private function create_pushbutton($row) 
	{
		switch ($row['param']) {
			case 'SMURL_REFRESH':
				$action_script = '../_controllers/config_co_maintain.php?action=smurl_refresh';
				break;
			case 'DISK_DB_ADJUSTMENT':
				$action_script = '../_controllers/config_co_maintain.php?action=disk_db_adjustment';
				break;
			case 'MEDIA_ROOT_ADJUSTMENT':
				$action_script = '../_controllers/config_co_maintain.php?action=media_root_adjustment';
				break;
		}
		
		$html = '<form name="refresh" action="'.$action_script.'" method="post">'."\n";
		$html .= '<input type="submit" value="'.$row['value'].'" />'."\n";
		$html .= '</form>'."\n";	
		return $html;
	}

}


?>
