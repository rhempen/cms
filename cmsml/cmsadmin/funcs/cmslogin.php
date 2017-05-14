<?php
/*=================================================================================
	Functions
=================================================================================*/
/* Login-Input-Felder gem. Action-Code ausgeben */
function login_fields($action)
{
	global $pwcode, $user;
	$html = '';
	$html .= '<input type="hidden" name="pwcode" id="pwcode" value="'.$pwcode.'" />' . "\n";
	switch ($action) {
	case 'CHANGE':
		// Passwort aendern
		$html .= '<h2>'.$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD'].'</h2>' . "\n";
		$html .= '<p class="odd">'.$GLOBALS['TEXTE']['USERNAME'].'<br/>' . "\n";
		$html .= '<input style="width:160px;" type="text" id="username" name="username" tabindex="1" value="'.$user.'" />' . "\n";
		$html .= '<script type="text/javascript">document.getElementById("username").focus();</script>';
		$html .= '<br/>'.$GLOBALS['TEXTE']['OLD_PASSWORD'].'<br/>'. "\n";
		$html .= '<input  style="width:160px;" type="password" name="password" tabindex="2" />' . "\n";
		$html .= '<br/>'.$GLOBALS['TEXTE']['NEW_PASSWORD'].'<br/>'. "\n";
		$html .= '<input  style="width:160px;" type="password" name="pwrdneu1" tabindex="3" />' . "\n";
		$html .= '<br/>'.$GLOBALS['TEXTE']['REPEAT_PASSWORD'].'<br/>'. "\n";
		$html .= '<input  style="width:160px;" type="password" name="pwrdneu2" tabindex="4" />' . "\n";
		$html .= '<p class="even">' . "\n";
		$html .= '<input style="width:170px;padding:3px 0;" type="submit" name="new_password" tabindex="5" value="'.$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD'].'" onclick="javascript:start_form(\'change\');" />' . "\n";
		$html .= '<input type="hidden" name="code" value="'.$_SESSION['code'].'">' . "\n";
		$html .= '</p>' . "\n";
		$html .= '<p class="even">' . "\n";
//		$html .= '<input style="width:170px;padding:0;" type="submit" name="login" tabindex="6" value="'.$GLOBALS['TEXTE']['EXEC_LOGIN'].'" onclick="javascript:start_form(\'login\');" />' . "\n";
//		$html .= '<input style="width:170px;padding:0;" type="submit" name="forgot" tabindex="7" value="'.$GLOBALS['TEXTE']['LBL_NEW_PASSWORD'].'" onclick="javascript:start_form(\'forgot\');" />' . "\n";		
		$html .= '<a style="padding:3px 0;" href="#" onclick="javascript:start_form(\'login\');">'.$GLOBALS['TEXTE']['EXEC_LOGIN'].'</a>' . "\n";
		$html .= '<a style="padding:3px 0;" href="#" onclick="javascript:start_form(\'forgot\');">'.$GLOBALS['TEXTE']['LBL_NEW_PASSWORD'].'</a></p>' . "\n";
		$html .= '</p>' . "\n";
		break;
	case 'FORGOT':
		// Passwort vergessen
		$html .= '<h2>'.$GLOBALS['TEXTE']['LBL_NEW_PASSWORD'].'</h2>' . "\n";
		$html .= '<p class="odd">'.$GLOBALS['TEXTE']['USERNAME'].'<br/>' . "\n";
		$html .= '<input style="width:160px;" type="text" id="username" name="username" tabindex="1" value="'.$user.'" />' . "\n";
		$html .= '<script type="text/javascript">document.getElementById("username").focus();</script>';
		$html .= '<input  style="width:160px;" type="hidden" name="password" />' . "\n";
    	$html .= '<br />'.$GLOBALS['TEXTE']['EMAIL'].'<br/>' . "\n";
		$html .= '<input style="width:160px;" type="email" name="email" tabindex="2" />' . "\n";
		$html .= '<p class="even">' . "\n";
		$html .= '<input style="width:170px;padding:3px 0;" type="submit" name="new_password" tabindex="3" value="'.$GLOBALS['TEXTE']['LBL_NEW_PASSWORD'].'" onclick="javascript:start_form(\'forgot\');" />' . "\n";
		$html .= '<input type="hidden" name="code" value="'.$_SESSION['code'].'">' . "\n";
		$html .= '</p>' . "\n";
		$html .= '<p class="even">' . "\n";
//		$html .= '<input style="width:170px;padding:0;" type="submit" name="login" tabindex="4" value="'.$GLOBALS['TEXTE']['EXEC_LOGIN'].'" onclick="javascript:start_form(\'login\');" />' . "\n";
//		$html .= '<input style="width:170px;padding:0;" type="submit" name="change" tabindex="5" value="'.$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD'].'" onclick="javascript:start_form(\'change\');" />' . "\n";		
		$html .= '<a style="padding:3px 0;" href="#" onclick="javascript:start_form(\'login\');">'.$GLOBALS['TEXTE']['EXEC_LOGIN'].'</a>' . "\n";
		$html .= '<a style="padding:3px 0;" href="#" onclick="javascript:start_form(\'change\');">'.$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD'].'</a></p>' . "\n";
		$html .= '</p>' . "\n";
		break;
	default:
		// Login
		$html .= '<h2>'.$GLOBALS['TEXTE']['LBL_LOGIN'].'</h2>' . "\n";
		$html .= '<p class="even">'.$GLOBALS['TEXTE']['USERNAME'].'<br />' . "\n";
		$html .= '<input style="width:160px;" type="text" id="username" name="username" tabindex="1" value="'.$user.'" />' . "\n";
		$html .= '<script type="text/javascript">document.getElementById("username").focus();</script>';
		$html .= '<br/>'.$GLOBALS['TEXTE']['PASSWORD'].'<br/>'. "\n";
		$html .= '<input  style="width:160px;" type="password" name="password" tabindex="2" />' . "\n";
		$html .= '<p class="even">'. "\n";
		$html .= '<input style="width:170px;padding:3px 0;" type="submit" name="login" tabindex="3" value="'.$GLOBALS['TEXTE']['EXEC_LOGIN'].'" onclick="javascript:start_form(\'login\');" />' . "\n";
		$html .= '<input type="hidden" name="code" value="'.$_SESSION['code'].'">'. "\n";
		$html .= '<p class="even">' . "\n";
//		$html .= '<input style="width:170px;padding:0;" type="submit" name="change" tabindex="4" value="'.$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD'].'" onclick="javascript:start_form(\'change\');" />' . "\n";
//		$html .= '<input style="width:170px;padding:0;" type="submit" name="forgot" tabindex="5" value="'.$GLOBALS['TEXTE']['LBL_NEW_PASSWORD'].'" onclick="javascript:start_form(\'forgot\');" />' . "\n";
		$html .= '<a style="padding:3px 0;" href="#" onclick="javascript:start_form(\'change\');">'.$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD'].'</a>' . "\n";
		$html .= '<a style="padding:3px 0;" href="#" onclick="javascript:start_form(\'forgot\');">'.$GLOBALS['TEXTE']['LBL_NEW_PASSWORD'].'</a></p>' . "\n";
		$html .= '</p>' . "\n";
		break;
	}
return $html;
}

/* class setzen */ 
function set_class($act, $pos) {
	/* wenn $act == $pos --> diese Menuposition wurde angeklickt */
	if ($act == $pos) { 
		return 'odd'; 
	} else { 
		return 'even'; 
	}
}

/* Menu ausgeben */
function menu()
{
	global $menu_arr, $action;
	// Debugging - Fenster �ffnen 
	if ($_SESSION['debugging'] === true) {
		debug_open_window();
		debug_var('Seite: ', $_SERVER['PHP_SELF']);
		debug_var('Action: ',$_REQUEST);
		debug_msg('Debugging ist aktiv');
		debug_finish();
		$message = 'Debugging: aktiv!';
	} 
	
	$html = '';
	$html .= '<h2>Menu</h2>' . "\n";
	$html .= '<ul>' ."\n";
		if (in_array($GLOBALS['CMS']['MENU01'],$menu_arr)) { $html .= '<li class="'.set_class($action, 'NAVIGA').'"><a href="#" onclick="javascript:start_form(\'naviga\');">'.$GLOBALS['CMS']['MENU01'].'</a></li>' . "\n"; }
		if (in_array($GLOBALS['CMS']['MENU02'],$menu_arr)) { $html .= '<li class="'.set_class($action, 'SEITEN').'"><a href="#" onclick="javascript:start_form(\'seiten\');">'.$GLOBALS['CMS']['MENU02'].'</a></li>' . "\n"; }
		if (in_array($GLOBALS['CMS']['MENU11'],$menu_arr)) { $html .= '<li class="'.set_class($action, 'FRGMNT').'"><a href="#" onclick="javascript:start_form(\'frgmnt\');">'.$GLOBALS['CMS']['MENU11'].'</a></li>' . "\n"; }
		if (in_array($GLOBALS['CMS']['MENU12'],$menu_arr)) { $html .= '<li class="'.set_class($action, 'ADDONS').'"><a href="#" onclick="javascript:start_form(\'addons\');">'.$GLOBALS['CMS']['MENU12'].'</a></li>' . "\n"; }
		if (in_array($GLOBALS['CMS']['MENU03'],$menu_arr)) { $html .= '<li class="'.set_class($action, 'MEDIEN').'"><a href="#" onclick="javascript:start_form(\'medien\');">'.$GLOBALS['CMS']['MENU03'].'</a></li>' . "\n"; }
		if (in_array($GLOBALS['CMS']['MENU10'],$menu_arr)) { $html .= '<li class="'.set_class($action, 'CONFIG').'"><a href="#" onclick="javascript:start_form(\'config\');">'.$GLOBALS['CMS']['MENU10'].'</a></li>' . "\n"; }
		if (in_array($GLOBALS['CMS']['MENU06'],$menu_arr)) { $html .= '<li class="'.set_class($action, 'XLINKS').'"><a href="#" onclick="javascript:start_form(\'xlinks\');">'.$GLOBALS['CMS']['MENU06'].'</a></li>' . "\n"; }
		if (in_array($GLOBALS['CMS']['MENU07'],$menu_arr)) { $html .= '<li class="'.set_class($action, 'BACKUP').'"><a href="#" onclick="javascript:start_form(\'backup\');">'.$GLOBALS['CMS']['MENU07'].'</a></li>' . "\n"; }
		if (in_array($GLOBALS['CMS']['MENU08'],$menu_arr)) { $html .= '<li class="'.set_class($action, 'DOKU').'"><a href="#" onclick="javascript:start_form(\'docu\');">'.$GLOBALS['CMS']['MENU08'].'</a></li>' . "\n"; }	
	$html .= '<li class="even">' . "\n";
	$html .= '<p><font color="#00CC00">'.$GLOBALS['TEXTE']['ANGEMELDET'].' '.$_SESSION['username'].'</font><br />' . "\n";
	    if ($message != '') { $html .= $message; } 
	$html .= '</p>' . "\n";
	$html .= '</li>' . "\n";
	$html .= '<li class="even"><a href="#" onclick="javascript:start_form(\'logout\');">'.$GLOBALS['CMS']['MENU09'].'</a></li>' . "\n";
	$html .= '</ul>' . "\n";
	return $html;
}

/* Message ausgeben */
function message($message)
{
	$html = '';
	if ($message != '') {
		$html  = '<div id="msg">' . "\n";
		$html .= $message . "\n";
		$html .= '</div>' . "\n";
	}  
	$html .= '<br />' . "\n";
	return $html;	
}

/* Copyright ausgeben */
function copyright()
{
	$html  = '<p> Copyright by &copy; R. Hempen<br>' . "\n";
	$html .= 'See also <a class="ohne_rand" href="http://www.hempenweb.ch" target="_blank">hempen<em>Web</em></a>' . "\n"; 
    $html .= '</p>' . "\n";
    return $html;
}

?>
