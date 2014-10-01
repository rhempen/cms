<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse fuer die Verwaltung der Navigation und zugehoeriger Seiten
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2007-07-14
 * @package     CMSADMIN/Navigation
 * 
 */

class naviMaintain
{
	private $mNavId;
	private $mMeldung;

    /* MyRequire-Klasse mit Zugangsdaten aufrufen */
    function __construct($db, $nav_id) 
    {
		$this->mNavId = $nav_id;
		$this->mPrefix = TABLE_PREFIX;
		$this->mDb = $db;
		$this->mMeldung = array();
    }                                                                          

    /* Neue Methode implementieren */	
	// Alle Navigationspunkte lesen
    public function navigation_laden() 
    { 
		global $db;
		$query = 'SELECT * FROM '.$this->mPrefix.'navigation ORDER BY kap, ukap';
		$navigation = $db->query($query);
		return $navigation;
    }

	// Einen bestimmten Navigationspunkte lesen anhand der nav_id
    public function read_navigation_by_id($nav_id) 
    { 
		global $db;
		$query = 'SELECT * FROM '.$this->mPrefix.'navigation WHERE nav_id='.$nav_id;
		$navi = $db->queryRow($query);
		return $navi;
    }
    
	// Einen bestimmten Navigationspunkte lesen anhand des Bildpfades    
    public function read_navigation_by_bildpfad($pfad) 
    { 
		global $db;
		$query = 'SELECT DISTINCT * FROM '.$this->mPrefix.'navigation WHERE bildpfad="'.$pfad.'"';
		$navi = $db->queryRow($query);
		return $navi;
    }
    
	// Einen bestimmten Navigationspunkte lesen anhand der nav_id
    public function read_bezeichnung_by_area($area) 
    { 
		global $db,$language;
		$query = 'SELECT bezeich_'.$language.' FROM '.$this->mPrefix.'navigation WHERE domain="'.$area.'" and ukap=0';
		$bezeichnung = $db->queryOne($query);
		return $bezeichnung;
    }

	// Zu einem bestimmten Kap alle Navigationspunkte lesen (Kap / Ukap)   
    public function read_navigation_by_kap($kap) 
    { 
		global $db;
		$query = 'SELECT * FROM '.$this->mPrefix.'navigation WHERE kap='.$kap.' ORDER BY ukap';
		$navi = $db->query($query);
		return $navi;
    }

	// Zu einem bestimmten Kap die Anzahl Ukaps lesen (Kap / Ukap)   
    public function read_anz_ukap_by_kap($kap) 
    { 
      $anz_ukap = 0;
      global $db;
      $query = 'SELECT count(ukap) FROM '.$this->mPrefix.'navigation WHERE kap='.$kap.' AND ukap>0';
      $anz_ukap = $db->queryOne($query);
      return $anz_ukap;
    }

	// Zu einem bestimmten Kap das nächste Ukap lesen (Kap / Ukap)   
    public function read_anz_ukap_by_kap_ukap($kap, $ukap) 
    { 
      global $db;
      $query = 'SELECT count(ukap) FROM '.$this->mPrefix.'navigation WHERE kap='.$kap.' AND ukap='.$ukap;
      $anz_ukap = $db->queryOne($query);
      return $anz_ukap;
    }

    // Zu einem bestimmten Kap die nav_id lesen (Kap / Ukap=0)   
    public function read_navid_by_kap($kap) 
    { 
      global $db;
      $query = 'SELECT nav_id FROM '.$this->mPrefix.'navigation WHERE kap='.$kap.' AND ukap=0';
      $navid = $db->queryOne($query);
      return $navid;
    }

    // Zu einem bestimmten Kap alle Navigationspunkte lesen (Kap / Ukap)   
    public function read_first_hauptnavi() 
    { 
      global $db;
      $query = 'SELECT DISTINCT domain FROM '.$this->mPrefix.'navigation WHERE nav_type<>"S" AND aktiv = "j" ORDER BY kap ASC';
      $navi = $db->queryOne($query);
      return $navi;
    }

    // Hauptnavigationspunkt wird um eine 1er-Stufe hochgezogen
	public function kap_hochziehen($kap) 
	{			
      global $db;
      if ($db->query('UPDATE '.$this->mPrefix.'navigation SET kap=222 WHERE kap='.$kap) && 
          $db->query('UPDATE '.$this->mPrefix.'navigation SET kap='.$kap.' WHERE kap=('.$kap.'-1)') && 
          $db->query('UPDATE '.$this->mPrefix.'navigation SET kap=('.$kap.'-1) WHERE kap=222')) 
      {
          $this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_KAP_HOCHZIEHEN'], $GLOBALS['row']['bezeichnung']);
          return $this->mMeldung;					
      }
	}

	// Unternavigationspunkt wird um eine 10er-Stufe hochgezogen
	public function ukap_hochziehen($nav_id) 
	{				
      global $db;
      $query = 'SELECT * FROM '.$this->mPrefix.'navigation WHERE nav_id='.$nav_id;
      $row = $db->queryRow($query);
      $kap = $row['kap'];
      $ukap = $row['ukap'];
      if ($db->query('UPDATE '.$this->mPrefix.'navigation SET ukap='.$ukap.' WHERE kap='.$kap.' AND ukap='.($ukap-10)) &&
          $db->query('UPDATE '.$this->mPrefix.'navigation SET ukap ='.($ukap-10).' WHERE nav_id='.$nav_id))
      {
          $this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_UKAP_HOCHZIEHEN'], $GLOBALS['row']['bezeichnung']);
          return $this->mMeldung;
      }
	}

	// Neuen Unternavigationspunkt eroeffnen
	public function neuer_ukap($nav_id) 
	{				
      global $db, $language;
      $row = $this->read_navigation_by_id($nav_id);
      $kap         = $row['kap'];
      $bezeichnung = $row['bezeich_'.$language];
      $domain      = $row['domain'];
      $navid_kap   = $row['nav_id'];
      $ukap_nummer = $this->getNextUkap($kap); // naechste Ukap-Nummer um 10 erhoehen
      $kap_bez     = $bezeichnung . "_" . $ukap_nummer;
      $kap_bez     = str_replace(" ","_",$kap_bez);
      $kap_bez_low = strtolower($kap_bez);

      // Unterdirectory fuer diese Seite bestimmen und dann auch gleich anlegen
      $bildpfad = $row['domain'].'_'.$ukap_nummer; 
      $dir_to_create = MEDIA_ROOT .'/'.$bildpfad;
      if (!is_dir($dir_to_create) && mkdir($dir_to_create)){ 
          $this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DIR_ANGELEGT'], $bildpfad);		
      } elseif (!is_dir($dir_to_create)) {
          $this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DIR_NICHT_ANGELEGT'], $bildpfad);		
      }
      // Insert des neuen Unternavigationspunktes plus Insert einer zugehoerigen Seite
      $nav_id = $this->getNextNavid();
      $insert_navi  = 'INSERT INTO '.$this->mPrefix.'navigation ';
      $insert_navi .= '(nav_id,domain,kap,ukap,bildpfad,bezeich_de,bezeich_en,bezeich_fr,bezeich_it,';
      $insert_navi .= 'kuerzel_de,kuerzel_en,kuerzel_fr,kuerzel_it,aktiv) ';
      $insert_navi .= 'VALUES ('.$nav_id.',"'.$domain.'",'.$kap.','.$ukap_nummer.',"'.$bildpfad.'",';
      $insert_navi .= '"'.$kap_bez.'","'.$kap_bez.'","'.$kap_bez.'","'.$kap_bez.'",';
      $insert_navi .= '"'.$kap_bez_low.'","'.$kap_bez_low.'","'.$kap_bez_low.'","'.$kap_bez_low.'","n")';
      
      // Insert neuer Eintrag in die Tabelle cms_redirect (SMURL) 
      $insert_redirect  = 'INSERT INTO '.$this->mPrefix.'redirect (navid,subid,pagid,kuerzel_de,kuerzel_en,kuerzel_fr,kuerzel_it) ';
      $insert_redirect .= 'VALUES ('.$navid_kap.','.$nav_id.',0,"'.$kap_bez_low.'","'.$kap_bez_low.'","'.$kap_bez_low.'","'.$kap_bez_low.'")';		

      // Insert einer neuen Seite zum gerade eingefuegten Unternavigationspunkt
      $seiten_id = $this->getNextSeitenid();
      $insert_page  = 'INSERT INTO '.$this->mPrefix.'seiten ';
      $insert_page .= '(seiten_id,nav_id,nummer,kurztitel_de,kurztitel_en,kurztitel_fr,kurztitel_it,galerie) ';
      $insert_page .= 'VALUES ('.$seiten_id.','.$nav_id.',1,"'.$kap_bez.'","'.$kap_bez.'","'.$kap_bez.'","'.$kap_bez.'","n")';

      if ($db->query($insert_navi) && $db->query($insert_redirect) && $db->query($insert_page))
      {
          $this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_NAVI_SEITE_ANGELEGT'],$kap_bez);
      } else {
          $this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_ANGELEGT'],$kap_bez);
      } 
      return $this->mMeldung;
	}

	// Neuen Hauptnavigationspunkt eroeffnen
	public function neuer_kap() 
	{				
      global $db;
      // naechst mögliche Kap, Navid und Seitenid ermitteln (um 1 erhoeht) 
      $neuer_kap  = $this->getNextKap();
      $neuer_nid  = $this->getNextNavid();
      $neuer_sid  = $this->getNextSeitenid();
      $ukap       = 0;
      if ($neuer_sid < 100) { $neuer_sid = sprintf('%03s', $neuer_sid); }      
      $bildpfad .= 'navi_'.$neuer_nid;  // an den Bildpfad wird neu die Navid zugefuegt, so ist es bestimmt einmalig!
      $kap_bez  = $bildpfad;
      $kap_bez_low = strtolower($kap_bez);
      $domain   = $bildpfad;

      // Unterdirectory fuer diese Seite bestimmen und dann auch gleich anlegen
      $dir_to_create = MEDIA_ROOT .'/'.$bildpfad;
      if (!is_dir($dir_to_create) && mkdir($dir_to_create)){ 
          $this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DIR_ANGELEGT'], $bildpfad);		
      } elseif (is_dir($dir_to_create)) {
          $this->mMeldung[] = 'warning'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DIR_EXISTS'], $bildpfad);		
      } elseif (!is_dir($dir_to_create)) {
          $this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DIR_NICHT_ANGELEGT'], $bildpfad);		
      }
      // Insert des neuen Navigationspunktes plus Insert einer zugehoerigen Seite plus Insert Eintrag in cms_redirect
      $insert_navi = 'INSERT INTO '.$this->mPrefix.'navigation ';
      $insert_navi .= '(nav_id,domain,kap,ukap,bildpfad,bezeich_de,bezeich_en,bezeich_fr,bezeich_it,';
      $insert_navi .= 'kuerzel_de,kuerzel_en,kuerzel_fr,kuerzel_it,aktiv,nav_type) ';
      $insert_navi .= 'VALUES ('.$neuer_nid.',"'.$domain.'",'.$neuer_kap.','.$ukap.',"'.$bildpfad.'",';
      $insert_navi .= '"'.$kap_bez.'","'.$kap_bez.'","'.$kap_bez.'","'.$kap_bez.'",';
      $insert_navi .= '"'.$kap_bez_low.'","'.$kap_bez_low.'","'.$kap_bez_low.'","'.$kap_bez_low.'","n","H")';

      // Insert neuer Eintrag in die Tabelle cms_redirect (SMURL) 
      $insert_redirect  = 'INSERT INTO '.$this->mPrefix.'redirect (navid,subid,pagid,kuerzel_de,kuerzel_en,kuerzel_fr,kuerzel_it) ';
      $insert_redirect .= 'VALUES ('.$neuer_nid.',0,0,"'.$kap_bez_low.'","'.$kap_bez_low.'","'.$kap_bez_low.'","'.$kap_bez_low.'")';

      // Insert einer neuen Seite zum gerade eingefuegten Unternavigationspunktes
      $insert_seite  = 'INSERT INTO '.$this->mPrefix.'seiten (seiten_id,nav_id,nummer,';
      $insert_seite .= 'kurztitel_de,kurztitel_en, kurztitel_fr, kurztitel_it,galerie) ';
      $insert_seite .= 'VALUES ('.$neuer_sid.','.$neuer_nid.',1,"'.$kap_bez.'","'.$kap_bez.'","'.$kap_bez.'","'.$kap_bez.'","n")';

      if ($db->query($insert_navi) && $db->query($insert_redirect) && $db->query($insert_seite))
      {
          $this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_NAVI_SEITE_ANGELEGT'],$kap_bez);
      } else {
          $this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_ANGELEGT'],$kap_bez);
      } 
      return $this->mMeldung;		
	}	
	
    // den naechst möglichen Navigationspunkt-Kap ermitteln
	private function getNextKap() 
    {
      global $db;
      $abfrage  = 'SELECT MAX(kap) FROM '.$this->mPrefix.'navigation ORDER BY domain'; 		
      $kap      = $db->queryOne($abfrage)+1;  
      return $kap;
    }

    // den naechst möglichen UKap ermitteln
	private function getNextUkap($kap) 
    {
      global $db;
      $abfrage  = 'SELECT MAX(ukap) FROM '.$this->mPrefix.'navigation WHERE kap='.$kap.' ORDER BY ukap'; 		
      $ukap     = $db->queryOne($abfrage)+10;  
      return $ukap;
    }

    // die nächst mögliche NavigationsId ermitteln
	private function getNextNavid() 
    {
      global $db;
      $abfrage 	= 'SELECT MAX(nav_id) FROM '.$this->mPrefix.'navigation';
      $nav_id 	= $db->queryOne($abfrage)+1;
      return $nav_id;
    }

    // die nächst mögliche SeitenId ermitteln
	private function getNextSeitenid() 
    {
      global $db;
      $abfrage 	 = 'SELECT MAX(seiten_id) FROM '.$this->mPrefix.'seiten';
      $seiten_id = $db->queryOne($abfrage)+1;
      return $seiten_id;
    }
       
    
	/* Einen Navigationspunkt loeschen
	 * 0. Eintrag in Index-Tabelle cms_redirect loeschen
	 * 1. Unternavigationspunkt wird geloescht
	 * 2. die restlichen Ukaps werden "hinaufgeschoben" --> Reihenfolge wieder herstellen
	 * 3. die zugehoerige Seite wird geloescht
	 */ 
	public function delete_navigationspunkt($row, $msg)  
	{				
      global $db;
      $nav_id = $row['nav_id'];
      $seite  = $row['bezeichnung'];
      $kap    = $row['kap'];
      $ukap   = $row['ukap'];
      $navid  = 0;
      $delete = '';

      // Erst sehen, ob der Eintrag in der Index-Tabelle nicht schon geloescht wurde
      $abfrage = 'SELECT nav_id FROM '.$this->mPrefix.'navigation WHERE kap='.$kap.' AND ukap=0';
      $navid   = $db->queryOne($abfrage);		
      // Eintrag in Index-Tabelle cms_redirect l�schen
      if ($kap !=0 && $ukap !=0) {
          // Wenn navid gefunden, wird der Index-Eintrag zum Unternavigationspunkt geloescht
          if ($navid != 0) { $delete  = 'DELETE FROM '.$this->mPrefix.'redirect WHERE navid='.$navid.' AND subid='.$nav_id.' AND pagid=0'; }
      } else {
          // es wird das ganze Kapitel geloescht, also alle Eintraege zur nav_id loeschen
          if ($navid != 0) { $delete  = 'DELETE FROM '.$this->mPrefix.'redirect WHERE navid='.$nav_id; }
      }
      if ($delete !='') { $db->query($delete); }

      $delete = 'DELETE FROM '.$this->mPrefix.'navigation WHERE nav_id='.$nav_id; 
      if ($ukap != 0) {  // Unternavigationspunkt
          $update = 'UPDATE '.$this->mPrefix.'navigation SET ukap=(ukap-10) WHERE kap='.$kap.' AND ukap >'.$ukap;
      } else {  // Hauptnavigationspunkt
          $update = 'UPDATE '.$this->mPrefix.'navigation SET kap=(kap-1) WHERE kap >'.$kap;
      }
      $delete_page = 'DELETE FROM '.$this->mPrefix.'seiten WHERE nav_id='.$nav_id;		
      if ($db->query($delete) && $db->query($update) && $db->query($delete_page))
      {
          $msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_NAVI_SEITE_GELOESCHT'], $seite);
      } else {			
          $msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_GELOESCHT'], $seite);
      }
      return $msg;
	}
	
	/* Eine Navigationspunkt editieren / bearbeiten */
	public function read_navi_page_by_seiten_id($seiten_id)
	{
      global $db;
      $read_page = 'SELECT * FROM '.$this->mPrefix.'seiten WHERE seiten_id='.$seiten_id;
      $page = $db->queryRow($read_page);
      return $page;
	}
            
	/* Eine Navigationspunkt editieren / bearbeiten */
	public function read_navi_page($nav_id)
	{
      global $db;
      $read_page = 'SELECT * FROM '.$this->mPrefix.'seiten WHERE nav_id='.$nav_id;
      $page = $db->queryRow($read_page);
      return $page;
	}
	
    /* Einen Navigationspunkt plus Seite kopieren */
	public function copy_navi_page($navigation, $navi_page)
	{
      global $db, $genmain;
      // 1. den Hauptnavigationspunkt vorbereiten
      $row_navi  = $this->prepare_copy_kap($navigation);
      // 2. die Seite zum Hauptnavigationspunkt vorbereiten
      $row_seite = $this->prepare_copy_seite($navi_page);

      // die Kopie soll direkt nach dem zu kopierenden Satz erscheinen. Dazu müssen die Kap-Nummern um 1 erhoeht werden
      // welche nach der Kopie folgen.
      $kap = $row_navi['kap'];
      $update_kap  = 'UPDATE '.$this->mPrefix.'navigation SET kap=(kap+1) WHERE kap>'.$kap; 

      // Insert des neuen Navigationspunktes plus Insert einer zugehoerigen Seite plus Insert Eintrag in cms_redirect
      $row_navi['kap'] = $kap+1; // Kap um 1 erhoehen 
      $insert_navi  = 'INSERT INTO '.$this->mPrefix.'navigation ';
      $insert_navi .= '(nav_id,domain,kap,ukap,bildpfad,bezeich_de,bezeich_en,bezeich_fr,bezeich_it,';
      $insert_navi .= 'kuerzel_de,kuerzel_en,kuerzel_fr,kuerzel_it,aktiv,start,nav_type) ';
      $insert_navi .= 'VALUES ('.$row_navi['nav_id'].',"'.$row_navi['domain'].'",'.$row_navi['kap'].','.$row_navi['ukap'].',"'.$row_navi['bildpfad'].'",';
      $insert_navi .= '"'.$row_navi['bezeich_de'].'","'.$row_navi['bezeich_en'].'","'.$row_navi['bezeich_fr'].'","'.$row_navi['bezeich_it'].'",';
      $insert_navi .= '"'.$row_navi['kuerzel_de'].'","'.$row_navi['kuerzel_en'].'","'.$row_navi['kuerzel_fr'].'","'.$row_navi['kuerzel_it'].'","n",';
      $insert_navi .= '"'.$row_navi['start'].'","'.$row_navi['nav_type'].'")';
      
      // Insert neuer Eintrag in die Tabelle cms_redirect (SMURL) 
      $kuerzel_de = $genmain->format_kuerzel($row_navi['kuerzel_de']);
      $kuerzel_en = $genmain->format_kuerzel($row_navi['kuerzel_en']);
      $kuerzel_fr = $genmain->format_kuerzel($row_navi['kuerzel_fr']);
      $kuerzel_it = $genmain->format_kuerzel($row_navi['kuerzel_it']);
      $insert_redirect  = 'INSERT INTO '.$this->mPrefix.'redirect (navid,subid,pagid,kuerzel_de,kuerzel_en,kuerzel_fr,kuerzel_it) '; 
      $insert_redirect .= 'VALUES ('.$row_navi['nav_id'].',0,0,"'.$kuerzel_de.'","'.$kuerzel_en.'","'.$kuerzel_fr.'","'.$kuerzel_it.'")';

      // Insert einer neuen Seite zum gerade eingefuegten Navigationspunkt
      $insert_seite  = 'INSERT INTO '.$this->mPrefix.'seiten ';
      $insert_seite .= '(seiten_id,nav_id,nummer,kurztitel_de,kurztitel_en,kurztitel_fr,kurztitel_it,';
      $insert_seite .= 'zusatz_de,zusatz_en,zusatz_fr,zusatz_it,template,modul,bild1,galerie,';
      $insert_seite .= 'inhalt1_de,inhalt1_en,inhalt1_fr,inhalt1_it,inhalt2_de,inhalt2_en,inhalt2_fr,inhalt2_it) '; 
      $insert_seite .= 'VALUES ('.$row_seite['seiten_id'].','.$row_seite['nav_id'].','.$row_seite['nummer'].',';
      $insert_seite .= '"'.$db->escape($row_seite['kurztitel_de']).'","'.$db->escape($row_seite['kurztitel_en']).'",';
      $insert_seite .= '"'.$db->escape($row_seite['kurztitel_fr']).'","'.$db->escape($row_seite['kurztitel_it']).'",';
      $insert_seite .= '"'.$db->escape($row_seite['zusatz_de']).'","'.$db->escape($row_seite['zusatz_en']).'",';
      $insert_seite .= '"'.$db->escape($row_seite['zusatz_fr']).'","'.$db->escape($row_seite['zusatz_it']).'",';
      $insert_seite .= $row_seite['template'].','.$row_seite['modul'].',"'.$row_seite['bild1'].'","'.$row_seite['galerie'].'",';
      $insert_seite .= '"'.$db->escape($row_seite['inhalt1_de']).'","'.$db->escape($row_seite['inhalt1_en']).'",';
      $insert_seite .= '"'.$db->escape($row_seite['inhalt1_fr']).'","'.$db->escape($row_seite['inhalt1_it']).'",';
      $insert_seite .= '"'.$db->escape($row_seite['inhalt2_de']).'","'.$db->escape($row_seite['inhalt2_de']).'",';
      $insert_seite .= '"'.$db->escape($row_seite['inhalt2_fr']).'","'.$db->escape($row_seite['inhalt2_it']).'")';

      if ($db->query($update_kap) && $db->query($insert_navi) && $db->query($insert_redirect) && $db->query($insert_seite))
      {
          $this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_NAVI_SEITE_ANGELEGT'], $row_navi['kuerzel']);
      } else {
          $this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_ANGELEGT'], $row_navi['kuerzel']);
      } 
      return $this->mMeldung;      
    }
   
    /* den zu kopierenden Hauptnavigationspunkt (=Kap) vorbereiten */
    private function prepare_copy_kap($navigation)
    {
      $row_navi = $navigation;
      $row_navi['nav_id']       = $this->getNextNavid();
      $row_navi['bezeich_de']  = 'Copy: '. $row_navi['bezeich_de'];
      $row_navi['bezeich_en']  = 'Copy: '. $row_navi['bezeich_en'];
      $row_navi['bezeich_fr']  = 'Copy: '. $row_navi['bezeich_fr'];
      $row_navi['bezeich_it']  = 'Copy: '. $row_navi['bezeich_it'];
      $row_navi['kuerzel_de']  = $row_navi['bezeich_de'];
      $row_navi['kuerzel_en']  = $row_navi['bezeich_en'];
      $row_navi['kuerzel_fr']  = $row_navi['bezeich_fr'];
      $row_navi['kuerzel_it']  = $row_navi['bezeich_it'];
      $row_navi['bildpfad']    = 'navi_'.$row_navi['nav_id'];
      return $row_navi;
    }
    
    /* die zu kopierende Seite zum Hauptnavigationspunkt (=Kap) vorbereiten */
    private function prepare_copy_seite($navi_page)
    {
//      $row_seite  = $navi_page->fetchRow(MDB2_FETCHMODE_ASSOC);
      $row_seite  = $navi_page;
      $row_seite['seiten_id'] = $this->getNextSeitenid();
      $row_seite['nav_id']    = $this->getNextNavid();
      $row_seite['kurztitel_de'] = 'Copy: '.$row_seite['kurztitel_de'];
      $row_seite['kurztitel_en'] = 'Copy: '.$row_seite['kurztitel_en'];
      $row_seite['kurztitel_fr'] = 'Copy: '.$row_seite['kurztitel_fr'];
      $row_seite['kurztitel_it'] = 'Copy: '.$row_seite['kurztitel_it'];
      return $row_seite;
    }
         
    /* Eine Navigationspunkt-Seite speichern.
     * Der Save erfolgt entweder mit der Sprache in $_POST['sprache'] = 
     * die gewählte Sprache. Der Benutzer hat dann auf den Button Sichern geklickt,...
     * oder mit der Sprache in $_POST['langu_sav'] = dieses Feld wird gefüllt, 
     * wenn die Sprach-Selectbox angeklickt wird. Wird die Sprache gewechselt, 
     * erfolgt per Ajax ein Save! 
     * @param: $seiten_id = die ID der zu speichernden Seite
     * @param: $_POST = alle Felder aus dem Formular 
     * @return: $msg = Erfolgs- oder Misserfolgsmeldung
     */
	public function save_navi_page($seiten_id)
	{
      global $db, $general;
      $memberlogin = isset($_POST['memberlogin']) ? $_POST['memberlogin'] : '';
      // der Save erfolgt in der Sprache, welche zur Zeit aktiv ist
      $language = $_POST['langu_sav'] != '' ? strtolower($_POST['langu_sav']) : strtolower($_POST['sprache']);
      $update = 'UPDATE '.$this->mPrefix.'seiten SET';
      $update .= ' template='.$_POST['templates'].',';
      $update .= ' modul='.$_POST['modules'].',';
      $update .= ' memberlogin="'.$memberlogin.'",';
      $update .= ' kurztitel_'.$language.'="'.$db->escape($_POST['kurztitel']).'",';
      $update .= ' zusatz_'.$language.'="'.$db->escape($_POST['zusatztext']).'",';
      $update .= ' inhalt1_'.$language.'="'.$db->escape($_POST['inhalt1']).'",';
      $update .= ' inhalt2_'.$language.'="'.$db->escape($_POST['inhalt2']).'",';
      $update .= ' bild1="'.$db->escape($_POST['thumb1']).'",';
      $update .= ' galerie="'.$db->escape($_POST['galerie_aktiv']).'"';
      $update .= ' WHERE seiten_id='.$seiten_id ;
      
      $affected =& $db->exec($update);
      if (PEAR::isError($affected)) {
          $msg[] = 'error'; $msg[] = $affected->getMessage().' '.$affected->getDebugInfo();
      } else {
          $msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_NAVI_SEITE_GESPEICHERT'], $_POST['kurztitel']);
      }	
      // Ausgabe der Message abhängig, ob der Request per Ajax oder normal erfolgt.
      if (isset($_POST['langu_sav']) && $_POST['langu_sav'] != '') {
        echo $msg[1].' ('.$_POST['langu_sav'].')';
      } else {
      }
      return $msg;        
  }

  /* Einen Navigationspunkt updaten. Dabei koennen einzelne Felder dynamisch uebergeben werden 
      Aufruf: bei Action = naviSave und aktivSave
  */
  public function navi_update($nav_id, $feldname, $feldvalue, $language="de")
  {
      global $db, $general;
      // bei bezeichnung wird auch kuerzel upgedatet
      if ($feldname == 'bezeichnung') {
          $bezeichnung = $feldvalue;
          $kuerzel = str_replace(' ', '', $bezeichnung);

          // es wird auch gleich der Titel in der Seite angepasst
          $update = 'UPDATE '.$this->mPrefix.'seiten SET kurztitel_'.$language.'="'.$bezeichnung.'" WHERE nav_id='.$nav_id;
          $affected =& $db->exec($update);
          if (PEAR::isError($affected)) { echo $affected->getMessage().' '.$affected->getDebugInfo(); }
      }

      if ($feldname == 'bezeichnung') {
          $bezeichnung = $feldvalue;
          $kuerzel     = str_replace(' ','',$bezeichnung);
          $update = 'UPDATE '.$this->mPrefix.'navigation SET kuerzel_'.$language.'="'.$kuerzel.'"';
          $update .= ', bezeich_'.$language.'="'.$bezeichnung.'"';
          $update .= ' WHERE nav_id='.$nav_id;
          $affected =& $db->exec($update);
          if (PEAR::isError($affected)) { echo $affected->getMessage().' '.$affected->getDebugInfo(); }
      } else {
          $update = 'UPDATE '.$this->mPrefix.'navigation SET '.$feldname.'="'.$feldvalue.'" WHERE nav_id='.$nav_id;
          $affected =& $db->exec($update);
          if (PEAR::isError($affected)) { echo $affected->getMessage().' '.$affected->getDebugInfo(); }
      }

      // Responsetexte zurückgeben
      switch ($feldname) {
        case 'start':
          $response = $feldvalue.'/';
          $response .=  $feldvalue == 'j' ? $GLOBALS['TEXTE']['JA'] : $GLOBALS['TEXTE']['NEIN'];
          break;
        case 'nav_type';
          $response = $feldvalue.'/';
          $response .= $general->set_navtype_title($feldvalue); // Text zu H, V, oder S
          break;
        case 'aktiv';
          $response = $feldvalue.'/';
          $response .=  $feldvalue == 'j' ? $GLOBALS['TEXTE']['TEXT_AKTIV'] : $GLOBALS['TEXTE']['TEXT_INAKTIV'];
          break;
        default:
          $response = $feldvalue;
          break;
      }
      
      return $response;
	}
	
    /* Navigation per Ajax neu Sortieren (Sortable) 
     * der Array $srtids beinhaltet als Values die navid's
     * 
     * @param: $sortids - die Id's der Elemente, welche sortiert werden sollen
     * @return: Message, ob der Sort funktioniert hat, oder eben nicht.
     */
    public function navi_sortieren($srtids) {
      global $db;
      $success=$error=0;
      // aktuelles Menu einlesen und in Array pro Kap und Ukap ordnen
      $navids = $this->navigation_laden();
      while ($row = $navids->fetchRow(MDB2_FETCHMODE_ASSOC)) {
        // Navigation in Array aufteilen mit Kap bzw. Kap/Ukap
        if ($row['ukap'] == 0) { 
          $kaps[$row['kap'].'_'.$row['ukap']] = $row['nav_id'];           
        } else {
          $ukaps[$row['kap'].'_'.$row['ukap']] = $row['nav_id'];          
        }
      }
      
      // aus den neu geordneten Sortid's einen Array bilden, in dem nur Kaps ohne Ukaps enthalten sind
      $i = 0;
      foreach ($srtids as $index => $navid) {
        if ($navid != '') {
          $key = array_search($navid,$kaps);
          list($kap,$ukap) = explode('_',$key);
          if ($kap != '' && $ukap != '') {
            $i++;
            $newarr[$navid] = $i.'_'.$key;           
          }
        }
      }
      // Jetzt endlich wird die DB upgedatet
      // Loop über den Kaps-Array, innerhalb des Loops wird ein Loop über den Ukaps-Array durchlaufen
      // um ev. vorhandene Ukaps zu einem Kap ebenfalls upzudaten
      foreach ($newarr as $navid => $value) {
        list($newkap, $kap) = explode('_',$value);
        $update = 'UPDATE '.$this->mPrefix.'navigation SET kap='.$newkap.' WHERE nav_id='.$navid;
        if ($db->query($update)) { $success++; } else { $error++; }
        // jetzt noch ev. vorhandene Ukaps updaten
        if (count($ukaps) > 0) {
          foreach ($ukaps as $kap_ukap => $navid) {
            list($_kap,$_ukap) = explode('_',$kap_ukap);
            if ($_kap == $kap) {
              $update = 'UPDATE '.$this->mPrefix.'navigation SET kap='.$newkap.' WHERE nav_id='.$navid;
              if ($db->query($update)) { $success++; } else { $error++; }            
            }
          }
        }
      }
      if ($error != 0) {echo $GLOBALS['MESSAGES']['MSG_NICHT_NEU_SORTIERT'] . "<br />\n";}
      else { echo $GLOBALS['MESSAGES']['MSG_NEU_SORTIERT'];	}      
    }
    
	/********************************************************************************/
	/* Funktionen zum Update der Bildpfade nach einem DB-Wechsel
	/********************************************************************************/
	/* Update der Bildpfade nach einem DB-Wechsel */
	public function update_bildpfade() 
	{
      global $db, $msg;
      $msg[] = 'message'; $msg[] = $GLOBALS['CMS']['MENU01'];		
      $newmedia = '/media_'.WEBSITE.'/';
//		$newpath  = ROOTDIR.$newmedia;
      $seiten = $this->alle_seiten_laden();
      if (count($seiten) > 0) {
        while ($row = $seiten->fetchRow(MDB2_FETCHMODE_ASSOC))  
        {
          $seite = $row['kurztitel'];
          $inhalt1 = $row['inhalt1'];
          $inhalt2 = $row['inhalt2'];
          $bild1 = $row['bild1'];
          if (stristr($inhalt1,'<img')) { $inhalt1 = str_replace('/media/',$newmedia,$row['inhalt1']); }
          if (stristr($inhalt2,'<img')) { $inhalt2 = str_replace('/media/',$newmedia,$row['inhalt2']); }
          if (stristr($bild1,'/media/'))  { $bild1   = str_replace('/media/',$newmedia,$row['bild1']); }
          {
            /* Update nur, falls noetig! */
            if ($inhalt1 != $row['inhalt1'] || $inhalt2 != $row['inhalt2'] || $bild1 != $row['bild1'])
            {
                $update = 'UPDATE '.$this->mPrefix.'seiten SET';
                $update .= ' inhalt1="'.$db->escape($inhalt1).'",';
                $update .= ' inhalt2="'.$db->escape($inhalt2).'",';
                $update .= ' bild1="'.$db->escape($bild1).'"';
                $update .= ' WHERE seiten_id = '.$row[seiten_id];
                $affected =& $db->exec($update);
                if (PEAR::isError($affected))
                {
                    $msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_GESPEICHERT'], $seite);
                } else {
                    $msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_NAVI_SEITE_GESPEICHERT'], $seite);
                }
            } else {
                $msg[] = 'neutral'; $msg[] = 'OK: '. $seite;						
            }
          }
        }
        return $msg;
      }	
	}
	
	/* Alle Seiten aus der DB lesen */
	private function alle_seiten_laden() 
	{
      global $db;
      $query = 'SELECT * from '.$this->mPrefix.'seiten';
      return $db->query($query);	
	}
	
} // End of Class

?>
