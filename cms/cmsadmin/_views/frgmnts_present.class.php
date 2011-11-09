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
		global $tpl;
		// Datenzeilen 
		$tpl->setCurrentBlock('frgmntzeile');
		while ($row = $frgmnts->fetchRow(MDB2_FETCHMODE_ASSOC)) 
		{
			$i++;
			// CSS-Klasse festlegen
			$class = $class == 'odd' ? 'even' : 'odd';
			$tpl->setVariable('sortid',$row['sort_id']);
			$tpl->setVariable('class', $class);
			$tpl->setVariable('nr', $row['frag_id']);
			$tpl->setVariable('frgname', $row['name']);
			$tpl->setVariable('bearbeiten', $this->compose_workmenu($row['frag_id'],$row['name']));
			$tpl->setVariable('sorticon', $this->compose_sorticon($row['frag_id']));
			// die Zeile parsen
			$tpl->parseCurrentBlock();
		}		
	}

  /* Workmenu zusammenstellen 
    @params: $frgid - Aktuelle Fragment-id
    @return: $html  - html f�r das anzuzeigende Menu
  */
  public function compose_workmenu($frgid,$frgname)
  {
    if ((int)$frgid > 0) {
      $url  = '../_controllers/frgmnts_co_maintain.php?frgid='.$frgid.'&action=';
      $html  = '<ul id="workmenu">';
      $script = 'javascript:setModus(\'edit\','.$frgid.');';
			$html .= '<li class="workitem"><a href="#"><img src="../gifs/edit.gif" alt="'.$GLOBALS['TEXTE']['TEXT_EDIT'].'" title="'.$GLOBALS['TEXTE']['TEXT_EDIT'].'" onclick="'.$script.'" /></a></li>';
      $script = 'javascript:if (confirm(\''.sprintf($GLOBALS["TEXTE"]["FRGMNT_CONFIRM_DELETE"],$frgname).'\')) setModus(\'dele\','.$frgid.');';
      $html .= '<li class="workitem"><a href="#"><img src="../gifs/delete.gif" alt="'.$GLOBALS['TEXTE']['TEXT_DELETE'].'" title="'.$GLOBALS['TEXTE']['TEXT_DELETE'].'" onclick="'.$script.'"/></a></li>';
      $script = 'javascript:setModus(\'copy\','.$frgid.');';
			$html .= '<li class="workitem"><a href="#"><img src="../gifs/copy_object.gif" alt="'.$GLOBALS['TEXTE']['TEXT_COPY'].'" title="'.$GLOBALS['TEXTE']['TEXT_COPY'].'" onclick="'.$script.'" /></a></li>';
      $script = 'javascript:setModus(\'crea\','.$frgid.');';
			$html .= '<li class="workitem"><a href="#"><img src="../gifs/create.gif" alt="'.$GLOBALS['TEXTE']['TEXT_CREATE'].'" title="'.$GLOBALS['TEXTE']['TEXT_CREATE'].'" onclick="'.$script.'" /></a></li>';
      $html .= '</ul>';      
    }
    return $html;
  }

  /* Sorticon zusammenstellen 
    @params: $frgid - Aktuelle Fragment-id
    @return: $sorticon  - html f�r das anzuzeigende Menu
  */
  public function compose_sorticon($frgid) 
  {
    $html = '<img src="../gifs/up.gif" height="15" width="12" border="0" alt="'.$GLOBALS['TEXTE']['TEXT_MOVE'].'" title="'.$GLOBALS['TEXTE']['TEXT_MOVE'].'" />';
		$html .= '<img src="../gifs/down.gif" height="15" width="12" border="0" alt="'.$GLOBALS['TEXTE']['TEXT_MOVE'].'" title="'.$GLOBALS['TEXTE']['TEXT_MOVE'].'" />';
    return $html;
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
