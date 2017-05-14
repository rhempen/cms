<?php

// die gewuenschte Unterseite aus der DB lesen
$page_infos	= $pages->read_page($_GET['pagid']);
$total      = $pictdb->count_bilder_pro_pageid($_GET['pagid']);
$bilder     = $pictdb->bilder_pro_pageid_lesen($_GET['pagid'], $start);

// Instanz der Klasse pageslider
if (!$slider)	{ $slider = new pageSlider(MAX_THUMBS, $total, $start); }

// zugeordnete Thumbnail-Masse lesen
$thumbsize = $frontget->read_thumbsize_by_tplid($page_infos['template']);
$type = 'P';

$tpl->setCurrentBlock('inhalt');

// Seitentitel zusammensetzen und anzeigen
$frontend->create_titel($seiten_infos['kurztitel'],$seiten_infos['template_name']);	

// Link Uebersicht brauchen wir hier
$frontend->create_uebersicht_link($tpl);

// Textelemente einer Seite anzeigen
$frontend->display_texte($page_infos, 'detail');


// Bilder anzeigen
// $frontend->display_bilder($page_infos, $bilder); --> muss erst entwickelt werden 3.12.2010!!


// Ausrichtung des Templates: 4 = 760h 5 = 760v
$tpl_ausrichtung = preg_match('/760h/',$page_infos['template']) ? 'horizontal' : 'vertikal';
$i=0;

while ($bild = $bilder->fetchRow(MDB2_FETCHMODE_ASSOC)) 
{
	/* Die Bildleiste kann horizontal oder vertikal angeordnet sein -> nur bei Template einspaltig_760
	 	es werden in beiden Fällen max. MAX_THUMBS Bilder angezeigt. --> es wurden auch nur max. MAX_THUMBS - Bilder eingelesen
	 */		
	
	switch ($tpl_ausrichtung) {
		case 'horizontal':
			// je 6 Bilder ausgeben
			$tpl->setCurrentBlock('bilder');
			
			// img-Tag pro Bild erstellen				
			$href = $frontend->create_href_thumbnail_tag($bild, $thumbsize, $type);
			
			if ($i <= MAX_THUMBS) {
				// max. 6 Thumbnails pro Zeile, dh. beim 7. Thumb muss die Bedingung erf�llt sein
				if ( $i != 0 && $i % 6 != 0) {
					$style = 'style="margin-left:12px;"';
				} else  { 
					$style = 'style="margin-left:0px;"';
				} 
				$tpl->setVariable('style', $style); 
				$tpl->setVariable('bild1', $href); 			
				$tpl->parseCurrentBlock();
			}
			$i++;
			break;
		default:				
			$i++;
			if ($bild['bildpfad'] == null) { continue; }
			// je 2 Bilder ausgeben
			$tpl->setCurrentBlock('bilder');
			
			// img-Tag pro Thumbnail erstellen				
			$href = $frontend->create_href_thumbnail_tag($bild, $thumbsize, $type);

			// den Rahmen fuer das 2. Bild vorsorglich verbergen, falls kein 2. Bild mehr angezeigt werden soll
			// $tpl->setVariable('display_bild2', HIDDEN); 
			$tpl->setVariable('bild2', BLANK_GIF);
			$tpl->setVariable('display_bild2', NO_BORDER); 
			
			if ($i == 1) {
				if ($bild['bildpfad'] != null) {
					$tpl->setVariable('bild1', $href); 
				} 
			} else {
				if ($bild['bildpfad'] != null) {
					$tpl->setVariable('bild2', $href);
					$tpl->setVariable('display_bild2', ''); 
				}
				// Block parsen
				$tpl->parseCurrentBlock();
				$i = 0;		
			}			
	}
}

// Pageslider anzeigen, falls n�tig
$tpl->setCurrentBlock('pageslider');
$tpl->setVariable('pageslider', $slider->toHtml());
$tpl->parseCurrentBlock();

// Block parsen
$tpl->parseCurrentBlock();

// Farbgebung gemaess Einträgen in cms_spezial setzen
$frontend->set_css_class('seite', $aktive_menupos, $css_classes);

// Speicherplatz wieder frei geben
$db->free($page);
$db->free($total);
$db->free($bilder);


?>