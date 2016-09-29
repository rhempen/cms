<?php
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

require_once './prototype.js';

ob_end_flush();
?>