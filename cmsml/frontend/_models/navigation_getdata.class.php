<?php
/**
 * ----------------------------------------------------------
 * (c) 2008  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Model-Klasse f�r die Beschaffung der Navigation (horizontal und vertikal)
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
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
    
    
    /* Erst einmal saemtliche aktiven Navigationsdaten (Haupt- und Unterknoten) einlesen 
		@return: $navigation - Array mit allen Navigationselementen
	*/
	public function get_complete_navigation()
	{
		global $db;
		$abfrage = 'SELECT *
					  FROM '.$this->mPrefix.'navigation 
					 WHERE aktiv = "j" 
					 ORDER BY kap,ukap';
		$navigation = $db->query($abfrage);
		return $navigation;
	}

    /* ein einzelner Datensatz aus der Navigation lesen 
     * @params: $navid
     * $return: $navigation - der Row aus der DB
     */
    public function get_single_navigation($navid)
    {
      global $db;
      $abfrage = 'SELECT * FROM '.$this->mPrefix.'navigation 
					 WHERE nav_id='.$navid.' AND aktiv = "j"';
      $navigation = $db->queryRow($abfrage);
      return $navigation;
    }
    
	/* die URL für die Startseite (Link im Headerbereich) zusammensetzen
     * 1. muss die niedrigste NavId ermittelt werden
     * 2. muss nachgelesen werden, ob es Unterseiten zur NavId gibt, 
     *    falls SUBNAV_SOFORT = 'ja' ist.
     * 3. Abhängig davon, ob SMURL aktiviert ist, wird die URL zusammengesetzt 
     * @return: $url	- URL der Startseite
	*/ 	
    public function get_startseite() 
    {
      global $redirect;
      $url = ''; $navid = $subid = 0;
//      Alternativ könnte auch die Seite mit der niedrigsten Kap-Nr gelesen werden
//      $navi_kap = $this->get_single_navi_with_lowest_kap();
      $navid = $this->get_home_navid();      
      $navi_kap = $this->get_single_navigation($navid);
      // falls direkt in eine Unternavigation verzweigt werden soll
      if (SUBNAV_SOFORT == 'ja') {
        if (is_array($navi_kap)) {
          // es wurde also ein DS gefunden, Jetzt schauen, ob es UNAV's gibt
          $navi_ukap = $this->get_single_navi_with_ukap($navi_kap['kap']);     
        }
        if (is_array($navi_ukap)) { $subid = $navi_ukap['nav_id']; }
      }
      // URL zusammensetzen, abhängig von SMURL
      if (SMURL == 'ja') {
        $url = $redirect->set_navlink($navid,$subid);
      } else {
        $url = ROOTDIR.'?navid='.$navid;
        if ($subid > 0) { $url .= '&subid='.$subid; }
      }
      return $url;
    }
    
    /* ein einzelner Datensatz aus der Navigation lesen 
     * $return: $navigation - der Row aus der DB
     */
    public function get_single_navi_with_lowest_kap() 
    {
      global $db;
      $abfrage = 'SELECT * FROM '.$this->mPrefix.'navigation 
                   WHERE aktiv="j" HAVING MIN(kap)'; 
      $navi_kap = $db->queryRow($abfrage);
      return $navi_kap;      
    }
    
    
    
    /* ein einzelner Datensatz aus der Navigation lesen mittels KAP, 
     * um festzustellen ob es Unterkapitel gibt
     * @params: $kap
     * $return: $navi_ukap - der Row aus der DB mit der ersten Ukap
     */
    public function get_single_navi_with_ukap($kap, $ukap=10) 
    {
      global $db;
      $abfrage = 'SELECT * FROM '.$this->mPrefix.'navigation 
                   WHERE aktiv="j" AND kap='.$kap.' AND ukap='.$ukap; 
      $navi_ukap = $db->queryRow($abfrage);
      return $navi_ukap;      
    }
    
	/* die erst mögliche NavId als Startseite ermitteln 
		@params: $akt_navid - Aktuelle Navigations-ID
		@return: $value		- Wert des gelesenen Feldes
	*/ 	
	public function get_home_navid($akt_navid=0)
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
	

	/* ein einzelnes Feld f�r eine bestimmte NavID aus der DB lesen 
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
     *  @params: $navtype - Navigationstype: S oder H oder V
		@return: $anz_service - Anzahl ID's
	*/ 	
	public function get_anz_navtype($navtype)
	{
		global $db;
        
		$abfrage = 'SELECT COUNT(*) FROM '.$this->mPrefix.'navigation 
					 WHERE aktiv="j" AND ukap="0" AND nav_type="'.$navtype.'"';
		$anz_navtype = $db->queryOne($abfrage);
		return $anz_navtype;
	}

    /* Einen Array mit allen Haupt-Navigationspunkten f�llen 
		@params: $akt_navid - Aktuelle Navigations-ID
	*/ 	
	public function fill_nav_array($akt_navid)
	{
		global $nav_array;
		global $unav_array;
		global $navigation;
		global $n_id;
		$langu = $_SESSION['language'];
		$temp = 'xxx';
		$n_id = $akt_navid;  // ID des aktuellen Nav-Eintrages 
		$akt_type = '';
		
		while ($eintrag = $navigation->fetchRow())
		{
            $bezeichnung = $eintrag['bezeich_'.$langu]; // Feldname ist sprachabhängig
			if ($_SESSION['debugging'] === true) { echo $eintrag['kuerzel'] .' '; }
			if ($temp != $eintrag['kap'])  { $temp = urlencode($eintrag['kuerzel']); }
		
			if ($eintrag['ukap'] == 0)
			{
				$akt_type = $eintrag['nav_type'];
				// f�r die Hauptnavigation werden kap und bezeichnung in einen String gespeichert, der beim Anzeigen
				// der Navigation wieder verwendet wird
				$nav_array[$eintrag['nav_id']] = $eintrag['kap'].'|'.$bezeichnung;
				if ($eintrag['nav_id'] == $akt_navid)
				{
					$n_id = $eintrag['nav_id'];
					if ($_SESSION['debugging'] === true) { echo '$n_id=' . $n_id . ' '; }
				}
			}
			else  
			{
				// f�r die Unternavigation werden kap, ukap und bezeichnung in einen String gespeichert, der beim Anzeigen
				// der Unternavigation wieder verwendet wird
			    $unav_array[$eintrag['nav_id']] = $eintrag['kap'].'|'.$eintrag['ukap'].'|'.$bezeichnung.'|'.$akt_type;
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
