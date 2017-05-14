<?php
/**
* ----------------------------------------------------------
* (c) 2007  Roland Hempen
*           www.hempenweb.ch
* ----------------------------------------------------------
*
* Klasse fuer den Aufruf allgemein verfuegbarer Methoden
*
* @author      Roland Hempen
* @copyright   Frei einsetz- und veraenderbar, wenn der Autor erwuehnt wird
* @version     1.0 | 2007-09-27
*/

class frontendPresent
{
  private $mTpl;

  function __construct($tpl) 
  {
      $this->mTpl = $tpl;
  }                                                                          

  /* Neue Methode implementieren */

  /**
   * 	Header-Informationen ausgeben 
   * 	@param: $template
  */
  public function write_header($template,$controller) {
      $html .= '<!--' ."\n";
      $html .= '*******************************************************************************************************************************************'."\n";
      $html .= 'Copyright : by hempenweb.ch' . "\n";
      $html .= 'Template  : '. $template. "\n";
      $html .= 'Controller: '. $controller. "\n";
      $html .= 'Datum     : '. date("D M j G:i:s T Y") . "\n";
      $html .= 'Aufrufer  : '. $_SERVER['REMOTE_ADDR'] . '-' . $_SERVER['SCRIPT_NAME'] . "\n";
      $html .= 'Browser   : '. $_SERVER['HTTP_USER_AGENT'] . "\n";	
      $html .= '*******************************************************************************************************************************************'."\n";
      $html .= '-->' ."\n";
      return $html;
  }

  /** 
   * 	Zusammensetzen des > weiter - Links im Frontend : Der Linktext kann auch 'mehr' heissen
   *	der html-Code wird 1. ausgegeben und 2. wird der link zurueckgeliefert
   *	@param: $_REQUEST - kap und ukap
   * 	@param: $page_id -> ID der anzuzeigenden Seite
   *	@return: $weiter_link - Link, der mit den Bildern verknuepft werden kann
  */
  public function create_weiter_link($page_id=0)
  {
      global $tpl, $redirect;
      $weiter_link = $redirect->set_link($page_id);
      $href = '<a href="'.$weiter_link.'" onclick="javascript:setLinkCookie(location.href);">'.$GLOBALS['LINKS']['WEITER'].'</a>';
      $tpl->setVariable('link_weiter', '<p>'.$href.'</p>');
      return $weiter_link;		
  }

  /**
   * 	Zusammensetzen des > Uebersicht - Links im Frontend -> Der Linktext kann auch 'zurueck' heissen
   *	@param: $_REQUEST - kap und ukap
  */
  public function create_uebersicht_link()
  {
//		echo '$_COOKIE[\'CrossLink\']: '. $_COOKIE['CrossLink'] ."<br />";
//		echo '$_REQUEST[\'original_url\']: '. $_REQUEST['original_url'] ."<br />";
//		echo '$_SERVER[\'HTTP_REFERER\']: '. $_SERVER['HTTP_REFERER'];

      global $tpl, $redirect;
      $uebersicht_link = $redirect->set_link();
      $href = '<a href="'.$uebersicht_link.'" onclick="javascript:delLinkCookie(this.value);">'.$GLOBALS['LINKS']['UEBERSICHT'].'</a>';
      $tpl->setVariable('link_uebersicht', '<p>'.$href.'</p>');
  }

  /**
   * 	Zusammensetzen des Titels aus der Bezeichnung fuer kap / ukap der Navigation 
   * 	@params: $kurztitel 
   *  @params: $template - Nummer des Template, um festzustellen, ob ein eigener
   *                       Titelblock existiert 
  */
  public function create_titel($kurztitel,$tplname='',$tplnr=0)
  {
      global $tpl, $general, $frontget;
      global $nav_array, $unav_array;
      $kap_text  = $_GET['navid'];
      $ukap_text = $_GET['subid'];

      // die Bezeichnung des Kap kann aus dem Array nav_array aus nav.php geholt werden
      if ($kap_text!='' && is_array($nav_array)) {
          foreach ($nav_array as $menu => $value) {
              list($kap, $label) = explode('|',$value);
              if ($kap_text == $menu) {
                  $kap_text = $label;
                  break;
              }
          }
      }
      // titel = Bezeichnung Kap
      $titel = $kap_text;

      // die Bezeichnung des Ukap kann aus dem Array unav_array aus nav.php geholt werden
      if ($ukap_text!='' && is_array($unav_array)) {
          foreach ($unav_array as $submenu => $value) {
              list($kap, $ukap, $label) = explode('|',$value);
              if ($ukap_text == $submenu) {
                  $ukap_text = $label;
                  break;
              }
          }
      }
      // Titel = Bezeichnungen von Kap und Ukap
      $titel .= $ukap_text !='' ? ' &#150; '.$ukap_text : '';
      // das Label des Kap's lassen wir da jetzt mal weg - Da muss ich noch einen
      // Weg finden, wie ich die Titel in der Konfiguration steuern kann
      // 
      // Titel = Bezeichnungen von Kap und Ukap
      $titel = $ukap_text !='' ? $ukap_text : $kap_text;
      // Falls der Titel ausserhalb des Inhalt-Blockes angezeigt wird
      // wird hier ein separater Seitentitel-Block angzeigt und gleich nach
      // der Anzeige des Titel geparst.
      $rc = $general->analyse_template($tplname,$tplnr,'/seitentitel/');
      if ($rc) { $tpl->setCurrentBlock('seitentitel'); }
      // hier müsste ein Flag abgefragt werden können, ob der Titel angezeigt werden soll
      $tpl->setVariable('kap_ukap', '<h1 class="h1mod">'.$titel.'</h1>');
      if ($rc) { 
        $tpl->parseCurrentBlock(); 
        $tpl->setCurrentBlock('inhalt');          
      }
      return $titel;        
  }

  /**
   * 	Zusammensetzen des img-Tag der in einen href-Tag eingebettet ist 
   *	@param:  	$bild - Bild, fuer das ein img-Tag erstellt werden soll
   *	@param:		$link - Link, in den das img-Tag eingebaut wird
   *	@return:	$href - html-Code 
  */
  public function create_href_img_tag($bild, $link)
  {
      global $thumbsize, $type;
      $href 	 = '';
      $thnail  = $this->resize_thumbnail($bild, $thumbsize, $type);
      $picture = $this->convert_rel2abs_path($thnail);
      $imagtag = '<img class="img_small" src="'.$picture.'" border="0" />';
      $href	 = '<a href="'.$link.'">'.$imagtag.'</a>';
      return $href;
  }

  /**
   *  Zusammensetzen des img-Tag fuer ein Thumbnail der in einen href-Tag eingebettet ist 
   *	@param:	 $bild - Bild, fuer das ein img-Tag erstellt werden soll
   *	@return: $href - html-Code 
  */
  public function create_href_thumbnail_tag($bild, $thumbsize=0, $type='Q')
  {
      $href = '';
      if ($thumbsize==0 || $type=='Q') return href;
      $thumb 	= str_replace('_images/', '_thumbs/th_', $bild['bildpfad']);
      $thnail = $this->resize_thumbnail($thumb, $thumbsize, $type);
      $image 	= $this->convert_rel2abs_path($thnail);
      $imgtag = '<img class="img_small" src="'.$image.'" border="0" />';
      $pict	= $this->convert_rel2abs_path($bild['bildpfad']);
      // wenn kein Kommentar gepflegt wurde, muss ein space ' ' uebergeben werden, sonst wird beim Bluettern
      // in Ligthbox der Kommentar des Folgebildes angezeigt
      $kommentar = ($bild['kommentar'] == null || $bild['kommentar'] == '') ? '' : $bild['kommentar'];
      $href = '<a href="'.$pict.'" rel="lightbox['.$_GET['page_id'].']" title="'.$kommentar.'">'.$imgtag.'</a>';
      return $href;
  }

  /**
   * 	den relativen Dateipfad in den absoluten Pfad convertieren 
   *	@param: $file -> Datei mit relativem Pfad
   *	@return: $file -> Datei mit absolutem Pfad
  */
  private function convert_rel2abs_path($ifile) 
  {
      $cfile = str_replace('../../', './', $ifile);
      $cfile = str_replace('./', HOST, $cfile);
      return $cfile;
  }

  /**
   *	Textelemente einer Seite anzeigen
   *	@param  $row - Textelemente einer Seite
   *	@param	$tpl - ITX-Objekt 
  */
  public function display_texte($row, $type='')
  {
      global $tpl, $frontget, $general, $language;
      if ($row['name_'.$language] != '') {
        $tpl->setVariable('name', '<h2>'.$row['name_'.$language].'</h2>');
      }
      // wenn $type = detail, dann sollen einzelne Textelemente nicht angezeigt werden
      if ($type == '') {
          $von_bis = '';
          $von = $this->check_datum($row['datum_von']);
          $bis = $this->check_datum($row['datum_bis']);
          // von - bis formatieren
          if ($von != null && $bis != null) {
              $von_bis = $general->date_mysql2german($row['datum_von']) . ' &#8211; ' . 
                                   $general->date_mysql2german($row['datum_bis']) . "\n";
          } elseif ($von != null && $bis == null) {
                  $von_bis = $GLOBALS['general']->date_mysql2german($row['datum_von']);
          }
          $tpl->setVariable('von_bis', '<p>'.$von_bis.'</p>');
          if ($row['zusatz_'.$language] != '') { $tpl->setVariable('zusatztext', '<p>'.$row['zusatz_'.$language].'</p>'); }
          if ($row['kurztext_'.$language] != '') { $tpl->setVariable('kurztext', '<p>'.$row['kurztext_'.$language].'</p>'); }
      } else {
          if ($row['inhalt1_'.$language] != '') { 
              // fragmente ermitteln und im Langtext ersetzen
              $newtext = $this->replenish_text_with_fragments($row['inhalt1_'.$language]);
              $linkliste = $frontget->create_unterseiten_link_liste($row);
              $row['inhalt1_'.$language] = $newtext.$linkliste;
              $tpl->setVariable('inhalt1', $row['inhalt1_'.$language]); 
          }

          // Fuer ev. vorhandene Verlinkung muss kap und ukap fuer die zu verlinkende Seite gelesen werden
          if ($row['linkid1'] > 0) { 
              $link = $frontget->create_cross_pages_link($row['linkid1'],'1');
              $tpl->setVariable('link1', $link);
          }
          if ($row['linkid2'] > 0) { 
              $link = $frontget->create_cross_pages_link($row['linkid2'],'2');
              $tpl->setVariable('link2', $link);
          }
      }
  }

  /**
   *	Text des Elementes "inhalt2" einer Seite anzeigen
   *	Diese Funktion wertet Felder von der Tabelle cms_seiten als auch cms_pages aus. 
   *	Das bedeutet, dass die Felder in beiden Tabellen identisch sein m�ssen!
   *	@param  $row - Textelemente einer Seite
  */
  public function display_inhalt2($row)
  {
      global $tpl, $frontget, $general, $seiten_infos, $language, $type;
      if ($type == 'N') { // NavigationsSeite
        $tplname = $seiten_infos['template_name'];
        $rc = $general->analyse_template($tplname,0,'/{inhalt2}/');
      } else { // Unterseite
        $tplnumr = $row['template'];
        $rc = $general->analyse_template('',$tplnumr,'/{inhalt2}/');          
      }
      if ($rc) {
          $tpl->setCurrentBlock('inhalt2');
          $newtext = $this->replenish_text_with_fragments($row['inhalt2_'.$language]);
          $linkliste = $frontget->create_unterseiten_link_liste($row);
          $row['inhalt2_'.$language] = $newtext.$linkliste;
          $tpl->setVariable('inhalt2', $row['inhalt2_'.$language]);
          $tpl->parseCurrentBlock();
      }
  }

  /**
   * 	Datum pruefen, ob ueberhaupt eines gesetzt wurde 
   * 	@param: $datum - zu pr�fenden Datum 
  */
  private function check_datum($datum) {
      if ($datum == null || $datum == '') {
          $datum = null;
      } else {
          list($year,$month,$day) = explode('-',$datum);
          $tag = substr($day,0,2);
          if (!checkdate($month,$tag,$year)) { $datum = null; }
      }			
      return $datum;		
  }

  /**
   *  Navigation fuer eine Nav_id lesen 
   *	@param: $nav_id - NavigationsId  
  */
  public function read_navi($nav_id) {
      global $naviga;
      return $naviga->read_navi_page($nav_id);
  }

  /**	
   * 	Anzeige der Bilder einer Seite 
   * 	@param: $row - Datensatz der anzuzeigenden Seite
   *	@param: $type - Navigationsseite oder Unterseite
  */
  public function display_bilder($row,$type) 
  {		
      global $tpl, $pictdb, $frontget; 
      $thumbsize = $frontget->read_thumbsize_by_tplid($row['template']);
      $id = $type == 'P' ? $row['page_id'] : $row['nav_id'];
      if ($row['bild1'] != '' && !preg_match('/blank/',$row['bild1']))  {
          $tpl->setCurrentBlock('bilder'); 
          // das zugeordnete Bild anzeigen
          if ($row['galerie'] == 'n' || $row['galerie'] == 'a') { // n=Kein Link, a=GalerieLink
              $this->display_bild($id, $row['bild1'], $thumbsize, $type);
          }
          // Bildergalerie vorbereiten
          $this->create_bilderanzeige($id, $row['galerie'], $row['bild1'], $type, $thumbsize);
          $tpl->parseCurrentBlock(); // Block parsen
      }
  }


  /**	
   * 	Anzeige eines Bildes - wenn das Bild ein blank.gif ist, wird kein Bild angezeigt 
   * 	@param: $Id der Seite
   * 	@param: $bild - das zugeordnete Bild
   *	@param: $type - Navigationsseite oder Unterseite
  */
  public function display_bild($id, $bild, $thumbsize, $type) 
  {
      global $tpl, $pictdb;
      $thumb		= $bild;
      $thumb		= $this->resize_thumbnail($bild, $thumbsize, $type);
      $image  	= str_replace('_thumbs/th_','_images/',$bild);	

      // zuerst muss geschaut werden, ob fuer das Bild auch ein Kommentar erfasst wurde
      $kommentar 	= $pictdb->bild_kommentar_in_db_lesen($id, $type, $image);

      // Html fuer die Bildausgabe 
      if (!preg_match('/blank.gif/',$bild) && $bild != null) {
          $bild 	= $this->convert_rel2abs_path($thumb);
          $image 	= str_replace('_thumbs/th_', '_images/', $bild);
          $html	= '<img src="'.$bild.'"  border="0" title="'.$kommentar.'" alt="'.$kommentar.'" />';
          $tpl->setVariable('bild1', $html);
      } else {
          $tpl->setVariable('bild1', HIDDEN);			
      }
  }

  /**
   * 	Resizen der Thumbnail-Datei abhaengig vom Template
   * 	@param:	$bild - aktuelles Bild
   *  @param:	$thumbsize - Gr�sse des Thumbnails
   *  @param:	$type  
  */ 
  private function resize_thumbnail($bild, $thumbsize=0, $type) 
  {	
      // wenn $thumbsize leer, nix wie raus!
      if ($thumbsize == 0) return $bild;

      global $picture;
//		$max_breite = $type == 'N' ? THUMB_NAVI_MAX_WIDTH : THUMB_PAGE_MAX_WIDTH;
//		$max_hoehe	= $type == 'N' ? THUMB_NAVI_MAX_HEIGHT : THUMB_PAGE_MAX_HEIGHT;

      // Bilddimensionen ermitteln
      $image		= str_replace('../../', './', $bild);
      if (is_file($image)) {
          $imagesize	= getimagesize($image);
          $img_breite = $imagesize[0];
          $img_hoehe	= $imagesize[1];
          if ($imagesize == false || $imagesize == null) return $this->convert_rel2abs_path($bild);
      } else { return false; }

      // Breite und Hoehe aus der Template-Tabelle
      list($th_breite, $th_hoehe) = explode('x', $thumbsize);

      // Masse des Bildes < Masse Template-Masse?
      if ($img_breite <= $th_breite && $img_hoehe <= $th_hoehe) return $this->convert_rel2abs_path($bild);

      // Dateiendung
      $arr = explode('/', $bild);
      $bilddatei = array_pop($arr);		
      list($datei, $endung) = explode('.', $bilddatei);

      // neu zu schaffende Bilddatei
      $bildneu  = str_replace('.'.$endung,'', $image) . '_'.$th_breite.'_'.$th_hoehe.'.'.$endung;
      // Resize nur durchfuehren, wenn die Datei nicht schon existiert!!
      if (!file_exists($bildneu)) {
          $picture->resize_picture($image, $bildneu, $th_breite, $th_hoehe);		
      }

      // absoluter Pfad 
      $bild = $this->convert_rel2abs_path($bildneu);
      return $bild;
  }



  /**
   *  falls das Flag "aktiv" gesetzt ist, werden weitere Bilder versteckt als Galerie (Lightbox) zur Verfuegung gestellt
   *	@param: $Seiten_infos - Array mit Seiteninformationen der Navigation
   *	@param: $id
   *	@param: $galerie - SQL-Array mit den auszugebenden Bildern
   *	@param:	$bild - das sichtbare Bild
   *	@param: $type - Art des Links f�r die Galerie
   *	@param:	$thumbsize - Gr�sse der Thumbnails
   * 	n = es wird kein Link angeboten
   *	a = Es wird der Link ">Galerie" angeboten
   * 	b = Es wird eine Bilderleiste mit Links angeboten
   *  c = automatischer Bildwechsel
  */
  public function create_bilderanzeige($id, $galerie, $bild, $type, $thumbsize) 
  {
      global $tpl;
      if ($galerie == 'a' && $id > 0) {
          // erzeuge Bildergalerie
          $this->erzeuge_bildergalerie($id, $type, $bild, $thumbsize);
      } elseif ($galerie == 'b' && !preg_match('/blank.gif/', $bild)) {
          // erzeuge Bildleiste
          $this->erzeuge_bilderleiste($id, $type, $bild, $thumbsize);
      } elseif ($galerie == 'c') {
          $this->erzeuge_auto_bildwechsel($id, $type, $bild, $thumbsize);
      } else {
      }
  }


  /**
   *  Bildergalerie zu einer nav_id erzeugen
   *	@param: $nav_id - id der Seite zu der die Galerie gehoert
   *	@param: $type - Seitentype N oder P um Bilder aus cms_galerien auszulesen
   *	@param: $bild - Bild, welches angezeigt wird
   *	@param: $thumbsize - Gr�sse der Thumbnails aus cms_templates
  */
  public function erzeuge_bildergalerie($id, $type, $bild, $thumbsize) 
  {	
      global $frontget, $tpl, $db, $language;
      $tpl->setVariable('leiste',HIDDEN);

      // Erst mal in der Tabelle cms_galerien sehen, ob es Bilder hat.
      $bilder = $frontget->read_galerie_pro_nav_id($id, $type);
      //var_dump($db->queryOne('SELECT FOUND_ROWS()'));
      // wenn Bilder da sind, das HTML fuer Galerie zusammenstellen
      $galerie = '';
      $i = 0;
      while ($row = $bilder->fetchRow(MDB2_FETCHMODE_ASSOC)) {
          $i++;
          $bild = $this->convert_rel2abs_path($row['bildpfad']);
          if ($i == 1) { 
              $bild1_link = $bild; 
              $bild1_kommentar = ($row['kommentar_'.$language] != '' || $row['kommentar_'.$language] != null) ? $row['kommentar_'.$language] : ' '; 
          }

          // Resize the thumbnail
          //$bild = $this->resize_thumbnail($bild, $thumbsize, $type);			
          if ($bild != '') { 
              //var_dump($bild);
              // wenn kein Kommentar gepflegt wurde, muss ein space ' ' uebergeben werden, sonst wird beim Blaettern
              // in Ligthbox der Kommentar des Folgebildes angezeigt
              $kommentar = ($row['kommentar_'.$language] != '' || $row['kommentar_'.$language] != null) ? $row['kommentar_'.$language] : ''; 
              // $bild = $this->convert_rel2abs_path($bild);
              $galerie .= '<a href="' .$bild. '" rel="lightbox[roundtrip]" title="' .$kommentar. '">';
              $galerie .= '<img src="' .$bild. '" border="0" alt="' .$bild. '" /></a>'."\n";		
          }
      }
      // den Link fuer die Galerie zusammenstellen und ausgeben
      if ($i > 0) {
//			$tpl->setCurrentBlock('bildergalerie');
          $link = '<p><a href="'.$bild1_link.'" title="'.$bild1_kommentar.' " rel="lightbox[roundtrip]">'.$GLOBALS['LINKS']['GALERIE'].'</a></p>'."\n";
          $tpl->setVariable('galerie', $galerie);	
          $tpl->setVariable('link_galerie', $link);   // Galerielink inkl. umschliessendes Div
//			$tpl->parseCurrentBlock();
      }		
      // Speicher wieder freigeben
      $bilder->free();
  } 


  /**
   *  Bildergalerie zu einer nav_id erzeugen
   *	@param: $nav_id - id der Seite zu der die Galerie gehoert
   *	@param: $type - Seitentype N oder P um Bilder aus cms_galerien auszulesen
   *	@param: $bild - Bild, welches angezeigt wird
   *	@param: $thumbsize - Gr�sse der Thumbnails aus cms_templates
  */
  public function erzeuge_bilderleiste($id, $type, $bild, $thumbsize) 
  {	
      global $frontget, $tpl, $db, $language;
      $tpl->setVariable('galink',HIDDEN);
      $tpl->setVariable('img_fix','img_fix');

      // Erst mal in der Tabelle art_galerien sehen, ob es Bilder hat.
      $bilder = $frontget->read_galerie_pro_nav_id($id, $type);
      //echo $db->queryOne('SELECT FOUND_ROWS()');	
      $i = 0;
      while ($row = $bilder->fetchRow(MDB2_FETCHMODE_ASSOC)) {
          $hide = 'display:none;';
          $aktiv_passiv = 'rect_passiv';

          // HTML fuer Bilder erstellen
          $image = $this->convert_rel2abs_path($row['bildpfad']);
          $thumb = str_replace('_images/', '_thumbs/th_', $row['bildpfad']);
          // das ausgewuehlte Bild soll als Erstes aktiv angezeigt werden
          if ($bild == $thumb) {
              $hide = 'display:inline;';
              $aktiv_passiv = 'rect_aktiv';			
          }
          $thumb = $this->resize_thumbnail($thumb, $thumbsize, $type);
          if ($thumb) {
              $kommentar = ($row['kommentar_'.$language] != '' && $row['kommentar_'.$language] != null) ? $row['kommentar_'.$language] : ''; 
              $bild_html .= '<img id="pict_'.$i.'" class="img_small" style="'.$hide.'" src="'.$thumb.'" border="0" title="'.$kommentar.'" />'."\n";	
              // HTML fuer Bildleiste aufbauen	
              $bildleiste .= '<a id="rect_'.$i.'" class="bildleiste '.$aktiv_passiv.'" onmouseover="picSwitch('.$i.');" rel="lightbox[roundtrip]" href="'.$image.'" title="'.$kommentar.'" />';
              $bildleiste .= '<img src="'.SPACER.'"  width="9" height="9" border="0"></a>'."\n";
              $bildleiste .= '<div class="bildleiste_space"><img src="'.SPACER.'" width="9" height="9" border="0" alt=""></div>'."\n";
              $i++;		
          }
      }
      if ($bild_html != '') {
//			$tpl->setCurrentBlock('bilderleiste');
          $tpl->setVariable('bild1', $bild_html); 
          $tpl->setVariable('bilder_leiste', $bildleiste);
//			$tpl->parseCurrentBlock();			
      } 
      // Speicher wieder freigeben
      $bilder->free();
  }

  /**
   *  Bildwechsel zu einer nav_id erzeugen
   *	@param: $nav_id - id der Seite zu der die Galerie gehoert
   *	@param: $type - Seitentype N oder P um Bilder aus cms_galerien auszulesen
   *	@param: $bild - Bild, welches angezeigt wird
   *	@param: $thumbsize - Gr�sse der Thumbnails aus cms_templates
  */
  public function erzeuge_auto_bildwechsel($id, $type, $bild, $thumbsize) 
  {	
      global $frontget, $tpl, $db, $language;
      $bild1 = ''; 
      $bild2 = '';

      // Erst mal in der Tabelle cms_galerien sehen, ob es Bilder hat.
      $bilder = $frontget->read_galerie_pro_nav_id($id, $type);
      $found  = $db->queryOne('SELECT FOUND_ROWS()');	
      // ev. Spezialfall aus cms_spezial lesen --> soll der Bildwechsel fuer 1 oder 2 Bilder erfolgen
      $spez	= $frontget->read_single_spez(THEME,'BW');  // BW = Bildwechsel

      $i = 0; $j=0;
      while ($row = $bilder->fetchRow(MDB2_FETCHMODE_ASSOC)) 
      {
          $i++; $j++;
          // muessen 2 BildContainer gefuellt werden, oder nur 1?
          $bilder_pro_container = $spez['wert1']=='imageContainer1' && $spez['wert2']=='imageContainer2' ? $found / 2 : $found;
          // $j und $bild_html initialisieren, sobald der 1. Container voll ist.
          if ($i > $bilder_pro_container && $i == $j) { $j = 1; $bild_html = ''; }
          $thumb = $this->resize_thumbnail($row['bildpfad'], $thumbsize, $type);
          $kommentar = ($row['kommentar_'.$language] != '' && $row['kommentar_'.$language] != null) ? $row['kommentar_'.$language] : ''; 
          $bild_html = '<img id="pict_'.$i.'" class="img_small" src="'.$thumb.'" border="0" title="'.$kommentar.'" />';
          if ($j < $i) { // jetzt ist der 2. Container dran
              $bild2 .= $bild_html;
          } else {
              $bild1 .= $bild_html;
          }
      }
      if ($bild1 != '') {
//			$tpl->setCurrentBlock('bilderwechsler');
          // das Script fuer den Bildwechsler wird erst hier eingefuegt, weil es sonst Probleme mit lightbox macht
          $xfade = '<script type="text/javascript" src="'.HOST.'frontend/scripts/xfade2.js"></script>';
          $imagecontainer = 'id="imageContainer1" ';
          $tpl->setVariable('xfade', $xfade);
          $tpl->setVariable('setright', ' setright'); // fuer Templates mit Bild rechts
          $tpl->setVariable('imagecontainer', $imagecontainer);				
          $tpl->setVariable('bild1', $bild1);
          $tpl->setVariable('bild2', $bild2);
//			$tpl->parseCurrentBlock();
      }
      // Speicher wieder freigeben
      $bilder->free();
  }

  /**
   *  Farbgebung gemess Eintraegen in der cms_spezial setzen 
   *  Es soll nur die CSS-Eigenschaft aus cms_spezial zurückgegeben werden.
   *	@param: $type -> Navigation, Unternavigation oder Seite
   *	@param: $navid -> Id der Navigation
   *	@param: $css_classes -> Array mit CSS-Klassen
  */
  public function set_css_class($type, $navid, $css_classes)
  {
      global $tpl;
      $farbe = '';
//		if ($type == 'nav')	{ $style = ' class="active"'; }
//		if ($type == 'subnav')	{ $style = ' class="subactive"'; }
//		if ($type == 'service') { $astyle = ' class="active"'; $listyle = ' active'; }
      if (count($css_classes) > 0 && $navid > 0) {
        foreach($css_classes as $index => $css){
          if ($css['wert1'] == $navid)  {
            switch($type) {
              case 'nav':
                  $style = $css['wert2'];
                  $farbe = $css['wert2'];
                  break;
              case 'subnav':
//                    $style = ' class="subactive '.$css['wert2'].'"';
                  $style = $css['wert2'];
                  $farbe = $css['wert2'];
                  break;
              case 'service':
                  $farbe = ' '.$css['wert2'];
                  break;
              case 'seite':
                  $style = ' '.$css['wert2'];
                  break;
            }
          }
        }			

        //Platzhalter-Variable setzen
        if ($type == 'nav') {
            return $style;
//              $tpl->setVariable('style', $style);
//              $tpl->setVariable('farbe', $farbe);
        } elseif ($type == 'subnav') {
            $tpl->setVariable('shnav', $farbe);
            return $style;
        } elseif ($type == 'service') {
            $tpl->setVariable('listyle', $listyle);
            $tpl->setVariable('astyle', $astyle);
            $tpl->setVariable('farbe', $farbe); // Farbe setzen in nav_tpl.html
        } elseif ($type == 'seite') {
            $tpl->setCurrentBlock('subnavi_horizontal');
            $tpl->setVariable('shnav', $style); // Hintergrundfarbe Subnavi Horizontal
            $tpl->parseCurrentBlock();
            $tpl->setCurrentBlock('subcontainer');
            $tpl->setVariable('farbe', $style); // Hintergrundfarbe Contentseite
            $tpl->parseCurrentBlock();
        }
        $style = '';
        $farbe = '';
      }
  }

  /**
   *  Textelement einer Seite mit Texten/Bildern/Objekten aus cms_fragments ergaenzen 
   *  @param: $text -> Textelement einer Seite/Unterseite mit Platzhaltern fuer Fragmente
   *  @return: $text 
   *	Hinweis: Um einen Paltzhalter fuer ein Fragment zu erkennen, muss folgende Syntax im HTML eingehalten werden:
   *	1. der Platzhalter kann folgende Syntax haben: %<zahl><wort><zahl>% zB. %teaser1%, 
   *		der Platzhalter kann in einem DIV, SPAN oder P-Tag eingebettet sein.
   *		Vollstaendiges Beispiele: 
   *		a) <div id="teaser1" class="fragment">%fragment1%</div>
   *		b) <p>%teaser1%</p>
   *	Um das richtige Fragment aus der Tabelle cms_fragmente zu lesen wird das Wort zwichen den %-Zeichen extrahiert			
  */
  public function replenish_text_with_fragments($text)
  {
      global $frontget;
      // zuerst feststellen, ob es ueberhaupt einen Platzhalter im Text gibt.
      // die Regex sucht alle Vorkommnisse des Pattern mit folgender Form %<zahl><wortinklsonderzeichen><zahl>% 
      // hilfreiches Regex-Test-Tool http://regex.larsolavtorvik.com/
      $pattern = '/%\d*\w.*\d*%/'; 
      // gibt es einen Platzhalter in der Form %<Zahl>irgendeinwort<Zahl>%? 
      $anz = preg_match_all($pattern, $text, $result);
      if ($anz > 0) {
          $fragments = $result[0];  // ist ein Array mit den Namen der Platzhalter
          // wenn mind. 1 Fragment gefunden wurde..
          foreach($fragments as $index => $fragment) {
              // muss das fuehrende und abschliessende %-Zeichen geloescht werden,
              $frgnam = str_replace("%","", $fragment);
              // um den Content des Fragments aus cms_fragmente zu lesen
              // das Fragment wird automatisch in einem Div-Tag ausgegeben
              $erstxt  = '<div class="teaserwrapper">';
              $erstxt .= '<div id="'.$frgnam.'" class="teaser">';
              $erstxt .= $frontget->read_longtext_fragment($frgnam);
              $erstxt .= '</div>';
              $erstxt .= '</div>';
              // und dann den Platzhalter $fragment (ein Regex-Ausdruck) in $text zu ersetzen
              $fragment = '/'.$fragment.'/';
              $text = preg_replace($fragment, $erstxt, $text);								
          }
      }
      // den ganzen erneuerten Text zurueckgeben
      return $text;
  }
}
?>
