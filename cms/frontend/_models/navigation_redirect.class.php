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
		$this->mDb 			= $db;
  }                                                                          

    /* Neue Methoden implementieren */
    
	/**
	 * 	navid, subid oder pagid anhand der GET-Parameter ermitteln
	 *	@param: $uri - URI
	 *	@return: $_GET[] - Array mit den ids 
	*/
	public function get_navid()
	{
		$db = $this->mDb;
		$tab_prefix = $this->mPrefix;
		unset($_GET);
		$uri = $_SERVER['REQUEST_URI'];
//		echo '<br>'.__FILE__;	
//		echo '<br>'.$uri;	
//		echo '<br>Rootdir='.ROOTDIR;

//  aus $uri wird nur der String in ROOTDIR entfernt, weil nur die folgenden 
//	Parameter gültig sind.		
		if (defined('ROOTDIR') && stristr($uri,ROOTDIR)) {
			$uri = str_replace(ROOTDIR,"",$uri);			
		}

		if (substr($uri,0,1) == '/')
		{
			$uri = substr($uri,1);
		}
//		echo '<br>$uri='.$uri;	
		if (strlen($uri) > 0)
		{
			$uri = explode('/',$uri);
			$k = 0;
			foreach ($uri as $i => $t)
			{
				if ($t != '' && $t != ROOTDIR && !preg_match('/index.php/',$t))
				{
//					echo '<br>$uri['.$i.']='.$t;
					// start=9 muss separat behandelt werden (Bl�ttern in Bildern)
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
		
//		echo "<br>navtxt=".$_GET['navtxt'];
		if ($_GET['navtxt'] != '') {
			$abfrage = 'SELECT distinct r.navid FROM '.$tab_prefix.'redirect as r inner join '.$tab_prefix.'navigation as n on r.navid=n.nav_id where r.kuerzel="'.$_GET['navtxt'].'" and r.subid=0 and r.pagid=0 and n.aktiv="j"';
			$navid = $db->queryOne($abfrage);						
//			echo '<br>$navid='.$navid;
		}
			
//		echo "<br>subtxt=".$_GET['subtxt'];
		if ($_GET['subtxt'] != '' && (int)$navid > 0) {
			$abfrage = 'SELECT subid FROM ' .$tab_prefix. 'redirect where kuerzel="'.$_GET['subtxt'].'" and navid='.$navid.' and subid > 0 and pagid=0';
			$sid = $db->queryOne($abfrage);			
			// wenn subid nicht gefunden wird, muss auch noch pagid gesucht werden, da eine Unterseite auch zu einem
			// hauptnavigationspunkt erstellt werden kann.
			$subid = $sid > 0 ? $sid : 0;
			if ($subid == 0 && $_GET['pagtxt'] == '') { $_GET['pagtxt'] = $_GET['subtxt']; } 
		}

		if ($_GET['pagtxt'] != '' && (int)$navid > 0 && (int)$subid > 0) {
			$abfrage = 'SELECT pagid FROM ' .$tab_prefix. 'redirect where kuerzel="'.$_GET['pagtxt'].'" and navid='.$navid.' and subid='.$subid.' and pagid >0';
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
		$db = $this->mDb;
		$tab_prefix = $this->mPrefix;

		$abfrage = 'SELECT kuerzel FROM ' .$tab_prefix.'redirect 
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
		$db = $this->mDb;
		$tab_prefix = $this->mPrefix;

		$abfrage = 'SELECT kuerzel FROM ' .$tab_prefix.'redirect 
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

		$abfrage = 'SELECT kuerzel FROM ' .$tab_prefix.'redirect 
					WHERE navid='.$navid. ' and subid='.$subid.' and pagid='.$pagid; 
		$kuerzel = $db->queryOne($abfrage);
		return $kuerzel;
	}
	
	/**
	 * 	Link erstellen anhand GET-Parameters navid, subid, pagid 
	 *	@param: $_GET $pagid
	 *	@return: $link
	*/
	public function set_link($pagid=0)
	{
		$db = $this->mDb;
		$tab_prefix = $this->mPrefix;
		$link = '';
		$navid = (int)$_GET['navid'];
		$subid = (int)$_GET['subid'];
		$pagid = (int)$pagid;
		if (SMURL == 'ja') {
			$params = '/'.$_GET['navtxt'];
			$params .= $_GET['subid']!='' ? '/'.$_GET['subtxt'] : '';
			if ($pagid > 0) { $params .= '/'.$this->get_kuerzel_pagid($navid, $subid, $pagid); }			
//			$params .= '.html';
			$link = $_SERVER['PHP_SELF'].$params;
			$link = preg_replace('/index.php\//','',$link);
		} else {
			$params = '?navid='.$navid;
			$params .= $subid !='' ? '&subid='.$subid : '';
			if ($pagid > 0) { $params .= '&pagid='.$pagid; }
			$link = $_SERVER['PHP_SELF'].$params;
		}
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
	 * 	Parameter start abh�ngig von SMURL formatieren 
	 *	@param: $nr - Seiten- oder Bildnummer
	 *	@return: $start - formatierter Parameter
	*/ 
	public function set_start($nr) {
		if (SMURL == 'ja') {
			$start = 'start_'.$nr;
		} else {
			$start = 'start='.$nr;
		}
		return $start;		
	}	
	
}

