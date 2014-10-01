<?php

session_start();

include_once('index.inc.php');

include_once('sendmail.inc.php');

$tpl->setCurrentBlock('kontaktform');

$msent = isset($_GET['mail']) ? $_GET['mail'] : '';
$langu = isset($_GET['langu']) ? $_GET['langu'] : 'de'; 

$script = '
  jQuery.noConflict();

  jQuery("[placeholder]").focus(function() {
    var lInput = jQuery(this);
    if (lInput.val() == lInput.attr("placeholder")) {
      lInput.val("");
      lInput.removeClass("placeholder");
    }
  }).blur(function() {
    var lInput = jQuery(this);
    if (lInput.val() == "" || lInput.val() == lInput.attr("placeholder")) {
      lInput.addClass("placeholder");
      lInput.val(lInput.attr("placeholder"));
    }
  }).blur();'."\n";

$script .= '
  function check_placeholders() {
    var fehler=false;
    var fehlermeldung="'.$GLOBALS['KONTAKTERROR']['MARKEDFIELDS'].'";
    var fehlerEmail="";
    jQuery("form[name=\'formmail\']").find("[placeholder]").each(function() {
      var lInput = jQuery(this);
      // die Obligatorischen Felder sollen einen Wert haben
      if (lInput.attr("id") == "kommentar") return true;
      if (lInput.val() == lInput.attr("placeholder")) { 
        lInput.addClass("wrong");
        fehler=true ; 
      }
      // Email prüfen
      if (lInput.attr("id") == "email" && lInput.val() != lInput.attr("placeholder")) {
        if (!isValidEmail(lInput.val())) {
          lInput.addClass("wrong");
          fehlerEmail = "'.$GLOBALS['KONTAKTERROR']['WRONGEMAIL'].'";
          fehler=true;
        }
      }    
    })
    if (fehler) {
      jQuery("#kontaktmeldung").html(fehlermeldung);
      if (fehlerEmail) { jQuery("#kontaktemail").html(fehlerEmail); }      
      return false;    
    }
    return true;
  }'."\n";

$script .= '
  function isValidEmail(string) {
	if (string.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) != -1) { 
		return true; 
	} else {
		return false;
	}  
  }
  '."\n";

$script .= '
  function resetForm(){
    jQuery("form[name=\'formmail\']").find("[placeholder]").each(function() {
      var lInput = jQuery(this);
      lInput.val(lInput.attr("placeholder"));
      lInput.removeClass("wrong");
      lInput.addClass("placeholder");
      });
      jQuery("#kontaktemail").html("");
      jQuery("#kontaktmeldung").html("'.$GLOBALS['KONTAKTFORM']['OBLIGATORY'].'");
  }'."\n";


$meldungen  = '<script type="text/javascript">'."\n";
$meldungen .= 'var markedfields="'.$GLOBALS['KONTAKTERROR']['MARKEDFIELDS'].'";'."\n";
$meldungen .= 'var wrongemail="'.$GLOBALS['KONTAKTERROR']['WRONGEMAIL'].'";'."\n";
$meldungen .= $script."\n";
$meldungen .= '</script>'."\n";

$nav_url = 'http://'.$_SERVER['HTTP_HOST'].$redirect->set_navlink($_GET['navid']);

// Kontaktformular
//$html = '<h2>'.$GLOBALS['KONTAKTFORM']['TITEL'].'</h2>';
$html = '';
if ($msent != 'sent' && $msent != 'fail' && $msent != 'code') {
	$html .= '
	<form action="'.$nav_url.'" method="post" name="formmail" onsubmit="return check_placeholders();">
	<fieldset>
	<p><span id="kontaktmeldung" class="error">'.$GLOBALS['KONTAKTFORM']['OBLIGATORY'].'</span><br></p>
    <input name="name" type="text" id="name" class="placeholder" placeholder="'.$GLOBALS['KONTAKTFORM']['NAME'].'"/><br />
	<input name="adresse" type="text" id="adresse" class="placeholder" placeholder="'.$GLOBALS['KONTAKTFORM']['ADRESSE'].'"/><br />
	<input name="plz_ort" type="text" id="plz_ort" class="placeholder" placeholder="'.$GLOBALS['KONTAKTFORM']['PLZ_ORT'].'"/><br />
	<input name="telefon" type="text" id="telefon" class="placeholder" placeholder="'.$GLOBALS['KONTAKTFORM']['TELEFON'].'"/><br />
	<span id="kontaktemail" class="error"></span>
	<input name="email" type="text" id="email" class="placeholder" placeholder="'.$GLOBALS['KONTAKTFORM']['EMAIL'].'"/><br />
	<textarea name="kommentar" cols="40" rows="4" id="kommentar" class="placeholder" placeholder="'.$GLOBALS['KONTAKTFORM']['MITTEILUNG'].'"></textarea><br />
	<input name="code" type="text" id="code" class="placeholder" placeholder="'.$GLOBALS['KONTAKTFORM']['BILDCODE'].'"/><br />
	<img src="'.HOST.'frontend/captcha/bild.php' . '" /><br />
    <input name="schicken" type="submit" class="submit" value="'.$GLOBALS['KONTAKTFORM']['SENDEN'].'" />
    <input name="resetten" type="button" class="zuruecksetzen" onclick="resetForm();" value="'.$GLOBALS['KONTAKTFORM']['RESET'].'" />
	</fieldset>'."\n".$meldungen;
} elseif ($msent == 'code') {
	$html .= '
	<form action="'.$nav_url.'" method="post" name="formmail" onsubmit="return check_placeholders();">
	<fieldset>	
    <p><span id="kontaktmeldung" style="color:red;"></span><br></p>
	<input name="name" type="text" id="name" class="placeholder" value="' .$_POST['name']. '" />
	<input name="adresse" type="text" id="adresse" class="placeholder" value="' .$_POST['adresse']. '" /><br />
	<input name="plz_ort" type="text" id="plz_ort" class="placeholder" value="' .$_POST['plz_ort']. '" /><br />
	<input name="telefon" type="text" id="telefon" class="placeholder" value="' .$_POST['telefon']. '" /><br />
	<span id="kontaktemail" class="error"></span>
	<input name="email" type="text" id="email" class="placeholder" value="' .$_POST['email']. '" /><br />
	<textarea name="kommentar" cols="40" rows="4" id="kommentar" class="placeholder">'.$_POST['kommentar'].'</textarea><br />
    <span id="kontaktcode" style="color:red;display:block">'.$GLOBALS['KONTAKTFORM']['CODE_FALSCH'].'</span>
    <input name="code" type="text" id="code" class="placeholder" placeholder="'.$GLOBALS['KONTAKTFORM']['BILDCODE'].'" style="border:1px solid red" /><br />
	<img src="'.HOST.'frontend/captcha/bild.php' . '" /><br />
	<input name="schicken" type="submit" class="submit" value="'.$GLOBALS['KONTAKTFORM']['SENDEN'].'" />
	<input name="resetten" type="button" class="zuruecksetzen" onclick="resetForm();" value="'.$GLOBALS['KONTAKTFORM']['RESET'].'" />
	</fieldset>'."\n".$meldungen;

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
