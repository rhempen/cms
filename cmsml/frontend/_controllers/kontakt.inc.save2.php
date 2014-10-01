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
	<p><span id="kontaktmeldung" class="error">'.$GLOBALS['KONTAKTFORM']['OBLIGATORY'].'</span><br></p>
    <input name="name" type="text" id="name" value="'.$GLOBALS['KONTAKTFORM']['NAME'].'" onfocus="setFokus(this.id)" /><br />
	<input name="adresse" type="text" id="adresse" value="'.$GLOBALS['KONTAKTFORM']['ADRESSE'].'" onfocus="setFokus(this.id)"/><br />
	<input name="plz_ort"type="text" id="plz_ort" value="'.$GLOBALS['KONTAKTFORM']['PLZ_ORT'].'" onfocus="setFokus(this.id)"/><br />
	<input name="telefon" type="text" id="telefon" value="'.$GLOBALS['KONTAKTFORM']['TELEFON'].'" onfocus="setFokus(this.id)"/><br />
	<input name="email" type="text" id="email" value="'.$GLOBALS['KONTAKTFORM']['EMAIL'].'" onfocus="setFokus(this.id)"/><br />
	<textarea name="kommentar" cols="40" rows="4" id="kommentar" onfocus="setFokus(this.id)">'.$GLOBALS['KONTAKTFORM']['MITTEILUNG'].'</textarea><br />
	<input name="code" type="text" id="code" value="'.$GLOBALS['KONTAKTFORM']['BILDCODE'].'" onfocus="setFokus(this.id)"/><br />
	<div class="inputWrapper"><img src="'.HOST.'frontend/captcha/bild.php' . '" /></div><br />
	<div class="inputWrapper">
      <input name="schicken" type="submit" class="submit" value="'.$GLOBALS['KONTAKTFORM']['SENDEN'].'" />
      <input name="resetten" type="reset" class="zuruecksetzen" value="'.$GLOBALS['KONTAKTFORM']['RESET'].'" />
    </div>
	</fieldset>';
} elseif ($msent == 'code') {
	$html .= '
	<form action="'.$nav_url.'" method="post" name="formmail" onsubmit="return check_form();">
	<fieldset>
	<p><span id="meldung" style="color:red;">'.$GLOBALS['KONTAKTFORM']['CODE_FALSCH'].'</span><br></p>
	<label for="name">'.$GLOBALS['KONTAKTFORM']['NAME'].'</label><input name="name" type="text" id="name" value="' .$_POST['name']. '" />
	<label for="adresse">'.$GLOBALS['KONTAKTFORM']['ADRESSE'].'</label><input name="adresse" type="text" id="adresse" value="' .$_POST['adresse']. '" /><br />
	<label for="plz">'.$GLOBALS['KONTAKTFORM']['PLZ_ORT'].'</label><input name="plz_ort"type="text" id="plz_ort" value="' .$_POST['plz_ort']. '" /><br />
	<label for="telefon">'.$GLOBALS['KONTAKTFORM']['TELEFON'].'</label><input name="telefon" type="text" id="telefon" value="' .$_POST['telefon']. '" /><br />
	<label for="email">'.$GLOBALS['KONTAKTFORM']['EMAIL'].'</label><input name="email" type="text" id="email" value="' .$_POST['email']. '" /><br />
	<label for="kommentar">'.$GLOBALS['KONTAKTFORM']['MITTEILUNG'].'</label><textarea name="kommentar" cols="40" rows="4" id="kommentar">'.$_POST['kommentar'].'</textarea><br />
	<label for="bildcode">'.$GLOBALS['KONTAKTFORM']['BILDCODE'].'</label><input name="code" type="text" id="code" style="border:1px solid red" /><br />
	<label for="bild">&nbsp;</label><img src="'.HOST.'frontend/captcha/bild.php' . '" /><br />
	<input name="schicken" type="submit" class="submit" value="'.$GLOBALS['KONTAKTFORM']['SENDEN'].'" />
	<input name="resetten" type="reset" class="zuruecksetzen" value="'.$GLOBALS['KONTAKTFORM']['RESET'].'" />
	</fieldset>';

} elseif ($msent == 'sent') {
	$html .= $GLOBALS['KONTAKTFORM']['SENT'];
	$text = 
	'<p><b>'.$GLOBALS['KONTAKTFORM']['DATA_SENT'].'</b><br />
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
	'<p><b>'.$GLOBALS['KONTAKTFORM']['NOT_SENT'].'</b><br />';	
	$html .= $text;
}
$tpl->setVariable('kontakt_formular', $html);

// Block parsen
$tpl->parseCurrentBlock();

?>
