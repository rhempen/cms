<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse fuer die Verwaltung der Benutzer und Logindaten
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erwaehnt wird
 * @version     1.0 | 2009-05-22
 * @package     CMSADMIN/Usermaintenance
 * 
 */

class userMaintain
{
	private $mPrefix;
	private $mDb;
	private $mMeldung;
	
	
    /* Constructor */
    function __construct($db) 
    {
		$this->mPrefix = TABLE_PREFIX;
		$this->mDb = $db;
		$this->mMeldung = array();
    }                                                                          

    /* Neue Methode implementieren */	
    /* login ausf�hren
		@param: $user - Benutzername
		@param: $pass - Passwort
		@param: $pwcode - Passwort MD5 verschl�sselt
		@return: $rc - Returncode (4 = ohne Fehlermeldung, 8 = Fehlermeldung)
    */	
    public function login($user, $pass, $pwcode) 
    {
    	$rc = $this->check_input('login', $user, $pass, $pwcode);
    	if ((int)$rc == 0) {
			$pass = md5($pass);
			// Zugriff auf DB und pr�fen, ob der Benutzer erfasst wurde.
			$usrow	= $this->get_user_row($user, $pass);
			// Nichts gefunden!
			if ($usrow == '') { return $rc=8; }
			
			$pswort	= $usrow['password'];
			$menu	= $usrow['menu'];
			
			if ($menu == '') {
				return $rc = 10; // Kein Menu gepflegt!
			} elseif ($pwcode == $pswort) {
				$_SESSION['username'] = $user;	
				$_SESSION['password'] = $pswort;
				$_SESSION['menu']     = $menu;		
				$rc = 0;
			} else {
				return $rc = 8; 
			}
		}
		// Einen 3-stelligen Code generieren und in der Session-Variablen speichern
		$_SESSION['code'] = erzeuge_code();
		return $rc;
    }    

    /* Userdatensatz lesen, nachdem der Benutzer die Logindaten eingegeben hat
		@param: $user - Benutzername
		@param: $pass - Passwort
		@return: $row  - Datensatz des Benutzers
    */	
    private function get_user_row($user, $pass) 
    {
    	global $db;
		$query	= 'SELECT * FROM '.TABLE_PREFIX.'users WHERE username="'.$user.'" AND password="'.$pass.'"';
		$usrow	= $db->query($query);
		$row  	= $usrow->fetchRow(MDB2_FETCHMODE_ASSOC);
		return $row;      
    }	

    /* Passwort �ndern
		@param: $user - Benutzername
		@param: $pass - Passwort
		@param: $pwcode - Passwort MD5 verschl�sselt
		@return: $rc - Returncode
    */	
    public function change_password($user, $pass, $pwneu1, $pwneu2) 
    {
    	$rc = $this->check_input('change', $user, $pass, '', $pwneu1, $pwneu2);
    	if ((int)$rc == 0) { $rc = $this->update_user($user, $pass, $pwneu1, $pwneu2); }
    	return $rc;
    }    

    /* Passwort �ndern auf der DB
		@param: $user - Benutzername
		@param: $pass - Passwort
		@param: $pwcode - Passwort MD5 verschl�sselt
		@return: $rc - Returncode
    */	
    private function update_user($user, $pass, $pwneu) 
    {
    	global $db;
    	$rc = $this->check_username($user);
    	if ((int)$rc == 0) {    	
	    	$update = 'UPDATE '.TABLE_PREFIX.'users SET password="'.md5($pwneu).'" WHERE username="'.$user.'" AND password="'.md5($pass).'"';
	    	if ($db->query($update)) { $rc = 0; } else { $rc = 12; }
    	}
    	return $rc;
    }
    	
    /* Neues Passwort per Mail anfordern
		@param: $user - Benutzername
		@param: $email - Emailadresse
		@return: $rc - Returncode
    */	
    public function get_new_password($user, $email) 
    {
    	$rc = $this->check_input('forgot', $user, '', '', '', '', $email);
    	if ((int)$rc == 0) { $newpass = $this->set_new_password(); }
    	if ($newpass != '') { $rc = $this->update_user_pw($user, $newpass); }
    	if ((int)$rc == 0) { $rc = $this->send_mail($email, $newpass); }
    	return $rc;
    }    
    
    /* Neues Passwort kreiieren
		@return: $newpass - Neues Password
    */	
    private function set_new_password($anz=6) 
    {
    	$newpassw	= '';
		$arr1 		= range(0,9);
    	$arr2 		= range('a','z');
    	$arr1und2 	= array_merge($arr1,$arr2);

    	srand ((float)microtime()*1000000);
    	shuffle($arr1und2);
        
	    foreach (array_slice($arr1und2,0,$anz) as $zeichen)
	    {
	        $newpassw .= $zeichen;
	    }
      $_SESSION['newpass'] = $newpassw;
    	return $newpassw;
    }

    /* Neues Passwort kreiieren
    	@param: $email - Email
		@return: $newpass - Neues Password
    */	
    private function send_mail($email, $newpass) 
    {
    	$rc = 0;
        $emailadresse = ereg_replace("\r", '', $email);
        $empfaenger   = $email;
        /* an 2 empfaenger schicken - emailadressen kommagetrennt: */
        //$empfaenger = 'rklein@mus.ch,off@abwesend.de';
        $betreff    = $GLOBALS['TEXTE']['EMAIL_BETREFF'];
        $text		= sprintf($GLOBALS['TEXTE']['EMAIL_TEXT'],$newpass);
        $extra = "MIME-Version: 1.0\nContent-Type: text/plain; charset=iso-8859-1\nContent-Transfer-Encoding: quoted-printable\n";
        if (!@mail($empfaenger, $betreff, $text, $extra)) { $rc = 10; }
		return $rc;
    }	
    
    /* Update Userpassword
		@param: $user - Benutzer
		@param: $newpass - Neues Password
		@return: $rc - Returnvalue
    */	
    private function update_user_pw($user, $newpass)
    {
    	global $db;
    	$rc = $this->check_username($user);    	
		if ($rc == 0) {
	    	$update = 'UPDATE '.TABLE_PREFIX.'users SET password="'.md5($newpass).'" WHERE username="'.$user.'"';
	    	if ($db->query($update)) { $rc = 0; } else { $rc = 12; }
		}
    	return $rc;
    	
    }
    	
    /* Userdatensatz lesen, nachdem der Benutzer die Logindaten eingegeben hat
		@param: $action - Aktion
		@param: $user - Benutzername
		@param: $pass - Passwort 
		@param: $pwcode - Passwort MD5-verschl�sselt 
		@param: $pwneu1 - Neues Passwort 1
		@param: $pwneu2 - Neues Passwort 2
		@param: $email - Emailadresse
		@return: $rc - Returncode
    */	
    private function check_input($action, $user, $pass='', $pwcode='', $pwneu1='', $pwneu2='', $email='') 
    {	
    	$rc = 0;
    	switch($action) {
    		case 'login':
		    	if ($user == '' && $pass == '') {
    				$rc = 4; // Keine Meldung 
    			} elseif ($user == '' || $pass == '') {
    				$rc = 8; // Fehlermeldung
    			}
    			break;
    		case 'change':
		    	if ($user == '' && $pass == '' && $pwneu1 == '' && $pwneu2 == '') {
    				$rc = 4; // Keine Meldung 
    			} elseif ($user == '' || $pass == '' || $pwneu1 == '' || $pwneu2 == '') {
    				$rc = 8; // Fehlermeldung
    			} elseif (md5($pass) == md5($pwneu1) || md5($pass) == md5($pwneu2)) {
    				$rc = 9; // Fehlermeldung
    			} elseif (strlen($pwneu1) < 6 || strlen($pwneu2) < 6) {
					$rc = 10;
    			} elseif (md5($pwneu1) != md5($pwneu2)) {
					$rc = 11;
    			}	    			
    			break;
    		case 'forgot':
		    	if ($user == '' && $email == '') {
    				$rc = 4; // Keine Meldung 
    			} elseif ($user == '' || $email == '') {
    				$rc = 8; // Fehlermeldung
    			}
    			// Email pruefen
    			if ($email != '' && !preg_match('/^[\w.+-]{2,}\@[\w.-]{2,}\.[a-z]{2,6}$/', $email)) {
    				$rc = 9;
    			}
    			break;
    	}
		return $rc;      
    }	

    /* Pruefen, ob der eingegebene Username existiert auf der DB 
    	@params: $user	- Username
    	@return: $rc	- Return-Code (0=User existiert, 12=User existiert nicht)
    */
    private function check_username($user)
    {
    	if ($user != '') {
	    	global $db;
	    	$query = 'SELECT DISTINCT username FROM '.TABLE_PREFIX.'users WHERE username="'.$user.'"';
	    	if ($db->queryOne($query)) { $rc = 0; } else { $rc = 14; }
    	}
    	return $rc;
    }
    
    /* Einen Array von Menupositionen aufbauen aus dem Menustring aus dem Usersatz 
    	@param: @menu - menustring zB: 'NUBD';
    	@return: @menu_arr - Array von Menupositionen
    */
	public function set_menu_arr($menu) 
	{
		$menu_arr = array();
		if ($menu != '') {
			$m_array = str_split($menu);
			foreach($m_array as $index => $value) {
				switch ($value){
					case 'N': // Navigation
						$menu_arr[$index] = $GLOBALS['CMS']['MENU01'];
						break;
					case 'U': // Unterseiten
						$menu_arr[$index] = $GLOBALS['CMS']['MENU02'];
						break;
					case 'F': // Fragmente
						$menu_arr[$index] = $GLOBALS['CMS']['MENU11'];
						break;
					case 'M': // Medienbrowser
						$menu_arr[$index] = $GLOBALS['CMS']['MENU03'];
						break;
					case 'K': // Konfiguration
						$menu_arr[$index] = $GLOBALS['CMS']['MENU10'];
						break;
					case 'L': // Links
						$menu_arr[$index] = $GLOBALS['CMS']['MENU06'];
						break;
					case 'B': // Backup
						$menu_arr[$index] = $GLOBALS['CMS']['MENU07'];
						break;
					case 'D': // Dokumentation
						$menu_arr[$index] = $GLOBALS['CMS']['MENU08'];
						break;
					case 'A': // Addons
						$menu_arr[$index] = $GLOBALS['CMS']['MENU12'];
						break;
				}
			}
			return $menu_arr;
		}
	}
} 


?>
