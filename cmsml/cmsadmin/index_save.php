<?php 
// Start einer Session muss immer als Erstes deklariert werden
session_start();
$session_name = session_name();
$session_id   = session_id();

require_once '../includes/includes.php';
require_once 'config.php';
include_once LANGUDIR.LANGUAGE_FILE;


$user 	= '';
$pass 	= '';
$action = $_POST['act'] ? strtoupper($_POST['act']) : '';
$message = '';
$login_error = '<p class="message">Login misslungen - Bitte nochmals versuchen!</p>';
$login_success = '<p class="success">Willkommen ' . $user . '</p>';
$pwcode = $_POST['pwcode'] ? $_POST['pwcode'] : '';

if (isset($_GET['debug']) && $_GET['debug'] == 1) {
	$_SESSION['debugging'] = true;	
} 
if (isset($_GET['debug']) && $_GET['debug'] == 0) {
	$_SESSION['debugging'] = false;		
}


/* Wenn die Session abgelaufen ist, muss das Login wiederholt werden */
if ($action != 'LOGIN') {
	if ($_SESSION['username'] == "" || $_SESSION['password'] == "") {	
		$message = '';
		$action = 'LOGIN';
	}
}

switch($action) {
  case 'LOGIN':
	if (isset($_POST['username']) && isset($_POST['password'])) {
		 // Backslashes aus $_POST-Array entfernen, falls der Server solche gesetzt hat
		if (get_magic_quotes_gpc()) { $_POST = array_map('stripslashes', $_POST); }
		$user = $_POST['username'];
		$pass = $_POST['password'];
		$pass = md5($pass);
	
		// Zugriff auf DB und prüfen, ob der Benutzer erfasst wurde.
		$query	= 'SELECT password FROM '.TABLE_PREFIX.'users WHERE username="' . $user . '" AND password="' . $pass. '"';
		$passwort = $db->queryOne($query);
		
		if ($pwcode == $passwort) {
			$_SESSION['username'] = $user;	
			$_SESSION['password'] = $passwort;
			$message = $login_success;
			$action  = 'menu';
		} else {
			$message = $login_error;
		}

	}
	// Einen 3-stelligen Code generieren und in der Session-Variablen speichern
	$_SESSION['code'] = erzeuge_code(); 
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

function set_class($act, $pos) {
	/* wenn $act == $pos --> diese Menuposition wurde angeklickt */
	if ($act == $pos) { 
		echo 'odd'; 
	} else { 
		echo 'even'; 
	}
}
?>


<?php echo "<?xml version=\"1.0\" encoding=\"utf-8\"?".">\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>CMS by hempenWeb</title>

<script type="text/javascript" src="scripts/md5.js"></script>
<script type="text/javascript">
function logincheck() {
	md5pw = hex_md5(document.forms["loginform"].elements["password"].value);
	document.forms["loginform"].elements["pwcode"].value = md5pw;
	return true;
}

function frame_buster() {
	if (top.location != self.location) {
		top.location.href = './index.php?act=login';
	}
}

function start_form(action) {
	document.getElementById('act').value=action;
	document.GeneralForm.submit();	
}

</script>


<link rel="shortcut icon"  href="../frontend/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/cmsadmin_admin.css" media="screen">
<link rel="stylesheet" type="text/css" href="css/cmsadmin_menue.css" media="screen">
<base target="_top">
</head>

<body id="top"><!-- onload="document.forms.loginform.elements[0].select();"> -->

<form action="index.php" method="post" name="GeneralForm">
	<input type="hidden" name="act" id="act" value="<?php echo $action; ?>">
</form>

<p class="message" align="right"></p>
<h1>Content Management System</h1>
		 
<div id="menu"> 
<?php if ($action != 'LOGIN' && $action != 'LOGOUT') 
{
// Debugging - Fenster öffnen 
if ($_SESSION['debugging'] === true) {
	debug_open_window();
	debug_var('Seite: ', $_SERVER['PHP_SELF']);
	debug_var('Action: ',$_REQUEST);
	debug_msg('Debugging ist aktiv');
	debug_finish();
	$message = 'Debugging: aktiv!';
} 
?>
  <h2>Menu</h2>
  <ul>
    <li class="<?php set_class($action, 'NAVIGA'); ?>"><a href="#" onclick="javascript:start_form('naviga');"><?php echo $GLOBALS['CMS']['MENU01'] ?></a></li>
    <li class="<?php set_class($action, 'SEITEN'); ?>"><a href="#" onclick="javascript:start_form('seiten');"><?php echo $GLOBALS['CMS']['MENU02'] ?></a></li>
<?php if ($_SESSION['username'] == 'hempen') { ?>
    <li class="<?php set_class($action, 'MEDIEN'); ?>"><a href="#" onclick="javascript:start_form('medien');"><?php echo $GLOBALS['CMS']['MENU03'] ?></a></li>
    <!-- <li class="<?php set_class($action, 'EXPLOR'); ?>"><a href="#" onclick="javascript:start_form('explor';"><?php echo $GLOBALS['CMS']['MENU04'] ?></a></li>-->
    <li class="<?php set_class($action, 'CONFIG'); ?>"><a href="#" onclick="javascript:start_form('config');"><?php echo $GLOBALS['CMS']['MENU10'] ?></a></li>
    <li class="<?php set_class($action, 'XLINKS'); ?>"><a href="#" onclick="javascript:start_form('xlinks');"><?php echo $GLOBALS['CMS']['MENU06'] ?></a></li>
<?php } ?>
    <li class="<?php set_class($action, 'BACKUP'); ?>"><a href="#" onclick="javascript:start_form('backup');"><?php echo $GLOBALS['CMS']['MENU07'] ?></a></li>
    <li class="<?php set_class($action, 'DOKU'); ?>"><a href="#" onclick="javascript:start_form('docu');"><?php echo $GLOBALS['CMS']['MENU08'] ?></a></li>
    <li class="even"> 
      <p><font color="#00CC00">Angemeldet: <?php echo $_SESSION['username']; ?></font><br />
      	<?php if ($message != '') { echo $message; } ?>
      </p>
    </li>
    <li class="even"><a href="#" onclick="javascript:start_form('logout');"><?php echo $GLOBALS['CMS']['MENU09'] ?></a></li>
  </ul>
  <?php 
} else { 
?>
  <h2>login</h2>
  <form name="loginform" method="post" action="" onsubmit="return logincheck();" >
    <p class="even"> Benutzername:<br/>
      <input type="text" name="username" size="15" tabindex="1" value="<?php echo $user; ?>" />
      <br/>
      Passwort:<br/>
      <input type="password" name="password" tabindex="2" size="15" />
      <br/>
      <br/>
      <input type="submit" name="login" tabindex="3" value="login" onclick="javascript:start_form('login');" />
      <br/>
      <input type="hidden" name="code" value="<?php echo $_SESSION['code']; ?>">
      <br/>
      <input type="hidden" name="pwcode" value="" />
      <br/>
      <script>
	  	// Der IE 7 macht beim Navigieren mit TAB Probleme, wenn der Focus auf ein Feld gesetzt ist
		// darum kein focus-setzen beim IE7
		var browser = navigator.userAgent;
		if (!browser.match(/MSIE 7/)) { document.forms.loginform.elements[0].select(); }
	  </script>
      <?php if ($message != '') { echo $message; } ?>
      <br/>
    </p>
  </form>
  <?php 
}
?>
  <p> Copyright by &copy; R. Hempen<br>
    See also <a class="ohne_rand" href="http://www.hempenweb.ch" target="_blank">hempen<em>Web</em></a> 
  </p>
</div>

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
