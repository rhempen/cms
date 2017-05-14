<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse fuer die Verwaltung der Navigation und zugeh�riger Seiten
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2007-07-14
 * @package     CMSADMIN/Pages
 * 
 */
 
class pagesMaintain
{
	private $mPrefix;
	private $mDb;
	private $mMsg;

    /* MyRequire-Klasse mit Zugangsdaten aufrufen */
    function __construct($db) 
    {
		$this->mPrefix = TABLE_PREFIX;
		$this->mDb = $db;
		$this->mMsg = array();
    }                                                                          

   /**************************************************************************
	* public functions
	***************************************************************************/
	
	/**
	 * 	Alle Pages lesen  
	 *	@return: Array mit allen aktiven Datensaetzen
	*/
	public function read_all_pages() 
	{
		global $db;
		$query = 'SELECT * FROM '.$this->mPrefix.'pages WHERE aktiv="j" ORDER BY domain, kennzeichen';
		$allpages = $db->query($query);
		return $allpages;
	}
   
   
   /**
    *  	Alle Datensaetze pro Area lesen
	*	@param: $area 
	*	@param: $referrer - ist gesetzt, wenn der Aufruf vom Frontend erfolgt -> 
	*                       dann muessen zusaetzliche Felder eingelesen werden
	*/
    public function read_pages_overview($area, $referrer='', $fach='', $start=0, $language) 
    { 
		global $db;
		$where  = ' domain="'.$area.'"';
//		$felder = 'page_id, kennzeichen, fach_'.$language.', name_'.$language.', datum_von, datum_bis, aktiv';
		$felder = '*';
		$order  = 'fach_'.$language.', sort_id';
		if ($referrer != '' && $fach != '') { $where .= ' AND fach_'.$language.'="'.$fach.'"' ;}
		$query = 'SELECT '.$felder.' FROM '.$this->mPrefix.'pages WHERE '.$where.' ORDER BY '.$order;
		$area_arr = $db->query($query);
		return $area_arr;
    }

	/**
	 * 	Ein einzelner Feldwert aus art_pages lesen 
     *	@param: $page_id - Seiten-id
     *	@param: $feld - das gewuenschte Feld
	 *	@return: $feldwert = Wert des gelesenen Feldes
    */    
	public function read_single_value_from_pages($feld, $page_id)  
	{				
		$feldwert = '';
		global $db;
		$query = 'SELECT ' .$feld. ' FROM ' .$this->mPrefix.'pages'. ' WHERE page_id='.$page_id;
		$feldwert = $db->queryOne($query);
		return $feldwert;
	}
   
    
	/**	
	 * 	Ein einzelnes Feld aus art_pages lesen, der einen Array zurueckliefert 
     *	@param: $feld - zu lesendes SELECT-Feld
     *	@param: $feld - das WHERE-Feld
	 *	@return: $valuearray = Array mit Werten des gelesenen Feldes
    */    
	public function read_fieldarray_from_pages($selectfeld, $wherefeld, $kriterium)  
	{				
		global $db;
		if ($wherefeld == 'nav_id' || $wherefeld == 'page_id') {
			$query = 'SELECT ' .$selectfeld. ' FROM ' .$this->mPrefix.'pages'. ' WHERE '.$wherefeld.'='.$kriterium;			
		} else {
			$query = 'SELECT ' .$selectfeld. ' FROM ' .$this->mPrefix.'pages'. ' WHERE '.$wherefeld.' like "'.$kriterium.'%"';
		}
		$valuearray = $db->query($query);
		return $valuearray;
	}
   
    /**
     * 	Die Anzahl Seiten pro Navid zaehlen
     *	@param: $navid = NavId 
	 *	@return: $total = Anzahl Seiten
    */    
	public function count_pages($navid) {
		global $db;
		$total = 0;
		$query = 'SELECT count(*) AS total FROM ' .$this->mPrefix.'pages'. ' WHERE nav_id='.$navid;
		$total = $db->queryOne($query);
		return $total;
	}
    
    /**
     * 	Die Anzahl Seiten pro Domaene (exp, eve, art) zaehlen
     *	@param: $domain = Kategorie 
	 *	@return: $total = Anzahl Seiten
    */    
	public function count_pages_per_domain($domain, $fach='')  
	{				
		$total = 0;
		$where_fach = $fach != '' ? ' AND fach="'.$fach.'"' : '';
		global $db;
		$query = 'SELECT count(*) AS total FROM ' .$this->mPrefix.'pages'. ' WHERE domain="'.$domain.'" AND aktiv="j"'.$where_fach;
		$total = $db->queryOne($query);
		return $total;
	}

	
    /**
     *  Die Seiten pro Domaene (exp, eve, art) generisch lesen fuer AutoComplete
     *	@param: $domain = Kategorie 
     *	@return: $result
    */    
	public function read_pages_per_domain($domain, $exp)  
	{				
		global $db, $langu_tra;
		$query = 'SELECT DISTINCT page_id, name_'.$langu_tra.' FROM ' .$this->mPrefix.'pages'. ' 
				   WHERE aktiv="j"
					 AND name_'.$langu_tra.' LIKE "%' . utf8_decode($exp) . '%"';
		$result = $db->query($query);
		return $result;
	}
    
    /**
     * 	Eine Seite pro Kennzeichen lesen zur Bestimmung der page_id
     *	@param: $kennzeichen = Kennzeichen = Bilderverzeichnis  
     *	@return: $result
    */    
	public function read_page_per_kennzeichen($kennzeichen)  
	{				
		global $db;
		$query  = 'SELECT DISTINCT * FROM ' .$this->mPrefix.'pages ';
		$query .= 'WHERE kennzeichen="'.$kennzeichen.'"' ;
		$page = $db->queryRow($query);
		return $page;
	}

	/**
	 * 	Eine Seite in der Reihenfolge hochziehen 
	 *	@param: $page_id - id der Seite, die hochgezogen werden soll
	 *	@param: $sort_id - Sortierschluessel der um 1 verringert werden soll
	 *	@param: $fach	  - Gruppenzugehoerigkeit der hochzuziehenden Seite
	 *	@return: $message - Array mit Meldungstype und Meldungstext
    */    
	public function move_up_page($page_id, $sort_id, $fach, $name)  
	{
		global $db, $language;
		if ($sort_id > 1) {
			if ($db->query('UPDATE '.$this->mPrefix.'pages SET sort_id=2222 WHERE page_id='.$page_id) && 
			    $db->query('UPDATE '.$this->mPrefix.'pages SET sort_id='.$sort_id.' WHERE fach_'.$language.'="'.$fach.'" AND sort_id=('.$sort_id.'-1)') && 
				$db->query('UPDATE '.$this->mPrefix.'pages SET sort_id=('.$sort_id.'-1) WHERE page_id='.$page_id.' AND sort_id=2222')) 
			{
				$this->mMsg[] = 'success'; $this->mMsg[] = sprintf($GLOBALS['MESSAGES']['MSG_KAP_HOCHZIEHEN'], $name);
				return $this->mMsg;					
			}
		}		
	}
	
	
	/**
	 *  Eine einzelne Seite loeschen 
     *	@param: $page - id der zu l�schenden Seite
	 *	@return: $message - Array mit Meldungstype und Meldungstext
    */    
	public function delete_page($page_id, $msg)  
	{				
		global $db;
		$delete = 'DELETE FROM '.$this->mPrefix.'pages WHERE page_id='.$page_id; 
		if ($db->query($delete)) {
			$msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_SEITE_GELOESCHT'],$_REQUEST['name']);
		} else {
			$msg[] = 'error'; $msg[] = $GLOBALS['MESSAGES']['MSG_SEITE_NICHT_GELOESCHT'];
		}
		return $msg;
	}
	
    /**
     * 	Eine einzelne Seite aus der DB lesen
     *	@param: $page_id = id der zu lesenden Seite
	 *	@return: $page - Array mit Seiteninhalt
    */    
	public function read_page($page_id)  
	{				
		global $db;
		$query = 'SELECT * FROM '.$this->mPrefix.'pages WHERE page_id='.$page_id; 
		$page  = $db->queryRow($query);
		return $page;
	}
	
    /**
     *	Den Namen zu einer Link-id aus der DB lesen
     *	@param: $link_id = id der zu lesenden Seite
	 *	@return: $name - Name
    */    
	public function read_link_name($link_id)  
	{				
		global $db, $langu_tra;
		$query = 'SELECT name_'.$langu_tra.' FROM '.$this->mPrefix.'pages WHERE page_id='.$link_id.' AND aktiv="j"'; 
		$name  = $db->queryOne($query);
		return $name;
	}
	

    /**
     * 	Das Template einer einzelnen Seite aus der DB lesen
     *	@param: $page_id = id der zu lesenden Seite
	 *	@return: $template - Nr. des Templates
    */    
	public function read_page_template($page_id)  
	{				
		global $db;
		$query = 'SELECT t.template_name FROM '.$this->mPrefix.'pages p
				  INNER JOIN '.$this->mPrefix.'templates t ON p.template = t.template_id
				  WHERE page_id='.$page_id; 
		$template  = $db->queryOne($query);
		return $template;
	}

    /**
     * 	Die page_id der Seite aus der DB lesen, welche das juengste Von-Datum enthaelt --> Anzeige auf der Seite home
     *	@param: $domain der zu lesenden Seite --> gilt nur fuer art4art!!
	 *	@return: $page_id der Seite
    */    
	public function read_page_with_latest_date($domain)  
	{				
		global $db;
		$page_id = 0;
		$query = 'SELECT page_id FROM '.$this->mPrefix.'pages 
				   WHERE domain="'.$domain.'" 
				   	 AND aktiv="j"
				   	 AND datum_von = ( SELECT MAX( datum_von ) FROM ' .$this->mPrefix.'pages WHERE domain="'.$domain.'")';
		$page_id = $db->queryOne($query);
		return $page_id;
	}

	/**
	 * 	aktuellste News lesen fuer die Frontseite --> max. 10 wenn beim Aufruf nichts angegeben wurde
	 *	@param: $domain der zu lesenden Seite --> gilt nur fuer art4art!!
	 * 	@return: $page_id der Seite
	*/
	public function read_pages_with_latest_date($domain, $anzahl=10)
	{
		global $db;
		$seiten = '';
		$query = 'SELECT * FROM '.$this->mPrefix.'pages
						 WHERE domain="'.$domain.'"
							 AND aktiv="j"
							 AND datum_bis >= CURRENT_DATE
					ORDER BY datum_von DESC LIMIT '.$anzahl ; 
		$seiten = $db->query($query);
		return $seiten;
	}

	/**
	 * 	zur aktuellen Page_id sollen die zugehörigen Thumbnails ermittelt werden
	 *	@param: $page_id --> die ID der Unterseite
	 * 	@return: $thumbnails 
	*/
    public function read_thumbnails($page_id) 
    {
      global $db, $browser, $naviga;
      $query = 'SELECT domain, kennzeichen FROM '.$this->mPrefix.'pages WHERE page_id='.$page_id;
      $pagerow = $db->queryRow($query);
      $kennzeichen = $pagerow['kennzeichen'];
      // wenn Kennzeichen nicht gesetzt ist, 
      // kann es aus der domain und der Pageid zusammengesetzt werden....
      if ($kennzeichen == '') {
        $kennzeichen = $pagerow['domain'].sprintf("%04d",$page_id);
        // ... und gleich in der cms_pages updaten
        $knz = $this->page_update($page_id, 'kennzeichen',$kennzeichen);
      }
      $verzeichnis = MEDIA_ROOT .'/'. $kennzeichen .'/_thumbs';
      $thumbnails  = $browser->get_images($verzeichnis);
      return $thumbnails;
    }
    
	/**
	 * 	Alle Felder auf Richtigkeit �berpr�fen
	 *	-> Diese Funktion wird nicht genutzt!! Statt dessen wird die Pruefung der Felder mit JavaScript gemacht
	 *	@param: $_POST-Array -> bei jedem Fehler wird das $_POST-Array um einen Wert $key_error = 'X' erg�nzt.
	 *			 So kann das Formular nochmals mit den geposteten Daten angezeigt und die fehlerhaften Feldwerte 
	 *			 markiert werden.
	 *	@return: $message
	*/	
	public function validate_inputs() 	
	{		
		$meldung = '';
		foreach ($_POST as $key => $value) {
			switch ($key) {
				case 'name':
					if ($value == '') { $this->mMsg[] = 'error'; $this->mMsg[] = $GLOBALS['MESSAGES']['MSG_SEITENTITEL_EINGEBEN']; }
					break;			
				case 'datum_von':
					$this->check_datum($value);
					$von = $value;
					break;			
				case 'datum_bis':
					$this->check_datum($value);
					$bis = $value;
					// Bis-Datum muss gr�sser sein, als Von-Datum
					$this->compare_von_bis_datum($von, $bis);
					break;		
				case 'kurztext':
					if ($value == '') { $this->mMsg[] = 'error'; $this->mMsg[] = $GLOBALS['MESSAGES']['MSG_KURZTEXT_EINGEBEN']; }
					break;						
				case 'langtext':
					if ($value == '') { $this->mMsg[] = 'error'; $this->mMsg[] = $GLOBALS['MESSAGES']['MSG_LANGTEXT_EINGEBEN']; }
					break;			
			}
		}
		return $this->mMsg;
	}


	/**
	 * 	eine neue Seite anlegen - Ermitteln des n�chst verf�gbaren Kennzeichens und der Page_id f�r die neue Seite
	 *	@param: $area - eine event, expo, kuenstler, etc. - Seite anlegen
	 *	@return: $next_id_kz - page_id und kennzeichen
	*/
	public function create_page($area) {
		$next_kennzeichen = $this->get_next_kennzeichen($area);
		$next_page_id = $this->get_next_page_id();
		$next_id_kz = $next_page_id . '/' . $next_kennzeichen;
		return $next_id_kz;
	}
	
	/**
	 * 	Eine Seite sichern 
	 *	@param: $dbaction - Update oder Insert
	 *	@param: $page_id 
	 *	@return: $meldung
	*/
	public function save_page($page_id, $action='', $dbaction='')	
	{
		global $db, $general, $row; // Zustand der Daten VOR dem SAVE
        $langu_tra = $_POST['langu_sav'] != '' ? strtolower($_POST['langu_sav']) : strtolower($_POST['sprache']);
        
		if ($action == '' || $dbaction == '') {
			$this->mMsg[] = 'error'; $this->mMsg[] = 'Unerlaubter Zugriff auf die DB!!';
			return $this->mMsg;		
			exit;	
		}
		
		// Datum in das MySql-Format YYYY-MM-DD umwandeln
		$datum_von_mysql = $this->date_german2mysql($_POST['datum_von']); 
		$datum_bis_mysql = $this->date_german2mysql($_POST['datum_bis']); 
		
		// falls als Thumbnails blank.gif gew�hlt wurde, wird bild1, bild2 auf space gesetzt
		$bild1 = stristr($_POST['thumb1'], 'blank.gif') ? '' : $_POST['thumb1'];
		$bild2 = stristr($_POST['thumb2'], 'blank.gif') ? '' : $_POST['thumb2'];
		
		// falls ein Link geloescht wurde, muss Linkid auf 0 gesetzt werden
		$linkid1 = $_POST['exp1'] == '' ? 0 : intval($_POST['linkid1']);
		$linkid2 = $_POST['exp2'] == '' ? 0 : intval($_POST['linkid2']);
		
		// das Feld FACH = Kuerzel muss anhand der navid aus der Navigation eruiert werden
		if (isset($_POST['navid']) && $_POST['navid'] > 0) {
			$query = 'SELECT bezeich_'.$langu_tra.' FROM '.$this->mPrefix.'navigation WHERE nav_id='.$_POST['navid']; //.' AND ukap > 0';
			$bezeichnung = $db->queryOne($query);
			$bezeichnung = str_replace(' ','_',$bezeichnung);
		} else {
			$this->mMsg[] = 'error'; $this->mMsg[] = 'Es fehlt die Navigations-Id - Speichern nicht m�glich!!';
			return $this->mMsg;		
			exit;	
		}
		
		// Wenn die Zuordnung der Seite im Menu ge�ndert hat:
		// - muss die letzte Sort_id des neuen Fachs in cms_pages ermittelt werden
		if ($bezeichnung != $row['fach_'.$langu_tra] || $dbaction == 'insert') { 
			$query = 'SELECT max(sort_id) FROM '.$this->mPrefix.'pages'.' WHERE nav_id='.$_POST['navid'].' AND fach_'.$langu_tra.'="'.$bezeichnung.'"';
			$row['sort_id'] = $db->queryOne($query)+1; 
		}
		
	    // Seitennamen automatisch, falls nicht eingegeben wurde
//		$pagename = convert_umlaute($_POST['name']);
		$pagename = convert_umlaute($_POST['name']);
		if ($pagename == '') { $pagename = $GLOBALS['TEXTE']['TEXT_UNTERSEITE'].$_POST['domain']; } 

		// Insert oder Update durchf�hren

		$galerie = isset($_POST['galerie_aktiv']) && $_POST['galerie_aktiv'] != '' ? $_POST['galerie_aktiv'] : 'n';
		$aktiv	 = isset($_POST['aktiv']) && $_POST['aktiv'] != '' ? $_POST['aktiv'] : 'n';

		// SQL-Statement vorbereiten
		$sql .= 'name_'.$langu_tra.'="'.$pagename.'",';
		$sql .= 'kennzeichen="'.$db->escape($_POST['kennzeichen']).'",';
		$sql .= 'domain="'.$db->escape($_POST['domain']).'",';
		$sql .= 'nav_id='.intval($_POST['navid']).',';
		$sql .= 'fach_'.$langu_tra.'="'	.$bezeichnung.'",';
		$sql .= 'datum_von="'.$datum_von_mysql.'",';
		$sql .= 'datum_bis="'.$datum_bis_mysql.'",';
		$sql .= 'kurztext_'.$langu_tra.'="'.$db->escape($_POST['kurztext']).'",';
		$sql .= 'inhalt1_'.$langu_tra.'="'.$db->escape($_POST['inhalt1']).'",';
		$sql .= 'inhalt2_'.$langu_tra.'="'.$db->escape($_POST['inhalt2']).'",';
		$sql .= 'template='.intval($_POST['templates']).',';
		$sql .= 'bild1="'.$bild1.'",';
		$sql .= 'bild2="'.$bild2.'",';
		$sql .= 'galerie="'.$galerie.'",';
		$sql .= 'linkid1='.$linkid1.',';
		$sql .= 'linkid2='.$linkid2.',';
		$sql .= 'aktiv="'.$aktiv.'",';
		$sql .= 'sort_id='.intval($row['sort_id']);

		switch (strtolower($dbaction)) {
			case 'insert':
				$insert = 'INSERT INTO '.$this->mPrefix.'pages SET ';
				$insert .= $sql;
				$affected =& $db->exec($insert);
				if (PEAR::isError($affected))
				{
					echo $affected->getMessage().' '.$affected->getDebugInfo();
					$this->mMsg[] = 'error'; $this->mMsg[] = sprintf($GLOBALS['MESSAGES']['MSG_SEITE_NICHT_GESPEICHERT'], $_POST['name']);
				} else {
					$this->mMsg[] = 'success'; $this->mMsg[] = sprintf($GLOBALS['MESSAGES']['MSG_SEITE_GESPEICHERT'], $_POST['name']);
					// für den anschliessenden Insert in cms_redirect ben�tigen wir die neue Page_id
					$last_insert = 'SELECT LAST_INSERT_ID()';
                    $lastID = $db->queryOne($last_insert);
					$_POST['page_id'] = $lastID;
				}
				break;
			case 'update':
				$update = 'UPDATE '.$this->mPrefix.'pages SET ';
				$update .= $sql;
				$update	.= ' WHERE page_id='.$page_id;
				$affected =& $db->exec($update);
				if (PEAR::isError($affected))
				{
					echo $affected->getMessage().' '.$affected->getDebugInfo(); 
					$this->mMsg[] = 'error'; $this->mMsg[] = sprintf($GLOBALS['MESSAGES']['MSG_SEITE_NICHT_GESPEICHERT'], $_POST['name']);
				} else {
					$this->mMsg[] = 'success'; $this->mMsg[] = sprintf($GLOBALS['MESSAGES']['MSG_SEITE_GESPEICHERT'], $_POST['name']);
				}
		}
		return $this->mMsg;
	}
    
	/**
	 * 	Eine Seite updaten. Dabei koennen einzelne Felder dynamisch uebergeben werden
	 * 	Diese Funktion wird per Ajax aufgerufen 
	 *	@param: $page_id
	 *	@param:	$feldname
	 *	@param:	$feldvalue 
	*/
	public function page_update($page_id, $feldname, $feldvalue)
	{
		global $db;
		$update = 'UPDATE '.$this->mPrefix.'pages SET '.$feldname.'="'.$feldvalue.'" WHERE page_id='.$page_id;
		$affected =& $db->exec($update);
    	if (PEAR::isError($affected)) { echo $affected->getMessage().' '.$affected->getDebugInfo(); }
		switch ($feldname) {
			case 'aktiv';
				$response = $feldvalue.'/';
				$response .=  $feldvalue == 'j' ? $GLOBALS['TEXTE']['TEXT_AKTIV'] : $GLOBALS['TEXTE']['TEXT_INAKTIV'];
				break;
			default:
				$response = $feldvalue;
				break;
    }
    return $response;
//		return utf8_encode($data[$feldname]);
	}
	
	/**
	 * 	Die SortId's einer Page reorganisieren
	 *	@param: $nav_id
	*/
	public function reorg_sort_ids( $nav_id ) {
      if ($nav_id) { 
        global $db;
        $query = 'SELECT page_id, sort_id from '.$this->mPrefix.'pages WHERE nav_id='.$nav_id.' ORDER BY sort_id';
        $result = $db->query($query);
        $i = 0;
        while ($row = $result->fetchRow(MDB2_FETCHMODE_ASSOC)) {
          $i++;
          $update = 'UPDATE '.$this->mPrefix.'pages SET sort_id='.$i.' WHERE page_id='.$row['page_id'];
          $db->query($update);
        }
      }
	}

	/********************************************************************************/
	/* Funktionen zum Update der Bildpfade nach einem DB-Wechsel
	/********************************************************************************/
	/* Update der Bildpfade nach einem DB-Wechsel */
	public function update_bildpfade() 
	{
		global $db, $msg;
		$msg[] = 'message'; $msg[] = $GLOBALS['CMS']['MENU02'];		
		$newmedia = '/media_'.WEBSITE.'/';
		$unterseiten = $this->alle_unterseiten_laden();
		if (count($unterseiten) > 0) {
			while ($row = $unterseiten->fetchRow(MDB2_FETCHMODE_ASSOC))  
			{
				$seite = $row['name'];
				$inhalt1 = $row['langtext'];
				$inhalt2 = $row['inhalt2'];
				$bild1 = $row['bild1'];
				$bild2 = $row['bild2'];
				if (stristr($inhalt1,'<img')) { $inhalt1 = str_replace('/media/',$newmedia,$row['langtext']); }
				if (stristr($inhalt2,'<img')) { $inhalt2 = str_replace('/media/',$newmedia,$row['inhalt2']); }
				if (stristr($bild1,'/media/'))  { $bild1   = str_replace('/media/',$newmedia,$row['bild1']); }
				if (stristr($bild2,'/media/'))  { $bild2   = str_replace('/media/',$newmedia,$row['bild2']); }
                /* Update nur, falls noetig! */
                if ($inhalt1 != $row['langtext'] || $inhalt2 != $row['inhalt2'] || $bild1 != $row['bild1'] || $bild2 != $row['bild2'])
                {
                    $update = 'UPDATE '.$this->mPrefix.'pages SET';
                    $update .= ' langtext="'.$db->escape($inhalt1).'",';
                    $update .= ' inhalt2="'.$db->escape($inhalt2).'",';
                    $update .= ' bild1="'.$db->escape($bild1).'",';
                    $update .= ' bild2="'.$db->escape($bild2).'"';
                    $update .= ' WHERE page_id = '.$row[page_id];
                    $affected =& $db->exec($update);
                    if (PEAR::isError($affected))
                    {
                            $msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_SEITE_NICHT_GESPEICHERT'], $seite);
                        } else {
                            $msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_SEITE_GESPEICHERT'], $seite);
                    }
                } else {
                    $msg[] = 'neutral'; $msg[] = 'OK: '. $seite;						
                }
			}
		return $msg;
		}	
	}

	/* Alle Seiten aus der DB lesen */
	private function alle_unterseiten_laden() 
	{
		global $db;
		$query = 'SELECT * from '.$this->mPrefix.'pages';
		return $db->query($query);	
	}
    
	/**************************************************************************
	* private functions
	***************************************************************************/
	
	/**
	 * 	das naechst moegliche Kennzeichen fuer die gewaehlte Area ermitteln
	 *	@param: $area
	*/
	private function get_next_kennzeichen($area) {
		global $db;
		$query = 'SELECT MAX(kennzeichen) from '.$this->mPrefix.'pages WHERE domain="'.$area.'"';
		$max_kz = $db->queryOne($query);
		if ($max_kz != '') {
			$zaehler = intval(substr($max_kz, -4, 4) +1); // die 4 letzten Stellen abschneiden und in einen Integer + 1 umwandeln 
			$max_kz = $area . sprintf("%04d", $zaehler); // $zaehler wieder als String im Format XXXX zurueckgeben
		} else {
			$max_kz = $area . sprintf("%04d", 1);
		}
		return $max_kz;
	
	}
	
	/**
	 * 	die naechste verfuegbare Page_id in der Tabelle $this->mPrefix.pages ermitteln 
     * @return: $next_page_id - die nächste PageId für eine neue Unterseite
	*/
	private function get_next_page_id() {
		global $db;
        $query = 'SHOW TABLE STATUS LIKE "'. $this->mPrefix.'pages"';
		$tableStatus = $db->queryRow($query);
        $next_page_id = $tableStatus['auto_increment'];
		return $next_page_id;
	}
	
	
	/**
	 * 	Ueberpruefung des Datums auf Gueltigkeit, sowohl betr. Format als auch Inhalt 
	 *	@param: $datum - das eingegebene Datum
	*/
	private function check_datum($datum) {
		if ($datum == null) { return; }
		// Datum muss im Format DD.MM.JJJJ eingegeben werden - Ueberpruefung mit RegExp.
	    if (preg_match("^([0-9]{1,2})\.([0-9]{1,2})\.([0-9]{4})$",trim($datum))) {
	        list($tag, $monat, $jahr) = explode('.', $datum);
	        
	        if (!checkdate($monat,$tag,$jahr))	
	        {
	        	// Ueberprueft das Datum auf Gueltigkeit, Schaltjahre werden beruecksichtigt
				$this->mMsg[] = 'error'; $this->mMsg[] = sprintf($GLOBALS['MESSAGES']['MSG_DATUM_UNGUELTIG'], $datum);
 	        }
	    } else {
			$this->mMsg[] = 'error'; $this->mMsg[] = $GLOBALS['MESSAGES']['MSG_DATUM_FORMAT'];		
	    }
	}	
	
	/**
	 * 	Deutsches Format ins MySQL (ISO)-Format umwandeln zB 31.12.2005 ==> 2005-12-31
	 *	@param: $datum 
	*/
	private function date_german2mysql($datum) 
	{
		// fuer den Fall, dass das Datum nicht eingegeben wurde
		if ($datum == null) { $datum = '00.00.0000'; }
	    list($tag, $monat, $jahr) = explode('.', $datum);
	    
	    if (strlen($jahr) < 4) $jahr = 2000 + $jahr;

	        if(checkdate($monat,$tag,$jahr))
	    {
	        return sprintf("%04d-%02d-%02d", $jahr, $monat, $tag);
	    }
	    return false;
	}
	

	/**
	 * 	Deutsches Format ins MySQL (ISO)-Format umwandeln zB 31.12.2005 ==> 2005-12-31
	    @param: $datum 
	*/
	private function compare_von_bis_datum($datum_von, $datum_bis) 
	{
	    list($tag, $monat, $jahr) = explode('.', $datum_von);
	    $von = intval(sprintf("%04d%02d%02d", $jahr, $monat, $tag));
	        
	    list($tag, $monat, $jahr) = explode('.', $datum_bis);
	    $bis = intval(sprintf("%04d%02d%02d", $jahr, $monat, $tag));

	    if ($bis < $von) {
			$this->mMsg[] = 'error'; $this->mMsg[] = sprintf($GLOBALS['MESSAGES']['MSG_DATUMBIS_KLEINER_DATUMVON'], $datum_bis, $datum_von);
	    }
	}
		
} 


?>
