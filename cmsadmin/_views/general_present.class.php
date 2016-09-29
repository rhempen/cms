<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse fuer den Aufruf allgemein verfuegbarer Methoden
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2007-08-19
 */

class generalPresent
{
	private $mTpl;

    function __construct($tpl) 
    {
		$this->mTpl	= $tpl; 
    }                                                                          

	/**
	 *  Meldung am Bildschirm ausgeben 
	 *  @param: Meldungstext, bzw. Array mit Meldungen
	 */
	public function print_message($message)
	{
		global $tpl;
		$tpl->setCurrentBlock('message_block');
		$html = '';
		// $message kommt als indexiertes Array daher, wobei alle geraden indices den 
		// Wert der Klasse (error/success) darstellen, alle ungeraden Werte den Meldungstext 
		if (count($message) > 0) {
			foreach ($message as $index => $value) {
				if ($index % 2 == 0) {
					$html .= '<span class="'.$value.'">';
				} else {
					$html .= $value.'</span><br />'."\n";
				}
			}
			$tpl->setVariable('meldung', $html);
		} else {
			$tpl->setVariable('class_meldung', 'hide');
		}
		$tpl->parseCurrentBlock();
	}

	/**
	 *  Andrucken der Seiteninformationen zu einer nav_id bzw. ref_id 
	 *  @param: $GLOBALS['page']
	 */
	public function print_seiten_info() {
		global $row, $tpl;
		$tpl->setVariable('text_seite', '|-> '. $GLOBALS['TEXTE']['TEXT_SEITE']);
		if ($row['kurztitel'] != '') { // Seite der Navigation
			$tpl->setVariable('seiten_info', $row['kurztitel']);
		} elseif ($row['name'] != '') { // Unterseite
			$tpl->setVariable('seiten_info', $row['name']);					
		}
	}
	
	/**
	 * den Browsetyp feststellen fuer eine Browserweiche
	 * @return: $browser - entweder liefert die Funktion msie oder nichts
	 */
	public function detect_user_agent() {
		$useragent = strtolower( $_SERVER['HTTP_USER_AGENT']);
		$browser = stristr($useragent, "msie") ? 'msie' : '';
		return $browser;
	}

    /* Sorticon zusammenstellen 
      @return: $sorticon  - html fuer das anzuzeigende Menu
    */
    public function compose_sorticon() 
    {
      $html = '<img src="../gifs/move.png" height="20" width="20" border="0" alt="'.$GLOBALS['TEXTE']['TEXT_MOVE'].'" title="'.$GLOBALS['TEXTE']['TEXT_MOVE'].'" />';
//      $html .= '<img src="../gifs/down.gif" height="15" width="12" border="0" alt="'.$GLOBALS['TEXTE']['TEXT_MOVE'].'" title="'.$GLOBALS['TEXTE']['TEXT_MOVE'].'" />';
      return $html;
    }

	
	/**
	 * mit den Templates eine Selectbox erstellen, wobei die von der Seite eingelesene Nummer vorselektiert sein soll.
	 * @param: $templates - Alle Templates  
	 * @param: $tplnr - vorselektierte Templatenummer
	 * @return: $selectbox - HTML-Code fuer eine Selectbox inkl. Werten
	 */
	public function create_tpl_selectbox($templates, $tplnr)
	{
		$selectbox_start = '<select id="template" name="templates" size="1" style="width:605px;" onchange="">' . "\n";
		$selectbox_ende  = '</select>';
		$option = '';
		while ($row = $templates->fetchRow(MDB2_FETCHMODE_ASSOC)) 
		{
			$row['template_id'] == $tplnr ? $option .= '<option selected ' : $option .= '<option ';
			$option .= 'value="'.$row['template_id'].'">'.$row['template_descr'].'</option>' . "\n"; 
		}	
		$selectbox = $selectbox_start . $option . $selectbox_ende;
		return $selectbox;	
	}


	/**
	 * mit den Modules eine Selectbox erstellen, wobei die von der Seite eingelesene Modulnummer vorselektiert sein soll.
	 * @param: $modules - Alle Modules  
	 * @param: $modulnummer - vorselektierte Modulnummer
	 * @return: $selectbox - HTML-Code fuer eine Selectbox inkl. Werten
	 */
	public function create_mod_selectbox($modules, $modulnummer)
	{
		$selectbox_start = '<select id="module" name="modules" size="1" style="width:605px;" onchange="">' . "\n";
		$selectbox_ende  = '</select>';

		if (count($modules) > 0) {
			// 1. Eintrag -> Auswahltext
			$option = '<option value="0">'.$GLOBALS['TEXTE']['TEXT_MODUL_SELECT'].'</option>' . "\n"; 
			while ($row = $modules->fetchRow(MDB2_FETCHMODE_ASSOC)) 
			{
				$row['module_id'] == $modulnummer ? $option .= '<option selected ' : $option .= '<option ';
				$option .= 'value="'.$row['module_id'].'">'.$row['module_descr'].'</option>' . "\n"; 
			}	
		} else {
			$option .= '<option selected value="">'.$GLOBALS['TEXTE']['TEXT_SELECTBOX_LEER'].'</option>'."\n";
		}
		$selectbox = $selectbox_start . $option . $selectbox_ende;
		return $selectbox;	
	}

		
	/**
	 * mit den Navigationseintraegen eine Selectbox erstellen, wobei die von der Seite eingelesene Nummer vorselektiert sein soll.
	 * @param: $unavi - Unternavigationspunkte
	 * @param: $navid - vorselektierte Navigations-Id
	 * @return: $selectbox - HTML-Code fuer eine Selectbox inkl. Werten
	 */
	public function create_navi_selectbox($unavi, $navid)
	{
		$selectbox_start = '<select id="navigation" name="navid" size="1" style="width:605px;" onchange="">' . "\n";
		$selectbox_ende  = '</select>';
		$unavis = '';
		
		if (isset($unavi)) {

			while ($row = $unavi->fetchRow(MDB2_FETCHMODE_ASSOC)) 
			{
				$nav_array[] = $row;
				if ($row['ukap'] > 0) { $unavis = 'X'; }
			}
			
			
			$option = ''; 
			foreach ($nav_array as $key => $row) {
				$eintrag = '';
				
				if ($row['ukap'] == 0) { $kap = $row['bezeichnung']; }
				if ($row['ukap'] != 0) { $eintrag =  ' - '. $row['bezeichnung']; }
				// wenn der Navigationspunkt inaktiv ist, soll er in der Selectbox in roter Schrift erscheinen
				$style = $row['aktiv'] != 'j' ? 'style="color:red;"' : '';
				// Wenn Ukaps vorhanden sind --> count > 1, darf der Eintrag mit ukap = 0 nicht in die Selectbox aufgenommen werden 
				if ($unavis == 'X'){
					$row['nav_id'] == $navid ? $option .= '<option selected ' : $option .= '<option ';
 					$option .= 'value="'.$row['nav_id'].'" '.$style.'>'.$kap.$eintrag.'</option>' . "\n"; 
				} elseif ($unavis == '') {					
					$row['nav_id'] == $navid ? $option .= '<option selected ' : $option .= '<option ';
 					$option .= 'value="'.$row['nav_id'].'" '.$style.'>'.$kap.'</option>' . "\n"; 
				}
			}	
			
		} else {
			$option .= '<option selected value="">'.$GLOBALS['TEXTE']['TEXT_SELECTBOX_LEER'].'</option>'."\n";
		}
		$selectbox = $selectbox_start . $option . $selectbox_ende;
		return $selectbox;	
	}

	/**
	 * Eine Selectbox fuer die Aktivierungsart der Galerie zur Verfuegung stellen
	 * @param: $table
	 * @param: $field
	 * @param: $code
	 * @return: $selectbox - HTML-Code fuer eine Selectbox inkl. Werten
	 */
	public function create_aktiv_selectbox($table, $field, $code)
	{
		global $genmain;
		// erst mal die Festwerte aus dem feld galerie vom Type enum lesen
		$enum = $genmain->read_enum($table, $field);
		
		$selectbox_start = '<select id="galerie_aktiv" name="galerie_aktiv" size="1" style="width:auto;" onchange="">' . "\n";
	
		foreach($enum as $index => $value) 
		{
			$option .= $code == $value ? '<option selected ' : '<option ';
			
			switch($value) {
				case 'n':
					$option .= 'value="'.$value.'">'.$GLOBALS['LINKS']['GALERIE_INAKTIV'].'</option>' . "\n"; 
					break;
				case 'a':			
					$option .= 'value="'.$value.'">'.$GLOBALS['LINKS']['GALERIE_AKTIV'].'</option>' . "\n"; 
					break;
				case 'b':
					$option .= 'value="'.$value.'">'.$GLOBALS['LINKS']['BILDLEISTE'].'</option>' . "\n"; 
					break;
				case 'c':
					$option .= 'value="'.$value.'">'.$GLOBALS['LINKS']['AUTOBILDWECHSEL'].'</option>' . "\n"; 
					break;
			}
		}
		
		$selectbox_ende  = '</select>';
		$selectbox = $selectbox_start . $option . $selectbox_ende;
		return $selectbox;	
	}
	
	
	
	/**
	 *  MySQL (ISO)-Format ins deutsches Format umwandeln zB 2007-12-31 ==> 31.12.2007 
	 *  @param: $datum 
	 */
	public function date_mysql2german($datum) 
	{
	    if(preg_match("[-]", $datum))
	        list($jahr, $monat, $tag) = explode('-', $datum);
	    else 
	    {
	        $jahr  = substr($datum, 0, 4);
	        $monat = substr($datum, 4, 2);
	        $tag   = substr($datum, 6, 2);
	    }
	    
	    return sprintf("%02d.%02d.%04d", $tag, $monat, $jahr);
	}
	
	
	/**
	 *  slashes hinzufuegen wenn magic quotes = OFF 
	 *  @param: $strng - Zeichenkette  
	*/ 
	public function reslash($strng)
	{
	    if($strng != '')
	    {
	        if (!get_magic_quotes_gpc()) 
	        {
	        	// Anfuehrungs- und Schlusszeichen ersetzen durch 
	        	$strng = str_replace('"', '&quot;', $strng);
	        	$strng = addslashes($strng);
	        }
	    }
	    return $strng;
	}
		
	/**
	 *  Titel fuer Navigationstyp im CMS
	 *  @param: $navtype - 'H', 'V' oder 'S' (Horizontal, Vertikal oder Service-Navigation)
	 *  @return: $navtitle - Titeltext
	*/
	public function set_navtype_title($navtype)
	{
		switch($navtype) {
			case $GLOBALS['NAVI']['SERVICE']:
				$navtitle = $GLOBALS['TEXTE']['SERVICENAVIGATION'];
				break;
			case $GLOBALS['NAVI']['VERTIKAL']:
				$navtitle = $GLOBALS['TEXTE']['VERTI_HAUPTNAVIGATION'];
				break;
			default:
				$navtitle = $GLOBALS['TEXTE']['HORIZ_HAUPTNAVIGATION'];
		}
		return $navtitle;	
	}
	
	/**
	 *  Farbe fuer Navigationstyp im CMS
	 *  @param: $navtype - 'H', 'V' oder 'S'
	 *  @return: $navcolor - green, red or purple
	*/
	public function set_navtype_color($navtype)
	{
		switch($navtype) {
			case $GLOBALS['NAVI']['SERVICE']:
				$navcolor = 'red';
				break;
			case $GLOBALS['NAVI']['VERTIKAL']:
				$navcolor = 'purple';
				break;
			default:
				$navcolor = 'green';
		}
		return $navcolor;
	
	}
		
	/**
	 * Anzeige eines ev. im Template vorhandenen Feldes mit Namen inhalt2
	 * @param: $tmpl - Template, welches einer Seite zugeordnet ist
	 * @return: true oder false 
	 */
	public function show_inhalt2($tplnr) 
	{
		global $frontget, $tpl;
		if ($template['template_name'] != '' && !$this->analyse_template('',$tplnr,'/{inhalt2}/')) {
			$tpl->setVariable('hide_inhalt2',HIDDEN);
			$tpl->setVariable('evenodd2',$this->flipflop($i++));
			$tpl->setVariable('evenodd1',$this->flipflop($i++));
			return false;		
		} else { 	
			$tpl->setVariable('evenodd1',$this->flipflop($i++));
			$tpl->setVariable('evenodd2',$this->flipflop($i++));			
			return true;		
		}
	}
	
	/**
	 * Funktion zum Analysieren eines Templates --> finde den String $pattern
	 * @params: $intpl - zu analysierendes Template. Falls Keines übergeben wird, 
     *                  muss $template eine Ziffer grösser 0 enthalten, damit es
     *                  auf der DB gelesen wird.
     * @params: $template - Nummer des Templates - Zum Nachlesen auf der DB  
	 * @params: $pattern - der zu findende String
	 * @return: gibt true oder false zurueck
	 */
	public function analyse_template($tplname='',$tplnr=0,$pattern='') 
	{
      global $frontget;
      // Templatename- oder Nummer muss übergeben werden
      if ($tplname == '' && $tplnr > 0) {
        $template = $frontget->read_single_template($tplnr); 
        $tplname = $template['template_name']; 
      }
      // Template mit absolutem Pfad ergänzen
      $intpl = $tplname !='' ? DOCUROOT.'/'.TEMPLATE_DIR.'/'.$tplname : '';  
      $intpl = str_replace('//','/',$intpl);
      // Pattern, nach dem gesucht werden soll
      if ($pattern == '') { $pattern = '/{inhalt2}/'; }
      // ab PHP5.0 koennen folgende optionale Parameter mitgegeben werden
      if ($intpl != '') {
        $lines = file($intpl, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach($lines as $line_num => $line ) {			
            if (preg_match($pattern, $line)) { return true; } 
        } 
      }
      return false;		
	}

	/**
	 * Zeilen abwechselnd mit CSS-Klasse col_even oder col_odd versorgen
	 * @param: $index index
	 * @return: $class CSS-Klasse
	 */
	private function flipflop($index) {
		$class = $index % 2 == 0 ? 'col_even' : 'col_odd';
		return $class;
	}
	
	
	/**
	 *	Funktionsbeschreibung DocBlock --> wichtig f�r phpDocumenter
	 *  @param:
	 *  @return:
	 */
	public function xx($text)
	{
	
	}
} 


?>
