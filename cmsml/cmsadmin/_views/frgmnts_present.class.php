<?php
/**
 * ----------------------------------------------------------
 * (c) 2010  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse f�r die Präsentation der Seitenfragmente am Bildschirm
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2010-01-15
 */
 
class frgmntsPresent
{
  private $mTpl;

  function __construct($tpl) 
  {
      $this->mTpl	= $tpl; 
  }                                                                          

  /* Neue Methode implementieren */	
  /* fragmente_anzeigen */
  public function fragmente_anzeigen($frgmnts, $tab, $message)
  {
      global $general;
      global $tpl;
      $tpl->loadTemplatefile('frgmnts_overview.tpl.html', true, true);
      // Menuposition für neuen Hauptnavigationspunkt
      $this->show_menu($tab);
      // Meldungen ausgeben
      $general->print_message($message);
      // Fragmente ausgeben
      $this->present_fragments($frgmnts);
      // Die Methode show() beendet die Template-Verarbeitung und startet die Auslieferung der 
      // erzeugten Seite an den Browser. Bis zu diesem Zeitpunkt befindet sich die produzierte 
      // HTML-Seite im Cache-Speicher des Servers 
      $tpl->show();
  }

  /* Anzeigen des Menus 
      @params: $cat - zZ. ist das nur Fragmente, sp�ter auch CSS und ev. weitere
  */
  private function show_menu($tab) 
  {
      global $tpl;
      $tpl->setCurrentBlock('tabnav');

      // Tabreiter 
      $text   =  $GLOBALS['TEXTE']['FRAGMENTE'];
      $class  = 'passivnav';
      if ($text == $tab) { $class='aktivnav'; }
      $link = '<a class="'.$class.'" href="'.$_SERVER['PHP_SELF'].'?tab='.$text.'">&nbsp;'.$text.'&nbsp;</a>';
      $tpl->setVariable('link',$link);
      $tpl->parseCurrentBlock();		

      if ($tab != $GLOBALS['TEXTE']['CSS']) {
          $text   = $GLOBALS['TEXTE']['TEXT_CREATE'];
          $class  = 'passivnav';
          if ($text == $tab) { $class='aktivnav'; }
          $link = '<a class="'.$class.'" href="'.$_SERVER['PHP_SELF'].'?action=crea">&nbsp;'.$text.'&nbsp;</a>';
          $tpl->setVariable('link',$link);
          $tpl->parseCurrentBlock();
      }

      $text   = $GLOBALS['TEXTE']['CSS'];
      $class  = 'passivnav';
      if ($text == $tab) { $class='aktivnav'; }
      $link = '<a class="'.$class.'" href="'.$_SERVER['PHP_SELF'].'?tab='.$text.'">&nbsp;'.$text.'&nbsp;</a>';
      $tpl->setVariable('link',$link);
      $tpl->parseCurrentBlock();

}

  /* Anzeigen der Fragmente als Liste 
      @params: $frgmnts - Array mit den aus der DB gelesenen Fragmenten
  */
  private function present_fragments($frgmnts) 
  {
    global $tpl, $general;
    // Datenzeilen 
    $tpl->setCurrentBlock('frgmntzeile');
    while ($row = $frgmnts->fetchRow(MDB2_FETCHMODE_ASSOC)) 
    {
      $i++;

      // Buttons erstellen pro Zeile
      $button_edit = $this->create_button("fragment_edit",$row['frag_id']);
      $button_copy = $this->create_button("fragment_copy",$row['frag_id']);
      $button_dele = $this->create_button("fragment_dele",$row['frag_id']);
      $button_move = $this->create_button("fragment_move",$row['frag_id']);

      
      // CSS-Klasse festlegen
      $class = $class == 'odd' ? 'even' : 'odd';
      $tpl->setVariable('sortid',$row['sort_id']);
      $tpl->setVariable('class', $class);
      $tpl->setVariable('nr', $row['frag_id']);
      $tpl->setVariable('frgname', $row['name']);
      $tpl->setVariable('button_edit', $button_edit);
      $tpl->setVariable('button_copy', $button_copy);
      $tpl->setVariable('button_dele', $button_dele);
      $tpl->setVariable('button_move', $button_move);
      // die Zeile parsen
      $tpl->parseCurrentBlock();
    }		
  }

	/**
	 * Das Code-Snippet für einen Button zusammenstellen
	 * @param:	$class  = CSS-Klasse
	 * @param:  $row    = der Datensatz der Seite, um den Link zusammenzustellen
     * @return: $button = das HTML-Snippet
	 */
	public function create_button($class,$row)
	{
      global $language, $general;
      $script = $title = $confrm = '';
      $click  = ' onclick="setModus(\'%s\','.$row.');"';
      $type   = 'button';
      $button = '<button type="%s" class="%s" title="%s" %s></button>';
      switch($class) {
        case 'translate':
          $langId = 'lang_'.$row['nav_id'];
          $script = "toggle_navi_trans('".$langId."','".LANGUAGE."');"; 
          $script = sprintf($click,$script);
          break;
       case 'fragment_edit':
          $title  = $GLOBALS['TEXTE']['TEXT_EDIT'];
          $script = sprintf($click,'edit');
          break;
        case 'fragment_copy':
          $title  = $GLOBALS['TEXTE']['TEXT_COPY'];
          $script = sprintf($click,'copy');
          break;
        case 'fragment_dele':
          $title  = $GLOBALS['TEXTE']['TEXT_DELETE'];
          $script = sprintf($click,'dele');
          break;        
        case 'fragment_move':
          $div    = '<div class="fragment_move">%s</div>';
          $image      = $general->compose_sorticon();
          $button = sprintf($div,$image);
          $title  = $GLOBALS['TEXTE']['TEXT_MOVE'];
          break;
      }
      $button = sprintf($button,$type,$class,$title,$script);
      return $button;
	
	}
  
  /* output - einen Platzhalter in der View mit einem Wert ausgeben 
    @params: $platzhalter - der {Platzhalter} im Template
    @return: $value - Der Wert, der den Platzhalter f�llt
  */
  public function output($platzhalter, $value) 
  {
    global $tpl, $frgid;
    $tpl->loadTemplatefile('frgmnts_overview.tpl.html', true, true);
    $this->show_menu('Fragmente');
    $tpl->setCurrentBlock('edit_mode');
    $tpl->setVariable('frgcontent', $value);
    $tpl->setVariable('frgid', $frgid);
    $tpl->setVariable('action_url', $_SERVER['PHP_SELF'].'?action=save&frgid='.$frgid);
    $tpl->parseCurrentBlock();
    $tpl->show();
  } 

	/******************************************************************************
	 * Methoden zum Anzeigen und Editiren des CSS-Files Fragmente.css
	 ******************************************************************************/

   public function css_editieren() {
      //print_r($csscontent);
      global $general, $tpl, $tab, $message;
      $tpl->loadTemplatefile('frgmnts_overview.tpl.html', true, true);
      // Menuposition für neuen Hauptnavigationspunkt
      $this->show_menu($tab);
      // Meldungen ausgeben
      $general->print_message($message);
      // csscontent ausgeben
      $this->present_css($csscontent);
   }

   private function present_css() {
      global $tpl, $csscontent;
      // Datenzeilen
      $tpl->setCurrentBlock('css_edit');
      $tpl->setVariable('csscontent', $csscontent);
      $tpl->setVariable('action_url', $_SERVER['PHP_SELF'].'?action=csssave');
      $tpl->parseCurrentBlock();
      $tpl->show();
   }

}

?>
