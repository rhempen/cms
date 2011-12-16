<?php
/**
 * ----------------------------------------------------------
 * (c) 2008  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * View-Klasse fuer die Ausgabe der Navigation (horizontal und vertikal)
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2008-05-05
 */

class navigationPresent
{
	private $mTpl;

    /* Constructor */
    function __construct($tpl) 
    {
		$this->mTpl	= $tpl;
    }                                                                          

    /* Neue Methoden implementieren */
    
    /**
     * 	Ausgabe von Unterpositionen als Dropdown im horizontalen Menu 
    */ 
    public function positionen_dropdown() 
    {
    	global $tpl;
    	global $redirect, $general;
    	global $unav_array;
    	global $eintrag;
    	global $tempid;
    	
      	$tpl->setCurrentBlock('unavi_horiz');
      	$tpl->setVariable('ul_unavi_h_start', '<ul class="ebene02">');
    	// alle Unterpositionen pro Servicenavigationspunkt
		foreach ($unav_array as $subid => $value)
		{
			list($kap, $ukap, $label) = explode('-',$value);
			if ($eintrag['kap'] != $kap) { continue; }
			$nav_url = $redirect->set_navlink($tempid, $subid);
			$link    = '<a href="'.urldecode($nav_url).'">'.$label.'</a>';
			$tpl->setVariable('unavi_h_link',$link);
			$tpl->parseCurrentBlock();
		}
		$tpl->setVariable('ul_unavi_h_ende', "</ul>");
		$tpl->parseCurrentBlock();
		$tpl->setCurrentBlock('navi_horiz');
    }
    
    
    /**
     * 	Ausgabe von Unterpositionen als horizontales Submenu 
    */ 
    public function positionen_submenu() 
    {
    	global $tpl, $frontend;
    	global $unav_array;
    	global $akt_kap;
    	global $akt_navid;
    	global $akt_subid;
    	global $redirect, $general, $naviout;
    	global $aktive_menupos, $css_classes;

    	// damit der Bereich fuer die vertikale Subnavigation wirklich nur dann
    	// angezeigt wird, wenn sie benoetigt wird, muss hier anhand von $akt_kap
    	// gecheckt werden, ob diese vom Typ H oder V ist. Nur wenn $akt_kap vom Typ H ist
    	// muss sie angezeigt werden.

		$rc = $this->check_subnavi_type();
    	if ($rc === true) 
    	{ 
	    	$tpl->setCurrentBlock('subnavi_'.SUBMENU_DIR);
            $frontend->set_css_class('subnav', $akt_navid, $css_classes);
		    $tpl->setVariable('ul_subitem_start', '<ul>');
			// alle Unterpositionen pro Navigationspunkt (horizontal)
			foreach ($unav_array as $subid => $value) 
			{
			    $tpl->setCurrentBlock('subitem_'.SUBMENU_DIR);
				list($kap, $ukap, $label, $type) = explode('-',$value);
				if ($kap != $akt_kap) { continue; }
				if ($type != $GLOBALS['NAVI']['HORIZONTAL']) { continue; } // hier sollen nur Nav-Typen = 'H' angezeigt werden
		        $nav_url = $redirect->set_navlink($akt_navid, $subid);
		        $link    = '<a href="'.urldecode($nav_url).'"';
		        if ($subid == $akt_subid) { 
                    $style = $naviout->set_style(THEME_SELECTED);
                    $class = $frontend->set_css_class('subnav', $aktive_menupos, $css_classes);
                    $link .= ' class="'.$style.' '.$class.'"';
                }
		        $link 	.= '>'.$label.'</a>';
				if (SUBMENU_DIR == 'horizontal') { $tpl->setVariable('richtung_subnavi', HMENU_RICHTUNG); }
				$tpl->setVariable('subnavi_link',$link);		
		        if ($subid == $akt_subid) { $tpl->setVariable('subnavi_aktiv', ' class="active"'); }
				$tpl->parseCurrentBlock();
			}			
		    $tpl->setVariable('ul_subitem_ende', "</ul>");
		    //$tpl->setCurrentBlock('subnavi_'.SUBMENU_DIR);		
			$tpl->parseCurrentBlock();
    	}	
    }
    	
    /**
     * 	Ausgabe von Unterpositionen als Liste im vertikalen Haupt-Menu 
     *	Zuvor wird geprueft, ob der aktuelle Link vom Typ = 'H' ist, denn
     *	nur dann soll der Subnavi-Block angezeigt werden.
    */ 
    private function check_subnavi_type() 
    {
    	global $unav_array, $akt_kap;
    	$unavis = array(); $rc = false;
    	$anz = count($unav_array);
//    	if (SUBMENU_DIR == 'horizontal' && $anz > 0) { 
    	if ($anz > 0) { 
	    	$unavis = $unav_array;
    		foreach ($unavis as $subid => $value) 
    		{
				list($kap, $ukap, $label, $type) = explode('-',$value);
				if ($kap == $akt_kap && $type == $GLOBALS['NAVI']['HORIZONTAL']) { $rc = true; } 
				else { continue; } 
    		}
    		return $rc;
    	}    	
    }
    
    	
    /**
     * 	Ausgabe von Unterpositionen als Liste im vertikalen Haupt-Menu 
    */ 
    public function positionen_hauptnavigation() 
    {
    	global $tpl, $frontend;
    	global $redirect, $general;
    	global $unav_array;
    	global $eintrag;
    	global $tempid;
    	global $navtxt;
    	global $akt_kap;
    	global $akt_subid;
    	global $aktive_menupos, $css_classes;

    	$tpl->setVariable('ul_start', '<ul>');
      	$tpl->setCurrentBlock('unavigation');
			foreach ($unav_array as $subid => $value)
			{
				list($kap, $ukap, $label) = explode('-',$value);
				if ($eintrag['kap'] != $kap) { continue; }

				$ausgewaehlt = ''; $style = '';
				if ($akt_subid == $subid) {
					$nav_id = $eintrag['nav_id'];
					$ausgewaehlt = ' class="active"';
					$style = $frontend->set_css_class('subnav', $aktive_menupos, $css_classes);
                    if ($style == '') {$style = $ausgewaehlt; }
				}
				$nav_url = $redirect->set_navlink($tempid, $subid);
				$tpl->setVariable('aktivu',$ausgewaehlt);
				$link  = '<a href="'.urldecode($nav_url).'"'.$style.'>'.$label.'</a>';
				$tpl->setVariable('linku',$link);
				$tpl->parseCurrentBlock();
			}
			$tpl->setCurrentBlock('navigation');
			$tpl->setVariable('ul_end', "</ul>");
			$tpl->parseCurrentBlock();
			}
    	
	/**
	 * 	Wenn fuer den Hauptnavigationspunkt ein Unternavigationspunkt vorhanden ist wird der entprechende Eintrag zurueckgeliefert.
	 *	@param: $kap - aktuelle Kapitelnummer
	 *	@param: $unav - Array mit allen Unternavigationspunkten 
	 *	@return: $ukap - Unternavigationspunkt	 
	*/
    public function check_ukap($kap, $unav) 
    {
		$ukap = 0;
		foreach ($unav as $key => $value) {
			list($val,$unterkap, $label) = explode("-",$value);
			if ($kap == $val) {
				$ukap = $key;
				break;
			}		
		}
		return $ukap;    	
    }
    
    /* CSS-Eigenschaften des aktiven Menupunktes setzen */
	public function set_style($thema, $dir='H') 
	{
		// Dir=H = Hauptnavigation, Dir=S = Servicenavigation
		switch ($thema) {
	      case 'publicdev/':
//	        $style = $dir == 'H' ? ' style="color:#6374B3; background-color:#dedede;border-left:5px solid #E46315;"'
//                        		 : 'class="active"';
	        break;
	      case 'hempen/':
//	        $style = $dir == 'H' ? ' style="color:#F0FFFF; background-color: #C1AD79;"'
//	        					 : 'class="active"';
	        break;
	      case 'default/':
//	        $style = $dir == 'H' ? ' style="color:#F0FFFF;"'
//	        					 : 'class="active"';
	        break;                    
	      case 'gigi/':
//	        $style = $dir == 'H' ? ' class="active"'
//	        					 : ' class="active"';
	        break;                    
//	      case 'feednsmile/':
//		    $style = ' class="active"';
//            break;
	      default:
//		    $style = ' class="active"';
		    $style = 'active';
	        break;                    
	    }
	    return $style;		
	}
	
	public function set_pipe() 
	{
		// das Pipe-Zeichen | wird nicht bei allen Themes ben�tigt
		switch (THEME_SELECTED) {
		  case 'art4art/':
			return '&nbsp;|&nbsp;';
		  	break;
		  default:
			return '';
			break;		
		}
	}
    
}
?>
