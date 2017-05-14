<?php
/**
 * ----------------------------------------------------------
 * (c) 2009  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Controller fuer die Ausgabe der Sitemap
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2009-11-28
 * ----------------------------------------------------------
 **/

	// Indexseite includieren
	include_once('index.inc.php');

	// Array mit Kaps und Ukaps holen (wurden in der nav.php erstellt
	global $nav_array, $unav_array;

	// S�mtliche Unterseiten einlesen
	$pages		= $pages->read_all_pages();
	$page_ids	= array();
	while ($pagrow = $pages->fetchRow(MDB2_FETCHMODE_ASSOC)) {
		$page_ids[$pagrow['page_id']] = $pagrow['nav_id'] .'|'. $pagrow['name'];
	}
	
	$html = '<ul class="smap_ul1">';
	
	// Hauptnavigationspunkte
	foreach ($nav_array as $navid => $value) 
	{
		list($navkap, $navbez) = explode('|',$value);
		$nav_url = $redirect->set_navlink($navid);			
		$html .=  '<li class="smap_li1"><a href="'.urldecode($nav_url).'">'.$navbez.'</a></li>';  
		
		// Gibt es Unterseiten zu diesem Navigationspunkt
		get_pages( $navid, 0 );
		
		// Unternavigationspunkte
		foreach ($unav_array as $subid => $value) {
			list($unavkap, $unavukap, $unavbez, $unavtype) = explode('|', $value);
			if ($unavkap == $navkap) {
				$nav_url = $redirect->set_navlink($navid, $subid);			
				$html .=  '<li class="smap_li2"><a href="'.urldecode($nav_url).'">'.$unavbez.'</a></li>';				
				
				// Gibt es Unterseiten zu diesem Navigationspunkt
				get_pages( $navid, $subid );
			}
		}
	}
	
	$html .= '</ul><p>&nbsp;</ul>';
	
	// Ausgabe 
	$tpl->setCurrentBlock('sitemap'); 
	$tpl->setVariable('sitemap', $html);
	$tpl->parseCurrentBlock();

	
	// Pages f�r eine Kap- oder Ukap ermitteln
	function get_pages( $navid, $subid ) 
	{
		global $redirect, $html, $page_ids;
		foreach ($page_ids as $pagid => $value) {
			list($page_navid, $name) = explode('|',$value);
			if ($page_navid == $navid && $subid == 0) { 
				$nav_url = $redirect->set_navlink($navid, 0, $pagid); 
				$html .=  '<li class="smap_li3"><a href="'.urldecode($nav_url).'">'.$name.'</a></li>';
			} 
			if ($page_navid == $subid) { 
				$nav_url = $redirect->set_navlink($navid, $subid, $pagid); 
				$html .=  '<li class="smap_li3"><a href="'.urldecode($nav_url).'">'.$name.'</a></li>';
			}				 
		}
	}
	
?>