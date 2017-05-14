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
 * @package     FRONTEND/MemberLogin
 * 
 */

class memberLogin
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

    /**
      * Logout ausfuehren
      */
    public function logout() 
    {
      $_SESSION['memberlogin'] = '';
      $_SESSION['memberpassw'] = '';
      $_SESSION['memberlastlogin'] = '';      
    }
  
    /**
      * Logout Formular aufbauen
      * es wird, wie beim Member-Login die JS-Funktion start_memberform benuetzt 
      */
    public function setLogoutForm() 
    {
      $logout = '<form name="memberlogout" action="" method="post">';
      $logout .= '<input type="hidden" id="logout" name="logout" value=""/>';
      $logout .= '<span id="memberlogout" onclick="start_memberform(\'logout\');">';
      $logout .= 'Logout: '.$_SESSION['memberlogin'].'</span>';
      $logout .= '</form>';
      return $logout;
    }
    
    /* login ausfuehren
		@param: $action - login, forgotten, register
		@param: $email - Benutzername
		@param: $pass - Passwort
		@return: $rc - Returncode (4 = ohne Fehlermeldung, 8 = Fehlermeldung)
    */	
    public function login($action, $email, $pass) 
    {
    	$rc = $this->check_input($action, $email, $pass);
    	if ((int)$rc == 0) {
			$pwcode = md5($pass);
			// Zugriff auf DB und pruefen, ob der Benutzer erfasst wurde.
			$usrow	= $this->get_user_row($email, $pwcode);
			// Nichts gefunden!
			if ($usrow == '') { return $rc=8; }
			
			$pswort	= $usrow['password'];
            $datumzeit = $this->prepare_timestamp();
			
            if ($pwcode == $pswort) {
                $_SESSION['memberlogin'] = $email;    
                $_SESSION['memberpassw'] = $pswort;
                $_SESSION['memberlastlogin'] = $datumzeit;
                // Member-Row updaten mit aktuellem Zeitstempel
                $rc = $this->update_user_last_login($email, $pwcode, $datumzeit);
			} else {
				return $rc = 8; 
			}
		}
		// Einen 3-stelligen Code generieren und in der Session-Variablen speichern
		$_SESSION['code'] = erzeuge_code();
		return $rc;
    }    

    /* neues Member registrieren
		@param: $action - login, forgotten, register
		@param: $email - Benutzername
		@param: $pass - Passwort
		@return: $rc - Returncode (0 = ohne Fehlermeldung, 8 = Fehlermeldung)
    */	
    public function register($action, $email, $pass) 
    {
      $rc = $this->check_input($action, $email, $pass);
      if ((int)$rc == 0) { 
        // jetzt den neuen Benutzer in der DB speichern
        $rc = $this->insert_user($email, $pass);
      }    
      return $rc;
    }
    
    /**
     * Timestamp zum Speichern in der DB vorbereiten
     * @return: $timestamp - Datum im SQL-Format zB. 2012-06-11 00:00:00
    */	
    private function prepare_timestamp()
    {
      $timestamp = time();
      $datumzeit = date("Y-m-d H:i:s", $timestamp);
      return $datumzeit;      
    }    

    /* Userdatensatz lesen, nachdem der Benutzer die Logindaten eingegeben hat
		@param: $email - Benutzername/Email
		@param: $pass - Passwort
		@return: $row  - Datensatz des Benutzers
    */	
    private function get_user_row($email, $pass) 
    {
    	global $db;
		$query	= 'SELECT * FROM '.TABLE_PREFIX.'members WHERE username="'.$email.'" AND password="'.$pass.'"';
		$usrow	= $db->query($query);
		$row  	= $usrow->fetchRow(MDB2_FETCHMODE_ASSOC);
		return $row;      
    }	

    /* Passwort aendern
		@param: $email - Benutzername
		@param: $pass - Passwort
		@param: $pwcode - Passwort MD5 verschluesselt
		@return: $rc - Returncode
    */	
    public function change_password($action, $email, $pass, $pwneu ) 
    {
        global $db;
    	$rc = $this->check_input($action, $email, $pass, $pwneu);
    	if ((int)$rc == 0) { $rc = $this->update_user($email, $pass, $pwneu); }
    	return $rc;
    }    

    /* LastLogin updaten auf der DB
		@param: $email - Benutzername
		@param: $pwcode - Passwort MD5 verschluesselt
		@return: $rc - Returncode
    */	
    private function update_user_last_login($email, $pwcode, $datumzeit) 
    {
    	global $db;
    	$rc = $this->check_username($email);        
    	if ((int)$rc == 0) {    	
	    	$update = 'UPDATE '.TABLE_PREFIX.'members SET lastlogin="'.$datumzeit.'" WHERE username="'.$email.'" AND password="'.$pwcode.'"';
	    	if ($db->query($update)) { $rc = 0; } else { $rc = 12; }
    	}
    	return $rc;
    }

    /* Passwort aendern auf der DB
		@param: $email - Benutzername
		@param: $pass - Passwort
		@param: $pwcode - Passwort MD5 verschluesselt
		@return: $rc - Returncode
    */	
    private function update_user($email, $pass, $pwneu) 
    {
    	global $db;
    	$rc = $this->check_username($email);
    	if ((int)$rc == 0) {    	
	    	$update = 'UPDATE '.TABLE_PREFIX.'members SET password="'.md5($pwneu).'" WHERE username="'.$email.'" AND password="'.md5($pass).'"';
	    	if ($db->query($update)) { $rc = 0; } else { $rc = 12; }
    	}
    	return $rc;
    }

    /**
     * Neuen Benutzer speichern
     * @param: $email - Benutzername --> wird in Kleinbuchstaben gespeichert
     * @return: $rc - Returncode
    */	
    private function insert_user($email, $pass)
    {
    	global $db;
    	$rc = $this->check_username($email);
    	if ((int)$rc == 0) {          
          return 13; // Dieser Benutzer existiert bereits!!
        } else {
          $pwneu = $pass;
          $datumzeit = $this->prepare_timestamp();
          $insert = 'INSERT INTO '.TABLE_PREFIX.'members SET ';
          $insert .= 'username="'.strtolower($email).'", password="'.md5($pwneu).'", ';
          $insert .= 'created="'.$datumzeit.'"';
          if ($db->query($insert)) { $rc = 0; } else { $rc = 11; }
        }
    	return $rc;
    }
    
    
    /* Neues Passwort per Mail anfordern
		@param: $email - Emailadresse
		@return: $rc - Returncode (0 = Email-Versand 
    */	
    public function get_new_password($action, $email) 
    {
    	$rc = $this->check_input($action, $email);
    	if ((int)$rc == 0) { $newpass = $this->set_new_password(); }
    	if ($newpass != '') { $rc = $this->update_user_pw($email, $newpass); }
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
    
    /**
     * Einen Link im Member-Login-Screen definieren
     * @param: $action - Action
     * @return: $link - Link
     **/	
    public function set_link($action) {
      $script = 'start_memberform';
      $link = $script.'(\''.$action.'\'); return false;';
      return $link;
    }

    /**
     * http://bitprison.net/php_mail_utf-8_subject_and_message
     * Neues Passwort kreiieren
     * @param: $email - Email
     * @return: $newpass - Neues Password
     **/	
    private function send_mail($email, $newpass) 
    {
    	$rc = 0;
        $empfaenger = $this->encode_email($email); // funktioniert nicht!!
        $empfaenger = $email;
        $betreff    = $GLOBALS['MEMBER']['IHR_NEUES_PASSWORT'];
        // Betreffezeile in base64 umcodieren, damit Umlaute stimmen
        $betreff    = '=?UTF-8?B?'.base64_encode($betreff).'?=';
        $text		= sprintf($GLOBALS['TEXTE']['EMAIL_TEXT'],$newpass);
        $extra = "MIME-Version: 1.0\nContent-Type: text/plain; charset=UTF-8\nContent-Transfer-Encoding: quoted-printable\n";
        if (!@mail($empfaenger, $betreff, $text, $extra)) { $rc = 10; }
        
		return $rc;
    }	
    
    /* Update Userpassword
		@param: $email - Benutzer
		@param: $newpass - Neues Password
		@return: $rc - Returnvalue
    */	
    private function update_user_pw($email, $newpass)
    {
    	global $db;
    	$rc = $this->check_username($email);    	
		if ($rc == 0) {
	    	$update = 'UPDATE '.TABLE_PREFIX.'members SET password="'.md5($newpass).'" WHERE username="'.$email.'"';
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
    private function check_input($action, $email, $pass='', $pwneu='') 
    {	
    	$rc = 0;
    	switch($action) {
    		case 'login':
		    	if ($email == '' && $pass == '') {
    				$rc = 4; // Keine Meldung 
    			} elseif ($email == '' || $pass == '') {
    				$rc = 8; // Fehlermeldung
    			}
    			break;
            case 'forgotten':
		    	if ($email == '') {
    				$rc = 8; // Fehlermeldung
                }
                break;              
            case 'register':
		    	if ($email == '' || $pass == '') {
    				$rc = 8; // Fehlermeldung
                }
                if ($pass != '' && strlen($pass) < 6) {
                  $rc = 7; // Fehlermeldung 
                }
                break;              
    		case 'change':
		    	if ($email == '' && $pass == '' && $pwneu == '') {
    				$rc = 4; // Keine Meldung 
    			} elseif ($email == '' || $pass == '' || $pwneu == '') {
    				$rc = 8; // Fehlermeldung
    			} elseif (md5($pass) == md5($pwneu)) {
    				$rc = 6; // Fehlermeldung
    			} elseif (strlen($pwneu) < 6) {
					$rc = 10;
    			}	    			
    			break;
    		case 'forgot':
		    	if ($email == '' && $email == '') {
    				$rc = 4; // Keine Meldung 
    			} elseif ($email == '' || $email == '') {
    				$rc = 8; // Fehlermeldung
    			}
    			break;
    	}

        // jetzt noch die Email auf Richtigkeit prüfen
        if ($rc == 0) {
          $rc = $this->check_email($email); // rc=9 --> Fehlermeldung
        }
        
		return $rc;      
    }	

    /**
     *  Pruefen, ob der eingegebene Username existiert auf der DB 
     *  @param: $email	- Username
     *  @return: $rc	- Return-Code (0=User existiert, 12=User existiert nicht)
    */
    private function check_username($email)
    {
    	if ($email != '') {
	    	global $db;
	    	$query = 'SELECT DISTINCT username FROM '.TABLE_PREFIX.'members WHERE username="'.$email.'"';
	    	if ($db->queryOne($query)) { $rc = 0; } else { $rc = 14; }
    	}
    	return $rc;
    }
    
    /**
     *  Pruefen, ob die Email-Adresse gültig ist 
     *  @param: $email	- Username
     *  @return: $rc	- Return-Code (9 = Ungültig)
    */
    private function check_email($email)
    {
      $rc = 0;
      if ($email != '' && 
        !preg_match('/^[\w.+-]{2,}\@[\w.-]{2,}\.[a-z]{2,6}$/', $email)) {
        $rc = 9;
      }
      return $rc;
    }
    
    /**
     * http://http://davidwalsh.name/php-email-encode-prevent-spam
     * This function takes a string input (the email address), loops through 
     * each character replacing the letter with the character's ASCII value, 
     * and returns the encoded email address. 
     * It's a simple way to prevent spammers from exploiting the information.
     * @param: $e - Email
     * @retrun: $output - the encoded Email-Address
     */
    public function encode_email($e)
    {
      for ($i = 0; $i < strlen($e); $i++) { $output .= '&#'.ord($e[$i]).';'; }
      return $output;
    }

    
    
} 


?>
