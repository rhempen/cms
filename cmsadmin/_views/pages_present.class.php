<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse f�r die Pr�sentation der Navigation am Bildschirm 
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2007-07-14
 */

 
class pagesPresent
{
	private $mTpl;

    function __construct($tpl) 
    {
		$this->mTpl	= $tpl; 
    }                                                                          

	/*************************************************************************************************
	*   public functions
	*************************************************************************************************/

	/**
	 * 	Eine Liste von Unterseiten anzeigen
	 * 	@param:	$message - Meldungstext
	*/
    public function show_pages_overview($overview, $area, $action, $msg) 
	{
		global $tpl;
		$tpl->loadTemplatefile('pages_overview.tpl.html', true, true);
		$tpl->setVariable('titel', 'Seiten-Verwaltung');
    	$this->show_menue($area, 'show');
		$i = 0;
    	
	   	// Browser-Detection
    	$useragent = strtolower($_SERVER['HTTP_USER_AGENT']);
    		
    	// Datenzeilen
		//$tpl->setCurrentBlock('list_block');
		while ($row = $overview->fetchRow(MDB2_FETCHMODE_ASSOC)) 
		{
			$fach = $row['fach']; 
			
			$tpl->setCurrentBlock('list_block');
			// Gruppenbruch 
			if ($fach != $fach_save) {
				//--> $Gruppenbruch noch nicht hier gleichsetzen; wird weiter unten nochmals ben�tigt!				
				//$fach_save = $fach; 
				$tpl->setVariable('class_gruppe', 'neutral');
				$tpl->setVariable('text_plus_minus', $GLOBALS['TEXTE']['TEXT_PLUS_MINUS']);
				$tpl->setVariable('name_plus_minus', $fach);
				$i = 0;		
				// Cookies f�r die Anzeige initialisieren, falls n�tig
				if ($_COOKIE[$fach_save] == '') { $_COOKIE[$fach_save] = 'close'; }
			} else {
				$tpl->setVariable('class_gruppe', 'hide');				
			}
						
			if ($_COOKIE[$fach] == 'open') {
				$display = '';	
				$dispicon = 'minus_16.png';
				// IE kennt table-row nicht!!
				$style = stristr($useragent, "msie") ? 'display:block;' : 'display:table-row;';
			} else {
				$display = ' display_none';	
				$dispicon = 'plus_16.png';
				$style = 'display: none;';
			}
			$tpl->setVariable('plus_minus', $dispicon);

			// Titelzellen ausgeben bei Gruppenbruch
			if ($fach != $fach_save) {
				// Gruppenbruch muss jetzt gleichgesetzt werden 
				$fach_save = $fach;
				$tpl->setCurrentBlock('titel');
				$tpl->setVariable('gruppen_id', $fach_save.$i);
				$tpl->setVariable('class', 'navi_overview_titel');
				$tpl->setVariable('style', $style);
				$tpl->setVariable('label_bezeichnung', $GLOBALS['TEXTE']['NAVI_BEZEICHNUNG']);
				$tpl->setVariable('label_gueltigkeit', $GLOBALS['TEXTE']['NAVI_GUELTIGKEIT']);
				$tpl->setVariable('label_aktiv', $GLOBALS['TEXTE']['NAVI_AKTIV']);
				$tpl->setVariable('label_links', $GLOBALS['TEXTE']['NAVI_BEARBEITEN']);
				$tpl->parseCurrentBlock();	
				$tpl->setCurrentBlock('list_block');
			}			
			
			$i++;

			// CSS-Klasse festlegen
			$class = $i % 2 != 0 ? 'even' : 'odd'; 
			
			// Variablen des Templates mit Werten belegen
			$tpl->setVariable('class_liste', $class);
			$tpl->setVariable('style', $style);
			$tpl->setVariable('gruppe', $fach_save);
			$tpl->setVariable('gruppen_id', $fach_save.$i);
			$tpl->setVariable('name', $this->reslash($row['name']));			
			$tpl->setVariable('page_id', $row['page_id']);
			$tpl->setVariable('fach', $fach);
      		// Ikonen f�r Aktiv/Inaktiv
			$freed = '<img src="../gifs/freed.gif" border="0" width="16" height="14" alt="'.$GLOBALS['TEXTE']['TEXT_AKTIV'].'" title="'.$GLOBALS['TEXTE']['TEXT_AKTIV'].'" />';
			$block = '<img src="../gifs/blocked.gif" border="0" width="16" height="14" alt="'.$GLOBALS['TEXTE']['TEXT_INAKTIV'].'" title="'.$GLOBALS['TEXTE']['TEXT_INAKTIV'].'" />';
			$aktiv = $row['aktiv'] == 'j' ? $freed : $block;
			$farbe = $row['aktiv'] == 'j' ? 'green' : 'red';
			$tpl->setVariable('aktiv', $aktiv);
			$tpl->setVariable('farbe', $farbe);
			
			$tpl->setVariable('aktivid', $row['aktiv'].$row['page_id']);
			$tpl->setVariable('datum_von', $this->date_mysql2german($row['datum_von']));
			$tpl->setVariable('datum_bis', $this->date_mysql2german($row['datum_bis']));
			$tpl->setVariable('link_upload', '../_controllers/pictures_co_maintain.php?action=uploadFiles&dir='.MEDIA_ROOT.'/'.$row['kennzeichen'].'&type=P&ref_id='.$row['page_id']);
			$tpl->setVariable('link_bilder_edit', '../_controllers/pictures_co_maintain.php?action=imagesEdit&dir='.MEDIA_ROOT.'/'.$row['kennzeichen'].'/_images'.'&type=P&ref_id='.$row['page_id']);
			$tpl->setVariable('text_upload', $GLOBALS['TEXTE']['TEXT_UPLOAD']);
			$tpl->setVariable('link_edit', $_SERVER['PHP_SELF'].'?action=edit&page_id='.$row['page_id'].'&dir='.MEDIA_ROOT);
			$tpl->setVariable('text_bilder_edit', $GLOBALS['TEXTE']['TEXT_BILDER_EDIT']);
			$tpl->setVariable('text_page_edit', $GLOBALS['TEXTE']['TEXT_PAGE_EDIT']);
			$tpl->setVariable('link_delete', $_SERVER['PHP_SELF'].'?action=delete&page_id='.$row['page_id'].'&name='.$row['name']);
			$tpl->setVariable('text_page_delete', $GLOBALS['TEXTE']['TEXT_PAGE_DELETE']);
			$tpl->setVariable('confirm_delete', $GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE']);
			if ($i > 1) { // Pfeil zum Hochziehen erst ab 2. Datensatz
				$move_up = '<a href="'.$_SERVER['PHP_SELF'].'?action=moveUp&page_id='.$row['page_id'].'">';
				$move_up .= '<img src="../gifs/up.gif" width="14" height="16" alt="'.$GLOBALS['TEXTE']['TEXT_REIHENFOLGE'].'" title="'.$GLOBALS['TEXTE']['TEXT_REIHENFOLGE'].'"/></a>';				
			} else {
				$move_up = '<img src="../gifs/spacer.gif" width="14" height="16" alt=" " title=" "/>';				
			}
			$tpl->setVariable('link_moveup', $move_up);							
			$tpl->parseCurrentBlock();
		}
		
		// Fehlermeldung, falls nichts gefunden wurde
    	if ($i == 0) { $msg[] = 'error'; $msg[] = $GLOBALS['MESSAGES']['MSG_NOTHING_FOUND'];	}
		$this->print_message($msg);
		// Jetzt die Seite anzeigen
		$tpl->show();
	}
	
	
	/**
	 * 	Eine neue Seite zum Erfassen anbieten
	 * 	@param:	$area
	 *	@param: $next_id_kz - n�chstes verf�gbares Kennzeichen f�r die Neue Seite	
	 * 	@param:	$template
	 * 	@param:	$unavi
	*/
	public function new_page($area, $next_id_kz, $templates, $unavi) 
	{
		global $tpl, $navi, $general;
		
		$tpl->loadTemplatefile('page_edit.tpl.html', true, true);
		// Menutext
		$this->show_menue($area, 'new');
		
		$tpl->setCurrentBlock('row');
		
		list($next_page_id, $next_kz) = explode('/', $next_id_kz);
		$tpl->setVariable('page_id', $next_page_id);
		$tpl->setVariable('kennzeichen', $next_kz);
		$tpl->setVariable('domain', $area);
		$tpl->setVariable('text_domain', $navi->read_bezeichnung_by_area($area));
		
		// Selectbox f�r die Templates erstellen
		$tpl_selectbox = $general->create_tpl_selectbox($templates, $row['template']);
		$tpl->setVariable('templates', $tpl_selectbox);

		// Selectbox f�r die Unternavigationspunkte erstellen
		$navi_selectbox = $general->create_navi_selectbox($unavi, '');
		$tpl->setVariable('navigation', $navi_selectbox);
		
		// die �brigen Platzhalter im Formular f�llen
		$tpl->setVariable('seite', $GLOBALS['TEXTE']['TEXT_NEUE_SEITE']);
		$tpl->setVariable('action_url', $_SERVER['PHP_SELF'].'?action=save&dbaction=insert');
		$tpl->setVariable('link_abbrechen', $_SERVER['PHP_SELF'].'?area='.$area);
	
		// Checkbox f�r das Flag Aktiv erstellen
//		$checkbox = $this->create_checkbox($row['aktiv']);
//		$tpl->setVariable('aktiv', $checkbox);

		// labels ausgeben
		$this->set_labels('new');
		
		// Seite Parsen und anzeigen
		$tpl->parseCurrentBlock();
		$tpl->show();
	}

	
	/**
	 * 	Eine Seite zum Bearbeiten anbieten
	 *	@param: $page - Array mit allen Feldern
	 *	@param: $area - Bereich: Events, Expos, K�nstler
	 *	@param: $dbaction - ist default space. Wenn fehlerhafte Daten eingegeben wurden, hat der Parameter den 
	 *			Wert 'insert' oder 'update', abh�ngig davon, ob das Formular aus dem Insert- oder Update-Modus kam
	 *			Dann wird das Formular nochmals mit den geposteten Daten zum �ndern angezeigt  	
	*/
	public function edit_page($page, $templates, $unavi, $thumbnails, $area, $domain, $msg, $dbaction='') 
	{			
		global $tpl, $general, $frontget;
		$tpl->loadTemplatefile('page_edit.tpl.html', true, true);
		// Menutext und Meldungen ausgeben
		$this->show_menue($area, 'edit');

		$tpl->setCurrentBlock('row');
		// Alle n�tigten Felder zum Editieren anbieten	
		$row = $page->fetchRow(MDB2_FETCHMODE_ASSOC);
		$tpl->setVariable('page_id', $row['page_id']);
		$tpl->setVariable('kennzeichen', $row['kennzeichen']);
		$tpl->setVariable('name', $this->reslash($row['name']));
		$tpl->setVariable('domain', $row['domain']);
		$tpl->setVariable('text_domain', $area);
		$tpl->setVariable('aktiv', $row['aktiv']);

		// Selectbox f�r die Templates erstellen
		$tpl_selectbox = $general->create_tpl_selectbox($templates, $row['template']);
		$tpl->setVariable('templates', $tpl_selectbox);

		// Selectbox f�r die Unternavigationspunkte erstellen
		$navi_selectbox = $general->create_navi_selectbox($unavi, $row['nav_id']);
		$tpl->setVariable('navigation', $navi_selectbox);
									
		$tpl->setVariable('datum_von', $this->date_mysql2german($row['datum_von']));
		$tpl->setVariable('datum_bis', $this->date_mysql2german($row['datum_bis']));
		$tpl->setVariable('kurztext', $row['kurztext']);
		$tpl->setVariable('maxzeichenwert', MAX_LENGTH_KURZTEXT > 0 ? MAX_LENGTH_KURZTEXT : 230 );
		$tpl->setVariable('langtext', $row['langtext']);
		
		// 2. Textarea mit WYSIWYG-Editor nur anzeigen, wenn im Template ein entsprechender Platzhalter vorhanden ist.
		$general->show_inhalt2($row['template']); 
		$tpl->setVariable('lbl_inhaltstext2', $GLOBALS['LABELS']['INHALT2']);
		$tpl->setVariable('inhalt2', $row['inhalt2']);
		
		// Ausw�hlen eines Thumbnails f�r bild1
		$thumbnail_selectbox1 = $this->create_thumbs_selectbox($thumbnails, 1, $row['bild1']);
		$tpl->setVariable('thumbnail_selectbox1', $thumbnail_selectbox1);
		// Falls kein Bild in der DB gespeichert ist, wird als Ersatz ein blank.gif eingesetzt
		$bild1 = $row['bild1'] == '' ? '../gifs/blank.gif' : $row['bild1'];
		$tpl->setVariable('bild1', $bild1);
				
		// Ausw�hlen eines Thumbnails f�r bild2
		$thumbnail_selectbox2 = $this->create_thumbs_selectbox($thumbnails, 2, $row['bild2']);
		$tpl->setVariable('thumbnail_selectbox2', $thumbnail_selectbox2);
		// Falls kein Bild in der DB gespeichert ist, wird als Ersatz ein blank.gif eingesetzt
		$bild2 = $row['bild2'] == '' ? '../gifs/blank.gif' : $row['bild2'];
		$tpl->setVariable('bild2', $bild2);
	
		// die �brigen Platzhalter im Formular f�llen
		$tpl->setVariable('seite', $row['name']);
		$tpl->setVariable('action_url', $_SERVER['PHP_SELF'].'?action=save&dbaction=update&page_id='.$row['page_id']);
		$tpl->setVariable('link_abbrechen', $_SERVER['PHP_SELF'].'?area='.$area);

		
		// Daten aus der DB ins Formular ausgeben
		if ($row['linkid1'] > 0) { 
			$tpl->setVariable('wert_linkid1', $row['linkid1']); 
			$tpl->setVariable('wert_link1', $GLOBALS['pages']->read_link_name($row['linkid1'])); 
		}
		if ($row['linkid2'] > 0) { 
			$tpl->setVariable('wert_linkid2', $row['linkid2']); 
			$tpl->setVariable('wert_link2', $GLOBALS['pages']->read_link_name($row['linkid2'])); 
		}
		
		// Script, welches den HTTP-Request ausf�hren wird
		$tpl->setVariable('auto_complete_exe', '../_controllers/pages_co_maintain.php?action=autoComplete&domain='.$domain);
		
		// Checkbox f�r das Flag Aktiv erstellen
//		$checkbox = $this->create_checkbox($row['aktiv']);
//		$tpl->setVariable('aktiv', $checkbox);
		
		// Selectbox f�r die Anzeige der GalerieLinks erstellen
		$table = TABLE_PREFIX.'pages';
		$field = 'galerie';
		$selectbox = $general->create_aktiv_selectbox($table, $field, $row['galerie']);
		$tpl->setVariable('galerie_aktiv', $selectbox);
		
		// Labels ausgeben
		$this->set_labels('edit');

		// Seite parsen und anzeigen
		$tpl->parseCurrentBlock();
		
		$tpl->show();
	}	
	
	/**
	 * 	lables ausgeben f�r Page Edit und Page New 
	 *  @param: $modus 
	*/
	private function set_labels($modus='') 
	{
		global $tpl;
		$tpl->setVariable('lbl_template', $GLOBALS['LABELS']['TEMPLATE']);
		$tpl->setVariable('lbl_integration', $GLOBALS['LABELS']['INTEGRATION']);
		$tpl->setVariable('lbl_name', $GLOBALS['LABELS']['SEITENTITEL']);
		$tpl->setVariable('lbl_kurztext', $GLOBALS['LABELS']['KURZTEXT']);
		$tpl->setVariable('max_zeichen', $GLOBALS['LABELS']['MAXZEICHEN']);
		$tpl->setVariable('restl_zeichen', $GLOBALS['LABELS']['ZEICHEN']);
		$tpl->setVariable('lbl_langtext', $GLOBALS['LABELS']['INHALTSTEXT']);
		$tpl->setVariable('lbl_vonbis', $GLOBALS['LABELS']['VONBIS']);
		$tpl->setVariable('lbl_galerie', $GLOBALS['LABELS']['BILDERGALERIE']);
		$tpl->setVariable('lbl_seiteaktiv', $GLOBALS['LABELS']['SEITE_AKTIV']);
		
		// Formularbuttons
		$tpl->setVariable('lbl_reset', $GLOBALS['LABELS']['RESET']);
		$tpl->setVariable('lbl_escape', $GLOBALS['LABELS']['ESCAPE']);
		$tpl->setVariable('lbl_save', $GLOBALS['LABELS']['SAVE']);		
		
		// Im EDIT-Modus werden zT. mehr Felder angezeigt, 
		// bei NEW-Modus werden zT. Felder ausgeblendet
		if ($modus == 'edit') {
			$tpl->setVariable('lbl_seite', $GLOBALS['LABELS']['SIE_BEARBEITEN_SEITE']);
			$tpl->setVariable('lbl_bild1', $GLOBALS['LABELS']['BILD1']);
			$tpl->setVariable('lbl_bild2', $GLOBALS['LABELS']['BILD2']);
			$tpl->setVariable('lbl_link1', $GLOBALS['LABELS']['LINK1']);
			$tpl->setVariable('lbl_link2', $GLOBALS['LABELS']['LINK2']);
		} else {
			// Die Tabellenrows f�r Bilder und Inhalt2 nicht anzeigen -> display: none;
			$tpl->setVariable('none', 'none');	
			$tpl->setVariable('hide_inhalt2',HIDDEN); 
			$tpl->setVariable('evenodd2','col_odd');			
		}
	}
	
	
	/**
	 * 	Funktionsbeschreibung
	 *  @param: $parameter
	 *  @return: 
	*/
	public function xx()
	{
	
	}
	
	
	/*************************************************************************************************
	*   private functions
	*************************************************************************************************/

	/**
	 * 	horizontale Menupositionen anzeigen
	 * 	@param: $area
	 * 	@param: $action 
	*/
	private function show_menue($area='', $action) 
	{
		// zuerst die Navigation einlesen
		global $navi;
		global $tpl;

		if ($action == 'show') {
			$navigation = $navi->navigation_laden();
			$neue_seite = false;
			
			// Ausgabe der Menu-Hauptpositionen (Ukap = 0)
			while ($row = $navigation->fetchRow(MDB2_FETCHMODE_ASSOC)) 
			{
				$bezeichnung = $row['bezeichnung'];
				if ($row['ukap'] == 0) {
					$tpl->setCurrentBlock('tabnav');
					if ($row['bildpfad'] == $area) {
						$link = '<a class="aktivnav" href="'.$_SERVER['PHP_SELF'].'?area='.$row['bildpfad'].'">&nbsp;'.$bezeichnung.'&nbsp;</a>';
						$_SESSION['area'] = $area;
					} else {
						$link = '<a href="'.$_SERVER['PHP_SELF'].'?area='.$row['bildpfad'].'">&nbsp;'.$bezeichnung.'&nbsp;</a>';
					}
					$tpl->setVariable('link',$link);
					$tpl->parseCurrentBlock();
					$neue_seite = true;
				}
			}		
	
			// Link f�r Neue Seite 
			if ($neue_seite) {
				$tpl->setCurrentBlock('tabnav');
				$link = '<a href="'.$_SERVER['PHP_SELF'].'?area='.$area.'&action=create'.'">&nbsp;'.$GLOBALS['TEXTE']['TEXT_NEUE_SEITE'].'&nbsp;</a>';
				$tpl->setVariable('link', $link);
				$tpl->parseCurrentBlock(); 
			} 
		} else {
			$tpl->setCurrentBlock('tabnav');
			$action = 'esc';
			$text   = $GLOBALS['TEXTE']['ABBRECHEN'];
			$link = '<a class="passivnav" href="'.$_SERVER['PHP_SELF'].'?action='.$action.'">&nbsp;'.$text.'&nbsp;</a>';
			$tpl->setVariable('link',$link);
			$tpl->parseCurrentBlock();		
		}
	} 
	
	/**
	 * 	Eine Meldung ausgeben 
	 *	@param: $message 
	*/
	private function print_message($message)
	{
		global $general;
		$general->print_message($message);
	}
	
	/**
	 * 	Das MySQL-Datumsformat ins Deutsche Format umwandel 2007-08-25 => 25.08.2007 
	 * 	@param: $datum
	 * 	@return: $german_date
	*/
	private function date_mysql2german($datum)
	{
		if (!$general) { $general = new generalPresent($this->mTpl); }
		$german_date = $general->date_mysql2german($datum);
		return $german_date;
	}

	/**
	 * 	falls get_magic_quotes OFF ist, muessen sonderzeichen maskiert werden 
	 * 	@param: $text
	 * 	@return: $text - maskiert mit Slashes
	*/
	private function reslash($text)
	{
		if (!$general) { $general = new generalPresent($this->mTpl); }
		$general->reslash($text);
		return $text;
	}
	
	/**
	 * 	die Checkbox f�r das Aktiv-Flag soll checked oder leer sein.
	 * 	@param: $aktiv	
	 * 	@return: $checkbox  
	 */ 
	private function create_checkbox($aktiv)
	{
		$checkbox = '<input type="checkbox" id="aktiv" name="aktiv" value="ja"  ';
		$aktiv == 'j' || $aktiv == 'ja' ? $checkbox .= 'checked="checked" />' : $checkbox .= ' />';
		return $checkbox;
	}
	
	/**
	 * 	Selectbox mit verf�gbaren Thumbnails erstellen
	 *	@param: $thumbnails - Array mit Thumbnails
	 *	@param: $nr - markiert die 1. oder 2. selectbox -> wird 2x aufgerufen um zwei Selectboxes darzustellen
	 *	@param:	$bild - Aktives Bild
	 *	@call: Aufruf aus dieser, als auch aus der Klasse naviPresent - deshalb ist die Methode public
	*/
	public function create_thumbs_selectbox($thumbnails, $nr, $bild) {
		$id = 'thumbnails'.$nr;
		$name = 'thumb'.$nr;
		
		$selectbox_start = '<select id="'.$id.'" name="'.$name.'" size="1" style="width:250px;" onchange="javascript:change_image(this.selectedIndex, this.id)">' . "\n";
		$selectbox_ende  = '</select>';
		$option = '';

		if (count($thumbnails) > 0) {
			// als ersten Eintrag einen Text-Eintrag erstellen : "Bitte ausw�hlen..."
			$option .= '<option value="../gifs/blank.gif">'.$GLOBALS['TEXTE']['TEXT_SELECTBOX_AUWAHL'].'</option>';
			
			foreach ($thumbnails as $thumb) {
				// Mittelgrosse Bilder (Format 300x300) nicht ber�cksichtigen
				if (stristr($thumb,'300_300')) { continue; }
				// das Thumbnail aus dem Pfad extrahieren
				$thumbnail = explode('/', $thumb);
				$thumb_image = array_pop($thumbnail);
				// das gespeicherte Bild wird als selektiert gekennzeichnet
				$bild == $thumb ? $option .= '<option selected ' : $option .= '<option ';
				$option .= 'value="'. $thumb .'">'.$thumb_image.'</option>'."\n";			
			}
		} else {
			$option .= '<option selected value="">'.$GLOBALS['TEXTE']['TEXT_SELECTBOX_LEER'].'</option>'."\n";
		}

		$selectbox = $selectbox_start . $option . $selectbox_ende;
		return $selectbox;	
	}
	
		
} 


?>
