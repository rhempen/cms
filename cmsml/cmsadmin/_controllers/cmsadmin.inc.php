<?php

// CMS Includes 
	require_once '../../includes/includes.php';

	require_once CMSADMIN.'config.php';

// Required function, classes etc.	
	require_once FUNKTION.'security.php';

	require_once CMSADMIN.'_models/config_maintain.class.php';
	require_once CMSADMIN.'_views/config_present.class.php';

	require_once CMSADMIN.'_models/navi_maintain.class.php';
	require_once CMSADMIN.'_views/navi_present.class.php';

	require_once CMSADMIN.'_models/pictures_maintain.class.php';
	require_once CMSADMIN.'_views/pictures_present.class.php';
	require_once CMSADMIN.'_models/pictures_db_maintain.class.php';
	
	require_once CMSADMIN.'_models/pages_maintain.class.php';
	require_once CMSADMIN.'_views/pages_present.class.php';
	
	require_once CMSADMIN.'_models/frgmnts_maintain.class.php';
	require_once CMSADMIN.'_views/frgmnts_present.class.php';

	require_once CMSADMIN.'_models/general_maintain.class.php';
	require_once CMSADMIN.'_views/general_present.class.php';
	
	require_once LANGUDIR.LANGUAGE_FILE;
	

// Instanz der HTML_Template_ITX-Klasse erzeugen
	$tpl = new HTML_Template_ITX('../templates');
	
// Je eine neue Instanz der Klassen zur Verwaltung der Navigation erstellen, nur wenn n�tig!!
// Dabei wird die $db-Instanz an die Klasse naviMaintain �bergeben f�r den DB-Zugriff
	if (!$general)	{ $general	= new generalPresent($db); }
	if (!$genmain)	{ $genmain 	= new generalMaintain($db); }

	if (!$confmain)	{ $confmain	= new configMaintain($db); }
	if (!$confpres) { $confpres	= new configPresent($tpl); }
	
	if (!$navi)		{ $navi 	= new naviMaintain($db, $nav_id); }
	if (!$pres) 	{ $pres 	= new naviPresent($tpl); }

	if (!$browser) 	{ $browser 	= new picturesMaintain($db, $dir); }
	if (!$show)		{ $show 	= new picturesPresent($tpl); }
	if (!$bilddb)	{ $bilddb 	= new picturesDbMaintain($db); }

	if (!$pages) 	{ $pages 	= new pagesMaintain($db); }
	if (!$zeige) 	{ $zeige 	= new pagesPresent($tpl); }
	
	if (!$frgmain) 	{ $frgmain 	= new frgmntsMaintain($db); }
	if (!$frgpres) 	{ $frgpres 	= new frgmntsPresent($tpl); }
	
	$tpl = new HTML_Template_ITX('../templates');

// erst mal authentifizieren
	require_once('../auth.php');	

?>
