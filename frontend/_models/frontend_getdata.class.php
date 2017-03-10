<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse f�r die Verwaltung der hochgeladenen Bilder in der DB
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2007-10-05
 */
 
class frontendGetData
{
	private $mDb;
	private $mPrefix;	

    /* Constructor */
    function __construct($db) 
    {
		$this->mPrefix 	= TABLE_PREFIX;
		$this->mDb 		= $db;
    }                                                                          

    /* Neue Methode implementieren */
    
	/*******************************************************************************
	 *	check_parameters -> dient der Vermeidung von Cross Site Scripting
	 *  als Parameter kommen folgende Namen vor: navid, subid, pagid, start
	 *  Die Werte d�rfen nur numerisch sein!
	 ******************************************************************************/
    public function check_parameters() 
    {
    	$rc = true;
    	$params = $_GET;
    	if (count($params) == 0) return $rc;
    	foreach ($params as $key => $value) { 
    		 if (preg_match('/id/', $key)) {   		
				 $int = (int) $value; 
				 $ori = $params[$key];
				 // Um eine Manipulation von numerischen Parametern festzustellen, muss man die 
				 // Variable nach dem Casten mit dem urspr�nglichen Wert vergleichen
				 if ((string)((int)$value) !== $ori) { $rc=false; } // echo '$ori='.$ori; }
    		 }
    	}
    	return $rc;
    }

    /*******************************************************************************
	 *	Selektionen auf cms_seiten / cms_templates
	 ******************************************************************************/
	/* Seiten-Infos zu einer Navigations-ID aus der DB lesen und zurueckgeben
	 * @param:  $navid - Navigations-Id  
	 * @return: $seiten_infos - Seiteninfos und Template
	*/
    public function read_seiten_infos($navid) 
    {
		$db = $this->mDb;
    	$abfrage = 'SELECT s.nav_id, s.kurztitel, s.zusatztext, s.inhalt1, s.inhalt2, s.bild1, s.modul, s.galerie, s.template,
					t.template_name, t.thumbsize
		            FROM '.$this->mPrefix.'seiten s
		            INNER JOIN '.$this->mPrefix.'templates t ON s.template = t.template_id
		            WHERE s.nav_id =' .$navid. '
					ORDER BY nummer';
		
		$seiten_infos = $db->queryRow($abfrage);
		return $seiten_infos;
    }
    
	/*******************************************************************************
	 *	Selectionen auf cms_pages
	 ******************************************************************************/
    /* 	Die Anzahl Seiten pro Navid zaehlen, die aktiv sind und 
     *  das von-bis Datum zum Tagesdatum passt, falls es gesetzt ist. 
     *	@param: $navid = NavId 
	 *	@return: $total = Anzahl Seiten
    */    
	public function count_pages_by_navid($navid) {
		global $general;
		$db = $this->mDb;
		$total = 0;
		$where_navid = $navid != 0 ? ' AND nav_id='.$navid : '';
		$datum_abfrage = $this->set_datum_abfrage();
		$query = 'SELECT count(*) AS total FROM ' .$this->mPrefix.'pages'. 
					' WHERE aktiv="j"'.$where_navid.' AND '.$datum_abfrage;
		$total = $db->queryOne($query);
		return $total;
	}    
    
    /* Alle Datensaetze pro zu einer nav_id lesen inkl. Datumsabfrage
	   Es werden folgende Datensaetze selektiert:
	   1. Alle Saetze mit datum_von und datum_bis = '0000-00-00'
	   2. Alle Saetze mit gesetztem datum_von und nicht gesetztem datum_bis, bei denen
	      das Tagesdatum >= datum_von
	   3. wie 2. aber mit gesetztem datum_bis
	   4. Alle Datensaetze mit gesetztem datum_von und datum_bis, und das Tagesdatum
	      dazwischen liegt   
	   @param: $navid - Navid aus der Navigation
	   @param: $start - Startpunkt zum lesen der Pages -> Bl�tterfunktion
	*/
    public function read_pages_pro_navid ($navid, $start=0) 
    { 
		$db = $this->mDb;		
		$datum_abfrage 	= $this->set_datum_abfrage();
		$where  		= ' nav_id='.$navid.' AND aktiv="j" AND '.$datum_abfrage;
		$felder 		= 'page_id, kennzeichen, fach, name, datum_von, datum_bis, aktiv, kurztext, bild1, bild2';
		$order  		= 'fach, datum_von DESC, sort_id, name';

 		// nur MAX_LIST_ITEMS lesen (fuer Blaetterfunktion im Frontend)
		$anzahl = $start + MAX_LIST_ITEMS;
		$db->setLimit(MAX_LIST_ITEMS, $start);
		
		$query = 'SELECT '.$felder.' FROM '.$this->mPrefix.'pages WHERE '.$where.' ORDER BY '.$order;
		$area_arr = $db->query($query);
		//var_dump($db->queryOne('SELECT FOUND_ROWS()'));
		return $area_arr;
    }
    
    /* Eine WHERE-Clause fuer die Datums-Abfrage erstellen
	   @return: $datum_abfrage - Datum-Abfrage f�r cms_pages - Saetze
	*/
    public function set_datum_abfrage() 
    {
		$datum_abfrage 	= '((date_format(datum_von,"%Y%m%d")=0 and date_format(datum_bis,"%Y%m%d")=0) OR
						   (date_format(datum_von,"%Y%m%d")>0 and date_format(datum_bis,"%Y%m%d")=0 AND
 							date_format(curdate(),"%Y%m%d")>=date_format(datum_von,"%Y%m%d")) OR 
						   (date_format(datum_bis,"%Y%m%d")>0 and date_format(datum_von,"%Y%m%d")=0 AND
 							date_format(curdate(),"%Y%m%d")<=date_format(datum_bis,"%Y%m%d")) OR 
						   (date_format(datum_von,"%Y%m%d")>0 and date_format(datum_bis,"%Y%m%d")>0 AND
 							date_format(curdate(),"%Y%m%d")>=date_format(datum_von,"%Y%m%d")  AND 
                            date_format(curdate(),"%Y%m%d")<=date_format(datum_bis,"%Y%m%d")))';
		return $datum_abfrage;    	
    }
    
	/*******************************************************************************
	 *	Selectionen auf cms_galerien
	 ******************************************************************************/
	 
    /* Bilder zu einer Nav_id aus cms_galerien lesen und zur�ckliefern 
    	um anhand des Bilderarrays eine Galerie zu erstellen
    	@param: $nav_id - Id einer Haupt-Navigationsseite
    	@return: $bilder - Array
    */
    public function read_galerie_pro_nav_id($nav_id, $type)
    {
    	$bilder = array();
		$abfrage = 'SELECT bildpfad, kommentar FROM '.$this->mPrefix.'galerien
		   			 WHERE ref_id='.$nav_id.' AND type="'.$type.'" ORDER BY sortkey';		
		$bilder =& $this->mDb->query($abfrage);	
		return $bilder;	
    }
    
	/*******************************************************************************
	 *	Selectionen auf cms_navigation
	 ******************************************************************************/

	/* ein einzelnes Feld aus der Navigation lesen 
		@param: $feld - zu lesender Wert des Feldes 
		@param: $nav_id - Id der Navigation
		@return: $feldwert - Wert des gelesenen Feldes
	*/
	public function read_single_field_from_navi($feld, $nav_id)
	{
		$ukap='';
		// erst sehen, ob das Feld in der Tabelle existiert
		
		// Datensatz lesen
		$query = 'SELECT '.$feld.' FROM '.$this->mPrefix.'navigation
		  	       WHERE aktiv="j" 
		  	         AND nav_id='.$nav_id.'
		  	         AND ukap > 0
		  	      ORDER BY ukap';
		$value = $this->mDb->queryOne($query);
		return $value;
	}

	/* Navigation zu einer Page-id lesen, um den parameter '?kap=..&ukap=..? f�r die 
		Querverlinkung herzustellen
		@param: $linkid - Id der gesuchten Seite
		@return: $param - K�rzel von kap und ukap als GET-Paramter zusammengesetzt
	*/
	public function create_cross_pages_link($linkid, $linknr) 	
	{
		global $redirect;
		$kap_ukap = '';
		$query = 'SELECT DISTINCT p.page_id, p.domain, p.name, n.nav_id, n.kap, n.ukap, n.kuerzel
			  		FROM '.$this->mPrefix.'pages p
			  INNER JOIN '.$this->mPrefix.'navigation n
			          ON p.nav_id = n.nav_id
			       WHERE p.page_id='.$linkid.'
			         AND p.aktiv="j"';
		$nav = $this->mDb->queryRow($query);
		
		// jetzt pruefen, ob es eine ukap gibt
		// wenn es ein Ukap gibt, hat das SELECT-Statement die nav_id der Unternavigation geliefert
		// Wenn es kein Ukap gibt, entspricht die nav_id dem Kap 
		// Wenn $nav = null ist, dann ist die eingetragene Id nicht aktiv
		// 1. $param fuer kuerzel navid und subid erstellen
		
		if ($nav && $nav['ukap'] > 0) {
          $link = $this->create_link($nav);
		// SMURL !!
          if ($link) { 
			$href_text = $GLOBALS['LINKS']['SIEHE_AUCH'].$nav['name'];
			$linkclass = $linknr == '1' ? 'clslink1' : 'clslink2';
			$href = '<p class="'.$linkclass.'"><a href="'.$link.'" onclick="javascript:setLinkCookie(location.href);">'.$href_text.'</a></p>';
          }            
        }
		return $href;
	}

	/* Auf Unterseiten kann eine Link-Liste aller Unterseiten eines Navigationspunktes erstellt werden
		@param: $feld - zu lesender Wert des Feldes 
		@param: $nav_id - Id der Navigation
		@return: $html - eine UL-Liste mit den links auf die Unterseiten
	*/    
    public function create_unterseiten_link_liste($row) 
    {
      global $redirect;
      $count;
      $navid = $row['nav_id'];
      $pagid = $row['page_id'];
      if ($navid > 0 && $pagid > 0) {
		$query = 'SELECT p.sort_id, p.page_id, p.name, n.nav_id, n.kap, n.ukap, n.kuerzel
			  		FROM '.$this->mPrefix.'pages p
			  INNER JOIN '.$this->mPrefix.'navigation n
			          ON p.nav_id = n.nav_id
			       WHERE p.nav_id='.$navid.'
			         AND p.aktiv="j"
                   ORDER BY p.sort_id';
		$rows = $this->mDb->query($query);
        $count = $rows->numRows();
      }
      
      // jetzt die Linkliste aufbauen, falls mehr als 1 Link da sind!!
      if ($count > 1) {
        $html = '<div class="linkliste"><ul>';      
        while ($nav = $rows->fetchRow(MDB2_FETCHMODE_ASSOC)) {
          if ($nav && $nav['ukap'] > 0) {
            $link = $this->create_link($nav);
            if ($nav['page_id'] == $pagid) {
              $html .= '<li><a class="active" href="'.$link.'">'.$nav['name'].'</a></li>';              
            } else {
              $html .= '<li><a href="'.$link.'">'.$nav['name'].'</a></li>';              
            }
          }
        };
        $html .= '</ul></div>';
        return $html;
      }
    }

	/* Einen Link anhand der Navigations-Id's navid, pagid, subid ermitteln
		@param: $nav - Array aus dem SELECT-Statement
		@return: $link - eine URL 
	*/    
    private function create_link($nav) 
    {
      global $redirect;
      // nav_id der Unternavigation
      $subid = $nav['nav_id'];
      // nav_id der Hauptnavigation dazulesen
      $query = 'SELECT DISTINCT nav_id FROM '.$this->mPrefix.'navigation
                 WHERE kap='.$nav['kap'].' AND ukap=0';
      $navid = $this->mDb->queryOne($query);
      // SMURL!!
      $link = $redirect->set_navlink($navid, $subid, $nav['page_id']);
      return $link;
    } 
    
	/*******************************************************************************
	 *	Selectionen auf cms_modules
	 ******************************************************************************/
	/* den Modulenamen lesen 
	 	@params: Modulid = Id des gesuchten Modules
	 	@return: $value = Name des Modules
	*/	
	public function read_modulename($modid) 
	{
		$value = '';
		if ($modid > 0) {
			$query = 'SELECT DISTINCT module_name FROM '.$this->mPrefix.'modules WHERE module_id='.$modid; 
			$value = $this->mDb->queryOne($query);			
		}
		return $value;
	}
	
	/*******************************************************************************
	 *	Selectionen auf cms_templates
	 ******************************************************************************/
	/**
	 *  die Thumbnailgroesse eines Templates lesen
	 *  @param: tplid = Id des gesuchten Templates
	 *  @return: $value = Bildmasse fuer ein Template
	*/
	public function read_thumbsize_by_tplid($tplid)
	{
		$value = '';
		if ($tplid > 0) {
			$query = 'SELECT DISTINCT thumbsize FROM '.$this->mPrefix.'templates WHERE template_id='.$tplid; 
			$value = $this->mDb->queryOne($query);	
		}
		return $value;
	}
	
	/**
	 *  ein einzelnes Template lesen anhand der TemplateId
	 *  @param:	$tplid Id des gesuchten Templates
	 *  @return: $value Bildmasse fuer ein Template
	*/
	public function read_single_template($tplid)
	{
		if ($tplid > 0) {
			$query = 'SELECT * FROM '.$this->mPrefix.'templates WHERE template_id='.$tplid; 
			$template = $this->mDb->queryRow($query);			
		}
		return $template;
	}
	
	/******************************************************************************************
	 *	Selectionen auf cms_spezial
	 ******************************************************************************************/
	/* CSS-Klassen aus der Tabelle cms_spezial f�r ein Thema lesen zZ. f�r das Thema "martina"
		@params: THEME_SELECTED
		@return: Array mit CSS-Klassen zum gew�hlten Thema 
	*/
	public function read_css_classes($thema) 
	{
		global $db;
		$query = 'select b.name, b.wert1, b.wert2, b.wert3 from '.$this->mPrefix.'config as a
				   inner join '.$this->mPrefix.'spezial as b on a.value = b.thema
 				   where a.category="general" and a.param="THEME"
 	 				 and a.value = b.thema
					 and b.name like "CSS%"';
		$rows = $db->query($query);
		while ($row = $rows->fetchRow(MDB2_FETCHMODE_ASSOC)) {
			$css[] = $row;
		};
		return $css;
	}
	
	/* einzelen Datansatz aus cms_spez lesen 
		@params: thema - aktuelles Thema
		@params: name  - Schluessel, welcher Datensatz gelesen wird
	*/
	public function read_single_spez($theme,$name) 
	{
		global $db;
		$query = 'SELECT * FROM '.$this->mPrefix.'spezial WHERE thema="'.$theme.'" AND name="'.$name.'"';
		$row = $db->queryRow($query);
		return $row;
	}
	
	/******************************************************************************************
	 *	Selectionen auf cms_fragments 08.01.2010 RHE
	 ******************************************************************************************/
	/* einzelen Datansatz aus cms_fragments lesen 
		@params: name  - Name des Fragments, welches gelesen werden soll
		@params: langtext - der Langtext wird hier ev. mit dem Inhalt des Fragments erg�nzt
		@return: langtext - der Langtext wird an den Aufrufer zur�ckgegeben
	*/
	public function read_longtext_fragment($name) 
	{
		global $db;
		$name = str_replace("%","",$name);
		$query = 'SELECT DISTINCT content FROM '.$this->mPrefix.'fragmente WHERE name="'.$name.'"';
		$longtext = $db->queryOne($query);
		return $longtext;
		
	}
	
	
	/******************************************************************************************
	  Durchsuchen des Theme-Verzeichnisses nach themenspezifischen Scripts
	 	wird ein oder mehrere Scripts gefunden, wird der HTML-Code zum Einbinden der Scripts
	 	im Main-Template zurückgeliefert --> Platzhalter theme_js im Bereich Themes
	 ******************************************************************************************/
	public function read_theme_scripts() 
	{
		$theme_scripts = THEMES_DIR . THEME_SELECTED . 'scripts/';
		$script = '<script type="text/javascript" src="%s"></script>'."\n\t";
		$html	= '';
		
		if (file_exists($theme_scripts)) {

			// dann wird das Verzeichnis ge�ffnet und durchsucht
			$handle  = opendir($theme_scripts);
			while (false !== ($file = readdir($handle)))
			{
				// Pfad und Datei
				$scriptfile = $theme_scripts. $file;
				$extension	= strrchr($file, ".");
				if (is_file($scriptfile) &&  $extension == '.js') {
					$html .= sprintf($script, HOST . $scriptfile);
				}		
			}
		}
		return $html;
	}

	/******************************************************************************************
	  Es wird im Media-Verzeichnis nach dem Untervereichnis background gesucht und ob es darin
	  Bilder gibt. Wenn ja, werden diese in einen Array gelesen, aus welchem dann ein zufälliges
	  Bild ausgewählt und zurückgeliefert wird. (randomize)
	  Zudem werden nur File-Typen gemäss dem Array $ext_array ausgewählt
	 ******************************************************************************************/
	public function get_random_bgimage() 
	{
		$media_dir = MEDIA_BASE.'/background/_images/';
		$ext_array = array('.png','.gif','.jpg');
		$bilder_arr = array();
		if (file_exists($media_dir)) {
			$handle  = opendir($media_dir);
			while (false !== ($file = readdir($handle)))
			{
				// Pfad und Datei
				$mediafile = $media_dir. $file;
				$extension	= strrchr($file, ".");
				if (is_file($mediafile) &&  in_array($extension, $ext_array) ) {
					array_push($bilder_arr,$mediafile);
				}
			}
			/* Zufallsgenerator waehlt ein Bild */
			if (count($bilder_arr) > 0) {
				$numr = array_rand($bilder_arr,1);
				$bild = $bilder_arr[$numr];
				$html =  $bild != '' ? '<img src="'.HOST.$bild.'" border="0" alt="" />' : '';
			}
			return $html;
		}      
  }

	/******************************************************************************************
	  Es wird im Media-Verzeichnis nach dem Untervereichnis header gesucht und ob es darin
	  Bilder gibt. Wenn ja, werden diese in einen Array gelesen, aus welchem dann ein zufälliges
	  Bild ausgewählt und zurückgeliefert wird. (randomize)
	  Zudem werden nur File-Typen gemäss dem Array $ext_array ausgewählt
	 ******************************************************************************************/
	public function get_random_bild()
	{
		$media_dir = MEDIA_BASE.'/header/_images/';
		$ext_array = array('.png','.gif','.jpg');
		$bilder_arr = array();
		if (file_exists($media_dir)) {
			$handle  = opendir($media_dir);
			while (false !== ($file = readdir($handle)))
			{
				// Pfad und Datei
				$mediafile = $media_dir. $file;
				$extension	= strrchr($file, ".");
				if (is_file($mediafile) &&  in_array($extension, $ext_array) ) {
					array_push($bilder_arr,$mediafile);
				}
			}
			/* Zufallsgenerator waehlt ein Bild */
			if (count($bilder_arr) > 0) {
				$numr = array_rand($bilder_arr,1);
				$bild = $bilder_arr[$numr];
				$html =  $bild != '' ? '<img src="'.HOST.$bild.'" border="0" alt="" />' : '';
			}
			return $html;
		}
	}

    /******************************************************************************************
     * Es wird im Media-Verzeichnis nach dem Untervereichnis header gesucht und ob es darin
	 * ein Verzeichnis "background" gibt und es da ein Bild drin hat.
     * Ist ein Bild da, wird es im main_tpl.html im Headerbereich als Bild eingefügt
     * Im Gegen satz zum CSS-Background kann das img-Tag mit width: 100% werden, so dass sich 
     * das Hintergrund automatisch der Fenstergrösse anpasst
     *******************************************************************************************/
	public function get_header_bgimage()
	{
		$media_dir = MEDIA_BASE.'/header/background/';
		$ext_array = array('.png','.gif','.jpg');
		$bilder_arr = array();
		if (file_exists($media_dir)) {
			$handle  = opendir($media_dir);
			while (false !== ($file = readdir($handle)))
			{
				// Pfad und Datei
				$mediafile = $media_dir. $file;
				$extension	= strrchr($file, ".");
				if (is_file($mediafile) &&  in_array($extension, $ext_array) ) {
					array_push($bilder_arr,$mediafile);
				}
			}
			/* Zufallsgenerator waehlt ein Bild */
			if (count($bilder_arr) > 0) {
				$numr = array_rand($bilder_arr,1);
				$bild = $bilder_arr[$numr];
				$html =  $bild != '' ? '<img src="'.HOST.$bild.'" border="0" alt="" />' : '';
			}
			return $html;
		}
	}



}

?>
