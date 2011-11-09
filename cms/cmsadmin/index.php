<?php 
header('Content-Type: text/html; charset=utf-8');

// Start einer Session muss immer als Erstes deklariert werden
session_start();
$session_name = session_name();
$session_id   = session_id();

require_once '../includes/includes.php';
require_once 'config.php';
require_once LANGUDIR.LANGUAGE_FILE;
require_once '_models/user_maintain.class.php';
$usmaint = new userMaintain($db);

// Backslashes aus $_POST-Array entfernen, falls der Server solche gesetzt hat
if (get_magic_quotes_gpc()) { $_POST = array_map('stripslashes', $_POST); }

$user 		= isset($_POST['username']) ? $_POST['username'] : '';
$pass		= isset($_POST['password']) ? $_POST['password'] : '';
$pwneu1	  	= isset($_POST['pwrdneu1']) ? $_POST['pwrdneu1'] : '';
$pwneu2	 	= isset($_POST['pwrdneu2']) ? $_POST['pwrdneu2'] : '';
$email	  	= isset($_POST['email']) ? $_POST['email'] : '';
$action 	= isset($_POST['act']) ? strtoupper($_POST['act']) : '';
$pwcode 	= isset($_POST['pwcode']) ? $_POST['pwcode'] : '';
$message 	= '';
$error 		= '<p class="message">%s</p>';
$success 	= '<p class="success">%s</p>';

//$firephp->log($action, 'Action');

if (isset($_GET['debug']) && $_GET['debug'] == 1) {
	$_SESSION['debugging'] = true;	
} 
if (isset($_GET['debug']) && $_GET['debug'] == 0) {
	$_SESSION['debugging'] = false;		
}

if ($_SESSION['debugging']){
	echo 'Action: '.$action;
	echo ' User: '.$user;
	echo ' Pass: '.$pass;
	echo ' PCode: '.$pwcode. '<br />';
	echo 'Pwneu1: '.$pwneu1;
	echo ' Pwneu2: '.$pwneu2;
	echo ' Email: '.$email;
}

/* Wenn die Session abgelaufen ist, muss das Login wiederholt werden */
if ($action != 'LOGIN' && $action != 'CHANGE' && $action != 'FORGOT' ) {
	if ($_SESSION['username'] == "" || $_SESSION['password'] == "") {	
		$message = '';
		$action = 'LOGIN';
	}
}

switch($action) {
	case 'LOGIN':
	    $rc = $usmaint->login($user, $pass, $pwcode);
	    if ((int)$rc == 0) { $message = sprintf($success,$GLOBALS['TEXTE']['WELCOME'] . $user); $action = 'MENU';} 
	    if ((int)$rc == 8) { $message = sprintf($error,$GLOBALS['TEXTE']['LOGIN_FAIL']); }
	    if ((int)$rc == 10) { $message = sprintf($error,$GLOBALS['TEXTE']['NO_MENU'],$user); }
		break;
	
	case 'CHANGE':
		$rc = $usmaint->change_password($user, $pass, $pwneu1, $pwneu2);
	    if ((int)$rc == 0) { $message = sprintf($success, $GLOBALS['TEXTE']['PASSWORD_CHANGED']); $action = 'LOGIN';}
	    if ((int)$rc == 8) { $message = sprintf($error, $GLOBALS['TEXTE']['ALLE_FELDER_FUELLEN']); }
	    if ((int)$rc == 9) { $message = sprintf($error, $GLOBALS['TEXTE']['PASSWORD_NEW_EQALS_OLD']); }
	    if ((int)$rc == 10) { $message = sprintf($error, $GLOBALS['TEXTE']['PASSWORD_LENGTH']); }
	    if ((int)$rc == 11) { $message = sprintf($error, $GLOBALS['TEXTE']['PASSWORD_EQUAL']); }
	    if ((int)$rc == 12) { $message = sprintf($error, $GLOBALS['TEXTE']['PASSWORD_CHANGE_FAILED']); }
	    if ((int)$rc == 14) { 
			$msg	 = sprintf($GLOBALS['TEXTE']['USER_NOT_EXIST'], $user);
	    	$message = sprintf($error, $msg);
	    }
		break;
	 	
	case 'FORGOT':
		$rc = $usmaint->get_new_password($user, $email);
		if ($_SERVER['HTTP_HOST'] == 'hero') { $zusatz = ' New: '.$_SESSION['newpass']; }
	    if ((int)$rc == 0) { $message = sprintf($success, $GLOBALS['TEXTE']['EMAIL_SENT'].$email); $action = 'LOGIN';}
	    if ((int)$rc == 8) { $message = sprintf($error, $GLOBALS['TEXTE']['ALLE_FELDER_FUELLEN']); }
	    if ((int)$rc == 9) { $message = sprintf($error, $GLOBALS['TEXTE']['WRONG_EMAIL'].$email); }
	    if ((int)$rc == 10) { $message = sprintf($error, $GLOBALS['TEXTE']['EMAIL_SEND_FAILED'].$email.$zusatz); }
	    if ((int)$rc == 12) { $message = sprintf($error, $GLOBALS['TEXTE']['PASSWORD_CHANGE_FAILED'].$zusatz); }
	    if ((int)$rc == 14) { 
			$msg	 = sprintf($GLOBALS['TEXTE']['USER_NOT_EXIST'], $user);
	    	$message = sprintf($error, $msg); 
	    }
		break;

	case 'LOGOUT':
	  	unset($_SESSION['username'])	;
		unset($_SESSION['password']);
		break;
	
	case 'BACKUP':
		break;
	
	default:
		break;
}

// Array mit Menupositionen des Benutzers aufbauen
$menu = isset($_SESSION['menu']) ? $_SESSION['menu'] : $menu;
if ($menu != '') $menu_arr = $usmaint->set_menu_arr($menu);

// Funktionen
require_once('funcs/cmslogin.php');
?>

<?php echo "<?xml version=\"1.0\" encoding=\"utf-8\"?".">\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="shortcut icon"  href="../frontend/themes/hempenweb/img/favicon.ico" type="image/x-icon" />
<title><?php echo $GLOBALS['CMS']['CMS_TITLE']; ?></title>

<script type="text/javascript" src="scripts/md5.js"></script>
<script type="text/javascript" src="scripts/start_cmsadmin.js"></script>
<link rel="shortcut icon"  href="../frontend/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/cmsadmin_admin.css" media="screen"/>
<link rel="stylesheet" type="text/css" href="css/cmsadmin_menue.css" media="screen"/>

<base target="_top"/>
</head>

<body id="top">

<p class="message" align="right"></p>
<h1><?php echo $GLOBALS['CMS']['LBL_CMS']; ?></h1>

<form action="index.php" method="post" name="generalForm">
<input type="hidden" name="act" id="act" value="<?php echo $action ?>" /> <!-- value="'.$action.'" /> -->

<div id="menu"> 
<?php 
switch($action)
{
	case 'LOGIN':
		// Input-Felder fuer Login, Passwort aendern oder Passwort anfordern
		echo login_fields($action);
		break;
	case 'CHANGE':
		// Input-Felder fuer Login, Passwort aendern oder Passwort anfordern
		echo login_fields($action);
		break;
	case 'FORGOT':
		// Input-Felder fuer Login, Passwort aendern oder Passwort anfordern
		echo login_fields($action);
		break;
	case 'LOGOUT':
		echo login_fields($action);
		break;
	default:
		// Menu ausgeben
		echo menu();
		break;
}
echo message($message);
echo copyright();	
?>

</div>
</form>

<div id="inhalt">
<?php
// hier wird das relevante Include aufgerufen
switch($action) {
  case 'NAVIGA':
    echo '<h2>' .$GLOBALS['CMS']['MENU01']. '</h2>';
	echo '<iframe name="files" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto" width="100%" height="800" src="_controllers/navi_co_maintain.php"></iframe>';
	break;
	
  case "SEITEN":
	echo '<h2>' .$GLOBALS['CMS']['MENU02']. '</h2>';
	echo '<iframe name="pages" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto" width="100%" height="800" src="_controllers/pages_co_maintain.php"></iframe>';
	break;
	
  case "FRGMNT":
	echo '<h2>' .$GLOBALS['CMS']['MENU11']. '</h2>';
	echo '<iframe name="pages" frameborder="0" marginheight="0" marginwidth="0" scrolling="auto" width="100%" height="800" src="_controllers/frgmnts_co_maintain.php"></iframe>';
	break;

  case "MEDIEN": 
	echo '<h2>' .$GLOBALS['CMS']['MENU03']. '</h2>';
	echo '<iframe name="medien" frameborder="0" scrolling="auto" width="100%" height="800" src="_controllers/pictures_co_maintain.php"></iframe>';
	break;
	
  case "EXPLOR": 
	echo '<h2>' .$GLOBALS['CMS']['MENU04']. '</h2>';
	echo '<iframe name="explor" frameborder="0" scrolling="auto" width="100%" height="600" src="../ajaxfilemanager/index.php"></iframe>';
	break;

  case "XLINKS":
	echo '<h2>' .$GLOBALS['CMS']['MENU06']. '</h2>';
	echo '<iframe name="xlinks" frameborder="0" scrolling="auto" width="100%" height="800" src="links.php"></iframe>';
	break;

  case "BACKUP":
	echo '<h2>' .$GLOBALS['CMS']['MENU07']. '</h2>';
	echo '<iframe name="backup" frameborder="0" scrolling="auto" width="100%" height="800" src="backup/index.php"></iframe>';
	break;

  case "DOCU":
	echo '<h2>' .$GLOBALS['CMS']['MENU08']. '</h2>';
	echo '<iframe name="docu" frameborder="0" scrolling="auto" width="100%" height="800" src="doku.php"></iframe>';
	break;

  case "LOGOUT":
	echo '<h2>' .$GLOBALS['CMS']['MENU09']. '</h2>';
	break;

  case "CONFIG":
	echo '<h2>' .$GLOBALS['CMS']['MENU10']. '</h2>';
	echo '<iframe name="backup" frameborder="0" scrolling="auto" width="100%" height="800" src="_controllers/config_co_maintain.php"></iframe>';
	break;

  case "LOGIN":
	echo '<h2>' .$GLOBALS['CMS']['TEXT_ANMELDEN']. '</h2>';
	break;

  case "CHANGE":
	echo '<h2>' .$GLOBALS['CMS']['TEXT_ANMELDEN']. '</h2>';
	break;

  case "FORGOT":
	echo '<h2>' .$GLOBALS['CMS']['TEXT_ANMELDEN']. '</h2>';
	break;
	
  default:
	echo '<h2>' .$GLOBALS['CMS']['TEXT_WAEHLEN']. '</h2>';
	break;

}	
// Schliessen der DB-Verbindung
$db->disconnect();
?>
</div>

</body>
</html>
