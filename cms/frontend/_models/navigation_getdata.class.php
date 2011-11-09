<?php
/**
 * ----------------------------------------------------------
 * (c) 2008  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Model-Klasse für die Beschaffung der Navigation (horizontal und vertikal)
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erwähnt wird
 * @version     1.0 | 2008-05-03
 */

class navigationGetData
{
	private $mDb;
	private $mPrefix;	

    /* Constructor */
    function __construct($db) 
    {
		$this->mPrefix 	= TABLE_PREFIX;
		$this->mDb 		= $db;
    }                                                                          

    /* Neue Methoden implementieren */
    
	/* Erst einmal sämtliche aktiven Navigationsdaten (Haupt- und Unterknoten) einlesen 
		@return: $navigation - Array mit allen Navigationselementen
	*/
	public function get_complete_navigation()
	{
		$db = $this->mDb;
		$abfrage = 'SELECT nav_id, kap, ukap, kuerzel, bezeichnung, nav_type 
					  FROM '.$this->mPrefix.'navigation 
					 WHERE aktiv = "j" 
					 ORDER BY kap,ukap';
		$navigation = $db->query($abfrage);
		return $navigation;
	}

	/* ein einzelnes Feld für eine bestimmte NavID aus der DB lesen 
		@params: $akt_navid - Aktuelle Navigations-ID
		@params: $field		- Feld, welches gelesen werden soll
		@return: $value		- Wert des gelesenen Feldes
	*/ 	
	public function get_home_navid($akt_navid)
	{
		global $db;
		$abfrage = 'SELECT nav_id FROM '.$this->mPrefix.'navigation 
					 WHERE aktiv="j" 
					   AND nav_id='.$akt_navid;
		$value = $db->queryOne($abfrage);

		if ($value == null) {
			$abfrage = 'SELECT nav_id FROM '.$this->mPrefix.'navigation 
						 WHERE aktiv="j" 
						   AND ukap=0
						 ORDER BY kap, ukap';
			$value = $db->queryOne($abfrage);			
		}  
		return $value;
	}
	

	/* ein einzelnes Feld für eine bestimmte NavID aus der DB lesen 
		@params: $akt_navid - Aktuelle Navigations-ID
		@params: $field		- Feld, welches gelesen werden soll
		@return: $value		- Wert des gelesenen Feldes
	*/ 	
	public function get_field_value($akt_navid, $field)
	{
		global $db;
		$abfrage = 'SELECT ' .$field. ' FROM '.$this->mPrefix.'navigation 
					 WHERE aktiv="j" 
					   AND nav_id='.$akt_navid;
		$value = $db->queryOne($abfrage);
		return $value;
	}
	

	/* Die Anzahl ID's mit Nav_type 'S' lesen 
		@return: $anz_service - Anzahl ID's
	*/ 	
	public function get_anz_services()
	{
		global $db;
		$abfrage = 'SELECT COUNT(*) FROM '.$this->mPrefix.'navigation 
					 WHERE aktiv="j" 
					   AND nav_type="S"';
		$anz_service = $db->queryOne($abfrage);
		return $anz_service;
	}
	
	/* Einen Array mit allen Haupt-Navigationspunkten füllen 
		@params: $akt_navid - Aktuelle Navigations-ID
	*/ 	
	public function fill_nav_array($akt_navid)
	{
		global $nav_array;
		global $unav_array;
		global $navigation;
		global $n_id;
		
		$temp = 'xxx';
		$n_id = $akt_navid;  // ID des aktuellen Nav-Eintrages 
		$akt_type = '';
		
		while ($eintrag = $navigation->fetchRow())
		{
			if ($_SESSION['debugging'] === true) { echo $eintrag['kuerzel'] .' '; }
			if ($temp != $eintrag['kap'])  { $temp = urlencode($eintrag['kuerzel']); }
		
			if ($eintrag['ukap'] == 0)
			{
				$akt_type = $eintrag['nav_type'];
				// für die Hauptnavigation werden kap und bezeichnung in einen String gespeichert, der beim Anzeigen
				// der Navigation wieder verwendet wird
				$nav_array[$eintrag['nav_id']] = $eintrag['kap'].'-'.$eintrag['bezeichnung'];
				if ($eintrag['nav_id'] == $akt_navid)
				{
					$n_id = $eintrag['nav_id'];
					if ($_SESSION['debugging'] === true) { echo '$n_id=' . $n_id . ' '; }
				}
			}
			else  
			{
				// für die Unternavigation werden kap, ukap und bezeichnung in einen String gespeichert, der beim Anzeigen
				// der Unternavigation wieder verwendet wird
			    $unav_array[$eintrag['nav_id']] = $eintrag['kap'].'-'.$eintrag['ukap'].'-'.$eintrag['bezeichnung'].'-'.$akt_type;
				if ($eintrag['kuerzel'] == $akt_ukap)
				{
					$n_id = $eintrag['nav_id'];
					if ($_SESSION['debugging'] === true) { echo '$n_id=' . $n_id . ' '; }
				}
			}
		}
	}
}
?>
