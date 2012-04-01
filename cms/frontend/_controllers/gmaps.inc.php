<?php

/*
 * @author      Roland Hempen - business [at] hempenweb [dot] ch
 * @copyright   you are free to use this code as long as you
 *              credit the author - and provide me with your improvements
 * @version     20120121
 * @function    Controller für die Filialsuche in Google Maps
 * 
 */

//include_once 'index.inc.php';

$gmapindex = './frontend/_addons/gmaps/index.php';

$html = '<iframe id="addon_canvas" scrolling="auto" src="' .$gmapindex. '"></iframe>';

$tpl->setCurrentBlock('sitemap');
$tpl->setVariable('sitemap', $html);
$tpl->parseCurrentBlock();


?>
