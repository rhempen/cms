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
		 * nachdem die DB-gewechsel wurde
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

    /* das Thema aus der Config lesen und daraus die Bildergroessen ableiten 
    	Dabei soll der Name eines Records mit 'M' = Masse beginnen
    */
    public function bildgroessen_lesen() 
    { 
    	$bildgroessen = array();
			global $db;
			$query = 'select b.name, b.wert1, b.wert2 from cms_config as a
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
		@params: $theme - das gew�hlte Thema
		@return: $spezial - Eintr�ge aus cms_spezial mit Thema THEME 
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

//		hat nicht funktioniert!!
//		$data 	= array($feldname => $feldvalue );
//		$types 	= array('integer');
//		$db->loadModule("Extended");
//		$db->extended->autoExecute($this->mPrefix.'spezial', $data, MDB2_AUTOQUERY_UPDATE, 'thema="'.THEME.'"', 'name="'.$name.'"', $types);
//		return $data[$feldname];
	}


} 

?>
