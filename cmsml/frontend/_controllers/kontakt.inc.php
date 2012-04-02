<?php

session_start();

include_once('index.inc.php');

include_once('sendmail.inc.php');

$tpl->setCurrentBlock('kontaktform');

$msent = isset($_GET['mail']) ? $_GET['mail'] : '';
//$navid = isset($_GET['navid']) && is_numeric($_GET['navid']) ? '?navid='.$_GET['navid'] : '';
//<form action="'.$_SERVER['PHP_SELF'].$navid.'" method="post" name="formmail" onsubmit="return check_form();">

$nav_url = 'http://'.$_SERVER['HTTP_HOST'].$redirect->set_navlink($_GET['navid']);

// Kontaktformular
//$html = '<h2>'.$GLOBALS['KONTAKTFORM']['TITEL'].'</h2>';
$html = '';
if ($msent != 'sent' && $msent != 'fail' && $msent != 'code') {
	$html .= '
	<form action="'.$nav_url.'" method="post" name="formmail" onsubmit="return check_form();">
	<fieldset>
	<p><span id="meldung" class="error">Bitte alle * Felder ausf&uuml;llen!</span><br></p>
	<label for="name">Name *</label><input name="name" type="text" id="name" /><br />
	<label for="adresse">Adresse *</label><input name="adresse" type="text" id="adresse" /><br />
	<label for="plz">Plz / Ort *</label><input name="plz_ort"type="text" id="plz_ort" /><br />
	<label for="telefon">Telefon *</label><input name="telefon" type="text" id="telefon" /><br />
	<label for="email">E-Mail *</label><input name="email" type="text" id="email" /><br />
	<label for="kommentar">Mitteilung</label><textarea name="kommentar" cols="40" rows="4" id="kommentar"></textarea><br />
	<label for="bildcode">Bild-Code *</label><input name="code" type="text" id="code" /><br />
	<label for="bild">&nbsp;</label><img src="'.HOST.'frontend/captcha/bild.php' . '" /><br />
	<input name="schicken" type="submit" class="submit" value="senden" />
	<input name="resetten" type="reset" class="zuruecksetzen" value="zur&uuml;cksetzen" />
	</fieldset>';
} elseif ($msent == 'code') {
	$html .= '
	<form action="'.$nav_url.'" method="post" name="formmail" onsubmit="return check_form();">
	<fieldset>
	<p><span id="meldung" style="color:red;">Der Sicherheitscode ist nicht korrekt!</span><br></p>
	<label for="name">Name *</label><input name="name" type="text" id="name" value="' .$_POST['name']. '" />
	<label for="adresse">Adresse *</label><input name="adresse" type="text" id="adresse" value="' .$_POST['adresse']. '" /><br />
	<label for="plz">Plz / Ort *</label><input name="plz_ort"type="text" id="plz_ort" value="' .$_POST['plz_ort']. '" /><br />
	<label for="telefon">Telefon *</label><input name="telefon" type="text" id="telefon" value="' .$_POST['telefon']. '" /><br />
	<label for="email">E-Mail *</label><input name="email" type="text" id="email" value="' .$_POST['email']. '" /><br />
	<label for="kommentar">Mitteilung</label><textarea name="kommentar" cols="40" rows="4" id="kommentar">'.$_POST['kommentar'].'</textarea><br />
	<label for="bildcode">Bild-Code *</label><input name="code" type="text" id="code" style="border:1px solid red" /><br />
	<label for="bild">&nbsp;</label><img src="'.HOST.'frontend/captcha/bild.php' . '" /><br />
	<input name="schicken" type="submit" class="submit" value="senden" />
	<input name="resetten" type="reset" class="zuruecksetzen" value="zur&uuml;cksetzen" />
	</fieldset>';

} elseif ($msent == 'sent') {
	$html .= $GLOBALS['KONTAKTFORM']['SENT'];
	$text = 
	'<p><b>Folgende Daten wurden gesendet: </b><br />
	'.htmlspecialchars($_POST['name']).'<br />
	'.htmlspecialchars($_POST['adresse']).'<br />
	'.htmlspecialchars($_POST['plz_ort']).'<br />
	'.htmlspecialchars($_POST['telefon']).'<br />
	'.htmlspecialchars($_POST['email']).'<br />
	'.htmlspecialchars($_POST['kommentar']).'</p>';
	$html .= $text;
} else {
	$html .= $GLOBALS['KONTAKTFORM']['SENT'];
	$text = 
	'<p><b>Das Mail konnte leider nicht gesendet werden!</b><br />';	
	$html .= $text;
}
$tpl->setVariable('kontakt_formular', $html);

// Block parsen
$tpl->parseCurrentBlock();

?>
