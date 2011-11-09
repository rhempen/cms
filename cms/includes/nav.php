<?php
/**
 * hempenWeb
 * Application of PEAR ITX-Templates and Database driven hierarchical Navigation
 *
 * Navigation Page
 *
 * @author      Roland Hempen - business [at] hempen [dot] ch
 * @copyright   you are free to use this code as long as you
 *              credit the author - and provide me with your improvements
 * @version     20070910
 *
 * Example-Pagecall: index.php?navid=12&subid=23
 **/

// GET-Parameter entgegennehmen
$akt_navid  = isset($_GET['navid'])  ? (int)$_GET['navid'] : 1;
$akt_subid  = isset($_GET['subid'])  ? (int)$_GET['subid'] : 0;
$akt_pagid	= isset($_GET['pagid'])  ? (int)$_GET['pagid'] : 0;
$phpself  	= $_SERVER['PHP_SELF']; 

if ($_SESSION['debugging'] === true) { echo $akt_navid.' '.$akt_subid.' '.$akt_pageid.'<br />'; }

/*===============================================================================
	Datenbeschaffung f�r die anschliessende Ausgabe	
  ===============================================================================*/
// Gesamte aktive Navigation einlesen
$navigation = $naviget->get_complete_navigation();

// $akt_navid pruefen, ob sie existiert, ansonsten wird die Navid mit dem
// niedrigsten kap und ukap = 0 ausgelesen.
$akt_navid = $naviget->get_home_navid($akt_navid);

// $akt_kap bestimmen anhand der aktuell angeklickten Navid
if ($akt_navid == '') { die('Bitte zuerst in der Administration einen Menupunkt aktivieren!'); }
$akt_kap = $naviget->get_field_value($akt_navid, 'kap');

// Abfuellen von Arrays mit allen aktiven Navigations-und Unternavigations-Punkten
$nav_array 	 = array();
$unav_array	 = array();
$css_classes = array();
$n_id = $akt_navid;
/* Alle Hauptnavigationspunkte */
$naviget->fill_nav_array($akt_navid);
/* Lesen von ev. Zusatz-CSS-Klassen zum Thema */
$css_classes = $frontget->read_css_classes(THEME_SELECTED);

/*===============================================================================
	Ausgabe	der Navigation
  ===============================================================================*/
// Gesamte aktive Navigation einlesen
$navigation = $naviget->get_complete_navigation();

// Anzahl der aktiven Servicenavigationen ermitteln
$anz_service = $naviget->get_anz_services();

/* START Ausgabe Navigation-Block */
$tpl->setCurrentBlock('navigation');

$tempid = null;
$temp	= 'xxx';
$zusatz = '';
$nav_id = 1;
$unav_kennung = '';
$last_label = '';
$aktive_menupos = '';

$count_service = 0;
while ($eintrag = $navigation->fetchRow())
{
	$ausgewaehlt = '';
	$style	= '';
	$temp	= $eintrag['kuerzel'];
	$tempid = $eintrag['nav_id'];
	$ukap_navid = 0;
	if ($eintrag['ukap'] == 0) {
		// Horizontale Navigation
		$navtype = strtoupper($eintrag['nav_type']);
		if ($navtype == $GLOBALS['NAVI']['HORIZONTAL']) 
		{
			/* Pipezeichen | setzen, falls erwuenscht */ 
			$pipe  = $naviout->set_pipe(THEME_SELECTED);
			
			$tpl->setCurrentBlock('navi_h_richtung');
			$tpl->setVariable('richtung_navi', HMENU_RICHTUNG);

			$tpl->setCurrentBlock('navi_horiz');
			$tpl->setVariable('text', $eintrag['bezeichnung']);

			// Unterpositionen 
			$ukap_navid = $naviout->check_ukap($eintrag['kap'], $unav_array);

			// Soll gleich auf die erste Unterposition positioniert werden?			
			if ($ukap_navid != '' && SUBNAV_SOFORT == 'ja') {
				$nav_url = $redirect->set_navlink($tempid, $ukap_navid);
			} else {
				$nav_url = $redirect->set_navlink($tempid);
			}
			$tpl->setVariable('link', $nav_url);

			if ($akt_navid == $tempid) {
				//$frontend->set_css_class('nav', $akt_navid, $css_classes);
				$aktive_menupos = $akt_navid; // Merken der aktiven Navid 
				$style = $naviout->set_style(THEME_SELECTED, $GLOBALS['NAVI']['HORIZONTAL']);
				$tpl->setVariable('hstyle',$style);
			}

			// Ausgabe der Unterpositionen als Dropdown 
			if ($ukap_navid > 0 && HMENU_SUBMENU == 'dropdown') 
			{
				$naviout->positionen_dropdown();
			} else {
				$tpl->parseCurrentBlock();		
			}
			continue;
		}
		
		// Servicenavigation
		if ($navtype == $GLOBALS['NAVI']['SERVICE']) 
		{
			$count_service++;
			$tpl->setCurrentBlock('navi_s_richtung');
			$tpl->setVariable('richtung_navi', HMENU_RICHTUNG);
			$tpl->setCurrentBlock('navi_service');
			$tpl->setVariable('text', $eintrag['bezeichnung']);
			if ($count_service < $anz_service) { $tpl->setVariable('pipe', $pipe); }
			if ($akt_navid == $tempid) { 
				$frontend->set_css_class('service', $akt_navid, $css_classes);			
				$aktive_menupos = $akt_navid; // Merken der aktiven Navid 
			}

			// Soll gleich auf die erste Unterposition positioniert werden?			
			if ($ukap_navid != '' && SUBNAV_SOFORT == 'ja') {
				$nav_url = $redirect->set_navlink($tempid, $ukap_navid);
			} else {
				$nav_url = $redirect->set_navlink($tempid);
			}
			$tpl->setVariable('link', $nav_url);
			$tpl->parseCurrentBlock();		
			continue;		
		}
		
		
		// Vertikale Hauptnavigation
		$tpl->setCurrentBlock('navigation');
		if ($akt_navid == $tempid) 
		{
			$nav_id = $eintrag['nav_id'];
			$aktive_menupos = $akt_navid; // Merken der aktiven Navid 
			$ausgewaehlt = ' class="active"';
			$frontend->set_css_class('nav', $akt_navid, $css_classes);
			$style = $naviout->set_style(THEME_SELECTED, $GLOBALS['NAVI']['VERTIKAL']);
		}
		$label = $eintrag['bezeichnung'];

		$ukap_navid = $naviout->check_ukap($eintrag['kap'], $unav_array);
		// ist SUBNAV_SOFORT = true wird der Link auf dem Hauptnavigationspunkt direkt
		// auf einen ev. vorhandenen Subnavigationspunkt gelenkt
		if ($ukap_navid != '' && SUBNAV_SOFORT == 'ja') {
			$nav_url = $redirect->set_navlink($tempid, $ukap_navid);
		} else {
			$nav_url = $redirect->set_navlink($tempid);
		}

		$last_label = $label;
		$tpl->setVariable('label',$label);
		$tpl->setVariable('aktiv',$ausgewaehlt);
		$link = '<a'.$style.' href="'.urldecode($nav_url).'">'.$label.'</a>';
		$tpl->setVariable('link',$link);
		
		if ($ukap_navid != '' && $eintrag['nav_id'] == $akt_navid) 
		{
			// Unterpositionen der vertikalen Hautpnavigation
			$naviout->positionen_hauptnavigation();
		} else {
			$tpl->parseCurrentBlock();		
		}
	}	
}

// Horizontale Subnavigation ausgeben 
if (HMENU_SUBMENU == 'submenu') 
{
	$naviout->positionen_submenu();
}		
		
?>
