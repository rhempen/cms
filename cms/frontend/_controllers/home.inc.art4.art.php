<?php

// Die letzten zwei Top-News aus der DB holen und ausgeben
for ($i=1; $i<=2; $i++) {
	$domain = $i==1 ? 'navi_3' : 'navi_4';
//	$domain = 'navi_085';
	
	$page_id = $pages->read_page_with_latest_date($domain);
	if ($page_id != 0 && $page_id != null) {
		$page = $pages->read_page($page_id);
	}
	// nur weiterfahren, wenn die Seite gefunden wurde
	if ($page == null) { continue; }
	
	$row = $page->fetchRow(MDB2_FETCHMODE_ASSOC);
	if ($row == null) { continue; }

	$tpl->setCurrentBlock('inhalt');
 	// Textelemente einer Seite anzeigen
	$frontend->display_texte($row);

	// Weiter - Link
	$weiter_link = $redirect->set_link($row['page_id']);
//	var_dump($weiter_link." ".$page_id);
	$href = '<a href="'.$weiter_link.'" onclick="javascript:setLinkCookie(location.href);">'.$GLOBALS['LINKS']['WEITER'].'</a>';
	$tpl->setVariable('link_weiter', '<p>'.$href.'</p>');			
	$tpl->parseCurrentBlock();
}

$tpl->setCurrentBlock('bilder');
// Bild anzeigen
if ($seiten_infos['bild1'] != '') { $frontend->display_bild($seiten_infos); }
// Bildergalerie vorbereiten
if ($seiten_infos['aktiv'] == 'b') { $frontend->erzeuge_bildergalerie($seiten_infos['nav_id']); }
$tpl->parseCurrentBlock();
?>
