<?php

/* wurde das Thema, und damit die DB gewechselt? 
 * Dies ist der Fall, wenn in der Konfiguration der THEME/DESIGN geaendert wird
 */
$thema = isset($_GET['thema']) ? $_GET['thema'] : '';
if ($thema != '') { 
	require_once(DOCUROOT.'cmsadmin/_models/config_maintain.class.php');
	$cfg->update_website($thema);
}

/* aktuelle Website --> steuert Zugriff auf die richtige DB */
require_once 'website.php';
if (defined('WEBSITE') && WEBSITE != '') {
	$thema = preg_replace('/\d$/','',WEBSITE); // Ziffern am Schluss des Wortes entfernen				
	$dbdir = DOCUROOT.'db/'.$thema.'/';
} else {
	$dbdir = DOCUROOT.'db/';
}

define('DBASEDIR', $dbdir); 	
define('DBFILE','cms_'.$thema);
//echo '<br>ROOTDIR='.ROOTDIR.'<br>DOCUROOT='.DOCUROOT .'<br>DBASEDIR='. DBASEDIR .'<br>SCRIPT_NAME='. $_SERVER['SCRIPT_NAME'].'<br />';
//echo '<br>'.$_SERVER['DOCUMENT_ROOT'];

?>
