<?php
/**
 * ----------------------------------------------------------
 * (c) 2008  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Model-Klasse f�r den Redirect der Navigation 
 * Diese Klasse kommt nur zum Einsatz, wenn die globale Variable SMURL = true ist
 * --> Suchmaschinenfreundliche URL.
 * F�r die Anh�nge /news/news_10 etc. werden anhand der Tabelle cms_redirect die 
 * entsprechenden Get-Parameter navid, subid, pagid ermittelt und damit dann die Daten
 * aus den Tabellen gelesen
 * 
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2008-12-20
 */

class navigationRedirect
{
	private $mDb;
	private $mPrefix;	

    /* Constructor */
  function __construct($db) 
  {
		$this->mPrefix 	= TABLE_PREFIX;
		$this->mDb 		= $db;
        $this->mLang    = strtolower($_SESSION['language']);
  }                                                                          

    /* Neue Methoden implementieren */

    /* die URI überprüfen -> Vergleich mit Einträgen in der Tabelle cms_redirect
     * dabei muss unterschieden werden, ob SMURL aktiv ist oder nicht. Wenn nicht,
     * werden die $_GET-Parameter überprüft
     * @params: $_GET
     * @return: $rc (true oder false)
    */
    public function check_uri() 
    {
      global $naviget;
      $uri = $_SERVER['REQUEST_URI'];
      $qst = $_SERVER['QUERY_STRING'];
      $nav = str_replace(ROOTDIR,'',$uri);
      $this->fill_redirect_buffer();
      if (SMURL == 'ja') {
        if ($nav == '' || $nav == 'index.php') {
          $rc = 8;
        } else {
          $arr = explode('/',$nav);
          foreach($arr as $index => $value) {
            $rc = 8;
            if ($this->is_exception($value) || 
                $this->is_redirection($value) || 
                $this->is_sprachcode($value)) {
              $rc = 0;
            }
          }
        }
      } else {
        $navid = $subid = $pagid = $rc = 0;
        if (count($_GET) > 0) {
          $rc = 8;
          foreach($_GET as $name => $value) {
            switch($name) {
              case 'navid': 
                $navid = $value;
                break;
              case 'subid':
                $subid = $value;
                break;
              case 'pagid':
                $pagid = $value;
                break;
            }
          }
        }
        $params = $navid.'_'.$subid.'_'.$pagid;
        if (in_array($params,$GLOBALS['allredirections'])) { $rc = 0; }              
      }
      return $rc;
    }
    
	/* Prüfen eines URL-Ausschnittes gegenüber definierten Ausnahmen 
     * @params: $value = der URL-Ausschnitt
     * @return: true oder false 
	*/
    private function is_exception($value) 
    {
      $arr_exclude = array(0 => '',1 => 'index.php',2 => 'start', 3 => 'addon');
      if (preg_match('/start/',$value) || 
          in_array($value,$arr_exclude)) { 
        return true;         
      }         
      return false;
    }
    
	/* Prüfen eines URL-Ausschnittes gegenüber Einträgen in der cms_redirection 
     * @params: $value = der URL-Ausschnitt
     * @return: true oder false 
	*/
    private function is_redirection($value) 
    {
      if (in_array($value,$GLOBALS['allredirections'])) { return true; }
      return false;
    }

	/* Prüfen eines URL-Ausschnittes gegenüber definierten Sprachcodes 
     * @params: $value = der URL-Ausschnitt
     * @return: true oder false 
	*/
    private function is_sprachcode($value) 
    {
      global $cfg;
      if ($cfg->check_sprachcode($value)) { return true; }
      return false;
    }

	/* Prüfen der URL ob es sich um eine AddOn-Url handelt
     * @return: $addon_uri = gekürzte URL 
	*/
    private function is_addon($uri) 
    {
      if (stristr($uri,'addon')) 
      {
        // Addons sind im Frontend-Verzeichnis abgelegt
        $addon_uri = explode('/frontend',$uri);
        return $addon_uri[0];
      }
      return $uri;
    }

    
    /* saemtliche Einträge aus cms_redirect einlesen 
		@return: $GLOBALS['allredirections']
	*/
	public function fill_redirect_buffer()
	{
      global $db;
      $language = $this->mLang;
      $redir_array  = array();
      $allredir = $this->get_all_redirections();
      while ($eintrag = $allredir->fetchRow())
      { 
        if (SMURL == 'ja') {
          $redir_array[] = $eintrag['kuerzel_'.$language];          
        } else {
          $redir_array[] = $eintrag['navid'].'_'.$eintrag['subid'].'_'.
                           $eintrag['pagid'];
        }
      }
      $GLOBALS['allredirections'] = $redir_array;
    }

    /* alle Datensätze aus redirect lesen für Überprüfung der URL 
     * @return: $result - DB-Object
    */
    public function get_all_redirections() 
    {
      global $db;
      $query = 'SELECT * FROM '.$this->mPrefix.'redirect 
                  ORDER BY navid, subid, pagid';
      $result = $db->query($query);
      return $result;
    }
  
	/* Wenn die Website mittels index.php oder ohne index.php gestartet wird,
     * muss eventuell ein Redirect auf die 1. Navigationsseite gemacht werden
	*/
    public function redirect_to_first_navi() 
    {
      global $naviget;
      $url = $_SERVER['REQUEST_URI'];
      // Aufsplitten der URL abhängig von SMURL
      if (SMURL == 'nein') {
        $params = explode('?',$url);
        $anzahl = count($params);
        if ( $anzahl == 1) { // es gibt keine GET-Parameter
          $index = str_replace('index.php','',$params[0]);          
        } else {
          return;
        }       
      } else {
        $rc = $this->check_uri();
      }
      if ($rc != 0) {
        $url_new = $naviget->get_startseite();
        header('Location: ' . $url_new);
        exit;
      }        
    }
    
  
	/**
	 * 	navid, subid oder pagid anhand der GET-Parameter ermitteln
	 *	@param: $uri - URI
	 *	@return: $_GET[] - Array mit den ids 
	*/
	public function get_navid()
	{
        global $db, $cfg;
		$tab_prefix = $this->mPrefix;
        $language = $this->mLang;
		unset($_GET);
		$request_uri = $_SERVER['REQUEST_URI'];
        
        $request_uri = $this->is_addon($request_uri);
        $uri = $request_uri;

//        $rc = $this->check_uri();

//  aus $uri wird nur der String in ROOTDIR entfernt, weil nur die folgenden 
//	Parameter gültig sind.		
		if (defined('ROOTDIR') && stristr($uri,ROOTDIR)) {
			$uri = str_replace(ROOTDIR,"",$uri);			
		}

		if (substr($uri,0,1) == '/')
		{
			$uri = substr($uri,1);
		}

        if (strlen($uri) > 0)
		{
			$uri = explode('/',$uri);
			$k = 0;
			foreach ($uri as $i => $t)
			{
				if ($t != '' && $t != ROOTDIR && !preg_match('/index.php/',$t))
				{
                    // start=9 muss separat behandelt werden (Blaettern in Bildern)
					if (preg_match('/start/',$t)) {
						$start = explode('_', $t);
						$_GET['start'] = $start[1];
						continue;
					}
					
					// mail=sent oder mail=fail heisst, dass ein Kontaktmail verschickt wurde
					if (preg_match('/sent/',$t) || preg_match('/fail/',$t)) {
						$mail = explode('=', $t);
						$_GET['mail'] = $mail[1];
						continue;
					}
							
                    // Sprachcode
                    if ($cfg->check_sprachcode($t)) {
                      // Wenn ein Sprachcode in $cfg->check_sprachcode($t) identifiziert wurde, muss er aus dem
                      // Request_Uri herausgelöscht werden
                      array_pop($uri); 
                      $_SERVER['REQUEST_URI'] = implode('/',$uri);
                      $_GET['langu'] = strtolower($t);
                      unset($_SESSION['language']);
                      $_SESSION['language'] = strtolower($t);
                      continue;
                    }
                      
					// .html wegschnippseln, falls ueberhaupt vorhanden...
					$t = preg_replace('/.html/','',$t);
					switch ($k)
					{
	  					case 0:
	   						$schluessel = 'navtxt';
	    					break;
	    				case 1:
	   						$schluessel = 'subtxt';
	    					break;
	    				case 2:
	   						$schluessel = 'pagtxt';
	    					break;
					}					
					$k++;
					$_GET[$schluessel] = $t;
				}
			}
		}
		
		if ($_GET['navtxt'] != '') {
			$abfrage = 'SELECT distinct r.navid FROM '.$tab_prefix.'redirect as r inner join '.$tab_prefix.'navigation';
            $abfrage .= ' as n on r.navid=n.nav_id where r.kuerzel_'.$language.'="'.$_GET['navtxt'].'"';
            $abfrage .= ' and r.subid=0 and r.pagid=0 and n.aktiv="j"';
			$navid = $db->queryOne($abfrage);						
//			echo '<br>$navid='.$navid;
		}
			
//		echo "<br>subtxt=".$_GET['subtxt'];
		if ($_GET['subtxt'] != '' && (int)$navid > 0) {
			$abfrage = 'SELECT subid FROM ' .$tab_prefix. 'redirect where kuerzel_'.$language.'="'.$_GET['subtxt'].'"';
            $abfrage .= ' and navid='.$navid.' and subid > 0 and pagid=0';
			$sid = $db->queryOne($abfrage);			
			// wenn subid nicht gefunden wird, muss auch noch pagid gesucht werden, da eine Unterseite auch zu einem
			// Hauptnavigationspunkt erstellt werden kann.
			$subid = $sid > 0 ? $sid : 0;
			if ($subid == 0 && $_GET['pagtxt'] == '') { 
              $_GET['pagtxt'] = $_GET['subtxt']; 
              $_GET['subtxt'] = ''; // Es gibt hier keinen Subtxt, da Subid = 0
              } 
		}

        // Suche der Pagid für eine Unterseite zu einem Haupt-Navigationspunkt
		if ($_GET['pagtxt'] != '' && (int)$navid > 0 && (int)$subid == 0) {
			$abfrage = 'SELECT pagid FROM ' .$tab_prefix. 'redirect where kuerzel_'.$language.'="'.$_GET['pagtxt'].'"';
            $abfrage .= ' and navid='.$navid.' and subid='.$subid.' and pagid >0';
			$pagid = $db->queryOne($abfrage);						
		}
                
        // Suche der Pagid für eine Unterseite zu einem Unter-Navigationspunkt
		if ($_GET['pagtxt'] != '' && (int)$navid > 0 && (int)$subid > 0) {
			$abfrage = 'SELECT pagid FROM ' .$tab_prefix. 'redirect where kuerzel_'.$language.'="'.$_GET['pagtxt'].'"';
            $abfrage .= ' and navid='.$navid.' and subid='.$subid.' and pagid >0';
			$pagid = $db->queryOne($abfrage);						
		}
		
		if ((int)$navid > 0) $_GET['navid'] = $navid;
		if ((int)$subid > 0) $_GET['subid'] = $subid;		
		if ((int)$pagid > 0) $_GET['pagid'] = $pagid;
		if ((int)$pagid > 0) 
		return $_GET;
	}	

	/**
	 * 	Kuerzel anhand des GET-Parameters navid ermitteln
	 *	@param: $navid
	 *	@return: $kuerzel - Text zur navid
	*/
	public function get_kuerzel_navid($navid)
	{
		global $db;
        $language = $this->mLang;
		$tab_prefix = $this->mPrefix;

		$abfrage = 'SELECT kuerzel_'.$language.' FROM ' .$tab_prefix.'redirect 
					WHERE navid='.$navid. ' and subid=0 and pagid=0'; 
		$kuerzel = $db->queryOne($abfrage);
		return $kuerzel;
	}


	/**
	 * 	Kuerzel anhand des GET-Parameters subid ermitteln
	 *	@param: $navid, $subid
	 * 	@return: $kuerzel - Text zur subid
	*/
	public function get_kuerzel_subid($navid, $subid)
	{
		global $db;
        $language = $this->mLang;
		$tab_prefix = $this->mPrefix;

		$abfrage = 'SELECT kuerzel_'.$language.' FROM ' .$tab_prefix.'redirect 
					WHERE navid='.$navid. ' and subid='.$subid.' and pagid=0'; 
		$kuerzel = $db->queryOne($abfrage);
		return $kuerzel;
	}
	
	/**
	 * 	Kuerzel anhand des GET-Parameters navid, subid, pagid ermitteln
	 *	@param: $navid, $subid, $pagid
	 *	@return: $kuerzel - Text zur pagid
	*/
	public function get_kuerzel_pagid($navid, $subid, $pagid)
	{
		global $db, $general;
		$tab_prefix = $this->mPrefix;
        $language = $this->mLang;

		$abfrage = 'SELECT kuerzel_'.$language.' FROM ' .$tab_prefix.'redirect 
					WHERE navid='.$navid. ' and subid='.$subid.' and pagid='.$pagid; 
		$kuerzel = $db->queryOne($abfrage);
		return $kuerzel;
	}
	
	/**
	 * 	Link erstellen anhand GET-Parameters navid, subid, pagid 
	 *	@param: $pagid, $subid, $navid
	 *	@return: $link
	*/
	public function set_link($pagid=0)
	{
		$link = '';
		$navid = (int)$_GET['navid'];
		$subid = (int)$_GET['subid'];
		$pagid = (int)$pagid;
        // Link zusammenbauen, abhängig davon, ob SMURL aktiviert ist
        $link = $this->set_navlink($navid,$subid,$pagid);
        // jetzt noch eine ev. vorhandene Startnr für Listitems anfügen
        $link .= $this->add_start_to_url( );
		return $link;
	}
	
	/**
	 * 	Links fuer die Navigation erstellen anhand GET-Parameters $navid, $subid 
	 *	--> pagid spielt hier nur fuer die cross_pages_links eine Rolle,
	 *	--> in der Navigation sind keine pagid's integriert, 
	 *	@param: $navid, $subid, $pagid
	 *	@return: $navlink
	*/
	public function set_navlink($navid, $subid=0, $pagid=0)
	{
		$db = $this->mDb;
		$tab_prefix = $this->mPrefix;
		$navlink = '';
		if (SMURL == 'ja') {
			$navtxt = $navid !=0 ? $this->get_kuerzel_navid($navid) : '';
			$subtxt = ($navid !=0 && $subid !=0) ? $this->get_kuerzel_subid($navid, $subid) : '';
			$pagtxt = $pagid > 0 ? $this->get_kuerzel_pagid($navid, $subid, $pagid) : '';
			$navlink = $navtxt !='' ? $_SERVER['PHP_SELF'].'/'.$navtxt : $_SERVER['PHP_SELF'];
			$navlink .= $subtxt !='' ? '/'.$subtxt : '';
			$navlink .= $pagtxt !='' ? '/'.$pagtxt : '';
			//$navlink .= '.html';
			$navlink = preg_replace('/index.php\//','',$navlink);
		} else {			
			$navlink = $navid !=0 ? $_SERVER['PHP_SELF'].'?navid='.$navid : $_SERVER['PHP_SELF'];
			$navlink .= $subid !=0 ? '&subid='.$subid : '';
			$navlink .= $pagid !=0 ? '&pagid='.$pagid : '';
		}
		return $navlink;
	}
	
	/**
	 * 	Parameter start abhaengig von SMURL formatieren 
	 *	@param: $nr - Seiten- oder Bildnummer
	 *	@return: $start - formatierter Parameter
	*/ 
	public function set_start($nr) 
    {
		if (SMURL == 'ja') {
			$start = 'start_'.$nr;
		} else {
			$start = 'start='.$nr;
		}
		return $start;		
	}	

	/**
	 * 	Parameter start an einen Link anfuegen
     *  das Cookie CrossLink wird beim Klick auf einen Listitem-Pfeil gesetzt 
     *  und kann  daher hier ausgewertet werden.
     *  $_SERVER['HTTP_REFERER'] könnte allenfalls auch ausgewertet werden.
	 *	@return: $start - formatierter Parameter
	*/ 
	private function add_start_to_url() 
    {
        $referer = $_SERVER['HTTP_REFERER'];
        $cookie  = $_SERVER['HTTP_COOKIE']; 
        $cvalue  = $_SERVER['HTTP_COOKIE']['CrossLink']; 
        $separator = SMURL == 'ja' ? '/' : '&';

        if (is_array($cookie) && isset($cookie['CrossLink'])) {
          $params = SMURL == 'ja' ? explode('/',$cookie['CrossLink']) : explode('&',$cookie['CrossLink']);
        } else {
          $params = SMURL == 'ja' ? explode('/',$referer) : explode('&',$referer);
        }           
         if (is_array($params)) {
          foreach($params as $key => $value) {
            if (preg_match('/start/',$value)) {
                $start .= $separator.$value;                 
            }
          }
        }
        
		return $start;		
	}	
    
}

