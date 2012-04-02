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
 
class naviPresent
{
	private $mTpl;

    function __construct($tpl) 
    {
		$this->mTpl	= $tpl; 
    }                                                                          

    /* Neue Methode implementieren */	
	/** 
	 * Navigation anzeigen inkl. Links fuer die Bearbeitung  
	 * @param: $navigation Array der Navigationspositionen
	 * @param: $message Meldungen	   
	 * 1. Template-File laden
	 * 2. Titel an die Seite uebergeben
	 * 3. Festlegen des Blocks, der in der while-Schleife mehrfach zu verarbeiten ist
	 * 4. Loop: Fuer jeden Menueintrag eine Zeile inkl. Links fuer die Bearbeitung an das Template uebergeben
	 *    Zusaetzlich wird die Zeile (<tr>) mit der Klasse even oder odd eingefaerbt	
	 */
	public function navigation_anzeigen($navigation, $message)
	{
		global $general, $tpl, $naviga;
        $language = defined('LANGUAGE') ? strtolower(LANGUAGE) : 'de';
		$tpl->loadTemplatefile('navi_overview.tpl.html', true, true);
		$tpl->setVariable('titel', $GLOBALS['TEXTE']['NAVI_VERWALTUNG']);
		$tpl->setVariable('formurl', $_SERVER['PHP_SELF']);
		
		// Menuposition fuer neuen Hauptnavigationspunkt
		$this->show_menu('show');
		
		// Meldungen ausgeben
		$general->print_message($message);

		// Titelzeile
		$tpl->setCurrentBlock('titel');
		$tpl->setVariable('class', 'navi_overview_titel');
		$tpl->setVariable('label_kap', 'Nav');
		$tpl->setVariable('label_ukap', 'UNav');
		$tpl->setVariable('label_bezeichnung', $GLOBALS['TEXTE']['NAVI_BEZEICHNUNG']);
		$tpl->setVariable('label_start', $GLOBALS['TEXTE']['NAVI_START']);
		$tpl->setVariable('label_nav_type', $GLOBALS['TEXTE']['NAVI_SERVICE']);
		$tpl->setVariable('label_aktiv', $GLOBALS['TEXTE']['NAVI_AKTIV']);
		$tpl->setVariable('label_links', $GLOBALS['TEXTE']['NAVI_BEARBEITEN']);
		$tpl->parseCurrentBlock();
		
		// Datenzeilen
        $i = 0;
		$tpl->setCurrentBlock('zeile');
		while ($row = $navigation->fetchRow(MDB2_FETCHMODE_ASSOC)) 
		{
			$i++;
            // den StartDiv für Drag/Drop/Sortable zusammensetzen und ausgeben, wenn ukap=0 oder $i=1
            $sortableDivBegin = '<div id="div_'.$row['nav_id'].'" class="lielem navisort">';
            if ($row['kap'] != $kap_old) { 
              $tpl->setVariable('sortableDivBegin',$sortableDivBegin); 
              $kap_old = $row['kap'];                            
              }
            // das End-DIV setzen, wenn es keine Ukaps (mehr) gibt
            $ukap = $row[ukap]+10;
            $anz_ukap = $naviga->read_anz_ukap_by_kap_ukap($kap_old, $ukap);
            if ($anz_ukap == 0) { $tpl->setVariable('sortableDivEnd','</div>'); }
            

            // CSS-Klasse festlegen
			$class = $row['ukap'] == 0 ? 'even' : 'odd'; 
			// Variablen des Templates mit Werten belegen
			$tpl->setVariable('class', $class);
			$tpl->setVariable('kap', $row['kap']);            
            $kap_ukap = $row['ukap'] == 0 ? $row['kap'] : $row['kap'].'_'.$row['ukap'];
			$tpl->setVariable('kap_ukap', $kap_ukap);            
			$tpl->setVariable('bezeichnung', $general->reslash($row['bezeich_'.$language]));
			$tr_id = $row['ukap'] == 0 ? $row['domain'] : $row['domain'].'_'.$row['ukap'];
			$tpl->setVariable('tr_id', $tr_id);	
			
			// Icon zum aufklappen der Unterseiten anzeigen
			if ($row['ukap'] == 0 && $hat_ukaps == 0) {
				$icon_html  = '<img src="../gifs/spacer.gif" with="16" height="16" alt="" border="0" />'."\n";
				$hat_ukaps = $naviga->read_anz_ukap_by_kap($row['kap']);
				if ($hat_ukaps > 0 && $row['ukap'] == 0 ) {
					$kap_id 	= 'kap_'.$row['kap'];
					$icon_html  = '<a href="#">'."\n";
					$image		= '<img src="../gifs/%s_16.png" id="'.$kap_id.'" with="16" height="16" alt="'.$GLOBALS['TEXTE']['TEXT_PLUS_MINUS'].'" title="'.$GLOBALS['TEXTE']['TEXT_PLUS_MINUS'].'" border="0" onclick="toggle_ukaps(this.id,\''.$tr_id.'\','.$hat_ukaps.');"/>'."\n";
					// ist ein Cookie f�r die tr_id gesetzt? - dann entsprechend verbergen oder zeigen
					if ($_COOKIE[$tr_id] == 'minus') { 
						$icon_html .= sprintf($image, 'minus');
						$plus_minus = 'minus';
					} else {
						$icon_html .= sprintf($image, 'plus');						
						$plus_minus = 'plus';
					}
					$icon_html .= '</a>'."\n";
					$hat_ukaps = 0;
				}
				$tpl->setVariable('ukap', $icon_html);
			}
						
			// Flag fuer Startseite
			if 	($row['ukap'] == 0) {
				$ja = '<img src="../gifs/ledgreen.gif" border="0" width="16" height="14" alt="'.$GLOBALS['TEXTE']['JA'].'" title="'.$GLOBALS['TEXTE']['JA'].'" />';
				$no = '<img src="../gifs/ledred.gif" border="0" width="16" height="14" alt="'.$GLOBALS['TEXTE']['NEIN'].'" title="'.$GLOBALS['TEXTE']['NEIN'].'" />';
				$startflag = $row['start'] == 'j' ? $ja : $no;
				$tpl->setVariable('startseite', $startflag);
				$starttitle = $row['start'] == 'j' ? $GLOBALS['TEXTE']['JA'] : $GLOBALS['TEXTE']['NEIN'];
				$tpl->setVariable('starttitle', $starttitle);
				$startid = 's'.$row['start'].$row['nav_id'];
				$tpl->setVariable('startid', $startid);
			}
			
			// die ID und der Wert fuer das Editieren des NavTypeFlags setzen
			if ($row['ukap'] == 0) {
				$navtype = $row['nav_type']; 
				$tpl->setVariable('nav_type', $navtype);
				$typeid = $navtype.$row['nav_id'];
				$tpl->setVariable('typeid', $typeid);
				$typetitle = $general->set_navtype_title($navtype);
				$tpl->setVariable('typetitle', $typetitle);
				$typecolor = $general->set_navtype_color($navtype);
				$tpl->setVariable('typecolor', $typecolor);
			}

			// die ID und der Wert fuer das Editieren des AktivFlags setzen
			$aktivid = $row['aktiv'].$row['nav_id'];
			$freed = '<img src="../gifs/freed.gif" border="0" width="16" height="14" alt="'.$GLOBALS['TEXTE']['TEXT_AKTIV'].'" title="'.$GLOBALS['TEXTE']['TEXT_AKTIV'].'" />';
			$block = '<img src="../gifs/blocked.gif" border="0" width="16" height="14" alt="'.$GLOBALS['TEXTE']['TEXT_INAKTIV'].'" title="'.$GLOBALS['TEXTE']['TEXT_INAKTIV'].'" />';
			$tpl->setVariable('aktivid', $aktivid);
			$aktiv = $row['aktiv'] == 'j' ? $freed : $block;
			$farbe = $row['aktiv'] == 'j' ? 'green' : 'red';
			$tpl->setVariable('aktiv', $aktiv);
			$tpl->setVariable('farbe', $farbe);

			// die ID's fuer das Editieren der Menubezeichnung setzen
			$tpl->setVariable('nav_id', $row['nav_id']);

			// Links aufbauen
			$links = '';
			$dir = MEDIA_ROOT.'/'.$row['bildpfad'];
			$dir_thumbs = $dir . '/_thumbs';  
			$href_pic = '../_controllers/pictures_co_maintain.php?action=uploadFiles&dir='.$dir.'&type=N&ref_id='.$row['nav_id'];
			$href_pic_edit = '../_controllers/pictures_co_maintain.php?action=imagesEdit&dir='.$dir.'/_images&type=N&ref_id='.$row['nav_id'];
			
			// Hauptnavigationspunkt 
			if ($row['ukap'] == 0) { 
				$icon_edi = '<a href="'.$_SERVER['PHP_SELF'].'?action=edit&dir='.$dir_thumbs.'&nav_id='.$row['nav_id'].'"><img src="../gifs/edit.gif" border="0" width="18" height="19" alt="'.$GLOBALS['TEXTE']['TEXT_EDIT_HAUPTNAVI'].'" title="'.$GLOBALS['TEXTE']['TEXT_EDIT_HAUPTNAVI'].'"></a>';
				$icon_pic = '<a href="'.$href_pic.'"><img src="../gifs/jpeg.gif" border="0" width="18" height="19" alt="'.$GLOBALS['TEXTE']['TEXT_BILDER_HOCHLADEN'].'" title="'.$GLOBALS['TEXTE']['TEXT_BILDER_HOCHLADEN'].'"></a>';
				$icon_pic_edit = '<a href="'.$href_pic_edit.'"><img src="../gifs/modify_16.png" border="0" width="18" height="19" alt="'.$GLOBALS['TEXTE']['TEXT_BILDER_EDIT'].'" title="'.$GLOBALS['TEXTE']['TEXT_BILDER_EDIT'].'"></a>';
				$icon_neu = '<a href="'.$_SERVER['PHP_SELF'].'?action=neuUkap&nav_id='.$row['nav_id'].'"><img src="../gifs/new.gif" border="0" width="16" height="15" alt="'.$GLOBALS['TEXTE']['TEXT_NEUE_UNTERNAVI'].'" title="'.$GLOBALS['TEXTE']['TEXT_NEUE_UNTERNAVI'].'"></a>';
				$confirm_del = "return confirm('".$GLOBALS['TEXTE']['TEXT_DELE_HAUPTNAVI']."?')";
				$confirm_cop = "return confirm('".$GLOBALS['TEXTE']['TEXT_COPY_HAUPTNAVI']."?')";
				$icon_del = '<a href="'.$_SERVER['PHP_SELF'].'?action=del&nav_id='.$row['nav_id'].'" onclick="'.$confirm_del.'"><img src="../gifs/delete.gif" border="0" width="16" height="16" alt="'.$GLOBALS['TEXTE']['TEXT_DELE_HAUPTNAVI'].'" title="'.$GLOBALS['TEXTE']['TEXT_DELE_HAUPTNAVI'].'"></a>';
				$icon_cop = '<a href="'.$_SERVER['PHP_SELF'].'?action=copy&nav_id='.$row['nav_id'].'" onclick="'.$confirm_cop.'"><img src="../gifs/copy_object.gif" border="0" width="16" height="16" alt="'.$GLOBALS['TEXTE']['TEXT_COPY_HAUPTNAVI'].'" title="'.$GLOBALS['TEXTE']['TEXT_COPY_HAUPTNAVI'].'"></a>';
				$icon_spa = '<img src="../gifs/spacer.gif" border="0" width="10" height="14" />';
				if ($row['kap'] > 1)
				{
					$icon_ups = '<a href="'.$_SERVER['PHP_SELF'].'?action=kap&nav_id='.$row['nav_id'].'&kap='.$row['kap'].'&ukap='.$row['ukap'].'"><img src="../gifs/up.gif" border="0" width="14" height="14" vspace="2" alt="'.$GLOBALS['TEXTE']['TEXT_REIHENFOLGE'].'" title="'.$GLOBALS['TEXTE']['TEXT_REIHENFOLGE'].'"></a></span>'; 
				}
                $icon_ups = '<span class="navisort">'.$general->compose_sorticon().'</span>';
				$icon_tra = '<a href="'.$_SERVER['PHP_SELF'].'?action=trans&nav_id='.$row['nav_id'].'"><img src="../gifs/translate.gif" border="0" width="18" height="19" alt="'.$GLOBALS['TEXTE']['TEXT_TRANSLATE'].'" title="'.$GLOBALS['TEXTE']['TEXT_TRANSLATE'].'"></a>';
				$links = $icon_pic.'&nbsp;&nbsp;'.$icon_pic_edit.'&nbsp;&nbsp;'.$icon_edi.'&nbsp;&nbsp;'.$icon_cop.'&nbsp;&nbsp;'.$icon_neu.'&nbsp;&nbsp;'.$icon_tra.'&nbsp;&nbsp;'.$icon_del.'&nbsp;&nbsp;'.$icon_ups;
			}
			// Unternavigationspunkt
			else { 
				$tpl->setVariable('ukap', $row['ukap']);
				$icon_edi = '<a href="'.$_SERVER['PHP_SELF'].'?action=edit&dir='.$dir_thumbs.'&nav_id='.$row['nav_id'].'"><img src="../gifs/edit.gif" border="0" width="18" height="19" alt="'.$GLOBALS['TEXTE']['TEXT_EDIT_UNTERNAVI'].'" title="'.$GLOBALS['TEXTE']['TEXT_EDIT_UNTERNAVI'].'"></a>';
				$icon_pic = '<a href="'.$href_pic.'"><img src="../gifs/jpeg.gif" border="0" width="18" height="19" alt="Bilder hochladen"></a>';
				$icon_pic_edit = '<a href="'.$href_pic_edit.'"><img src="../gifs/modify_16.png" border="0" width="18" height="19" alt="'.$GLOBALS['TEXTE']['TEXT_BILDER_EDIT'].'" title="'.$GLOBALS['TEXTE']['TEXT_BILDER_EDIT'].'"></a>';
				$confirm = "return confirm('".$GLOBALS['TEXTE']['TEXT_DELE_UNTERNAVI']."')";
				$icon_del = '<a href="'.$_SERVER['PHP_SELF'].'?action=del&nav_id='.$row['nav_id'].'" onclick="'.$confirm.'"><img src="../gifs/delete.gif" border="0" width="16" height="16" alt="'.$GLOBALS['TEXTE']['TEXT_DELE_UNTERNAVI'].'" title="'.$GLOBALS['TEXTE']['TEXT_DELE_UNTERNAVI'].'"></a>';
				$icon_ups = '<img src="../gifs/spacer.gif" border="0" width="10" height="14" />';
				if ($row['ukap'] > 10)
				{
//					$icon_ups = '<a href="'.$_SERVER['PHP_SELF'].'?action=ukap&nav_id='.$row['nav_id'].'&kap='.$row['kap'].'&ukap='.$row['ukap'].'"><img src="../gifs/pfeil_up.gif" border="0" width="10" height="14" vspace="2" alt="'.$GLOBALS['TEXTE']['TEXT_REIHENFOLGE'].'" title="'.$GLOBALS['TEXTE']['TEXT_REIHENFOLGE'].'"></a></span>'; 
					$icon_ups = '<a href="'.$_SERVER['PHP_SELF'].'?action=ukap&nav_id='.$row['nav_id'].'"><img src="../gifs/pfeil_up.gif" border="0" width="10" height="14" vspace="2" alt="'.$GLOBALS['TEXTE']['TEXT_REIHENFOLGE'].'" title="'.$GLOBALS['TEXTE']['TEXT_REIHENFOLGE'].'"></a></span>'; 
				}			
				$icon_tra = '<a href="'.$_SERVER['PHP_SELF'].'?action=trans&nav_id='.$row['nav_id'].'"><img src="../gifs/translate.gif" border="0" width="18" height="19" alt="'.$GLOBALS['TEXTE']['TEXT_TRANSLATE'].'" title="'.$GLOBALS['TEXTE']['TEXT_TRANSLATE'].'"></a>';
				$links = $icon_pic.'&nbsp;&nbsp;'.$icon_pic_edit.'&nbsp;&nbsp;'.$icon_edi.'&nbsp;&nbsp;'.$icon_tra.'&nbsp;&nbsp;'.$icon_del.'&nbsp;&nbsp;'.$icon_ups;
				
				// Unterkapitel verbergen oder zeigen
				$disp_none = 'style="display:none;"';
				if ($plus_minus == 'plus') { $tpl->setVariable('ukap_hide', $disp_none); }
			}
			$tpl->setVariable('links', $links);
            // den akutellen Kap merken wegen UKaps
            $kap_old = $row['kap'];             
			// die Zeile parsen
			$tpl->parseCurrentBlock();
		}
	// Die Methode show() beendet die Template-Verarbeitung und startet die Auslieferung der 
	// erzeugten Seite an den Browser. Bis zu diesem Zeitpunkt befindet sich die produzierte 
	// HTML-Seite im Cache-Speicher des Servers 
		$tpl->show();
	}
	
	public function edit_page($navigation, $navi_page, $templates, $modules, $thumbnails) 
	{	
		global $tpl;
		global $general, $frontget;
		$i=0;
		$tpl->loadTemplatefile('navi_edit.tpl.html', true, true);

		// Menuposition zum Abbrechen
		$this->show_menu('edit');

		// Alle noetigten Felder zum Editieren anbieten	
		$tpl->setCurrentBlock('row');		
		$row = $navi_page->fetchRow(MDB2_FETCHMODE_ASSOC);
		// die obersten Platzhalter im Formular fuellen
		$tpl->setVariable('lbl_seite', $GLOBALS['LABELS']['SIE_BEARBEITEN_SEITE']);
		$tpl->setVariable('seite', $row['kurztitel']);
		$tpl->setVariable('action_url', $_SERVER['PHP_SELF'].'?action=save&seiten_id='.$row['seiten_id']);
		$tpl->setVariable('lbl_escape', $GLOBALS['LABELS']['ESCAPE']);
		
		// Alle Felder an das Template uebergeben --> $label muss somit im Template mit dem Feldnamen identisch sein
		$tpl->setVariable('lbl_seiteninfo', $GLOBALS['LABELS']['SEITEN_INFO']);
		$seiteninfo = sprintf($GLOBALS['LABELS']['SEITEN_INFO_VALUES'], $row['seiten_id'],$row['nav_id'],$navigation['bildpfad']);
		$tpl->setVariable('seiteninfo', $seiteninfo);
		$tpl->setVariable('lbl_zeichen', $GLOBALS['LABELS']['ZEICHEN']);
		$tpl->setVariable('lbl_kurztitel', $GLOBALS['LABELS']['SEITENTITEL']);
		$tpl->setVariable('kurztitel', $row['kurztitel']);
		$tpl->setVariable('lbl_zusatztext', $GLOBALS['LABELS']['ZUSATZTEXT']);
		$tpl->setVariable('zusatztext', $row['zusatztext']);
		// 1. Textarea mit WYSIWYG-Editor
		$tpl->setVariable('lbl_inhaltstext', $GLOBALS['LABELS']['INHALTSTEXT']);
		$tpl->setVariable('inhalt1', $row['inhalt1']);
		
		// 2. Textarea mit WYSIWYG-Editor nur anzeigen, wenn im Template ein entsprechender Platzhalter vorhanden ist.
		$general->show_inhalt2($row['template']);
		$tpl->setVariable('lbl_inhaltstext2', $GLOBALS['LABELS']['INHALT2']);
		$tpl->setVariable('inhalt2', $row['inhalt2']);
		

		// Selectbox fuer die Templates erstellen
		$selectbox = $general->create_tpl_selectbox($templates, $row['template']);
		$tpl->setVariable('lbl_template', $GLOBALS['LABELS']['TEMPLATE']);
		$tpl->setVariable('templates', $selectbox);

		// Selectbox fuer die Modules erstellen
		$selectbox = $general->create_mod_selectbox($modules, $row['modul']);
		$tpl->setVariable('lbl_modul', $GLOBALS['LABELS']['MODUL']);
		$tpl->setVariable('modules', $selectbox);

		// Selectbox fuer die Thumbnails erstellen
		$select_thumbs = $this->create_thumbs_selectbox($thumbnails, $row['bild1']);
		$tpl->setVariable('bildselect', $select_thumbs);
		$bild1 = $row['bild1'] == '' ? '../gifs/blank.gif' : $row['bild1'];			
		$tpl->setVariable('lbl_bild', $GLOBALS['LABELS']['BILD']);
		$tpl->setVariable('bild1', $bild1);
		
		// Selectbox fuer das Aktiv-Flag Galerie erstellen
		$table = TABLE_PREFIX.'seiten';
		$field = 'galerie';
		$selectbox = $general->create_aktiv_selectbox($table, $field, $row['galerie']);
		$tpl->setVariable('lbl_galerie', $GLOBALS['LABELS']['BILDERGALERIE']);
		$tpl->setVariable('galerie_aktiv', $selectbox);

		// Formularbuttons
		$tpl->setVariable('lbl_reset', $GLOBALS['LABELS']['RESET']);
		$tpl->setVariable('lbl_escape', $GLOBALS['LABELS']['ESCAPE']);
		$tpl->setVariable('lbl_save', $GLOBALS['LABELS']['SAVE']);
		
		$tpl->parseCurrentBlock();			
		$tpl->show();
	}
	
	/**
	 * Zeilen abwechselnd mit CSS-Klasse col_even oder col_odd versorgen
	 * @param: $index index
	 * @return: $class CSS-Klasse
	 */
	private function flipflop($index) {
		$class = $index % 2 == 0 ? 'col_even' : 'col_odd';
		return $class;
	}
	
	// die Checkbox fuer das Aktiv-Flag soll checked oder leer sein.
	public function create_checkbox($aktiv)
	{
		$checkbox = '<input type="checkbox" id="aktiv" name="aktiv" value="ja"  ';
		$aktiv == 'j' ? $checkbox .= 'checked="checked" />' : $checkbox .= ' />';
		return $checkbox;
	}

	private function create_thumbs_selectbox($thumbnails, $bild)
	{
		if (!$pages) { $pages = new pagesPresent($tpl); }
		$selectbox = $pages->create_thumbs_selectbox($thumbnails, 1, $bild);
		return $selectbox;
	}


	private function show_menu($from) {
		global $tpl;
		$tpl->setCurrentBlock('tabnav');
		
		switch ($from) {
			case 'edit':
				$action = 'esc';
				$text   = $GLOBALS['TEXTE']['ABBRECHEN'];
				break;
			
			default: 
				$text 	= $GLOBALS['TEXTE']['TEXT_NEUE_HAUPTNAVI']; 
				$action = 'neu';
				break;			
		}
		$link = '<a class="passivnav" href="'.$_SERVER['PHP_SELF'].'?action='.$action.'">&nbsp;'.$text.'&nbsp;</a>';
		$tpl->setVariable('link',$link);
		$tpl->parseCurrentBlock();		
	}
	
	public function xx()
	{
	
	}

} 


?>
