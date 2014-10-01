<?php
// die Seite aus der DB lesen
$page_infos	= $pages->read_page($_GET['pagid']);
// $bilder	= $pictdb->bilder_pro_pageid_lesen($_GET['pagid']);

$tpl->setCurrentBlock('inhalt');

// Seitentitel zusammensetzen und anzeigen
$titel = $frontend->create_titel($seiten_infos['kurztitel_'.$language],$seiten_infos['template_name']);	
	
// Link Uebersicht/zurueck erstellen
$frontend->create_uebersicht_link($tpl);

// Textelemente einer Seite anzeigen
$frontend->display_texte($page_infos, 'detail');

// inhalt2 in der re bzw. li Spalte nur anzeigen, wenn der entspr. Platzhalter im Tpl gefunden wird
$frontend->display_inhalt2($page_infos);

// Block parsen
$tpl->parseCurrentBlock();

// Bild(er) anzeigen
$frontend->display_bilder($page_infos,'P');

// Farbgebung gemaess Eintraegen in cms_spezial setzen
$frontend->set_css_class('seite', $aktive_menupos, $css_classes);

// Speicher freigeben
$db->free($page);

/********************************************************************************************************* 
    fuer die Darstellung einer Bilddatei muss das gewaehlte Bild auf die Masse 300x300 resized werden 
	Das neue Thumbnail wird im _thumbs-Verzeichnis gespeichert und dann auf der Detailseite angezeigt.
**********************************************************************************************************/
function set_thumbnail_neu($bild, $thumb, $picture) {	
	$arr = explode('/', $bild);
	$bilddatei = array_pop($arr);
	
	$breite = THUMB_NAVI_MAX_WIDTH;
	$hoehe  = THUMB_NAVI_MAX_HEIGHT;
	
	$bildneu  = str_replace('.jpg','', $thumb) . '_'.$breite.'_'.$hoehe.'.jpg';
	// Resize nur durchfuehren, wenn die Datei nicht schon existiert!!
	if (!file_exists($bildneu)) {
		$picture->resize_picture($bild, $bildneu, $breite, $hoehe);		
	}	
	return $bildneu;
}


?>