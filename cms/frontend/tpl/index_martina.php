<?php
/**
 * Application of PEAR ITX-Templates and Database driven hierarchical Navigation
 *
 * Main Page
 *
 * @author      Roger Klein - rklein [at] klik-info [dot] ch
 * 				Roland Hempen - business [at] hempen [dot] ch
 * @copyright   you are free to use this code as long as you
 *              credit the author - and provide me with your improvements
 * @version     20070911
 *
 **/
 
// Gesamten Seiten inhalt buffern (und zippen)
function my_obstart()
{
	$encode = getenv('HTTP_ACCEPT_ENCODING');
	if (ereg('gzip',$encode)) 
	{
		ob_start('ob_gzhandler');
	} 
	else 
	{
		ob_start();
	}
}
my_obstart();

// wichtige Includes und Debuggingfunktion einbinden
require('./includes/includes.php');

// SMURL 
if (SMURL == 'ja') { $redirect->get_navid(); }

// F�r den Zugriff auf die Bilder-DB muss der Seiten-Type (Page oder Navi) bekannt sein 
$type = $_GET['pagid'] > 0 ? 'P' : 'N';

// auf Cross Site Scripting pr�fen, ev. Meldung ausgeben und alle GET-Parameter l�schen
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

// Startzahl f�rs Lesen der Bilder bzw. der Listitems
$start	= isset($_GET['start']) && $_GET['start'] > 0 ? $_GET['start'] : 0;

// Einlesen der Haupttemplate-Datei
$tpl->loadTemplatefile('main_tpl.html', true, true);

// Meta-Tags ausgeben
$tpl->setCurrentBlock('meta-tags');
$tpl->setVariable('description', DESCRIPTION);
$tpl->setVariable('keywords', KEYWORDS);
$tpl->setVariable('page_topic', PAGE_TOPIC);
$tpl->setVariable('publisher', PUBLISHER);
$tpl->setVariable('verify-v1', GOOGLE_VERIFY);
$tpl->parseCurrentBlock();

// themes-Directory und selected Theme ausgeben
$theme_global = str_replace('/','',THEME_SELECTED).'_global';
$tpl->setCurrentBlock('themes');
$tpl->setVariable('theme_global', $theme_global);
$tpl->setVariable('host', HOST);
$tpl->setVariable('themes_dir', THEMES_DIR);
$tpl->setVariable('theme', THEME_SELECTED);
$html_for_scripts = $frontget->read_theme_scritps();
$html_for_scripts != '' ? $tpl->setVariable('theme_js',$html_for_scripts) : '';
$tpl->parseCurrentBlock();

// home_link
$tpl->setCurrentBlock('home');
$tpl->setVariable('home_link', ROOTDIR.'index.php');
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
//$s_id = isset($_GET['subid']) ?  's.nav_id ='. $_GET['subid'] : 's.nav_id =' .$n_id;
$s_id = isset($_GET['subid']) ?  $_GET['subid'] : $n_id;

// Name Content-Template aus DB holen, Template einbinden und verarbeiten
$tpl->setCurrentBlock('content');
$abfrage = 'SELECT s.nav_id, s.kurztitel, s.zusatztext, s.inhalt1, s.bild1, s.modul, s.galerie, s.template,
			t.template_name, t.thumbsize
            FROM '.$tab_prefix.'seiten s
            INNER JOIN '.$tab_prefix.'templates t ON s.template = t.template_id
            WHERE s.nav_id =' .$s_id. '
			ORDER BY nummer';

$seiten_infos = $db->queryRow($abfrage);

// Browserweiche f�r XML-Notation --> darf nicht im IE ausgegeben werden.
$useragent = $general->detect_user_agent();
//if ($useragent != 'msie') {
// "iso-8859-1"
	$xml_notation = '<?xml version="1.0" encoding="utf-8" ?>' . "\n";
	$tpl->setCurrentBlock('xml');
	$tpl->setVariable('xml_notation', $xml_notation);
	$tpl->parseCurrentBlock();
//}

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
	// das gew�nschte Template der Seite holen
	$template = $pages->read_page_template($akt_pagid);
}

// Header-Informationen
// Header-Informationen
$tpl->setCurrentBlock('header');
$tpl->setVariable('header',$frontend->write_header($template));
$tpl->parseCurrentBlock();

// das gew�nschte Modul lesen 
if ($seiten_infos['modul'] != 0) {
	$module = $frontget->read_modulename($seiten_infos['modul']);
}

// Jetzt beginnt die Ausgabe
$tpl->addBlockfile('content','content_block', $template);
$tpl->setCurrentBlock('content_block');

// feststellen, ob die Startseite angezeigt werden soll
$query = 'SELECT start FROM '.$tab_prefix.'navigation WHERE nav_id='.$s_id;
$startseite = $db->queryOne($query);
if ($startseite == 'j') { $tpl->setVariable('dyn_margin', ' style="margin-left:0;"'); }

// Ist der Seite ein Modul zugewiesen?
if ($seiten_infos['modul'] == 0)
{
	// Seiteninhalt anzeigen entweder mit einem Thumbnail-Template oder mit normalgrossen Bilder
	if (preg_match('/760h/', $template) || preg_match('/760v/', $template) || preg_match('/260/', $template) )	{
		include_once(NAVI_DETAIL_THUMBS);
	} else {
		require_once(INDEX_DETAIL);
	}
}	
else {
	/* Module einbinden */
	switch ($module) 
	{
	  case 'READ_TOP_EXPO_EVENT':
		include_once(HOME);		
		break;	
	  case 'KONTAKTFORMULAR':
  		include_once(KONTAKTFORMULAR);
		break;	
	  case 'WEBMAIL':
  		include_once(WEBMAIL);
		break;	
	  case 'SITEMAP':
  		include_once(SITEMAP);
		break;	
	  case 'PAGES_OVERVIEW':
	  	if ($akt_pagid > 0) {
	  		// Template mit Thumbnails (98x98) f�r Detailanzeige (horizontal oder vertikal)
		  	if (preg_match('/760h/', $template) || preg_match('/760v/', $template)) {
  				include_once(PAGE_DETAIL_THUMBS);
		  	} else {
		  	// Template mit Thumbnails 300x300 links oder rechts
  				include_once(PAGE_DETAIL);
		  	}
		 } else {
        include_once(PAGES_OVERVIEW);
	   }
		break;	
	}
}

/* Google-analytics Script einbinden */
if ($ga_script != '') { $tpl->setVariable('google_analytics', $ga_script); }

// Ausgabe anzeigen
$tpl->show();

// Alle Ressourcen freigeben
$db->free($seiten_infos);
$db->disconnect();
ob_end_flush();

?>
