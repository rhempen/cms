<?php
/* Tabellen Pr�fix */
define('TABLE_PREFIX', 'cms_');

/* Dokumenten Rootverzeichnis */
require_once('server.php');

/* Globale Variablen definieren */
define('CMSADMIN', DOCUROOT.'cmsadmin/');
define('FRONTEND', DOCUROOT.'frontend/');
define('FUNKTION', DOCUROOT.'cmsadmin/funcs/');
define('LANGUDIR', DOCUROOT.'languages/');
define('BACKUPDIR', CMSADMIN.'backup/backups/');  
define('THEMESDIR', FRONTEND.'themes/');  
define('TEMPLATES', 'frontend/');  


/* Models laden und je eine Instanz davon erstellen */
require_once(CMSADMIN.'_models/navi_maintain.class.php');
require_once(CMSADMIN.'_models/pages_maintain.class.php');
require_once(CMSADMIN.'_models/pictures_maintain.class.php');
require_once(CMSADMIN.'_models/pictures_db_maintain.class.php');
require_once(CMSADMIN.'_models/config_maintain.class.php');
require_once(CMSADMIN.'_models/redirect_maintain.class.php');
require_once(CMSADMIN.'_views/general_present.class.php');

require_once(FRONTEND.'_models/frontend_getdata.class.php');
require_once(FRONTEND.'_models/navigation_getdata.class.php');
require_once(FRONTEND.'_models/navigation_redirect.class.php');
require_once(FRONTEND.'_views/frontend_present.class.php');
require_once(FRONTEND.'_views/navigation_present.class.php');
require_once(FRONTEND.'_views/pageslider.class.php');

// globale Objekt-Variablen initialisieren
require_once('init.php');

// Klassenobjekte deklarieren --> Klassen des CMS
if (!$naviga)		{ $naviga		= new naviMaintain($db, 0); }
if (!$pages)		{ $pages		= new pagesMaintain($db); }
if (!$picture)	{ $picture 	= new picturesMaintain($aktdir, $bilddb); }
if (!$pictdb)		{ $pictdb 	= new picturesDbMaintain($db); }
if (!$cfg)			{ $cfg			= new configMaintain($db); }
if (!$redir)		{ $redir		= new redirectMaintain($db); }
if (!$general)	{ $general 	= new generalPresent($tpl); }

/* nachdem alle wichtigen Deklarationen gemacht sind, muss geprueft werden
 * ob die DB gewechselt wurde. Daraus ergibt sich die Konstanten-Definition
 * fuer die DB (DBASEDIR und DBFILE) 
 */
require_once('changedb.php');

// PEAR MDB2 Package laden und DB-Login ausfuehren
require_once(DBASEDIR.'pear_mdb2.class.php');
$db->setFetchMode(MDB2_FETCHMODE_ASSOC);

/* Config-Settings aus der DB lesen */
$cfg->config_laden();

/* das gewählte THEME muss in der aktuellen DB aktualisiert werden,
 * damit im Frontend das richtige Design (Theme) gezogen wird.  */
if (WEBSITE) {
	$cfg->update_website_db( );
}

/* Das PEAR ITX-Package laden --> Template Engine 
 * Eine Instanz der HTML_Template_ITX-Klasse erzeugen mit Angabe des tpl-Verzeichnisses
 */
require_once('HTML/Template/ITX.php');
$tpl = new HTML_Template_ITX(TEMPLATE_DIR);

// Klassenobjekte deklarieren --> Klassen des Frontends
if (!$frontget)	{ $frontget	= new frontendGetData($db); }
if (!$naviget)	{ $naviget	= new navigationGetData($db); }
if (!$redirect)	{ $redirect	= new navigationRedirect($db); }
if (!$frontend)	{ $frontend	= new frontendPresent($tpl); }
if (!$naviout)	{ $naviout	= new navigationPresent($tpl); }
//if (!$slider)   { $slider	= new pageSlider(MAX_LIST_ITEMS, $items, $start); }

/* Config Dateien laden */
require_once(CMSADMIN.'/config.php');
require_once(DOCUROOT.'/config_frontend.php');

/* Sprachenfile laden */
require_once(LANGUDIR.LANGUAGE_FILE);

/* Formularfunktionen */
require_once FUNKTION.'form_fus.php';
require_once FUNKTION.'erzeuge_code.php';

/* Script fuer Google Analytics erstellen, falls ein GA-Konto gefunden wurde */
$ga_script = $cfg->google_analytics(GOOGLE_ANALYTICS);

// Test für den Einsatz von FirePHP
//ob_start();
/*
require_once('FirePHPCore/FirePHP.class.php');
$firephp = FirePHP::getInstance(true);
$var = array('i'=>10, 'j'=>20);
$firephp->setEnabled(true);
*/

//$firephp->log($action, 'Action');
//$firephp->log($_SESSION['debugging'], 'Debugging');
//ob_end_flush();

// Debugging kann aktiviert werden, indem &debug=1 an die URL angehängt wird.
require_once(FUNKTION.'debug.php');
if (isset($_REQUEST['debug']) && $_REQUEST['debug'] == 1) {
	$_SESSION['debugging'] = true;
}
// Debugging deaktivieren
if (isset($_REQUEST['debug']) && $_REQUEST['debug'] == 0) {
	$_SESSION['debugging'] = false;
}

// Debugging - Fenster öffnen
if ($_SESSION['debugging'] === true) {
	debug_var('Seite: ', $_SERVER['PHP_SELF']);
	debug_var('Action: ',$_REQUEST);
	debug_msg('Debugging ist aktiv');
	debug_finish();
	//echo 'Debugging aktiv!<br />';
}

?>
