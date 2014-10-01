<?php

// Unterseiten lesen fuer einen Haupt- oder Subnavigationspunkt
if ($akt_subid > 0) {
	$items	= $frontget->count_pages_by_navid($akt_subid);
	$nav_id	= $akt_subid;
} else {
	$items	  = $frontget->count_pages_by_navid($akt_navid);
	$nav_id	= $akt_navid;
}

// alle Unterseite zur Navid lesen
$overview = $frontget->read_pages_pro_navid($nav_id, $start);

// Groesse der anzuzeigenden Thumbnails aus dem Template lesen
$thumbsize = $frontget->read_thumbsize_by_tplid($seiten_infos['template']);
$type = 'P';

// Instanz der Klasse pageslider
if (!$slider)	{ $slider = new pageSlider(MAX_LIST_ITEMS, $items, $start); }

// Farbgebung gemaess Eintraegen in cms_spezial setzen
$farbe = $frontend->set_css_class('seite', $aktive_menupos, $css_classes);

// bildleiste und galerielink verstecken
$tpl->setVariable('leiste', HIDDEN);
$tpl->setVariable('galink', HIDDEN);

if ($items != 0) {
  // Seitentitel zusammensetzen und anzeigen
  $frontend->create_titel($seiten_infos['kurztitel_'.$language],$seiten_infos['template_name']);

  while ($row = $overview->fetchRow(MDB2_FETCHMODE_ASSOC)) 
  {
      $tpl->setCurrentBlock('inhalt');

      // Textelement einer Seite anzeigen
      $frontend->display_texte($row);

      // Weiter Link
      $detail_link = $frontend->create_weiter_link($row['page_id']);

      // Bild(er) anzeigen - Wenn kein Bild vorhanden, wird ein blank.gif angezeigt und der Rahmen 
      // des umschliessenden Div ausgeblendet.
      if ($row['bild1'] != '' || $row['bild2'] != '') { 
          if ($row['bild1'] != '') { 
              $href = $frontend->create_href_img_tag($row['bild1'], $detail_link);
              $tpl->setVariable('bild1', $href); 
          } else { 
              $tpl->setVariable('bild1', BLANK_GIF); 
              $tpl->setVariable('display_bild1', NO_BORDER); 
          }

          if ($row['bild2'] != '') { 
              $href = $frontend->create_href_img_tag($row['bild2'], $detail_link);
              $tpl->setVariable('bild2', $href); 
          } else { 
              $tpl->setVariable('bild2', BLANK_GIF); 
              $tpl->setVariable('display_bild2', NO_BORDER); 
          }

      } else {
          $tpl->setVariable('display_bild1', HIDDEN); 
          $tpl->setVariable('display_bild2', HIDDEN); 
      }
      // Block parsen
      $tpl->parseCurrentBlock();
  }
} else {
      $tpl->setCurrentBlock('inhalt');
      $frontend->create_titel($seiten_infos['kurztitel'],$seiten_infos['template_name']);
      $tpl->setVariable('link_uebersicht','');
      $tpl->setVariable('pageslider','');
      $tpl->setVariable('langtext', $GLOBALS['TEXTE']['TEXT_SELECTBOX_LEER']);
      $tpl->parseCurrentBlock();
}

// Pageslider anzeigen, falls noetig
$tpl->setCurrentBlock('itemslider');
$tpl->setVariable('listitemslider', $slider->toHtml());
$tpl->parseCurrentBlock();

// Speicher wieder freigeben
$db->free($overview);
?>