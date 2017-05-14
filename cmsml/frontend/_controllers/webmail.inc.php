<?php

include_once('index.inc.php');

$hosts = array('hempen.ch', 'hempenweb.ch', 'orasch.ch', 'publicdev.ch', 'gigijacquier.ch', 'physio-allschwil.ch');

if (isset($_POST['login_username'])) 
{
	$email = stristr($_POST['login_username'], '@');
	if (stristr($email, '@'))
	{
		$host = substr($email,1);	       
		if (in_array($host, $hosts)) {
			$link = 'http://webmail.'. $host .'/imp/redirect.php?imapuser='.$_POST['login_username'];
			header('Location: ' . $link);
		} else {
			$meldung = $host.' ist leider nicht bekannt!';
		}
	}
}

$tpl->setCurrentBlock('webmail');

$meldung = $meldung == '' ? 'Bitte Emailadresse eingeben' : $meldung; 
// Webmail Login
$html = '<h2>'.$GLOBALS['WEBMAIL']['TITEL'].'</h2>';
$html .= '
<form action="'. $_SERVER['PHP_SELF'].'/webmail" method="post" name="webmail" onsubmit="return check_webmail();">
<fieldset>
<p><span id="meldung" class="error">'. $meldung .'</span><br></p>
<label for="email">Emailadresse</label><input name="login_username" type="text" size="30" />
<!--<label for="passw">Passwort</label><input name="secretkey" type="password" /><br />-->
<input name="schicken" type="submit" class="submit" value="zum Webmail" />
<!--<input name="resetten" type="reset" class="zuruecksetzen" value="zur&uuml;cksetzen" /> -->
</fieldset>
</form>';
$tpl->setVariable('webmail', $html);

// Block parsen
$tpl->parseCurrentBlock();

?>
