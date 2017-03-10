<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse f�r die Verwaltung der Navigation und zugeh�riger Seiten
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2007-07-14
 */

class configMaintain
{
	private $mMeldung;

    /* MyRequire-Klasse mit Zugangsdaten aufrufen */
    function __construct($db) 
    {
		$this->mPrefix = TABLE_PREFIX;
		$this->mDb = $db;
		$this->mMeldung = array();
    }                                                                          

    /* Neue Methode implementieren */	
	// Alle Konfigurationsitems lesen und als globale Variablen definieren, 
	// welche im config.php bzw. config_frontend.php verwendet werden
    public function config_laden() 
    { 
		global $db;
		$query = 'SELECT * FROM '.$this->mPrefix.'config';
		$config = $db->query($query);
		while ($row = $config->fetchRow(MDB2_FETCHMODE_ASSOC)) 
		{
			// ist ein Langtext gepflegt, wird dieser uebernommen
			$value = $row['longvalue'] != '' ? $row['longvalue'] : $row['value'];
			// ist $value leer oder 'val' und der Alternativtext nicht leer, wird der Alternativtext eingesetzt
			if (($value == '' || $value == 'val') && $row['alternative'] != '') { $value = $row['alternative']; } 
			define(strtoupper($row['param']), $value);
		}
    }

    public function config_lesen($category) 
    { 
		global $db;
		$query = 'SELECT * FROM '.$this->mPrefix.'config WHERE category="'.$category.'" ORDER BY id';
		$config = $db->query($query);
		return $config;
    }

    /* website.php mit dem aktiven THEME updaten */ 
    public function update_website($website) 
    {
        if ($website == '') return;
        $website  = "<?php define('WEBSITE','".$website."'); ?>";			
        $file = DOCUROOT.'includes/website.php';
        if (is_file($file)) {
//				chmod($file, 0777);			
            $fo =	fopen($file, 'w');
            $fp = file_put_contents($file,$website); // (PHP 5)
            fclose($fo);
//				chmod($file,0644);
        }
    }

    /* in der aktuell im Zugriff befindlichen DB muss das gewählte 
     * THEME aktualisiert werden */
    public function update_website_db() 
    {
        global $db;
        if (!defined('WEBSITE')) return;
        $query = 'SELECT id FROM '.$this->mPrefix.'config WHERE param="THEME"';
        $cfgid = $db->queryOne($query);
        $update = 'UPDATE '.$this->mPrefix.'config';
        $update .= ' SET value="'.WEBSITE.'"';
        $update .= ' WHERE id='.$cfgid;
        $db->query($update);
    }

    /* mit dieser Funktion werden die Pfade auf die Media-Dateien aktualisiert,
     * nachdem die DB-gewechselt wurde
     */
    public function update_website_media()
    {
        global $db, $pictdb, $navi, $pages, $frgmain, $msg;
        $newmedia = MEDIA_ROOT;
        $webroot  = ROOTDIR;			
        $msg = $pictdb->update_bildpfade();
        $msg = $navi->update_bildpfade();
        $msg = $pages->update_bildpfade();
        $msg = $frgmain->update_bildpfade();
        return $msg;
    }
		
    /* script fuer Google-Analytics erstellen 
    	@params: Kontonummer
    	@return: $ga_script	- JavaScript
    */
    public function google_analytics($kontonr)
    {
    	if (preg_match('/UA/', $kontonr)) {
    		$ga_script 	 = '<script type="text/javascript">'."\n";
    		$ga_script 	.= 'var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");'."\n";
			$ga_script 	.= 'document.write(unescape("%3Cscript src=\'" + gaJsHost + "google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E"));'."\n";
    		$ga_script 	.= '</script>'."\n";
    		$ga_script 	.= '<script type="text/javascript">'."\n";
    		$ga_script 	.= 'try {'."\n";
    		$ga_script 	.= 'var pageTracker = _gat._getTracker("'.GOOGLE_ANALYTICS.'");'."\n";
    		$ga_script	.= 'pageTracker._trackPageview();'."\n";
    		$ga_script	.= '} catch(err) {}'."\n";
    		$ga_script	.= '</script>'."\n";
//    		$ga_script 	 = '<script type="text/javascript">google_analytics("'.GOOGLE_ANALYTICS.'");</script>';
    		return $ga_script;	
    	}
    }

	// Die Kategorien lesen 
    public function config_category_lesen() 
    { 
		global $db;
		$query = 'SELECT DISTINCT category FROM '.$this->mPrefix.'config';
		$categories = $db->query($query);
		return $categories;
    }
    

	/* Einen Config-Wert updaten. Dabei k�nnen einzelne Felder dynamisch �bergeben werden 
		Aufruf: bei Action = save 	*/
	public function config_update($id, $feldname, $feldvalue)
	{
		global $db;
		$update = 'UPDATE '.$this->mPrefix.'config';
		$update .= ' SET '.$feldname.'="'.$feldvalue.'"';
		$update .= ' WHERE id='.$id;
		$db->query($update);
		return $feldvalue;
	}

	/* Einen Config-Wert updaten. 
		Dabei werden die Werte in den Feldern Value und Alternative entsprechend vertauscht.
		Aufruf: bei Action = saverb --> Update eines Radiobuttons
	*/
	public function config_update_rb($id, $feldvalue, $alternative)
	{
		global $db;
		$update = 'UPDATE '.$this->mPrefix.'config';
		$update .= ' SET value="'.$feldvalue.'", alternative="'.$alternative.'"';
		$update .= ' WHERE id='.$id;
		$db->query($update);
		return $feldvalue;
		//return utf8_encode($data[$feldname]);
	}

    /* Tabelle cms_spezial lesen anhand THEME. 
        @params: $theme - das gewaehlte Thema
        @return: $spezial - Eintraege aus cms_spezial mit Thema THEME 
    */
    public function spezial_lesen($theme)
    {
      unset($spezial);
      if ($theme != '') {
          global $db;
          $query = 'SELECT * FROM '.$this->mPrefix.'spezial'. ' WHERE thema="'.$theme.'"';
          $spezial = $db->query($query);
      }
      return $spezial;
    }	

    /* Einen Wert in cms_spezial updaten. Dabei können einzelne Felder dynamisch übergeben werden
    Aufruf: bei Action = save_spez 	*/
    public function spezial_update($name, $feldname, $feldvalue)
    {
        global $db;
        $update = 'UPDATE '.$this->mPrefix.'spezial SET '. $feldname.'="'.$feldvalue.'"';
        $update .= ' WHERE thema="'.THEME.'" AND name="'.$name.'"';
        $db->query($update);
        return $feldvalue;		
    }

    /* das Thema aus der Config lesen und daraus die Bildergroessen ableiten 
        Dabei soll der Name eines Records mit 'M' = Masse beginnen
    */
    public function bildgroessen_lesen() 
    { 
      $bildgroessen = array();
      global $db;
      $query = 'select b.name, b.wert1, b.wert2 from '.$this->mPrefix.'config as a
                   inner join cms_spezial as b on a.value = b.thema
                   where a.category="general" and a.param="THEME"
                   and a.value = b.thema
                   and b.name like "M%"';
      $rows = $db->query($query);
      while ($row = $rows->fetchRow(MDB2_FETCHMODE_ASSOC)) {
          $bildgroessen[] = $row;
      }
      return $bildgroessen;
    }


    /* Verfügbare Sprachen lesen. Wenn keine Sprache in cms_spezial gepflegt 
     * wurde, wird die Standardsprache aus dem Browser ermittelt. 
     * @return: $GLOBALS['sprachcodes'] - Array der verfügbaren Sprachen inkl. Text
     * @return: $GLOBALS['sprachen_erlaubt'] - Array der erlaubten Sprachcodes
    */
    public function sprachen_lesen() 
    { 
      global $db;
      $sprachcodes = array();
      $sprachen_erlaubt = array();
      $query = 'SELECT * FROM '.$this->mPrefix.'spezial WHERE thema="'.THEME.'" 
               AND name like "LANG%"';
      $result = $db->query($query);
      while ($row = $result->fetchRow(MDB2_FETCHMODE_ASSOC)) {
          $sprachcodes[] = $row['wert2']; // Sprachcode in Kleinschrift
          $sprachen_erlaubt[] = $row; // Sprach-Datensatz
      }
      $GLOBALS['sprachcodes'] = $sprachcodes;
      $GLOBALS['sprachen_erlaubt'] = $sprachen_erlaubt;
    }
    
    /* Sprachcode in der URL pruefen 
     * @params: $sprachcode - wird gegen den Array von erlaubten Sprachen geprüft
     * @return: true or false
     */
    public function check_sprachcode($sprachcode) 
    {
      if (empty($GLOBALS['sprachcodes'])) { $this->sprachen_lesen(); }
      $sprachen = $GLOBALS['sprachcodes'];
      $code = strtolower($sprachcode);
      if (in_array($code,$sprachen)) { return true; }
      return false;
    }
    
    /* Sprachcode anhand GET oder SESSION-Variable setzen 
     * @return: $_GET['langu'] und $_SESSION['language'] gefüllt oder leer
     */
    public function sprache_festlegen() 
    {   
      global $cfg;
      // 1. Fall: es wurde eine Sprache mitgegeben
      if (isset($_GET['langu'])) { 
        $sprachcode = strtoupper($_GET['langu']); 
      }
      // 2. Fall: die Session-Variable hat eine Wert
      elseif (isset($_SESSION['language'])) {
        $sprachcode = strtolower($_SESSION['language']);
      }
      else {        
        $sprachcode = $cfg->getBrowserLanguage();         
      }

      if ($sprachcode != '') {
        // Jetzt den Sprachcode überprüfen gem. definierten Sprachen in cms_spezial
        $rc = $this->check_sprachcode($sprachcode);  
        // Globale Daten neu setzen
        if (!$rc) { $sprachcode = $cfg->getBrowserLanguage(); }
        // neuer Sprachcode setzen
        $_SESSION['language'] = strtoupper($sprachcode);
        $_GET['langu'] = strtolower($sprachcode);        
      }
    }
    
  
    /* Standardsprache des Browsers auslesen 
     * Erläuterungen zu dieser Funktion sind zu finden auf...
     * http://aktuell.de.selfhtml.org/artikel/php/httpsprache/#z61
     * Die Konstante LANGUAGE_DEFAULT wird mit der gefundenen Sprache gefüllt
     */
    public function getBrowserLanguage($strict_mode=true) 
    {
      if (count($GLOBALS['sprachcodes']) == 0) $this->sprachen_lesen();;
      $allowed_languages = $GLOBALS['sprachcodes'];
      
      // Default-Sprache aus der Konstanten beziehen oder DE setzen
      $default_language = isset($_SESSION['language']) ? $_SESSION['language'] : 'DE';
      $lang_variable = $_SERVER['HTTP_ACCEPT_LANGUAGE'];
      // Den Header auftrennen
      $accepted_languages = preg_split('/,\s*/', $lang_variable);

      // Die Standardwerte einstellen
      $current_lang = strtolower($default_language);
      $current_q = 0;

      // Nun alle mitgegebenen Sprachen abarbeiten
      foreach ($accepted_languages as $accepted_language) {
        // Alle Infos über diese Sprache rausholen
        $res = preg_match ('/^([a-z]{1,8}(?:-[a-z]{1,8})*)'.
                           '(?:;\s*q=(0(?:\.[0-9]{1,3})?|1(?:\.0{1,3})?))?$/i', $accepted_language, $matches);
        // war die Syntax gültig? - Nein? Dann ignorieren
        if (!$res) { continue; }
        // Sprachcode holen und dann sofort in die Einzelteile trennen
        $lang_code = explode ('-', $matches[1]);
        // Wurde eine Qualität mitgegeben?
        if (isset($matches[2])) {
          // die Qualität benutzen
          $lang_quality = (float)$matches[2];
        } else {
          // Kompabilitätsmodus: Qualität 1 annehmen
          $lang_quality = 1.0;
        }
        // Bis der Sprachcode leer ist...
        while (count($lang_code)) {
          // mal sehen, ob der Sprachcode angeboten wird
          if (in_array (strtolower(join('-',$lang_code)),$allowed_languages)) {
            // Qualität anschauen
            if ($lang_quality > $current_q) {
                // diese Sprache verwenden
                $current_lang = strtolower (join ('-', $lang_code));
                $current_q = $lang_quality;
                // Hier die innere while-Schleife verlassen
                break;
            }
          }
          // Wenn wir im strengen Modus sind, die Sprache nicht versuchen zu minimalisieren
          if ($strict_mode) {
            // innere While-Schleife aufbrechen
            break;
          }
          // den rechtesten Teil des Sprachcodes abschneiden
          array_pop ($lang_code);
        }
      }
      $lang = explode('-',$current_lang);
      return strtoupper($lang[0]);
    }

} 

?>
