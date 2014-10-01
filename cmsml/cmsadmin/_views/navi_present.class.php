<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse fuer die Praesentation der Navigation am Bildschirm 
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erwaehnt wird
 * @version     1.0 | 2007-07-14
 * @package     CMSADMIN/Navigation
 * 
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
        global $general, $tpl, $naviga, $cfg, $language;
        // Sprachen aus cms_spezial lesen, um die Übersetzungen anzuzeigen
        if (empty($GLOBALS['sprachcodes'])) { $cfg->sprachen_lesen(); }
        $sprachen = $GLOBALS['sprachcodes'];
        if (count($sprachen) == 0) $sprachen[0] = $language;	
      
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
            // sprachabhängige Texte und CSS-Klassen setzen
            $tpl->setVariable('class_de', 'hide');
            $tpl->setVariable('class_en', 'hide');
            $tpl->setVariable('class_fr', 'hide');
            $tpl->setVariable('class_it', 'hide');
            foreach($sprachen as $key => $sprache) {
              $tpl->setVariable('bezeich_'.$sprache, $general->reslash($row['bezeich_'.$sprache]));
              $class_lang = $sprache == $language ? 'show' : 'hide';
              $tpl->setVariable('class_'.$sprache,$class_lang); 
              $tpl->setVariable('lang_'.$sprache,strtoupper($sprache).':');
            }
            // ID der Text-Tabelle
            $lang_id = 'lang_'.$row['nav_id'];
            $tpl->setVariable('lang_id', $lang_id);	

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
					// ist ein Cookie fuer die tr_id gesetzt? - dann entsprechend verbergen oder zeigen
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
			$button_freed = $this->create_button("freed");
			$button_block = $this->create_button("blocked");
			$tpl->setVariable('aktivid', $aktivid);
			$aktiv = $row['aktiv'] == 'j' ? $button_freed : $button_block;
			$farbe = $row['aktiv'] == 'j' ? 'green' : 'red';
			$tpl->setVariable('aktiv', $aktiv);
			$tpl->setVariable('farbe', $farbe);

			// die ID's fuer das Editieren der Menubezeichnung setzen
			$tpl->setVariable('nav_id', $row['nav_id']);

			// Links aufbauen
            $button_translate = $this->create_button("translate",$row);
            $button_upload = $this->create_button("navi_upload",$row);
            $button_bilder_edit = $this->create_button("navi_bilder_edit",$row);
            $button_edit  = $this->create_button("navi_edit",$row);
            $button_copy = $this->create_button("navi_copy",$row);
            $button_create = $this->create_button("navi_create",$row);
            $button_delete = $this->create_button("navi_delete",$row);
            $button_move_up = $this->create_button("navi_move_up",$row);
            
			// Hauptnavigationspunkt 
			if ($row['ukap'] == 0) {
              if (count($sprachen) > 1) { $tpl->setVariable('button_translate', $button_translate); }
              $tpl->setVariable('button_upload',$button_upload);
              $tpl->setVariable('button_bilder_edit',$button_bilder_edit);            
              $tpl->setVariable('button_edit',$button_edit);            
              $tpl->setVariable('button_copy',$button_copy);            
              $tpl->setVariable('button_create',$button_create);            
              $tpl->setVariable('button_delete',$button_delete);            
              // Move-Button (spezial)
              $icon_ups = '<span class="navisort">'.$general->compose_sorticon().'</span>';              
              $tpl->setVariable('button_move',$icon_ups);            
			}
			// Unternavigationspunkt
			else { 
              // Links aufbauen              
              if (count($sprachen) > 1) { $tpl->setVariable('button_translate', $button_translate); }
              $tpl->setVariable('ukap', $row['ukap']);
              $tpl->setVariable('button_upload',$button_upload);
              $tpl->setVariable('button_bilder_edit',$button_bilder_edit);            
              $tpl->setVariable('button_edit',$button_edit);            
              $tpl->setVariable('button_delete',$button_delete);            
              if ($row['ukap'] > 10) {
                $tpl->setVariable('button_move_up',$button_move_up);            
              }
              // Unterkapitel verbergen oder zeigen
              $disp_none = 'style="display:none;"';
              if ($plus_minus == 'plus') { $tpl->setVariable('ukap_hide', $disp_none); }
			}
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

	/**
	 * Das Code-Snippet für einen Button zusammenstellen
	 * @param:	$type = Type des Buttons: Submit, Button, Reset
	 * @param:  $row  = der Datensatz der Seite, um den Link zusammenzustellen
     * @return: $button = das HTML-Snippet
	*/
	private function create_button($class,$row=NULL)      
	{
      global $language, $general;
      $script = $title = $confrm = '';
      $click  = ' onclick="%s"';
      $submit = "genericSubmit('%s','%s')";
      $span   = '<span class="%s">%s</span>';
      $type   = 'button';
      $button = '<button type="%s" class="%s" title="%s" %s></button>';
      switch($class) {
        case 'freed':
          $title = $GLOBALS['TEXTE']['TEXT_AKTIV'];
          break;
        case 'blocked':
          $title = $GLOBALS['TEXTE']['TEXT_INAKTIV'];
          break;
        case 'translate':
          $langId = 'lang_'.$row['nav_id'];
          $script = "toggle_navi_trans('".$langId."','".LANGUAGE."');"; 
          $script = sprintf($click,$script);
          break;
        case 'navi_upload':
          $title  = $GLOBALS['TEXTE']['TEXT_UPLOAD'];
          $link   = "../_controllers/pictures_co_maintain.php?action=uploadFiles&dir=".MEDIA_ROOT."/".$row['bildpfad']."&type=N&ref_id=".$row['nav_id'];
          $submit = sprintf($submit,$link,$confrm);
          $script = sprintf($click,$submit);
          break;
        case 'navi_bilder_edit':
          $link   = "../_controllers/pictures_co_maintain.php?action=imagesEdit&dir=".MEDIA_ROOT."/".$row['bildpfad']."/_images"."&type=N&ref_id=".$row['nav_id'];
          $title  = $GLOBALS['TEXTE']['TEXT_BILDER_EDIT'];
          $submit = sprintf($submit,$link,$confrm);
          $script = sprintf($click,$submit);
          break;
        case 'navi_edit':
          $link   = $_SERVER['PHP_SELF']."?action=edit&nav_id=".$row['nav_id']."&dir=".MEDIA_ROOT;
          $title  = $GLOBALS['TEXTE']['TEXT_PAGE_EDIT'];
          $submit = sprintf($submit,$link,$confrm);
          $script = sprintf($click,$submit);
          break;
        case 'navi_copy':
          $link   = $_SERVER['PHP_SELF'].'?action=copy&nav_id='.$row['nav_id'];
          $title  = stripslashes($GLOBALS['TEXTE']['TEXT_COPY_HAUPTNAVI']);
          $confrm = $GLOBALS['TEXTE']['TEXT_COPY_HAUPTNAVI'];
          $submit = sprintf($submit,$link,$confrm);
          $script = sprintf($click,$submit);
          break;
        case 'navi_create':
          $link   = $_SERVER['PHP_SELF']."?action=neuUkap&nav_id=".$row['nav_id'];
          $title  = $GLOBALS['TEXTE']['TEXT_NEUE_UNTERNAVI'];
          $submit = sprintf($submit,$link,$confrm);
          $script = sprintf($click,$submit);
          break;
        case 'navi_delete':
          $link   = $_SERVER['PHP_SELF']."?action=del&nav_id=".$row['nav_id'];          
          $title  = $GLOBALS['TEXTE']['TEXT_PAGE_DELETE'];
          $confrm = $GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE'];
          $submit = sprintf($submit,$link,$confrm);
          $script = sprintf($click,$submit);
          break;        
        case 'navi_move_up':
          $link   = $_SERVER['PHP_SELF']."?action=ukap&nav_id=".$row['nav_id'];          
          $title  = $GLOBALS['TEXTE']['TEXT_REIHENFOLGE'];
          $submit = sprintf($submit,$link,$confrm);
          $script = sprintf($click,$submit);
          break;
      }
      $button = sprintf($button,$type,$class,$title,$script);
      return $button;
   }
    
	
	public function edit_page($navigation, $navi_page, $templates, $modules, $thumbnails) 
	{	
		global $tpl, $general, $frontget;
        global $language, $langu_tra;
        $language = $langu_tra;
		$i=0;
		$tpl->loadTemplatefile('navi_edit.tpl.html', true, true);

		// Menuposition zum Abbrechen
		$this->show_menu('edit');

		// Alle noetigen Felder zum Editieren anbieten	
		$tpl->setCurrentBlock('row');	
        $row = $navi_page;
		// die obersten Platzhalter im Formular fuellen
		$tpl->setVariable('lbl_seite', $GLOBALS['LABELS']['SIE_BEARBEITEN_SEITE']);
		$tpl->setVariable('seite', $row['kurztitel_'.$language]);
		$tpl->setVariable('action_url', $_SERVER['PHP_SELF'].'?action=save&seiten_id='.$row['seiten_id']);
        
		// Alle Felder an das Template uebergeben --> $label muss somit im Template mit dem Feldnamen identisch sein
		$tpl->setVariable('lbl_seiteninfo', $GLOBALS['LABELS']['SEITEN_INFO']);
        $tpl->setVariable('seiteninfo', $this->prepare_seiteninfo());
		$tpl->setVariable('lbl_message', $GLOBALS['LABELS']['MESSAGE']);
		$tpl->setVariable('lbl_zeichen', $GLOBALS['LABELS']['ZEICHEN']);
		$tpl->setVariable('lbl_kurztitel', $GLOBALS['LABELS']['SEITENTITEL']);
		$tpl->setVariable('kurztitel', $row['kurztitel_'.$language]);
		$tpl->setVariable('lbl_zusatztext', $GLOBALS['LABELS']['ZUSATZTEXT']);
		$tpl->setVariable('zusatztext', $row['zusatz_'.$language]);
		// 1. Textarea mit WYSIWYG-Editor
		$tpl->setVariable('lbl_inhaltstext', $GLOBALS['LABELS']['INHALTSTEXT']);
		$tpl->setVariable('inhalt1', $row['inhalt1_'.$language]);
		
		// 2. Textarea mit WYSIWYG-Editor nur anzeigen, wenn im Template ein entsprechender Platzhalter vorhanden ist.
		$general->show_inhalt2($row['template']);
		$tpl->setVariable('lbl_inhaltstext2', $GLOBALS['LABELS']['INHALT2']);
		$tpl->setVariable('inhalt2', $row['inhalt2_'.$language]);
		
        // Selectbox für Sprachauswahl
        $selectbox = $general->create_sprachen_selectbox($row['seiten_id'], 'navi');
		$tpl->setVariable('lbl_sprachwahl', $GLOBALS['TEXTE']['TEXT_TRANSLATE']);
		$tpl->setVariable('sprachwahl', $selectbox);
        // ev. vorhandene Message, welche als GET-Parameter mitgegeben wurde, anzeigen
        $tpl->setVariable('msg_hide','hide');
        $tpl->setVariable('msg_class','info');
        $tpl->setVariable('ledLangu',SPACER);
        if ($_GET['msg_save'] != '') {
          $tpl->setVariable('message',$_GET['msg_save']);
          $tpl->setVariable('ledLangu',$_GET['led_save']);
          $tpl->setVariable('ledAlt',$_GET['msg_save']);
          $tpl->setVariable('ledTitle',$_GET['msg_save']);
          $tpl->setVariable('msg_hide','');
          $tpl->setVariable('msg_class',$_GET['class_save']);
        } 

		// Selectbox fuer die Templates erstellen
		$selectbox = $general->create_tpl_selectbox($templates, $row['template']);
		$tpl->setVariable('lbl_template', $GLOBALS['LABELS']['TEMPLATE']);
		$tpl->setVariable('templates', $selectbox);

		// Selectbox fuer die Modules erstellen
		$selectbox = $general->create_mod_selectbox($modules, $row['modul']);
		$tpl->setVariable('lbl_modul', $GLOBALS['LABELS']['MODUL']);
		$tpl->setVariable('modules', $selectbox);

		// Selectbox fuer die Modules erstellen
		$checkbox = $general->create_memberlogin_checkbox($row['memberlogin']);
		$tpl->setVariable('lbl_memberlogin', $GLOBALS['LABELS']['MEMBERLOGIN']);
		$tpl->setVariable('memberlogin', $checkbox);

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

		// Formularbuttons --> ucfirst macht den 1. Buchstaben uppercase
		$tpl->setVariable('lbl_reset', ucfirst($GLOBALS['LABELS']['RESET']));
		$tpl->setVariable('lbl_escape', ucfirst($GLOBALS['LABELS']['ESCAPE']));
		$tpl->setVariable('lbl_save', ucfirst($GLOBALS['LABELS']['SAVE']));
		
		$tpl->parseCurrentBlock();			
		$tpl->show();
	}
    
    /* Erstellen des HTML-Snippets für das Save-Script, welches von verschiedenen
     * Buttons und der Sprach-Selectbox im Edit-Modus aufgerufen wird  
     * @param: $langu_tra - die aktuelle Sprach
     * @param: $seiten_id - die Id der aktuellen Navi-Seite
     * @return: $save_script - das HTML-Snippet mit dem JS-Aufruf
     */
    private function prepare_save_script($langu_tra,$seiten_id) {
      $save_script = "setLanguForTranslation('".$langu_tra."','".$seiten_id."','navi');";
      return $save_script;
    }
    
    /* Erstellen des HTML-Snippets für die Seiteninfo
     * Die ID's werden bewusst in span-Tag mit separater Id gesetzt, damit
     * sie per JS ansprechbar sind
     * @param: $navi_page (global) - Row mit den Daten der NaviSeite
     * @param: $navigation (global) - Row der Navigation
     * @return: $seiteninfo - das HTML-Snippet mit dem Seiteninfos
     */
    private function prepare_seiteninfo() {
      global $navi_page, $navigation;
      $seitenId = '<span id="seitenId">'.$navi_page['seiten_id'].'</span>';
      $navId    = '<span id="naviId">'.$navi_page['nav_id'].'</span>';
      $bildPfad = '<span id="bildPfad">'.$navigation['bildpfad'].'</span>';
      $seiteninfo = sprintf($GLOBALS['LABELS']['SEITEN_INFO_VALUES'],$seitenId,$navId,$bildPfad);
      return $seiteninfo;
    }
    
    
    /* auszutauschende Texte im Template eintragen
     * @param: $texte - Array mit den sprachabhängigen Texten
     * @return $tpl -  Template-File navi_edit.tpl.html Block "textebylangu"  */
    public function edit_page_replace_texte($texte,$language) {
      global $tpl, $general, $row;
      $tpl->loadTemplatefile('navi_edit_texte.tpl.html', true, true); 
      $tpl->setCurrentBlock('texte');		
      $tpl->setVariable('lbl_zeichen', $GLOBALS['LABELS']['ZEICHEN']);
      $tpl->setVariable('lbl_kurztitel', $GLOBALS['LABELS']['SEITENTITEL']);
      $tpl->setVariable('kurztitel', $texte['kurztitel_'.$language]);
      $tpl->setVariable('lbl_zusatztext', $GLOBALS['LABELS']['ZUSATZTEXT']);
      $tpl->setVariable('zusatztext', $texte['zusatz_'.$language]);
      // 1. Textarea mit WYSIWYG-Editor
      $tpl->setVariable('lbl_inhaltstext', $GLOBALS['LABELS']['INHALTSTEXT']);
      $tpl->setVariable('inhalt1', $texte['inhalt1_'.$language]);

      // 2. Textarea mit WYSIWYG-Editor nur anzeigen, wenn im Template ein entsprechender Platzhalter vorhanden ist.
      $general->show_inhalt2($row['template']);
      $tpl->setVariable('lbl_inhaltstext2', $GLOBALS['LABELS']['INHALT2']);
      $tpl->setVariable('inhalt2', $texte['inhalt2_'.$language]);
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


    // Funktionen werden mittels JS registriert
	private function show_menu($from) {
      global $tpl, $navi_page, $langu_tra;
      switch ($from) {
        case 'edit':
          $action = 'esc';
          $text   = $GLOBALS['TEXTE']['ABBRECHEN'];
          $link = '<a class="passivnav navi_abbrechen" href="#">&nbsp;'.$text.'&nbsp;</a>';
          $this->show_tabnav('link',$link);
          
          $action = 'save';
          $text   = ucfirst($GLOBALS['LABELS']['SAVE']); // make first Charakter uppercase
          $link = '<a class="passivnav navi_sichern" href="#">&nbsp;'.$text.'&nbsp;</a>';
          $this->show_tabnav('link',$link);
          break;
        default: 
          $text 	= $GLOBALS['TEXTE']['TEXT_NEUE_HAUPTNAVI']; 
          $action = 'neu';
          $link = '<a class="passivnav" href="'.$_SERVER['PHP_SELF'].'?action='.$action.'">&nbsp;'.$text.'&nbsp;</a>';
          $this->show_tabnav('link',$link);
          break;			
      }
	}

    
	private function show_tabnav($var,$html) {
		global $tpl;
		$tpl->setCurrentBlock('tabnav');		
		$tpl->setVariable($var, $html);
		$tpl->parseCurrentBlock();			
	}
    
    public function xx()
	{
	
	}

} 


?>
