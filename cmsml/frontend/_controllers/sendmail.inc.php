<?php 

// zuerst den Sicherheitscode pr�fen 
if (isset($_POST['email'])) {
	if (!isset($_SESSION['code']) || $_SESSION['code'] != $_POST['code'])
	{
		$_GET['mail'] = 'code';
		return;
	}
}

### Konfiguration ###
# An welche Adresse sollen die Mails gesendet werden?
# $strEmpfaenger = 'info@'.$_SERVER['HTTP_HOST'].'.ch';
if (EMAIL_RECEIVER == '') { 'hempen@bluewin.ch'; }
$strEmpfaenger = $member->encode_email(EMAIL_RECEIVER); // funktioniert nicht!!
$strEmpfaenger = EMAIL_RECEIVER;

# Welche Adresse soll als Absender angegeben werden?
# (Manche Hoster lassen diese Angabe vor dem Versenden der Mail ueberschreiben)
 $strFrom       = '"Formmailer" ';

# Welchen Betreff sollen die Mails erhalten?
$strSubject    = 'Feedback von '.$_POST['name'];

# Zu welcher Seite soll als "Danke-Seite" weitergeleitet werden?
# Wichtig: Sie muessen hier eine gueltige HTTP-Adresse angeben!
if (SMURL == 'ja') {
	$nav_url = $redirect->set_navlink($_GET['navid']);
	$nav_url .= '/sent';
	$strReturnhtml = $nav_url;
} else {
	$navid = isset($_GET['navid']) && is_numeric($_GET['navid']) ? '?navid='.$_GET['navid'].'&mail=sent' : '?mail=sent';
	$strReturnhtml = $_SERVER['PHP_SELF'].$navid;
}

# Welche(s) Zeichen soll(en) zwischen dem Feldnamen und dem angegebenen Wert stehen?
$strDelimiter  = ":\t";

### Ende Konfiguration ###

if($_POST)
{
 $strMailtext = "";

 while(list($strName,$value) = each($_POST))
 {
  if(is_array($value))
  {
   foreach($value as $value_array)
   {
    $strMailtext .= $strName.$strDelimiter.$value_array."\n";
   }
  }
  else
  {
   $strMailtext .= $strName.$strDelimiter.$value."\n";
  }
 }

 if(get_magic_quotes_gpc())
 {
  $strMailtext = stripslashes($strMailtext);
 }
 
// utf8 Dekodieren, falls n�tig
//echo mb_check_encoding($strMailtext);
//if (mb_check_encoding($strMailtext, "UTF-8") === true)
//{
	$strMailtext =  utf8_decode($strMailtext);
//}

// Mail senden
// mail($strEmpfaenger, $strSubject, $strMailtext, "From: ".$strFrom)
//  or die("Die Mail konnte nicht versendet werden.");
// Error Reporting komplett abschalten
 error_reporting(0);
 if (mail($strEmpfaenger, $strSubject, $strMailtext, "From: ".$strFrom))
 {
 	$_GET['mail'] = 'sent';
 } else {
 	$_GET['mail'] = 'fail';
 }
// Error Reporting wieder auf E_ERROR schalten
 error_reporting(1);
}

?>
