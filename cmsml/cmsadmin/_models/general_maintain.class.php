<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse fuer die Verwaltung der Navigation und zugehoeriger Seiten
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erwaehnt wird
 * @version     1.0 | 2007-07-14
 * @package     CMSADMIN/General
 * 
 */

class generalMaintain
{
	private $mPrefix;
	private $mDb;
	private $mMeldung;
	
	
    /* Constructor */
    function __construct($db) 
    {
		$this->mPrefix = TABLE_PREFIX;
		$this->mDb = $db;
		$this->mMeldung = array();
    }                                                                          

    /* Neue Methode implementieren */	
    	
	/* Verfuegbare Template einlesen */
	public function read_templates() 
	{
		$db = $this->mDb;
		$query = 'SELECT * FROM '.$this->mPrefix.'templates ORDER BY template_id';
		$templates = $db->query($query);
		return $templates; 	
	}
	
	/* Verfuegbare Module einlesen */
	public function read_modules() 
	{
		$db = $this->mDb;
		$query = 'SELECT * FROM '.$this->mPrefix.'modules';
		$modules = $db->query($query);
		return $modules; 	
	}
	
	/* Unterkapitel zu einer Area oder zu einer page_id lesen 
		falls das Kuerzel leer bleibt, werden alle Navigationspunkte gelesen
	*/
	public function read_navi_ukaps($area='') 
	{
		$area_ukaps = array();
		global $db;
		$where_clause = $area != '' ? 'WHERE domain="'.$area.'"' : '';
		$query = 'SELECT * FROM '.$this->mPrefix.'navigation '.$where_clause.' ORDER BY kap, ukap';
		$navi_ukaps = $db->query($query);			
		return $navi_ukaps;
	}
		
	/* Unterkapitel zu einer Area (expos, events, k�nstler) oder zu einer page_id lesen */
	public function read_navi_ukaps_old($action, $page_id=0, $area='') 
	{
		$kuerzel = '';
		$area_ukaps = array();
		$db = $this->mDb;		
		
		switch ($action) {
			case 'create':
				if ($area != '') {
					// Array mit allen nav_ids aus art_pages, die domain like area haben
					$navid_array = $GLOBALS['seite']->read_fieldarray_from_pages('nav_id', 'domain', $area);
					// WHERE-clause "nav_id=30 or nav_id=31 ..".etc. aufbauen
					if (count($navid_array >0)) {
						$where_navid = '';
						while ($row = $navid_array->fetchRow(MDB2_FETCHMODE_ASSOC)) {							
							$i++;
							if ($i == 1) {
								$where_navid = 'nav_id='.$row['nav_id']; 
							} else {								
								$where_navid .= ' OR nav_id='.$row['nav_id']; 
							}
						}
						if ($where_navid != '') {
							$sql = 'SELECT * FROM '.$this->mPrefix.'navigation WHERE '.$where_navid; 
							$navi_ukaps = $db->query($sql);
						} else {
							// Wenn noch keine Pages erfasst wurden, soll wenigstens die Hauptnavigation angegeben werden
							$sql = 'SELECT * FROM '.$this->mPrefix.'navigation WHERE '.$where_navid; 
							$navi_ukaps = $db->query($sql);							
						}
					}
				}
				break;
			default:  // edit
				if ($page_id > 0) {
					// anhand der Page_id die Navigations-Id aus art_pages lesen
					$nav_id = $GLOBALS['seite']->read_single_value_from_pages('nav_id', $page_id);
				}
				if ($nav_id > 0) {
					// alle Unternavigationspunkte zur Kap bestehen
					$sql = 'SELECT * FROM '.$this->mPrefix.'navigation 
							 WHERE kap=(SELECT kap FROM '.$this->mPrefix.'navigation WHERE nav_id='.$nav_id.')
							   AND aktiv="j"';
					$navi_ukaps = $db->query($sql);
				}			
		}	
		
		return $navi_ukaps;
	}
	
	
	/* Funktion zum Auslesen der Festwerte eines Feldes vom Type enum oder set 
		@params: $table	- zu lesende Tabelle
		@params: $field - zu lesendes Feld
		@return: $enum - Array mit allen Festwerten 
	*/ 
	public function read_enum($table, $feld) 
	{
		global $db;
		$query 	= 'SHOW COLUMNS FROM '.$table.' LIKE "'.$feld.'"';
		$row	= $db->queryRow($query);
		if ($db->queryOne('SELECT FOUND_ROWS()') > 0) {
			$enum 	= explode("','",preg_replace("/(enum|set)\('(.+?)'\)/","\\2",$row['type']));
		}
		return $enum;
	}
	
    /* Kuerzel formatieren für Speicherung in cms_redirect */
    public function format_kuerzel($text) 
    {
    	$text = convert_umlaute2(utf8_decode($text));
		$kuerzel = str_replace(' ','_',$text);
		return strtolower($kuerzel);
    }    

} 


?>
