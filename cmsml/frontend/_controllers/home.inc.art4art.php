<?php

// Die letzten zwei Top-News aus der DB holen und ausgeben
for ($i=1; $i<=2; $i++) {
	$domain = $i==1 ? 'navi_3' : 'navi_4';
	
	$page_id = $pages->read_page_with_latest_date($domain);
	if ($page_id != 0 && $page_id != null) {
		$row_page = $pages->read_page($page_id);        
        if ($row_page == null) { continue; }
        // aus cms_redirect die Koordinaten des anzuzeigenden Satzes lesen. Das ist nötig, 
        // weil die akutelle nav_id auf Home zeigt und daher der weiter-Link auf der expo oder dem event
		// nicht an der richtigen Stelle im Menu positioniert
        $row = $redir->page_read_redirect($row_page['page_id'],$row_page['nav_id']);
	}
	// nur weiterfahren, wenn die Seite gefunden wurde

	$tpl->setCurrentBlock('inhalt');
	if ($row_page == null) { continue; }
	$nodata='';
 	// Textelemente einer Seite anzeigen
	$frontend->display_texte($row_page);

    // Weiter - Link
    $_GET['navid'] = $row['navid'];
    $_GET['subid'] = $row['subid'];
	$weiter_link = $redirect->set_link($row['pagid']);
	$href = '<a href="'.$weiter_link.'" onclick="javascript:setLinkCookie(location.href);">'.$GLOBALS['LINKS']['WEITER'].'</a>';
	$tpl->setVariable('link_weiter', '<p>'.$href.'</p>');			
	$tpl->parseCurrentBlock();
}

// Wenn keine Daten gefunden wurden, Text für Accrochage ausgeben
if ($nodata != '') { $frontend->accrochage(); }

$tpl->setCurrentBlock('bilder');
// Bild anzeigen
if ($seiten_infos['bild1'] != '') { 
  $frontend->display_bild( 
          $seiten_infos['nav_id'],
          $seiten_infos['bild1'],
          $seiten_infos['thumbsize'], 'N'); 
}
// Bildergalerie vorbereiten
if ($seiten_infos['aktiv'] == 'b') { $frontend->erzeuge_bildergalerie($seiten_infos['nav_id']); }
$tpl->parseCurrentBlock();
?>
