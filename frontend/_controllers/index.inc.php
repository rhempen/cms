<?php

// Inhalte Content-Bereich einfuellen - HTML-Tagx fuer ein oder mehrere Bilder
$frontend->display_bilder($seiten_infos,'N');

// Inhalte Content-Bereich einfuellen - Texte und Links
$tpl->setCurrentBlock('inhalt');

// Titel anzeigen
$frontend->create_titel($_GET['navid'],$seiten_infos['template_name']);

// Link Uebersicht brauchen wir hier nur, falls page_id gesetzt ist.
// dh. die Seite wurde als Linkverweis aufgerufen
if (isset($_GET['pagid'])) {
	$frontend->create_uebersicht_link($tpl);
}

// Textelemente anzeigen
if ($seiten_infos['zusatztext'] != '') {
	$zusatz = '<h2>' .htmlspecialchars_decode($seiten_infos['zusatztext']). '</h2>'; 
	$tpl->setVariable('zusatztext', $zusatz);
}

// fragmente ermitteln und im Langtext ersetzen
$newtext = $frontend->replenish_text_with_fragments($seiten_infos['inhalt1']);
$seiten_infos['inhalt1'] = $newtext;
$tpl->setVariable('lt_disp', HIDDEN);
$tpl->setVariable('langtext', $seiten_infos['inhalt1']);
$tpl->parseCurrentBlock();

// Block inhalt2 in der re bzw. li Spalte nur anzeigen, wenn der entspr. Platzhalter im Tpl gefunden wird
$frontend->display_inhalt2($seiten_infos);

// Farbgebung gemaess Eintraegen in cms_spezial setzen
$farbe = $frontend->set_css_class('seite', $_GET['navid'], $css_classes);

?> 
