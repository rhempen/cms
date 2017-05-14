<?php

$html = '';

switch ($action) {
	case 'CHANGE':
		// Passwort aendern
		$html .= '<div id="change">' . "\n";
		$html .= '<h2>'.$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD'].'</h2>' . "\n";
		$html .= '<form name="changeform" method="post" action="'.$_SERVER['PHP_SELF'].'" onsubmit="return logincheck();" >' . "\n";
		$html .= '<p class="odd">'.$GLOBALS['TEXTE']['USERNAME'].'<br/>' . "\n";
		$html .= '<input style="width:160px;" type="text" name="username" tabindex="1" value="'.$user.'" />' . "\n";
		$html .= '<br/>'.$GLOBALS['TEXTE']['OLD_PASSWORD'].'<br/>'. "\n";
		$html .= '<input  style="width:160px;" type="password" name="password" tabindex="2" />' . "\n";
		$html .= '<br/>'.$GLOBALS['TEXTE']['NEW_PASSWORD'].'<br/>'. "\n";
		$html .= '<input  style="width:160px;" type="password" name="new_password1" tabindex="3" />' . "\n";
		$html .= '<br/>'.$GLOBALS['TEXTE']['REPEAT_PASSWORD'].'<br/>'. "\n";
		$html .= '<input  style="width:160px;" type="password" name="new_password2" tabindex="4" />' . "\n";
		$html .= '<p class="even">' . "\n";
		$html .= '<input style="width:170px;padding:3px 0;" type="submit" name="new_password" tabindex="5" value="'.$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD'].'" onclick="javascript:start_form(\'login\');" />' . "\n";
		$html .= '<input type="hidden" name="code" value="'.$_SESSION['code'].'">' . "\n";
		$html .= '</p>' . "\n";
		$html .= '<p class="even"><a style="padding:3px 0;" href="index.php?act=login" onclick="">'.$GLOBALS['TEXTE']['EXEC_LOGIN'].'</a>' . "\n";
		$html .= '<a style="padding:3px 0;" href="index.php?act=forgot" onclick="">'.$GLOBALS['TEXTE']['LBL_NEW_PASSWORD'].'</a></p>' . "\n";
		$html .= '</p>' . "\n";
		$html .= '</form>' . "\n";
		$html .= '</div>' . "\n";
		break;
	case 'FORGOT':
		// Passwort vergessen
		$html .= '<div id="forgot">' . "\n";
		$html .= '<h2>'.$GLOBALS['TEXTE']['LBL_NEW_PASSWORD'].'</h2>' . "\n";
		$html .= '<form name="forgotform" method="post" action="'.$_SERVER['PHP_SELF'].'" onsubmit="return logincheck();" >' . "\n";
		$html .= '<p class="odd">'.$GLOBALS['TEXTE']['USERNAME'].'<br/>' . "\n";
		$html .= '<input style="width:160px;" type="text" name="username" tabindex="1" value="'.$user.'" />' . "\n";
		$html .= '<br />'.$GLOBALS['TEXTE']['EMAIL'].'<br/>' . "\n";
		$html .= '<input style="width:160px;" type="email" name="email" tabindex="2" size="27" />' . "\n";
		$html .= '<p class="even">' . "\n";
		$html .= '<input style="width:170px;padding:3px 0;" type="submit" name="new_password" tabindex="3" value="'.$GLOBALS['TEXTE']['LBL_NEW_PASSWORD'].'" onclick="javascript:start_form(\'login\');" />' . "\n";
		$html .= '<input type="hidden" name="code" value="'.$_SESSION['code'].'">' . "\n";
		$html .= '</p>' . "\n";
		$html .= '<p class="even"><a style="padding:3px 0;" href="index.php?act=login" onclick="">'.$GLOBALS['TEXTE']['EXEC_LOGIN'].'</a>' . "\n";
		$html .= '<a style="padding:3px 0;" href="index.php?act=change" onclick="">'.$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD'].'</a></p>' . "\n";
		$html .= '</p>' . "\n";
		$html .= '</form>' . "\n";
		$html .= '</div>' . "\n";
		break;
	default:
		// Login
		$html .= '<div id="login">' . "\n";
		$html .= '<h2>'.$GLOBALS['TEXTE']['LBL_LOGIN'].'</h2>' . "\n";
		$html .= '<form name="loginform" method="post" action="" onsubmit="return logincheck();" >' . "\n";
		$html .= '<p class="even">'.$GLOBALS['TEXTE']['USERNAME'].'<br />' . "\n";
		$html .= '<input style="width:160px;" type="text" name="username" tabindex="1" value="'.$user.'" />' . "\n";
		$html .= '<br/>'.$GLOBALS['TEXTE']['PASSWORD'].'<br/>'. "\n";
		$html .= '<input  style="width:160px;" type="password" name="password" tabindex="2" />' . "\n";
		$html .= '<p class="even">'. "\n";
		$html .= '<input style="width:170px;padding:3px 0;" type="submit" name="login" tabindex="3" value="'.$GLOBALS['TEXTE']['EXEC_LOGIN'].'" onclick="javascript:start_form(\'login\');" />' . "\n";
		$html .= '<input type="hidden" name="code" value="'.$_SESSION['code'].'">'. "\n";
		$html .= '<input type="hidden" name="pwcode" value="" />' . "\n";
		$html .= '<p class="even"><a style="padding:3px 0;" href="index.php?act=change" onclick="">'.$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD'].'</a>' . "\n";
		$html .= '<a style="padding:3px 0;" href="index.php?act=forgot" onclick="">'.$GLOBALS['TEXTE']['LBL_NEW_PASSWORD'].'</a></p>' . "\n";
		$html .= '</p>' . "\n";
		$html .= '</form>' . "\n";
		$html .= '</div>' . "\n";
		break;
}

echo $html;
?>
