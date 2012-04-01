<?php

// die gew�nschte K�nstler-Seite aus der DB lesen
//$page  	= $pages->read_page($_GET['pagid']);
$total 	= $pictdb->count_bilder_pro_pageid($seiten_infos['nav_id']);
$bilder	= $pictdb->bilder_pro_pageid_lesen($seiten_infos['nav_id'], $start);

// Instanz der Klasse pageslider
if (!$slider)	{ $slider = new pageSlider(MAX_THUMBS, $total, $start); }

$tpl->setCurrentBlock('inhalt');

// Seitentitel zusammensetzen und anzeigen
$frontend->create_titel($seiten_infos['kurztitel'],$seiten_infos['template_name']);	

// Textelemente einer Seite anzeigen
$row['name'] 	 = $seiten_infos['zusatztext'];
$row['langtext'] = $seiten_infos['inhalt1'];
$frontend->display_texte($row, 'detail');

// Block inhalt parsen
$tpl->parseCurrentBlock();

// Ausrichtung des Templates: 4 = 760h 5 = 760v
$tpl_ausrichtung = preg_match('/760h/',$seiten_infos['template_name']) ? 'horizontal' : 'vertikal';

// Thumbnail-Masse des aktuellen Templates
$thumbsize = $seiten_infos['thumbsize'];
$type='N';

$i=0;

while ($bild = $bilder->fetchRow(MDB2_FETCHMODE_ASSOC)) 
{
	/* Die Bildleiste kann horizontal oder vertikal angeordnet sein -> nur bei Template einspaltig_760*
	 	es werden in beiden F�llen max. 6 Bilder angezeigt. --> es wurden auch nur max. MAX_THUMBS - Bilder eingelesen
	 */		
	switch ($tpl_ausrichtung) {
	case 'horizontal':
		// je 6 Bilder/Zeile ausgeben
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

		// den Rahmen f�r das 2. Bild vorsorglich verbergen, falls kein 2. Bild mehr angezeigt werden soll
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


// Speicherplatz wieder frei geben
$db->free($page);
$db->free($total);
$db->free($bilder);


?>