<?php
  /* Die letzten ?? Top-News aus der DB holen und ausgeben
	  in der cms_spezial muss es zum aktuellen Thema einen Datensatz geben, anhand dessen die Tabelle cms_pages gelesen wird
	  Im Feld "domain" in cms_pages ist der Wert enthalten, mit dem die pages gelesen werden sollen
	  Feldwerte im Datensatz aus cms_spezial: wert1 = Domain ~ Navid, wert2 = Anzahl zu lesende Sätze
	*/
	$spez	= $frontget->read_single_spez(THEME,'domain');
	if ($spez == null) return; // Wenn kein Datensatz gefunden wurde, dann was??
	if ($spez['wert1'] != '' && $spez['wert1'] != 'val') { $domain = $spez['wert1']; }
	if ($spez['wert2'] != '' && $spez['wert2'] != 'val') { $anzahl = $spez['wert2']; }
	if ($domain == '') return;
	if ($anzahl === 0) $anzahl = MAX_LIST_ITEMS;

	$seiten = $pages->read_pages_with_latest_date($domain,$anzahl);
	
	$frontend->create_titel($seiten_infos['kurztitel'],$seiten_infos['template_name']);

	while ($row = $seiten->fetchRow(MDB2_FETCHMODE_ASSOC)) {
		$tpl->setCurrentBlock('inhalt');

		// Textelemente einer Seite anzeigen
		$frontend->display_texte($row);

		// Weiter - Link  --> da dies die Frontseite ist, müssen hier die Parameter für die Verlinkung angepasst werden
		$_GET['navid'] = $row['nav_id'];
		$_GET['navtxt'] = $redirect->get_kuerzel_navid($row['nav_id']);
		$detail_link = $frontend->create_weiter_link($row['page_id']);

		// Ein ev. vorhandenes Bild ausgeben		
		if ($row['bild1'] != '') {
			$thumbsize = $seiten_infos['thumbsize']; $type = 'P';
			$href = $frontend->create_href_img_tag($row['bild1'], $detail_link);
			$tpl->setVariable('bild1', $href);
		} else {
			$tpl->setVariable('bild1', BLANK_GIF);
			$tpl->setVariable('display_bild1', NO_BORDER);
		}

		$tpl->parseCurrentBlock();
	}
?>
