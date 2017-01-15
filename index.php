<?php
/**
 * Application of PEAR ITX-Templates and Database driven hierarchical Navigation
 *
 * Main Page
 *
 * @author      Roland Hempen - business [at] hempenweb [dot] ch
 * @copyright   you are free to use this code as long as you
 *              credit the author - and provide me with your improvements
 * @version     20101119
 *
 **/
 
// Gesamten Seiten inhalt buffern (und zippen)
function my_obstart()
{
	$encode = getenv('HTTP_ACCEPT_ENCODING');
	if (preg_match('/gzip/',$encode)) 
	{
		ob_start('ob_gzhandler');
	} 
	else 
	{
		ob_start();
	}
}
my_obstart();
session_start();

// wichtige Includes und Debuggingfunktion einbinden
require('./includes/includes.php');

// die CSS-Klasse des Header-Bereiches aus der Session beschaffen
$classHeader = preg_match('/(hide|show)/',$_SESSION['classHeader']) ? $_SESSION['classHeader'] : 'show';

// ev. ist eine Umleitung auf die Startseite nötig!
$startSeite = $redirect->redirect_to_startseite();

// SMURL
if (SMURL == 'ja') { $redirect->get_navid(); }

// Sprache festlegen anhand $_GET['langu'] bzw. $_SESSION['language']
$cfg->sprache_festlegen(); 
//var_dump($_GET);

// Fuer den Zugriff auf die Bilder-DB muss der Seiten-Type (Page oder Navi) bekannt sein
$type = $_GET['pagid'] > 0 ? 'P' : 'N';
// Startzahl zum Lesen der Bilder bzw. der Listitems
$start = isset($_GET['start']) && $_GET['start'] > 0 ? $_GET['start'] : 0;

// auf Cross Site Scripting pruefen, ev. Meldung ausgeben und alle GET-Parameter l�schen
$rc = $frontget->check_parameters();
if ($rc===false) { 
	//die('Diese Eingabe ist nicht erlaubt!'); 
	$tpl->loadTemplatefile('main_tpl.html', true, true);
	$tpl->setCurrentBlock('message');
	$tpl->setVariable('meldung', '<div style="margin-left:100px;text-align:center;width:auto;color:red;background:white;font-weight:bold;">Parameter nicht erlaubt!</div>');
	$tpl->parseCurrentBlock();
	
	unset($_REQUEST); 
	unset($_GET);
}	


// Einlesen der Haupttemplate-Datei
$tpl->loadTemplatefile('main_tpl.html', true, true);
// Meta-Tags ausgeben
$tpl->setCurrentBlock('meta-tags');
$tpl->setVariable('author', AUTHOR);
$tpl->setVariable('description', DESCRIPTION);
$tpl->setVariable('keywords', KEYWORDS);
$tpl->setVariable('page_topic', PAGE_TOPIC);
$tpl->setVariable('publisher', PUBLISHER);
$tpl->setVariable('google_verify', GOOGLE_VERIFY);
$tpl->parseCurrentBlock();

// themes-Directory und selected Theme ausgeben
$theme_global = str_replace('/','',THEME_SELECTED).'_global';
$tpl->setCurrentBlock('themes');
$tpl->setVariable('theme_global', $theme_global);
$tpl->setVariable('host', HOST);
$tpl->setVariable('themes_dir', THEMES_DIR);
$tpl->setVariable('theme', THEME_SELECTED);
$html_for_scripts = $frontget->read_theme_scripts();
$html_for_scripts != '' ? $tpl->setVariable('theme_js',$html_for_scripts) : '';
$tpl->parseCurrentBlock();

// skalierbares Hintergrundbild, falls erwuenscht
if ($general->analyse_template('main_tpl.html',0,'/{backgroundImage}/') ) {
  $tpl->setCurrentBlock('background');
  $bgImage = $frontget->get_random_bgimage();
  $bgImage != '' ? $tpl->setVariable('backgroundImage',$bgImage) : '';
  $tpl->parseCurrentBlock();
}

// home_link
$tpl->setCurrentBlock('home');
$url_startseite = $naviget->get_startseite();
$tpl->setVariable('home_link', $url_startseite);
//$tpl->setVariable('home_link', ROOTDIR.'index.php');
$header_bild = $frontget->get_random_bild();
$header_bild != '' ? $tpl->setVariable('header_bild',$header_bild) : '';
$header_bgimage = $frontget->get_header_bgimage();
$header_bgimage != '' ? $tpl->setVariable('header_background',$header_bgimage) : '';
$tpl->setVariable('webroot', ROOTDIR); // ist nötig für Lightbox
$tpl->setVariable('mediadir', str_replace('../../','',MEDIA_ROOT)); // ist nötig für footer
$tpl->setVariable('classheader',$classHeader); // ist nötig für Headerbereich 
$tpl->parseCurrentBlock();

// Copyright
$tpl->setCurrentBlock('copyright');
$tpl->setVariable('copyright', COPYRIGHT);
$tpl->parseCurrentBlock();

// Navigations-Template einbinden und verarbeiten
$tpl->addBlockfile('nav','nav_block', 'nav_tpl.html');
$tpl->setCurrentBlock('nav_block');

// Navigation
require_once './includes/nav.php';
$s_id = isset($_GET['subid']) ?  $_GET['subid'] : $n_id;

// Hidden Fields ins HTML rendern
if ($general->analyse_template('main_tpl.html',$tplnr,'/{hidden_fields}/')) {
  $tpl->setCurrentBlock('hidden_fields');
  // Versteckte Informationen für die Lightbox
  $tpl->setVariable('webroot', ROOTDIR); // ist nötig für Lightbox
  $tpl->setVariable('mediadir', str_replace('../../','',MEDIA_ROOT)); // ist nötig für footer
  $tpl->setVariable('classheader',$classHeader); // ist nötig für Headerbereich 
  // feststellen, ob die Startseite angezeigt werden soll
  $startseite = $frontget->read_single_field_from_navi('start', $s_id);
  $tpl->setVariable('startseite',$startseite); // Flag wird per Javascript ausgwertet 
  $tpl->parseCurrentBlock();
}  

// Name Content-Template aus DB holen, Template einbinden und verarbeiten
$tpl->setCurrentBlock('content');
$seiten_infos = $frontget->read_seiten_infos($s_id);

// Browserweiche fuer XML-Notation --> darf nicht im IE ausgegeben werden.
$useragent = $general->detect_user_agent();
//if ($useragent != 'msie') {
// "iso-8859-1"
// Mit HTML5 ist das nicht mehr noetig!!
if ($general->analyse_template('main_tpl.html',$tplnr,'/{xml_notation}/')) {
  $xml_notation = '<?xml version="1.0" encoding="utf-8"?>'."\n";
  $tpl->setCurrentBlock('xml');
  $tpl->setVariable('xml_notation', $xml_notation);
  $tpl->parseCurrentBlock();
}

// Title-Tag setzen
$titletag = COPYRIGHT != ''  ? COPYRIGHT.' &#8211; '.$seiten_infos['kurztitel'] : $seiten_infos['kurztitel'];
$tpl->setCurrentBlock('title');
$tpl->setVariable('titletag', $titletag);
$tpl->parseCurrentBlock();

/* Anfuegen Inhalt-Template-Datei */
//$template = $seiten_infos['template_name'] == '' ? 'zweispaltig_340_420_tpl.html' : $seiten_infos['template_name'];
$template = $seiten_infos['template_name'];

// page_id > 0, dann ist eine Detailseite mit einem separaten Template gefragt
// wird die Seite aber ohne Modul aufgebaut, soll das Template der seiten_infos benutzt werden
if ($akt_pagid > 0 && $seiten_infos['modul'] > 0)  { 
	// das gewuenschte Template der Seite holen
	$template = $pages->read_page_template($akt_pagid);
}

// das gewuenschte Modul lesen 
if ($seiten_infos['modul'] != 0) {
	$module = $frontget->read_modulename($seiten_infos['modul']);
}

// Jetzt beginnt die Ausgabe
$tpl->addBlockfile('content','content_block', $template);
$tpl->setCurrentBlock('content_block');

// feststellen, ob die Startseite angezeigt werden soll
$query = 'SELECT start FROM '.$tab_prefix.'navigation WHERE nav_id='.$s_id;
$startseite = $db->queryOne($query);
if ($startseite == 'j') { 
  $tpl->setCurrentBlock('dyn_margin');
  $tpl->setVariable('dyn_margin',' style="margin-left:0;"'); 
  $tpl->parseCurrentBlock();
}

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
}	
else {
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

// Header-Informationen ausgeben
$tpl->setCurrentBlock('header');
$tpl->setVariable('header',$frontend->write_header($template,$controller));
$tpl->parseCurrentBlock();


/* Google-analytics Script einbinden */
if ($ga_script != '') { $tpl->setVariable('google_analytics', $ga_script); }

// Ausgabe anzeigen
$tpl->show();

// Alle Ressourcen freigeben
$db->free($seiten_infos);
$db->disconnect();
ob_end_flush();

?>
