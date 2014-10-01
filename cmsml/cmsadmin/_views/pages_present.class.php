<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse f�r die Praesentation der Navigation am Bildschirm 
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2007-07-14
 * @package     CMSADMIN/Pages
 * 
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
    public function show_pages_overview($overview, $area, $action, $msg, $language) 
	{
		global $tpl, $general;
		$tpl->loadTemplatefile('pages_overview.tpl.html', true, true);
		$tpl->setVariable('titel', 'Seiten-Verwaltung');
    	$this->show_menue($area, 'show', $language);
		$i = 0;

        // Sprachen aus cms_spezial lesen, um die Übersetzungen anzuzeigen
        if (empty($GLOBALS['sprachcodes'])) { $cfg->sprachen_lesen(); }
        $sprachen = $GLOBALS['sprachcodes'];
        if (count($sprachen) == 0) $sprachen[0] = $language;	
    	
	   	// Browser-Detection
    	$useragent = strtolower($_SERVER['HTTP_USER_AGENT']);
    		
    	// Datenzeilen
		//$tpl->setCurrentBlock('list_block');
		while ($row = $overview->fetchRow(MDB2_FETCHMODE_ASSOC)) 
		{
			$fach = $row['fach_'.$language]; 
			
			$tpl->setCurrentBlock('list_block');
			// Gruppenbruch 
			if ($fach != $fach_save) {
				//--> $Gruppenbruch noch nicht hier gleichsetzen; wird weiter unten nochmals benoetigt!				
				//$fach_save = $fach; 
				$tpl->setVariable('class_gruppe_abstand', 'gruppenbruchabstand');
				$tpl->setVariable('class_gruppe', 'gruppenbruch');
				$tpl->setVariable('text_plus_minus', $GLOBALS['TEXTE']['TEXT_PLUS_MINUS']);
				$tpl->setVariable('name_plus_minus', $fach);
				$i = 0;		
				// Cookies f�r die Anzeige initialisieren, falls n�tig
				if ($_COOKIE[$fach_save] == '') { $_COOKIE[$fach_save] = 'close'; }
			} else {
				$tpl->setVariable('class_gruppe_abstand', 'hide');
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
				// Gruppenbruch muss jetzt gleich gesetzt werden 
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
            
            // sprachabhängige Texte und CSS-Klassen setzen
            $tpl->setVariable('class_de', 'hide');
            $tpl->setVariable('class_en', 'hide');
            $tpl->setVariable('class_fr', 'hide');
            $tpl->setVariable('class_it', 'hide');
            foreach($sprachen as $key => $sprache) {
              // falls der Name leer ist wird "value" reingestellt, damit der Benutzer
              // den Wert mit dem InPalceEditor ändern kann
              $pagename = $row['name_'.$sprache] == '' ? 'value' : $this->reslash($row['name_'.$sprache]);
              $tpl->setVariable('name_'.$sprache, $pagename);
              $class_lang = $sprache == $language ? 'show' : 'hide';
              $tpl->setVariable('class_'.$sprache,$class_lang); 
              $tpl->setVariable('lang_'.$sprache,strtoupper($sprache).':');
            }
            // ID der Text-Tabelle
            $lang_id = 'lang_'.$row['page_id'];
            $tpl->setVariable('lang_id', $lang_id);	
            
			$tpl->setVariable('page_id', $row['page_id']);
			$tpl->setVariable('fach', $fach);
            // Ikone für Übersetzungen
            $button_translate = $this->create_button("translate",$row);
            $tpl->setVariable('button_translate', $button_translate);
            
      		// Buttons fuer Aktiv/Inaktiv
			$button_freed = $this->create_button("freed");
			$button_block = $this->create_button("blocked");
			$aktiv = $row['aktiv'] == 'j' ? $button_freed : $button_block;
			$farbe = $row['aktiv'] == 'j' ? 'green' : 'red';
			$tpl->setVariable('button_aktiv', $aktiv);
			$tpl->setVariable('farbe', $farbe);			
			$tpl->setVariable('aktivid', $row['aktiv'].$row['page_id']);
            
			$tpl->setVariable('datum_von', $this->date_mysql2german($row['datum_von']));
			$tpl->setVariable('datum_bis', $this->date_mysql2german($row['datum_bis']));
            $button_upload = $this->create_button("page_upload",$row);
			$tpl->setVariable('button_upload',$button_upload);
            
            $button_bilder_edit = $this->create_button("page_bilder_edit",$row);
			$tpl->setVariable('button_bilder_edit',$button_bilder_edit);            

            $button_edit  = $this->create_button("page_edit",$row);
			$tpl->setVariable('button_edit',$button_edit);            

            $button_delete = $this->create_button("page_delete",$row);
            $tpl->setVariable('button_delete',$button_delete);            
            
			if ($i > 1) { // Pfeil zum Hochziehen erst ab 2. Datensatz
              $button_move_up = $this->create_button("page_move_up",$row);
			} else {
              $button_move_up = '<img src="../gifs/spacer.gif" alt=" " title=" "/>';	
			}
			$tpl->setVariable('button_moveup', $button_move_up);							
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
	 * Das Code-Snippet für einen Button zusammenstellen
	 * @param:	$type = Type des Buttons: Submit, Button, Reset
	 * @param:  $row  = der Datensatz der Seite, um den Link zusammenzustellen
     * @return: $button = das HTML-Snippet
	*/
	private function create_button($class,$row=NULL)      
	{
      global $language;
      $script = $title = $confrm = '';
      $click  = ' onclick="%s"';
      $submit = "genericSubmit('%s','%s')";
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
          $langId = 'lang_'.$row['page_id'];
          $script = "toggle_navi_trans('".$langId."','".LANGUAGE."');"; 
          $script = sprintf($click,$script);
          break;
        case 'page_upload':
          $title  = $GLOBALS['TEXTE']['TEXT_UPLOAD'];
          $link   = "../_controllers/pictures_co_maintain.php?action=uploadFiles&dir=".MEDIA_ROOT."/".$row['kennzeichen']."&type=P&ref_id=".$row['page_id'];
          $submit = sprintf($submit,$link,$confrm);
          $script = sprintf($click,$submit);
          break;
        case 'page_bilder_edit':
          $link   = "../_controllers/pictures_co_maintain.php?action=imagesEdit&dir=".MEDIA_ROOT."/".$row['kennzeichen']."/_images"."&type=P&ref_id=".$row['page_id'];
          $title  = $GLOBALS['TEXTE']['TEXT_BILDER_EDIT'];
          $submit = sprintf($submit,$link,$confrm);
          $script = sprintf($click,$submit);
          break;
        case 'page_edit':
          $link   = $_SERVER['PHP_SELF']."?action=edit&page_id=".$row['page_id']."&dir=".MEDIA_ROOT;
          $title  = $GLOBALS['TEXTE']['TEXT_PAGE_EDIT'];
          $submit = sprintf($submit,$link,$confrm);
          $script = sprintf($click,$submit);
          break;
        case 'page_delete':
          $link   = $_SERVER['PHP_SELF']."?action=delete&page_id=".$row['page_id'];          
          $title  = $GLOBALS['TEXTE']['TEXT_PAGE_DELETE'];
          $confrm = $GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE'];
          $submit = sprintf($submit,$link,$confrm);
          $script = sprintf($click,$submit);
          break;
        case 'page_move_up':
          $link   = $_SERVER['PHP_SELF']."?action=moveUp&page_id=".$row['page_id']."&langu=".$language;
          $title  = $GLOBALS['TEXTE']['TEXT_REIHENFOLGE'];
          $submit = sprintf($submit,$link,$confrm);
          $script = sprintf($click,$submit);
          break;
      }
      $button = sprintf($button,$type,$class,$title,$script);
      return $button;
   }
    
    
	/**
	 * 	Eine neue Seite zum Erfassen anbieten
	 * 	@param:	$area
	 *	@param: $next_id_kz - naechstes verfuegbares Kennzeichen fuer die Neue Seite	
	 * 	@param:	$template
	 * 	@param:	$unavi
	*/
	public function new_page($area, $next_id_kz, $templates, $unavi) 
	{
		global $tpl, $navi, $general, $language;
		
		$tpl->loadTemplatefile('page_edit.tpl.html', true, true);
		// Menutext
		$this->show_menue($area, 'new', $language);
		
		$tpl->setCurrentBlock('row');
		
		list($next_page_id, $next_kz) = explode('/', $next_id_kz);
		$tpl->setVariable('page_id', $next_page_id);
		$tpl->setVariable('kennzeichen', $next_kz);
		$tpl->setVariable('domain', $area);
		$tpl->setVariable('text_domain', $navi->read_bezeichnung_by_area($area));

        // PageInfo anzeigen
        $seiteninfo = $this->prepare_pageinfo();
		$tpl->setVariable('seiteninfo', $seiteninfo);
        
        // Selectbox für Sprachauswahl
        $selectbox = $general->create_sprachen_selectbox($next_page_id, 'page');
		$tpl->setVariable('sprachwahl', $selectbox);
        
		// Selectbox fuer die Templates erstellen
		$tpl_selectbox = $general->create_tpl_selectbox($templates, $row['template']);
		$tpl->setVariable('templates', $tpl_selectbox);

		// Selectbox fuer die Unternavigationspunkte erstellen
		$navi_selectbox = $general->create_navi_selectbox($unavi, '');
		$tpl->setVariable('navigation', $navi_selectbox);
		
		// die uebrigen Platzhalter im Formular fuellen
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
	public function edit_page($row, $templates, $unavi, $thumbnails, $area, $domain, $msg, $dbaction='') 
	{			
		global $tpl, $general, $frontget, $pages;
        global $language, $langu_tra;
        $language = $langu_tra;
		$tpl->loadTemplatefile('page_edit.tpl.html', true, true);
		// Menutext und Meldungen ausgeben
		$this->show_menue($area, 'edit', $language);

		$tpl->setCurrentBlock('row');
		$tpl->setVariable('page_id', $row['page_id']);
		$tpl->setVariable('kennzeichen', $row['kennzeichen']);
		$tpl->setVariable('name', $this->reslash($row['name_'.$language]));
		$tpl->setVariable('domain', $row['domain']);
		$tpl->setVariable('text_domain', $area);
		$tpl->setVariable('aktiv', $row['aktiv']);

        // PageInfo anzeigen
        $seiteninfo = $this->prepare_pageinfo();
		$tpl->setVariable('seiteninfo', $seiteninfo);
        
        // Selectbox für Sprachauswahl
        $selectbox = $general->create_sprachen_selectbox($row['page_id'], 'page');
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
		$tpl_selectbox = $general->create_tpl_selectbox($templates, $row['template']);
		$tpl->setVariable('templates', $tpl_selectbox);

		// Selectbox fuer die Unternavigationspunkte erstellen
		$navi_selectbox = $general->create_navi_selectbox($unavi, $row['nav_id']);
		$tpl->setVariable('navigation', $navi_selectbox);
									
		$tpl->setVariable('datum_von', $this->date_mysql2german($row['datum_von']));
		$tpl->setVariable('datum_bis', $this->date_mysql2german($row['datum_bis']));
		$tpl->setVariable('kurztext', $row['kurztext_'.$language]);
		$tpl->setVariable('maxzeichenwert', MAX_LENGTH_KURZTEXT > 0 ? MAX_LENGTH_KURZTEXT : 230 );
		$tpl->setVariable('inhalt1', $row['inhalt1_'.$language]);
		
		// 2. Textarea mit WYSIWYG-Editor nur anzeigen, wenn im Template ein entsprechender Platzhalter vorhanden ist.
		$general->show_inhalt2($row['template']); 
		$tpl->setVariable('lbl_inhalt2', $GLOBALS['LABELS']['INHALT2']);
		$tpl->setVariable('inhalt2', $row['inhalt2_'.$language]);
		
		// Auswaehlen eines Thumbnails fuer bild1
		$thumbnail_selectbox1 = $this->create_thumbs_selectbox($thumbnails, 1, $row['bild1']);
		$tpl->setVariable('thumbnail_selectbox1', $thumbnail_selectbox1);
		// Falls kein Bild in der DB gespeichert ist, wird als Ersatz ein blank.gif eingesetzt
		$bild1 = $row['bild1'] == '' ? '../gifs/blank.gif' : $row['bild1'];
		$tpl->setVariable('bild1', $bild1);
				
		// Auswaehlen eines Thumbnails fuer bild2
		$thumbnail_selectbox2 = $this->create_thumbs_selectbox($thumbnails, 2, $row['bild2']);
		$tpl->setVariable('thumbnail_selectbox2', $thumbnail_selectbox2);
		// Falls kein Bild in der DB gespeichert ist, wird als Ersatz ein blank.gif eingesetzt
		$bild2 = $row['bild2'] == '' ? '../gifs/blank.gif' : $row['bild2'];
		$tpl->setVariable('bild2', $bild2);
	
		// die uebrigen Platzhalter im Formular fuellen
		$tpl->setVariable('seite', $row['name_'.$language]);
		$tpl->setVariable('action_url', $_SERVER['PHP_SELF'].'?action=save&dbaction=update&page_id='.$row['page_id']);
		$tpl->setVariable('link_abbrechen', $_SERVER['PHP_SELF'].'?area='.$area);

		
		// Daten aus der DB ins Formular ausgeben
		if ($row['linkid1'] > 0) { 
			$tpl->setVariable('wert_linkid1', $row['linkid1']); 
			$tpl->setVariable('wert_link1', $pages->read_link_name($row['linkid1'])); 
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
		
		// Selectbox fuer die Anzeige der GalerieLinks erstellen
		$field = 'galerie';
        $table = TABLE_PREFIX.'pages';
		$selectbox = $general->create_aktiv_selectbox($table, $field, $row['galerie']);
		$tpl->setVariable('galerie_aktiv', $selectbox);
		
		// Labels ausgeben
		$this->set_labels('edit');

		// Seite parsen und anzeigen
		$tpl->parseCurrentBlock();
		
		$tpl->show();
	}	
	
	/**
	 * 	lables ausgeben fuer Page Edit und Page New 
	 *  @param: $modus 
	*/
	private function set_labels($modus='') 
	{
		global $tpl;
		$tpl->setVariable('lbl_message', $GLOBALS['LABELS']['MESSAGE']);
		$tpl->setVariable('lbl_seiteninfo', $GLOBALS['LABELS']['SEITEN_INFO']);
		$tpl->setVariable('lbl_sprachwahl', $GLOBALS['TEXTE']['TEXT_TRANSLATE']);
		$tpl->setVariable('lbl_template', $GLOBALS['LABELS']['TEMPLATE']);
		$tpl->setVariable('lbl_integration', $GLOBALS['LABELS']['INTEGRATION']);
		$tpl->setVariable('lbl_name', $GLOBALS['LABELS']['SEITENTITEL']);
		$tpl->setVariable('lbl_kurztext', $GLOBALS['LABELS']['KURZTEXT']);
		$tpl->setVariable('max_zeichen', $GLOBALS['LABELS']['MAXZEICHEN']);
		$tpl->setVariable('restl_zeichen', $GLOBALS['LABELS']['ZEICHEN']);
		$tpl->setVariable('lbl_inhalt1', $GLOBALS['LABELS']['INHALTSTEXT']);
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
			// Die Tabellenrows für Bilder und Inhalt2 nicht anzeigen -> display: none;
			$tpl->setVariable('none', 'none');	
			$tpl->setVariable('hide_inhalt2',HIDDEN); 
			$tpl->setVariable('evenodd2','col_odd');			
		}
	}
	
    /* Erstellen des HTML-Snippets für die Pageinfo
     * Die ID's werden bewusst in span-Tag mit separater Id gesetzt, damit
     * sie per JS ansprechbar sind
     * @param: $row (global) - Row mit den Daten der UnterSeite
     * @return: $seiteninfo - das HTML-Snippet mit dem Seiteninfos
     */
    private function prepare_pageinfo() {
      global $row, $next_id_kz;
      if (!isset($row)) {
        list($next_page_id, $next_kz) = explode('/', $next_id_kz);
        $row['page_id'] = $next_page_id;
        $row['kennzeichen'] = $next_kz;
      }
      $pageId   = '<span id="pageId">'.$row['page_id'].'</span>';
      $navId    = '<span id="naviId">'.$row['nav_id'].'</span>';
      $bildPfad = '<span id="bildPfad">'.$row['kennzeichen'].'</span>';
      $seiteninfo = sprintf($GLOBALS['LABELS']['SEITEN_INFO_VALUES'],$pageId,$navId,$bildPfad);
      return $seiteninfo;
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
	private function show_menue($area='', $action, $language) 
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
                $bezeichnung = $row['bezeich_'.$language];
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
            $action = 'esc';
            $text   = $GLOBALS['TEXTE']['ABBRECHEN'];
            $link = '<a class="passivnav page_abbrechen" href="#">&nbsp;'.$text.'&nbsp;</a>';
            $this->show_tabnav('link',$link);

            $action = 'save';
            $text   = ucfirst($GLOBALS['LABELS']['SAVE']); // make first Charakter uppercase
            $link = '<a class="passivnav page_sichern" href="#">&nbsp;'.$text.'&nbsp;</a>';
            $this->show_tabnav('link',$link);
        }
	} 
	
    /**
	 * 	Einen Menupunkt im Edit-Modus ausgeben 
	 *	@param: $var
     *  @param: $link
	*/
	private function show_tabnav($var,$html) {
		global $tpl;
		$tpl->setCurrentBlock('tabnav');		
		$tpl->setVariable($var, $html);
		$tpl->parseCurrentBlock();			
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
		
		$selectbox_start = '<select id="'.$id.'" name="'.$name.'" size="1" class="selboxEdit" onchange="change_image(this.selectedIndex, this.id);">' . "\n";
		$selectbox_ende  = '</select><br/>';
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
