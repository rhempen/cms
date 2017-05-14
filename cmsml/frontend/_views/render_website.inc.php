<?php
/**
 * ----------------------------------------------------------
 * (c) 2012  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Rendern der Website aufgrund Informationen in $seiten_infos
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2012-06-09
 * ----------------------------------------------------------
 **/

  // Ist der Seite ein Modul zugewiesen?
  if ($seiten_infos['modul'] == 0)
  {
    // Seiteninhalt anzeigen entweder mit einem Thumbnail-Template oder mit normalgrossen Bilder
    if (preg_match('/760h/', $template) || preg_match('/760v/', $template) || preg_match('/260/', $template) )	{
        include_once(NAVI_DETAIL_THUMBS);
        $controller = NAVI_DETAIL_THUMBS;
    } else {
        require_once(INDEX_DETAIL);
        $controller = INDEX_DETAIL;
    }
  } else {
    /* Module einbinden */
    switch ($module) 
    {
      case 'LIST_EXPOS_EVENTS':
        if (isset($_GET['pagid']) && $_GET['pagid'] > 0) {
            include_once(PAGE_DETAIL);
            $controller = PAGE_DETAIL;
        } else {
            include_once(PAGES_OVERVIEW);
            $controller = PAGES_OVERVIEW;
        }
        break;
      case 'READ_TOP_EXPO_EVENT':
        include_once(HOME_ART4ART);
        $controller = HOME_ART4ART;
        break;
      case 'READ_TOP_NEWS':
        include_once(HOME);
        $controller = HOME;
        break;
      case 'KONTAKTFORMULAR':
        include_once(KONTAKTFORMULAR);
        $controller = KONTAKTFORMULAR;
        break;
      case 'WEBMAIL':
        include_once(WEBMAIL);
        $controller = WEBMAIL;
        break;
      case 'SITEMAP':
        include_once(SITEMAP);
        $controller = SITEMAP;
        break;
      case 'GOOGLEMAPS';
        include_once(GOOGLEMAPS);
        $controller = GOOGLEMAPS;
        break;
      case 'MEMBER_LOGIN';
        include_once(MEMBER_LOGIN);
        break;
//	  case 'PAGES_OVERVIEW':
      default:
        if ($akt_pagid > 0) {
          // Template mit Thumbnails (98x98) f�r Detailanzeige (horizontal oder vertikal)
          if (preg_match('/760h/', $template) || preg_match('/760v/', $template)) {
            include_once(PAGE_DETAIL_THUMBS);
            $controller = PAGE_DETAIL_THUMBS;
          } else {
          // Template mit Thumbnails 300x300 links oder rechts
            include_once(PAGE_DETAIL);
            $controller = PAGE_DETAIL;
          }
         } else { 
            include_once(PAGES_OVERVIEW);
            $controller = PAGES_OVERVIEW;
         }
        break;
    }
  }

?>
