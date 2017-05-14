<?php
/**
 * ----------------------------------------------------------
 * (c) 2012  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Controller fuer die Ausgabe des Member Login
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2012-06-09
 * ----------------------------------------------------------
 **/

  // Object für die Klasse memberLogin registrieren
  require_once(FRONTEND.'_models/member_login.class.php');
  if (!$member)	{ $member = new memberLogin($db); }
  $memberlogin  = isset($_POST['memberlogin']) ? $_POST['memberlogin'] : '';
  $memberpassw  = isset($_POST['memberpassw']) ? $_POST['memberpassw'] : '';
  $memberoldpw  = isset($_POST['memberoldpw']) ? $_POST['memberoldpw'] : '';
  $logout       = isset($_POST['logout']) ? strtolower($_POST['logout']) : '';
  $action       = isset($_POST['action']) ? strtolower($_POST['action']) : '';
  $msg_class    = 'error';
  $submitButton = isset($_POST['login']) ? $_POST['login'] : '';  
  
  $_SESSION['memberaction'] = $action != '' ? $action : 'login';
  
  if ($logout == 'logout') {
    $_SESSION['memberlogin'] = '';
    $_SESSION['memberpassw'] = '';
  }
  
  
  // wurde der SubmitButton angeklickt?
  if ($submitButton != '') 
  {
    switch ($_SESSION['memberaction']) {
      case 'change':
        $rc = $member->change_password($action, $memberlogin, $memberoldpw, $memberpassw);
        if ($rc == 0) {
          $message = $GLOBALS['TEXTE']['PASSWORD_CHANGED'];
          $msg_class = 'success';
          $action = 'login';
        }
        break;
      case 'register':
        $rc = $member->register($action, $memberlogin, $memberpassw);
        if ($rc == 0) { 
          $message = $GLOBALS['MEMBER']['REGISTER_MELDUNG'];
          $msg_class = 'success';
          $action = 'login';
        }
        break;
      case 'forgotten':
        $rc = $member->get_new_password($action, $memberlogin);
        if ($rc == 0) {
          $message = sprintf($GLOBALS['TEXTE']['EMAIL_SENT'],$memberlogin);
          $msg_class = 'success';
          $action = 'login';
        }
        break;
      default:
        $rc = $member->login($action, $memberlogin, $memberpassw); 
        break;      
    }

    if ($rc != 0) {
      if ($rc == 4) $rc = 8;
      switch ($rc) {
        case 14:
          $message = sprintf($GLOBALS['MEMBER']['USER_NOT_EXISTS'],$memberlogin);
          break;
        case 13:
          $message = sprintf($GLOBALS['MEMBER']['USER_ALREADY_EXISTS'],$memberlogin);
          break;
        case 12:
          $message = sprintf($GLOBALS['MEMBER']['USER_ALREADY_EXISTS'],$memberlogin);
          break;
        case 11:
          $message = $GLOBALS['MEMBER']['SAVE_FAILED'];
          break;
        case 10:
          $message = $GLOBALS['MEMBER']['EMAIL_SEND_FAILED'];
          break;
        case 9: 
          $message = $GLOBALS['TEXTE']['WRONG_EMAIL'];
          break;
        case 8: 
          $message = $GLOBALS['MEMBER']['LOGIN_AND_PASSWORD'];
          break;
        case 7:
          $message = $GLOBALS['TEXTE']['PASSWORD_LENGTH'];
          break;
        case 6:
          $message = $GLOBALS['TEXTE']['PASSWORD_NEW_EQALS_OLD'];
          break;
        default:
          $message = '';
          break;
      }
    }
  }
  
  
  if ($_SESSION['memberlogin'] == '' || $_SESSION['memberpassw'] == '') {
	// Ausgabe 
    $tpl->addBlockfile('sitemap','member_login', 'member_login_tpl.html');
    $tpl->setCurrentBlock('member_login');
	$tpl->parseCurrentBlock();
    $tpl->setCurrentBlock('login_form');
    $tpl->setVariable('message', $message);
    $tpl->setVariable('msg_class', $msg_class);
    $tpl->setVariable('action', $action);
    $tpl->setVariable('lbl_username', $GLOBALS['MEMBER']['EMAIL']);
    $tpl->setVariable('txt_username', $memberlogin);    
    $tpl->setVariable('session_code', $_SESSION['code']);
    $tpl->setVariable('action_change', $member->set_link('change'));
    $tpl->setVariable('link_change', $GLOBALS['MEMBER']['CHANGE_PW'] );
    $tpl->setVariable('action_forgotten', $member->set_link('forgotten'));
    $tpl->setVariable('link_forgotten', $GLOBALS['MEMBER']['FORGOTTEN'] );
    $tpl->setVariable('action_register', $member->set_link('register'));
    $tpl->setVariable('link_register', $GLOBALS['MEMBER']['REGISTER'] );
    $tpl->setVariable('lbl_submit', $GLOBALS['MEMBER']['LBL_EXECUTE']);
    $tpl->setVariable('class_oldpw_hidden','hide');
    $tpl->setVariable('class_pw_hidden','hide');        

    switch ($action) {
      case 'change':
        $tpl->setVariable('lbl_memberlogin', $GLOBALS['MEMBER']['TITLE_CHANGE']);
        $tpl->setVariable('class_oldpw_hidden','show');
        $tpl->setVariable('class_pw_hidden','show');      
        $tpl->setVariable('lbl_old_passwort', $GLOBALS['TEXTE']['OLD_PASSWORD']);
    	$tpl->setVariable('lbl_passwort', $GLOBALS['TEXTE']['NEW_PASSWORD']);
        $tpl->setVariable('exec_login', $GLOBALS['MEMBER']['TITLE_CHANGE']);        
        break;
      case 'forgotten':
        $tpl->setVariable('lbl_memberlogin', $GLOBALS['MEMBER']['TITLE_FORGOTTEN']);
        $tpl->setVariable('exec_login', $GLOBALS['MEMBER']['EXEC_FORGOTTEN']);
        break;
      case 'register':
        $tpl->setVariable('lbl_memberlogin', $GLOBALS['MEMBER']['TITLE_REGISTER']);
    	$tpl->setVariable('lbl_passwort', $GLOBALS['TEXTE']['PASSWORD']);
        $tpl->setVariable('class_pw_hidden', 'show');        
        $tpl->setVariable('exec_login', $GLOBALS['MEMBER']['EXEC_REGISTER']);
        break;
      default:
    	$tpl->setVariable('lbl_memberlogin', $GLOBALS['MEMBER']['TITLE_LOGIN']);
    	$tpl->setVariable('lbl_passwort', $GLOBALS['TEXTE']['PASSWORD']);
        $tpl->setVariable('class_pw_hidden','show');        
        $tpl->setVariable('exec_login', $GLOBALS['TEXTE']['EXEC_LOGIN']);      
    }

	$tpl->parseCurrentBlock();
  } else {
//    include_once('index.inc.php');    
  }

?>
