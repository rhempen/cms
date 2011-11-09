<?php

/* Ist magic_quotes_runtime aktiviert (1), werden Anf�hrungszeichen in den
Ergebnissen der meisten Funktionen, welche Daten von externer Quelle (inkl.
Datenbanken und Textdateien) zur�ckgeben, mit einem Backslash versehen.
Darum setzen wir das hier mal ausser Kraft!!
*/
// set_magic_quotes_runtime(0);

/* Themes */
//define('HOST', 'http://' .$_SERVER['HTTP_HOST']. CMS_ROOT );  
define('HOST', 'http://' .$_SERVER['HTTP_HOST']. ROOTDIR );  
define('THEMES_DIR', 'frontend/themes/');
define('THEME_SELECTED', THEME.'/');

/* Platzierung der Subnavigation */
define('SUBNAVIGATION', 'h');

/* Pfad zu den Page-Slider */
define('GIFS_PAGESLIDER', HOST. THEMES_DIR . THEME_SELECTED . 'gifs/');

/* Frontend Controllers */
define('HOME', './frontend/_controllers/home.inc.php');
define('INDEX_DETAIL', './frontend/_controllers/index.inc.php');
define('KONTAKTFORMULAR', './frontend/_controllers/kontakt.inc.php');
define('WEBMAIL', './frontend/_controllers/webmail.inc.php');
define('SITEMAP', './frontend/_controllers/sitemap.inc.php');
define('PAGES_OVERVIEW', './frontend/_controllers/pages_overview.inc.php');
define('PAGE_DETAIL', './frontend/_controllers/page_detail.inc.php');
define('PAGE_DETAIL_THUMBS', './frontend/_controllers/page_detail_thumbs.inc.php');
define('NAVI_DETAIL_THUMBS', './frontend/_controllers/navi_detail_thumbs.inc.php');

// Style Hidden
define('HIDDEN', 'display:none;');
// Style border none
define('NO_BORDER', 'border:none;');
// Blindes Gif anstelle eines Thumbnails 98x98
define('BLANK_GIF', '<img src="'.HOST.'frontend/shared/gifs/blank.gif" border="0" width="98" height="98" />'); 
// Blindes Gif ohne HTML-Attribute
define('SPACER', HOST.'frontend/shared/gifs/blank.gif'); 

/* Error Reporting setzen --> wird schon in config.php deklariert 
define ('FATAL',E_USER_ERROR);
define ('ERROR',E_USER_WARNING);
define ('WARNING',E_USER_NOTICE);
*/
// error_reporting     
// Gibt an, welche PHP-Fehlermeldungen gezeigt werden  
//error_reporting (FATAL | ERROR | WARNING); 
// Alle Fehler, ausser NOTICE anzeigen
//error_reporting (E_ALL & ~E_NOTICE & ~E_STRICT);  
error_reporting (E_ALL ^ E_NOTICE);
//error_reporting (0);
ini_set('display_errors', 'On');

?>
