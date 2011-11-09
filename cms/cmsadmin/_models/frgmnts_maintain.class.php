<?php
/**
 * ----------------------------------------------------------
 * (c) 2010  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse für die Verwaltung von Seitenfragmenten
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2010-01-15
 */

class frgmntsMaintain
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
	// Alle Fragmente lesen
    public function fragmente_lesen()
    {
		global $db;
		$query = 'SELECT * FROM '.$this->mPrefix.'fragmente ORDER BY sort_id';
		$frgmnts = $db->query($query);
		return $frgmnts;
    }

    /* fragmente sortieren
        @params: $srtids - Array von Fragment-id's
        @return: echo Meldung
    */
    public function fragmente_sortieren($srtids)
    {
    	global $db;
			$success=$error=0;
    	foreach ($srtids as $index =>$value) {
    		if ($value != '') {
    			$update = 'UPDATE '.$this->mPrefix.'fragmente SET sort_id='.$index.' WHERE frag_id='.$value;
    			if ($db->query($update)) { $success++; } else { $error++; }
    		}
    	}
			if ($error != 0) {echo 'Es konnten nicht alle Datens&auml;tze neu sortiert werden'. "<br />\n";}
			else { echo 'Die Datens&auml;tze wurden neu sortiert!';	}
    }

    /* den Content eines einzelnen fragments lesen
        @params: $frgid - einzelne Fragment-ID
        @return: $content - der gelesene Datensatz
    */
    public function read_single_content($frgid)
    {
      global $db;
      $query = 'SELECT content FROM ' .$this->mPrefix.'fragmente WHERE frag_id='.$frgid;
      return $db->queryOne($query);
    }

    /* ein einzelnes fragment lesen
        @params: $frgid - einzelne Fragment-ID
        @return: $row - der gelesene Datensatz
    */
    public function read_single_frgmnt($frgid)
    {
      global $db;
      $query = 'SELECT * FROM ' .$this->mPrefix.'fragmente WHERE frag_id='.$frgid;
      return $db->queryRow($query);
    }

	// Den Content eines Fragmentes speichern
    public function fragment_speichern($frgid)
    {
			global $db, $frgrow;
			$frgname = $frgrow['name'];
			$content = $db->escape($_POST['content']);
			$update = 'UPDATE '.$this->mPrefix.'fragmente SET content="'.$content.'" WHERE frag_id='.$frgid;
			$affected =& $db->exec($update);
			if (PEAR::isError($affected)) {
				$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_FRGMNT_NICHT_GESPEICHERT'],$frgname);
				$msg[] = 'error'; $msg[] = $affected->getMessage().' '.$affected->getDebugInfo();
			} else {
				$msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_FRGMNT_GESPEICHERT'],$frgname);
			}
			return $msg;
    }

		// Fragment-Name sichern via Ajax
		public function fragment_name_save($frgid, $frgname)
		{
			global $db;
			$update = 'UPDATE '.$this->mPrefix.'fragmente SET name="'.$db->escape($frgname).'" WHERE frag_id='.$frgid;
			$affected =& $db->exec($update);
			if (PEAR::isError($affected)) { echo $affected->getMessage().' '.$affected->getDebugInfo(); }
			return $frgname;
		}

	// ein bestimmtes Fragment kopieren
    public function fragment_kopieren($frgid)
    {
		global $db, $frgrow;
		$frgmnt	= $this->read_single_frgmnt($frgid);
		if ($frgmnt !== '') {
			$nxtfid = $this->get_next_fragid( );
			$nxtsid	= $frgmnt['sort_id'] + 1; // Der kopierte Datensatz wird direkt unterhalb des angeklickten Datensatzes eingefügt
			// alle Sortid's grösser $nxtsid um 1 erhöhen.
			$this->increment_sortids($nxtsid);
			$insert = 'INSERT INTO '.$this->mPrefix.'fragmente SET ';
			$sql	= 'frag_id='.$nxtfid.',';
			$sql	.= 'name="'. sprintf($GLOBALS['TEXTE']['TEXT_COPY_FRGMNT'],$frgmnt['name']).'",';
			$sql	.= 'sort_id='.$nxtsid.',';
			$sql	.= 'content="'.$db->escape($frgmnt['content']).'"';
			$insert	.= $sql;
			$affected =& $db->exec($insert);
			if (PEAR::isError($affected)) {
				$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_FRGMNT_NICHT_GESPEICHERT'],$frgname);
				$msg[] = 'error'; $msg[] = $affected->getMessage().' '.$affected->getDebugInfo();
			} else {
				$msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_FRGMNT_GESPEICHERT'],sprintf($GLOBALS['TEXTE']['TEXT_COPY_FRGMNT'],$frgmnt['name']));
			}
		} else {
			$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_FRGMNT_NICHT_GESPEICHERT'],$frgname);
		}
		return $msg;
    }

	// Ein Fragment löschen
    public function fragment_loeschen($frgid)
    {
		global $db, $frgrow;
		$frgname = $frgrow['name'];
		$delete = 'DELETE FROM '.$this->mPrefix.'fragmente WHERE frag_id='.$frgid;
		$affected =& $db->exec($delete);
		if (PEAR::isError($affected)) {
			$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_FRGMNT_NICHT_GELOESCHT'],$frgname);
			$msg[] = 'error'; $msg[] = $affected->getMessage().' '.$affected->getDebugInfo();
		} else {
			$this->renumber_sortids( ); // Sortid's neu durchnummerieren
			$msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_FRGMNT_GELOESCHT'],$frgname);
		}
		return $msg;
    }

	// Ein Fragment anlegen
    public function fragment_anlegen($frgid )
    {
		global $db;
		if ($frgid > 0) { // Button auf einem Fragment-Satz angeklickt
			$frgmnt	= $this->read_single_frgmnt($frgid);
			if (count($frgmnt) > 0) {
				$nxtfid = $this->get_next_fragid( );
				$nxtsid = $frgmnt['sort_id'] + 1;
			}
		} else { // Button im Menu oberhalb geklickt
				$nxtfid = $this->get_next_fragid( );
				$nxtsid = $this->get_next_sortid( );
		}
		$this->increment_sortids($nxtsid);
		$insert = 'INSERT INTO '.$this->mPrefix.'fragmente SET ';
		$sql	 = 'frag_id='.$nxtfid.',';
		$sql	.= 'name="'.$GLOBALS['TEXTE']['TEXT_NEW_FRGMNT'].'",';
		$sql	.= 'sort_id='.$nxtsid.',';
		$sql	.= 'content=""';
		$insert	.= $sql;
		$affected =& $db->exec($insert);
		if (PEAR::isError($affected)) {
			$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_FRGMNT_NICHT_GESPEICHERT'],$frgname);
			$msg[] = 'error'; $msg[] = $affected->getMessage().' '.$affected->getDebugInfo();
		} else {
			$msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_FRGMNT_GESPEICHERT'],$GLOBALS['TEXTE']['TEXT_NEW_FRGMNT']);
		}
		return $msg;
	}

	private function get_next_fragid( ) {
		global $db;
		$query	= 'SELECT MAX(frag_id) FROM '.$this->mPrefix.'fragmente';
		return $db->queryOne($query)+1;
	}

	private function get_next_sortid( ) {
		global $db;
		$query	= 'SELECT MAX(sort_id) FROM '.$this->mPrefix.'fragmente';
		return $db->queryOne($query)+1;
	}

	private function increment_sortids($sortid) {
		global $db;
		$query	= 'SELECT * FROM '.$this->mPrefix.'fragmente WHERE sort_id>='.$sortid.' ORDER BY sort_id';
		$frgmnts = $db->query($query);
		if ($frgmnts > 0) {
			while ($row = $frgmnts->fetchRow(MDB2_FETCHMODE_ASSOC)) {
				$newsid = $row['sort_id']+1;
				$update	= 'UPDATE '.$this->mPrefix.'fragmente SET sort_id='.$newsid.' WHERE frag_id='.$row['frag_id'];
				$affected =& $db->exec($update);
			}
		}
	}

	private function renumber_sortids() {
		global $db;
		$query	= 'SELECT * FROM '.$this->mPrefix.'fragmente ORDER BY sort_id';
		$frgmnts = $db->query($query);
		if ($frgmnts > 0) {
			while ($row = $frgmnts->fetchRow(MDB2_FETCHMODE_ASSOC)) {
				$i++;
				$newsid = $i;
				$update	= 'UPDATE '.$this->mPrefix.'fragmente SET sort_id='.$newsid.' WHERE frag_id='.$row['frag_id'];
				$affected =& $db->exec($update);
			}
		}
	}

	/*****************************************************************************
	 * Funktionen zum Lesen und editieren von CSS-Dateien
	 *****************************************************************************/
	public function read_css() {
		// 1. wir müssen wissen, welche Thema zZ. aktiv ist.
		$cssfile = $this->get_cssfile_name();
		// 2. den Inhalt der CSS-Datei auslesen
		$csscont = $this->read_cssfile($cssfile);
		return $csscont;
	}

	private function get_cssfile_name() {
		$thema = $this->read_thema();  // aktuell eingestelltes Thema
		$themadir = '../../frontend/themes/';
		$cssdir = $thema != '' ? $themadir.$thema.'/css' : $themadir.'default/css';
		$cssfile = $cssdir.'/fragmente.css';
		return $cssfile;
	}

	private function read_thema() {
		global $db;
		$query = 'SELECT value FROM '.$this->mPrefix.'config WHERE category="general" and param="THEME"';
		return $db->queryOne($query);
	}

	private function read_cssfile($cssfile) {
		// wenn die datei nicht existiert, soll sie erst angelegt werden.
		if (!file_exists($cssfile)) {
			$cssdir = $this->extract_path($cssfile);
			if (is_dir($cssdir) && is_writable($cssdir)) {
				$handle = fopen($cssfile,'w+');
				$fclose = fclose($handle);
				$msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_CSS_NEU_ANGELEGT'],$cssfile);
			} else {
				$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_CSS_NICHT_ANGELEGT'],$cssfile);
				$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_FILE_KEINE_BERECHTIGUNG'],$cssfile);
				$GLOBALS['message'] = $msg;
				return;
			}
		}
		// danach bzw. ansonsten wird die datei eingelesen
		$lines = file($cssfile);
		if (count($lines) > 0) {
			foreach ($lines as $line_num => $line) {
					$csscontent .= htmlspecialchars($line); // . "\n";
			}
		} else {
			// wenn die CSS-Datei leer ist, wird eine Kommentarzeile eingefügt
			$timestamp = date('d.m.Y H:i:s');
			$zeile  = sprintf($GLOBALS['TEXTE']['CSS_START_TEXT'], $timestamp);
			$csscontent = $zeile;
		}
		$msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_CSS_BEARBEITEN'],$cssfile);
		$GLOBALS['message'] = $msg;
		return $csscontent;
	}

	private function extract_path($cssfile) {
		if (is_dir($cssfile)) return $cssfile;
		$filearray = explode('/',$cssfile);
		$file = array_pop($filearray);
		$cssdir = implode('/',$filearray);
		return $cssdir;
	}

	public function save_cssfile() {
		$csscontent = $_POST['content'];
		$cssfile = $this->get_cssfile_name();
		if (is_writable($cssfile)) {
			$handle = fopen($cssfile,'w');
			if (!fwrite($handle, $csscontent)) {
				$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_CSS_NICHT_GESPEICHERT'],$cssfile);
			} else {
				$msg[] = 'success'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_CSS_GESPEICHERT'],$cssfile);
			}
			$fclose = fclose($handle);
		} else {
				$msg[] = 'error'; $msg[] = sprintf($GLOBALS['MESSAGES']['MSG_FILE_KEINE_BERECHTIGUNG'],$cssfile);
		}
		return $msg;
	}
	
}

?>
