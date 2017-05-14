<?php

// Inhalte Content-Bereich einfuellen - HTML-Tagx fuer ein oder mehrere Bilder
$frontend->display_bilder($seiten_infos,'N');

// Inhalte Content-Bereich einfuellen - Texte und Links
$tpl->setCurrentBlock('inhalt');

// Titel anzeigen
$titel = $frontend->create_titel($_GET['navid'],$seiten_infos['template_name']);

// Link Uebersicht brauchen wir hier nur, falls page_id gesetzt ist.
// dh. die Seite wurde als Linkverweis aufgerufen
if (isset($_GET['pagid'])) {
	$frontend->create_uebersicht_link($tpl);
}

// die Sprache wird zu Beginn in der Methode sprache_festlegen definiert 
$language = $cfg->get_disp_language_code(); 
// Textelemente anzeigen, abhägig von der gewählten Sprache
if ($seiten_infos['zusatz_'.$language] != '') {
	$zusatz = '<h2>' .htmlspecialchars_decode($seiten_infos['zusatz_'.$language]). '</h2>'; 
	$tpl->setVariable('zusatztext', $zusatz);
}

// fragmente ermitteln und im Langtext ersetzen
$newtext = $frontend->replenish_text_with_fragments($seiten_infos['inhalt1_'.$language]);
$seiten_infos['inhalt1_'.$language] = $newtext;
$tpl->setVariable('lt_disp', HIDDEN);
$tpl->setVariable('inhalt1', $seiten_infos['inhalt1_'.$language]);
$tpl->parseCurrentBlock();

// Block inhalt2 in der re bzw. li Spalte nur anzeigen, wenn der entspr. Platzhalter im Tpl gefunden wird
$type = $type != '' ? $type : 'N';
$frontend->display_inhalt2($seiten_infos);

// Farbgebung gemaess Eintraegen in cms_spezial setzen
$farbe = $frontend->set_css_class('seite', $_GET['navid'], $css_classes);

?> 
