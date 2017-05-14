<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse fuer die Verwaltung der hochgeladenen Bilder in der DB
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2007-09-01
 * @package     CMSADMIN/Pictures
 * 
 */
 
class picturesDbMaintain
{
	private $mDb;
	private $mPrefix;	

    /* Constructor */
    function __construct($db) 
    {
		$this->mDb 		= $db;
		$this->mPrefix 	= TABLE_PREFIX;
    }                                                                          

    /* Neue Methode implementieren */
    
    /**
     * Informationen einer Bilddatei in der Datenbank speichern 
     * @global type $db
     * @param type $ref_id - id der Seite zu der das Bild gehoert
     * @param type $pfad_bild - Bilddateiname inkl. Pfad
     * @param type $kommentar
     * @param type $dbaction - Insert oder Update
     * @param type $msg
     * @return type $message - Erfolgsmeldung 
     */
    public function bild_in_db_speichern($ref_id, $pfad_bild, $kommentar='', $dbaction, $msg='') 
    {
		global $db;
    	// vor dem Insert/Update wird erst mal überprüft, ob ein Datensatz schon vorhanden ist
    	$bild_id = $this->bild_in_db_checken($ref_id, $pfad_bild);
    	
    	// SQL vorbereiten
    	$sql =	'ref_id         ='	. $ref_id . ',';
    	$sql .= 'type           ="'	. $_SESSION['type'] . '",';
		$sql .= 'bildpfad       ="' . $pfad_bild . '",';
		$sql .= 'kommentar_de	="'	. $kommentar . '",';
		$sql .= 'kommentar_en	="'	. $kommentar . '",';
		$sql .= 'kommentar_fr	="'	. $kommentar . '",';
		$sql .= 'kommentar_it	="'	. $kommentar . '",';
		$sql .= 'sortkey        ='	. $this->get_next_sortkey($ref_id, $_SESSION['type']);

		// Bildname extrahieren
		$bild_arr = explode('/', $pfad_bild);
		$bild = array_pop($bild_arr);
						 
		// Data-Array in der DB speichern oder updaten			 
		switch (strtolower($dbaction)) {
			case 'insert':
				if ($bild_id == null) {
					$insert = 'INSERT INTO '.$this->mPrefix.'galerien SET ';
					$insert .= $sql;
					$affected =& $db->exec($insert);
					if (PEAR::isError($affected))
					{ 
						echo $affected->getMessage().' '.$affected->getDebugInfo();
						$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB_GESPEICHERT'], $bild);
					} else {
						$msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_BILD_IN_DB_GESPEICHERT'], $bild);
					}	
				} else {
					$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_BILD_EXISTIERT_IN_DB'], $bild);
				}
				break;
			default: 	
				if ($bild_id != null) {
					$update = 'UPDATE '.$this->mPrefix.'galerien SET ';
					$update .= $sql;
					$update	.= ' WHERE id='.$bild_id;
					$affected =& $db->exec($update);
					if (PEAR::isError($affected))
					{ 
						echo $affected->getMessage().' '.$affected->getDebugInfo();
						$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB_GESPEICHERT'], $bild);
					} else {
						$msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_BILD_IN_DB_GESPEICHERT'], $bild);
					}
				} else {
					$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB'], $bild);
				}
		}
		return $msg;
	}

    /**
     * den höchsten Sortierschlüssel festlegen
     * @global type $db
     * @param type $ref_id - ID der betroffenen Page
     * @param type $type - um 1 erhoehten Sortierschluessel
     * @return type 
     */
	private function get_next_sortkey($ref_id, $type) {
		global $db;
		$query = 'SELECT MAX(sortkey) AS sortkey FROM '.$this->mPrefix.'galerien WHERE ref_id='.$ref_id.' AND type="'.$type.'"';
		$sortkey = $db->queryOne($query) + 1;
		return $sortkey;		
	}
	
    /**
     * Informationen einer Bilddatei in der Datenbank loeschen 
     * @global type $db
     * @param type $ref_id - id der Seite zu der das Bild gehoert
     * @param type $pfad_bild - Bilddateiname inkl. Pfad
     * @param type $msg
     * @return type $message - Erfolgsmeldung
     */
    public function bild_in_db_loeschen($ref_id, $pfad_bild, $msg) 
    {		
    	// vor dem L�schen wird erst mal überprüft, ob ein Datensatz vorhanden ist -> id, sortkey
    	$id_sortkey = $this->bild_in_db_checken($ref_id, $pfad_bild);
    	$bild = array_pop(explode('/', $pfad_bild));
    	
   		$bild_id = $id_sortkey['id'];
   		$sortkey = $id_sortkey['sortkey'];

   		if ($bild_id != null) {	
			global $db;
	    	// 1. Bild löschen
			$delete = 'DELETE FROM '.$this->mPrefix.'galerien WHERE id=' . $bild_id; 
			// 2. Reihenfolge (Sortkey) wieder herstellen 
			$update_sortkey = 'UPDATE '.$this->mPrefix.'galerien SET sortkey=(sortkey-1) WHERE ref_id='.$ref_id.' AND sortkey >'.$sortkey;

			if ($db->exec($delete) && $db->query($update_sortkey )) {
				$msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_BILD_IN_DB_GELOESCHT'], $bild);
			} else {
				$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB_GELOESCHT'], $bild);
			} 
			
    	} else {
			$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB'], $bild);    		
    	}
		return $msg;
    }

    /**
     * Alle Bilder einer Ref_id l�schen -> erfolgt beim L�schen einer Seite oder eines Navigationspunktes
     * @global type $db
     * @param type $ref_id
     * @param type $type
     * @param type $msg
     * @return type $msg
     */
    public function bilder_loeschen_pro_ref_id($ref_id, $type, $msg='') {
    	if ($ref_id > 0 && ($type == 'N' || $type == 'P')) {
    		global $db;
    		$seite = $type == 'N' ? $GLOBALS['row']['bezeichnung'] : $GLOBALS['row']['name'];
    		
    		// Erst pr�fen, ob es �berhaupt etwas zu L�schen gibt
    		$query = 'SELECT DISTINCT ref_id FROM '.$this->mPrefix.'galerien WHERE ref_id='.$ref_id.' AND type="'.$type.'"';
    		$rid = $db->queryOne($query);
    		// falls etwas gefunden wurde, l�schen wir jetzt alle Eintr�ge f�r die $ref_id
			if ($rid == $ref_id) {	    		
				$delete = 'DELETE FROM '.$this->mPrefix.'galerien WHERE ref_id=' . $ref_id;     		
				if ($db->exec($delete)) {
					$msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_BILDER_PRO_REF_GELOESCHT'], $seite);
				} else {
					$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_BILDER_PRO_REF_NICHT_GELOESCHT'], $seite);
				} 
			}
    	}
    	return $msg;
    }
    	
    /**
     * Bilder aus der DB auslesen anhand eines Array, der gefuellt wurde durch 
     * das Auslesen eines Verzeichnisses
     * @global type $db
     * @global type $general
     * @param type $ref_id
     * @param type $files_disk
     * @param type $type - P = Pages oder N = Navigation
     * @return type $files_in_db - Datenbank - Objekt
     */
	public function bilder_aus_db_lesen($ref_id, $files_disk, $type) 
	{
		global $db, $general;
		
		// Aller Bilder zur ref_id aus der Bilder-DB lesen
		$query = 'SELECT * from '.$this->mPrefix.'galerien WHERE ref_id='.$ref_id.' AND type="'.$type.'" ORDER BY sortkey';
		$bilder =  $db->query($query);
		
		// Bilddaten in einen neuen Array �bernehmen und gleichzeitig pr�fen, ob die Bilder auch auf der Disk existieren
		while ($bild = $bilder->fetchRow(MDB2_FETCHMODE_ASSOC))  {
			// erst pr�fen, ob die Datei auch im array $files_disk enthalten ist
			// wenn nicht, wird es in der DB gel�scht und nicht in den Array aufgenommen
			if (!in_array($bild['bildpfad'], $files_disk)) {
				$sql = 'DELETE FROM '.$this->mPrefix.'galerien WHERE ref_id='.$bild['ref_id']. ' AND bildpfad="'.$bild['bildpfad'].'"';
				if ($db->exec($sql)) { 
					$meldung = sprintf($GLOBALS['MESSAGES']['MSG_DISKFILE_FEHLT'], $bild['bildpfad']); 
					$meldung .= ' -> '. sprintf($GLOBALS['MESSAGES']['MSG_BILD_IN_DB_GELOESCHT'],'');
					echo '<span class="error">' . $meldung . "</span><br />\n";
					$meldung='';
				}
			} else {				
				// Array-Felder vorbelegen
				$fdb['bild'] = $bild['bildpfad'];
				$fdb['kommentar'] = $bild['kommentar'];
				$fdb['kommentar_de'] = $bild['kommentar_de'];
				$fdb['kommentar_en'] = $bild['kommentar_en'];
				$fdb['kommentar_fr'] = $bild['kommentar_fr'];
				$fdb['kommentar_it'] = $bild['kommentar_it'];
				$fdb['bildid'] = $bild['id'];
				$fdb['ref_id'] = $bild['ref_id'];
				$fdb['type'] = $bild['type'];
				$fdb['sortkey'] = $bild['sortkey'];
				// am Bildschirm soll das Thumbnail angezeigt werden
				$thumbnail = str_replace('_images/', '_thumbs/th_', $bild['bildpfad']);
				$fdb['thumbnail'] = $thumbnail;
				$files_in_db[] = $fdb;
			}
		}	
		return 	$files_in_db;
	}

	/**
     * Bildreihenfolge in der DB aendern 
     * @global type $db
     * @param type $ref_id
     * @param type $sortkey
     * @return type $msg - Erfolgsmeldung
     */
	public function bild_hochziehen($ref_id, $sortkey) {
		global $db;
		if ($db->query('UPDATE '.$this->mPrefix.'galerien SET sortkey=222 WHERE ref_id='.$ref_id.' AND sortkey='.$sortkey) && 
		    $db->query('UPDATE '.$this->mPrefix.'galerien SET sortkey='.$sortkey.' WHERE ref_id='.$ref_id.' AND sortkey=('.$sortkey.'-1)') &&
			$db->query('UPDATE '.$this->mPrefix.'galerien SET sortkey=('.$sortkey.'-1) WHERE ref_id='.$ref_id.' AND sortkey=222')) 
		{
			$msg[] = 'success'; $msg[] = $GLOBALS['MESSAGES']['MSG_BILD_HOCHGEZOGEN'];
			return $msg;					
		}
	}
	
	/**
     * Die Funktion updated die sprachabhaengigen Kommentarfelder via Ajax
     * @global type $db
     * @param type $bild_id
     * @param type $kommentar --> kommt als JSON-String daher
     * @return string 
     */
    public function bild_kommentar_speichern($bild_id, $kommentar) 
    {
		global $db;
        // den Json-String in einen assoziativen Array umwandeln
        $komm_array = json_decode($kommentar,true); 
        // Beginn des UPDATE-Statements für alle gelieferten sprachabhangigen Kommentare
        $update = 'UPDATE '.$this->mPrefix.'galerien SET ';
        foreach($komm_array as $langu => $comment) {
          $i++;
          $kommentar = mb_detect_encoding($comment,"UTF-8") == "UTF-8" ? $comment : utf8_encode($comment);
          if ($i > 1) { $update .= ','; }
          $update .= 'kommentar_'.$langu.'="'.$db->escape($kommentar).'"';
        }
        $update .= ' WHERE id='.$bild_id;
		$affected =& $db->exec($update);
		if (PEAR::isError($affected))
		{
			echo $affected->getMessage().' '.$affected->getDebugInfo();
			$meldung = '<font style="color:red;">'.$GLOBALS['MESSAGES']['MSG_KOMMENTAR_NICHT_GESPEICHERT'].'</font>';
		} else {
			$meldung = '<font style="color:green;">'.$GLOBALS['MESSAGES']['MSG_KOMMENTAR_GESPEICHERT'].'</font>';
		}
		// die Meldung wird im Controller mit echo ausgegeben, darum wird sie nicht ins $msg-Array geschrieben.
		return $meldung;
	}

	
    /**
     * Die ID eines Bildes aus der DB auslesen
     * @global type $db
     * @param type $ref_id - Referenz-Id einer Seite
     * @param type $pfad_bild - Bildname
     * @return type $id - BildID
     */
	public function bild_in_db_checken($ref_id, $pfad_bild) {
		global $db;
		$query = 'SELECT id, sortkey FROM ' . $this->mPrefix.'galerien' . ' WHERE ref_id='. $ref_id . ' AND bildpfad="' . $pfad_bild . '"';
		$id_sortkey = $db->queryRow($query);
		return $id_sortkey;		
	}
	
    /**
     * Die Anzahl Bilder zu einer Page_id aus der DB auslesen (Frontend)
     * @global type $db
     * @global type $type
     * @param type $ref_id
     * @return type $total - Anzahl Bilder
     */
	public function count_bilder_pro_pageid($ref_id) {
		global $db, $type;
		$total = 0;
		$query = 'SELECT count(*) AS total FROM '.$this->mPrefix.'galerien'.' WHERE ref_id='.$ref_id.' AND type="'.$type.'"';
		$total = $db->queryOne($query);
		return $total;		
	}

    /**
     * Die Bilder zu einer Page_id aus der DB auslesen (Frontend)
     * @global type $db
     * @global type $type - N = Navigation , P = Page
     * @param type $ref_id - Referenz-Id einer Seite
     * @param type $start
     * @return type $bilder - Bilder-Array
     */
	public function bilder_pro_pageid_lesen($ref_id, $start=0) {
		global $db, $type, $language;
		
		// festlegen der Limite mit setLimit(Anzahl, Start)
		$db->setLimit(MAX_THUMBS, $start);
		$query = 'SELECT bildpfad, kommentar_'.$language.' FROM '.$this->mPrefix.'galerien';
        $query .= ' WHERE ref_id='.$ref_id.' AND type="'.$type.'" ORDER BY sortkey';
		$bilder = $db->query($query);
		return $bilder;		
	}

    /**
     * Den Kommentar f�r ein einzelnes Bild aus der DB auslesen
     * @global type $db
     * @global type $general
     * @param type $ref_id
     * @param type $type
     * @param type $pfad_bild
     * @return type 
     */
	public function bild_kommentar_in_db_lesen($ref_id, $type, $pfad_bild) {
		global $db, $general, $language;
		$kommentar = '';
		$query = 'SELECT kommentar_'.$language.' FROM '.$this->mPrefix.'galerien'.' WHERE ref_id='.$ref_id.' 
		             AND type="'.$type.'" AND bildpfad="' . $pfad_bild . '"';
		$kommentar = $db->queryOne($query);
		return $kommentar;		
	}
	/************************************************************************************************/
	/* die folgenden Funktionen betreffen den Update nach einem DB-WEchsel
	/************************************************************************************************/

	/* Update der Bildpfade nach DB-Wechsel */
	public function update_bildpfade() 
	{
		global $db, $msg;
		$msg[] = 'message'; $msg[] = $GLOBALS['LABELS']['BILDERGALERIE'];
		$newmedia = '/media_'.WEBSITE.'/';
		$bilder = $this->alle_bilder_lesen();
		if (count($bilder) > 0) {
			while ($row = $bilder->fetchRow(MDB2_FETCHMODE_ASSOC))  
			{
				if (!stristr($row['bildpfad'],$newmedia)) // Update nur, wenn nötig!
				{
					$pfad = str_replace('/media/',$newmedia,$row['bildpfad']);
					$update = 'UPDATE '.$this->mPrefix.'galerien SET bildpfad="'.$pfad.'" WHERE id='.$row[id];
					$affected =& $db->exec($update);
					if (PEAR::isError($affected)) {
						$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB_GESPEICHERT'], $pfad);
					} else {
						$msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_BILD_IN_DB_GESPEICHERT'], $pfad);
					}
				} else {
					$msg[] = 'neutral'; $msg[] = 'OK: '. $row['bildpfad'];					
				}
			}
			return $msg;
		}	
	}
	/* alle Bilder aus cms_galerien lesen */
	private function alle_bilder_lesen() 
	{
		global $db;
		// Aller Bilder aus der Bilder-DB lesen
		$query = 'SELECT * from '.$this->mPrefix.'galerien';
		$bilder =  $db->query($query);
		return $bilder;
	}
		
	/************************************************************************************************/
	/* Den Sortkey der Bilder f�r eine Ref_id in der DB neu aufbauen */
	public function refresh_sortkey($ref_id, $type) {
		$bilder = $this->bilder_lesen($ref_id, $type);
		$sortkey = 0;
		while ($bild = $bilder->fetchRow(MDB2_FETCHMODE_ASSOC))
		{	
			$sortkey++;
			$this->update_sortkey($bild, $sortkey);
			$msg[] ='success'; $msg[] = 'Sortkey/Type/Id/Ref_Id/Bildpfad: '.$sortkey .' '.$bild['type'].' '.$bild['id'].' '.$bild['ref_id'].' '.$bild['bildpfad']; 
		}
		return $msg;
	}
	
	/* Bilder pro page_id lesen, ohne Limite */
	private function bilder_lesen($ref_id, $type) {
		global $db;
		$query = 'SELECT * FROM '.$this->mPrefix.'galerien'.' WHERE ref_id='.$ref_id.' AND type="'.$type.'" ORDER BY sortkey';
		$bilder = $db->query($query);
		return $bilder;				
	}
	
	/* Bild mit neuem sortkey updaten */
	private function update_sortkey($bild, $sortkey) {
		global $db;
		$query = 'UPDATE '.$this->mPrefix.'galerien'.' SET sortkey='.$sortkey.' WHERE id='.$bild['id'].' AND ref_id='.$bild['ref_id'].' AND type="'.$bild['type'].'"';
		// Falls Update nicht erfolgreich ist, muss der $Sortkey wieder zur�ckgesetzt werden
		if (!$db->query($query)) { $sortkey--; }
	}
	
	/*************************************************************************************************/	
	/* Bilder auf der Disk mit den Eintr�gen in der Tabelle cms_galerien abgleichen
	   Ablauf:
		1) alle Navigationspunkte aus cms_navigation lesen
		2) Pro Nav_id/Bildpfad die Dateien lesen
		3) F�r alle Dateien einen Eintrag in cms_galerien suchen und bei Bedarf einen neuen Eintrag machen
		4) Dieselben 3 Schritte f�r Eintr�ge in cms_pages durchf�hren
	*/
	public function disk_db_adjustment() {
		$msg = array();
		$msg = $this->adjust_galerien_navi();
		$msg = $this->adjust_galerien_pages();
		return $msg;
	}

	/* Alle Bilder aus der Menu-Navigation mit der DB abgleichen */
	private function adjust_galerien_navi() {
		global $picture, $naviga, $msg;
		$msg[] = 'message'; $msg[] = $GLOBALS['CMS']['MENU01'];
		// 1. alle Navigationspunkte aus cms_navigation einlesen
		$navigation = $naviga->navigation_laden();
		if (count($navigation) > 0) {
			while ($row = $navigation->fetchRow(MDB2_FETCHMODE_ASSOC))
			{	
				// 2. Dateien pro Bildpfad einlesen
				$msg[] = 'title'; $msg[] = 'Navid='.$row['nav_id'].' Path: '.$row['bildpfad'].' Nav/Unav: '.$row['kap'].'/'.$row['ukap'];
				$verzeichnis = MEDIA_ROOT.'/'.$row['bildpfad'].'/_images';
				$pictures = $picture->get_images($verzeichnis);
				// 3. in DB cms_galerien suchen
				$type = 'N'; // Type Navigation
				$msg = $this->check_and_update_db($row['nav_id'] ,$pictures, $type);
			}
		} else {
			$msg[] = 'error'; $msg[] = 'Keine Navigationspunkte!';
		}
		return $msg;	
	}
	
	/* Alle Bilder aus der Pages-Navigation mit der DB abgleichen */
	private function adjust_galerien_pages() {
		global $picture, $pages, $msg;
		$msg[] = 'message'; $msg[] = $GLOBALS['CMS']['MENU02'];
		// 1. alle Submenupunkte aus cms_pages einlesen
		$subpages = $pages->read_all_pages();
		while ($row = $subpages->fetchRow(MDB2_FETCHMODE_ASSOC))
		{	
			// 2. Dateien pro Bildpfad einlesen
			$msg[] = 'title'; $msg[] = 'Pagid/Navid='.$row['page_id'].'/'.$row['nav_id'].' Path: '.$row['kennzeichen'];
			$verzeichnis = MEDIA_ROOT.'/'.$row['kennzeichen'].'/_images';
			$pictures = $picture->get_images($verzeichnis);
			// 3. in DB cms_galerien suchen
			$type = 'P'; // Type Pages
			$msg = $this->check_and_update_db($row['page_id'] ,$pictures, $type);
		}
		return $msg;
	}	

	/* Jedes einzelne Bild in der DB checken, wenn es nicht vorhanden ist, wird ein Datensatz in 
		der Tabelle cms_galerien angelegt
		@param: $ref_id: Id der Navigationspunktes
		@param: $pictures: Array mit Bildpfaden
		@return: $msg: Array mit Meldungen 
	*/
	private function check_and_update_db($ref_id, $pictures, $type) {
		global $general, $msg;
		if (count($pictures) > 0) {
			foreach ($pictures as $index => $pic) {
				$sortid = $this->bild_in_db_checken($ref_id, $pic);
				if (count($sortid) > 0) {
					$msg[] = 'neutral'; $msg[] = $pic . ' -> ist in der DB!';
				} else {
					$dbaction = 'insert';
					$_SESSION['type'] = $type;
					$msg = $this->bild_in_db_speichern($ref_id, $pic, $kommentar='', $dbaction, $msg);
				}
			}
		}
		return $msg;
	} 
	
	/*************************************************************************************************/	
}

?>
