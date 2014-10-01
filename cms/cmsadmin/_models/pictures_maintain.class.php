<?php
/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Klasse f�r die Verwaltung der Navigation
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erw�hnt wird
 * @version     1.0 | 2007-07-14
 */

class picturesMaintain
{
	private $mDir;
	private $mBildDb;
	private $mMeldung;

	/* Constructor */
	function __construct($dir, $bilddb)
	{
		$dir == '' ? $dir = MEDIA_ROOT : $dir;
		$this->mDir		= $dir;
		$this->mBildDb  = $bilddb;
		$this->mMeldung = array();
	}

	/* Neue Methode implementieren */
	/********************************************************************************************
	* Die folgende Funktion scant ein Verzeichnis und liefert neben dem Dateinamen inkl. Pfad
	* die folgenden Dateiinformationen: fmt = last modified, fsz = Filesize, drs = Name eines
	* Unterverzeichnisses, mit $verbose=1 kann man sich die gelesenen Daten ausgeben lassen
	*******************************************************************************************/
	function dirlst($srcdir, $p=0, $getfmt=0, $getfsz=0, $getdrs=0, $verbose=0)
	{
		global $bilddb;
		// falls ein Verzeichnis noch nicht existiert, wird es hier angelegt.
		if (!file_exists($srcdir)) {
			$msg = $this->create_directory($srcdir);
		}

		// dann wird das Verzeichnis ge�ffnet und durchsucht
		$handle  = opendir($srcdir);
		while (false !== ($file = readdir($handle)))
		{
			if ($file != '.' && $file != '..' && $file != 'Thumbs.db')
			{
				// Pfad und Datei
				$srcfile = $srcdir.'/'.$file;
				if (is_file($srcfile)) {
					// Sortkey aus der tabelle art_galerien besorgen
					if (isset($_SESSION['ref_id'])) {
						$bild_pfad = str_replace('_thumbs/th_','_images/',$srcfile);
						$ref_id = $_SESSION['ref_id'];
						// id und sortkey lesen
						$id_sortkey = $bilddb->bild_in_db_checken($ref_id, $bild_pfad);
						$sf['sortkey'] = $id_sortkey['sortkey'];
					}
					// strrchr sucht das letzte Vorkommen eines Zeichens in einem String
					$sf['extension'] = strrchr($file, ".");
					// Bilddatei-Masse imagesize[0]=Breite x imagesize[1]=H�he
					$imagesize = getimagesize($srcfile);
					$sf['imgsize'] = $imagesize[0] .'x'. $imagesize[1];
					$sf['type'] = $imagesize[2];
					$sf['filetype'] = 'file';
					// p=0 -> absoluter Dateiname p=1 -> Dateiname allein
					$sf['datei'] = substr($srcfile, $p);
					// Filepermissions
					$sf['permissions'] = fileperms($srcfile) & 511;
					// Statistische Daten zur Datei lesen
					$sst = stat($srcfile);
					// last modified
					if($getfmt) { $fmt = filemtime($srcfile); $sf['fmt'] = $fmt; }
					// die Filesize in Kb umgerechnet
					if($getfsz) { $fsz = $sst['size'];  $sf['fsz'] = round($fsz / 1024); }
				}
				else if (is_dir($srcfile)) {
					if($getdrs) {
						$sf['filetype'] = 'dir';
						$sf['datei'] = $file;
						// Filepermissions
						$sf['fileperms'] = $this->file_perms($srcfile, true);
						$sf['filegroup'] = $this->file_owner($srcfile,'group');
						$sf['fileowner'] = $this->file_owner($srcfile,'owner');
						
 					}
				}

				// Ausgabe, falls $verbose=1
				if ($verbose) { echo "<br />\n"; print_r($sf); }
				// Array f�llen
				$fs[] = $sf;
				// Variable l�schen
				unset($sf);
			}
		}
		// Aufsteigend Sortieren, falls das Array nicht leer ist
		if (count($fs) > 0) { sort($fs); }
		// R�ckgabe
		return $fs;
	}

	// Filepermissions ermitteln, aber nicht auf Windows
	private function file_perms($file, $octal=false) 
	{
		if (file_exists($file) && SERVER_OS != 'WIN') {
			$perms = fileperms($file);
		    $cut = $octal ? 2 : 3;
		    return substr(decoct($perms), $cut);
		}
	}
	
	// Fileowner bestimmen, aber nicht auf Windows
	private function file_owner($file, $type) 
	{
		if (file_exists($file) && SERVER_OS != 'WIN') {
//		if (file_exists($file)) {
			if ($type == 'owner') { 
				$owner = fileowner($file);
				$owner_array = posix_getpwuid($owner); 
//                $stat_array = stat($file);
                $owner_array['name'] = $stat_array['uid'];
			} else { 
				$owner = filegroup($file);
				$owner_array = posix_getgrgid($owner); 
//                $stat_array = stat($file);
                $owner_array['name'] = $stat_array['gid'];
			}
		    return $owner_array['name'];
		}
	}
	
	
	/************************************************************************************************
	* Eine Datei oder ein Verzeichnis umbenennen
	************************************************************************************************/
	public function rename_file($dir, $file, $fileold)
	{
		if (is_dir($dir)){
			$fileold = $dir.'/'.$fileold;
			$file = $dir.'/'.$file;
			if (file_exists($fileold)){
				if (rename($fileold,$file)) {
					$this->mMeldung[] = 'success'; $this->mMeldung[] = $GLOBALS['MESSAGES']['MSG_DATEI_UMBENANNT'];
				}
				else {
					$this->mMeldung[] = 'error'; $this->mMeldung[] = $GLOBALS['MESSAGES']['MSG_DATEI_NICHT_UMBENANNT'];
				}
			}
		}
		return $this->mMeldung;
	}

	/************************************************************************************************
	* Eine Datei oder ein Verzeichnis l�schen
	* Wenn eine Datei geloescht werden soll, wird die entsprechende thumbnail ebenfalls geloescht
	************************************************************************************************/
	public function delete_file($dir, $file)
	{
		global $extensions, $bilddb;

		if (is_dir($dir)){

			// $extension der Datei feststellen
			$extension = strrchr($file, '.');
			// Pfad und Datei zusammensetzen
			$datei = $dir.'/'.$file;
			// $pfad festlegen, damit der entspr. Eintrag auch in der DB gel�scht werden kann.
			$verzeichnis = explode('/', $dir);

			// entweder haben wir ein PDF oder ein Bild vor uns
			if ($extension == '.pdf') {
				$pfad = $dir;
			} else {
				// in der DB ist nur der Bildpfad zum Verzeichnis _images gespeichert
				$pfad_bild = str_replace('_thumbs/th_', '_images/', $datei);
			}


			// Es soll eine Datei geloescht werden
			if (file_exists($datei) && is_file($datei)){
				$this->datei_loeschen($datei);

				// eine ev. 2 Bilddatei nur loeschen, wenn die Extension im Array $extensions enthalten ist.
				if (in_array($extension, $extensions)) {
					// Vorbereitung, damit das Thumbnail bzw. das Image auch geloescht werden kann
					$nextdir  = $this->get_next_directory($dir);
					$next     = array_pop(explode('/', $nextdir));  // letzter Eintrag im Array = $nextdir
					$nextfile = $this->get_next_file($next, $file);

					// 2. Bilddatei (entweder im Verzeichnis _images oder _thumbs)
					$datei = $nextdir .'/'.$nextfile;
					$this->datei_loeschen($datei);
				}

				// nachdem die Dateien von der Platte gel�scht wurden, wird nun auch noch ein ev. vorhandener Eintrag
				// in der DB-Tabelle art_galerien gel�scht
				if ($_SESSION['ref_id'] > 0) {
					// Meldungsarray an die Methode in der Fremdklasse mitgeben, dort erg�nzen und wieder empfangen
					$this->mMeldung = $bilddb->bild_in_db_loeschen($_SESSION['ref_id'], $pfad_bild, $this->mMeldung);
				}
			}

			// es soll ein Verzeichnis und der gesamte Inhalt geloescht werden
			// das ist aber nur m�glich, wenn DELTREE_ALLOWED = true ist.
			if (file_exists($datei) && is_dir($datei) && DELTREE_ALLOWED) {
				$this->deltree($datei);
			}


			// Es soll ein Verzeichnis gel�scht werden
			if (file_exists($datei) && is_dir($datei)) {
				// Das Verzeichnis darf nur gel�scht werden, wenn es leer ist!!
				$files = scandir($datei);
				// die Verzeichnisse '.' und '..' und die Datei 'Thumbs.db' werden nicht gez�hlt
				$count = 0;
				foreach($files as $f) {
					if ($f != '.' && $f != '..') { $count++; }
					// Thumbs.db wird hier noch schnell gel�scht
					if ($f == 'Thumbs.db') {
						$thumbsdb = $datei .'/Thumbs.db';
						unlink($thumbsdb);
					}
				}

				// Es sind noch Dateien oder Verzeichnisse vorhanden
				if ($count > 0) {
					$this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DIR_NICHT_LEER'], $file);
				} else {
					// es darf gel�scht werden
					$this->verzeichnis_loeschen($datei);
				}
			}
			return $this->mMeldung;
		}
	}


	/* Einen ganzen Verzeichnisbaum l�schen
	@param: $path - Name des Verzeichnisses
	@return: $message - Erfolgs- oder Misserfolgsmeldung
	*/
	public function deltree($path) {
		$count_err_dire = 0;
		if (is_dir($path)) {
			$entries = scandir($path);
			foreach ($entries as $entry) {
				if ($entry != '.' && $entry != '..') {
					$this->deltree($path.'/'.$entry);
				}
			}
			if (!rmdir($path)) { $count_err_dire++; }
			if ($count_err_dire != 0) {
				$this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DIR_NICHT_GELOESCHT'], $path);
			} else {
				$this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DIR_GELOESCHT'], $path);
			}

		} elseif (is_file($path)) {
			if (!unlink($path)) {
				$this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DATEI_NICHT_GELOESCHT'], $path);
			}
		}
		return $this->mMeldung;
	}

	/* Wenn das aktuelle Directory _images ist, dann muss das n�chste _thumbs sein und umgekehrt */
	private function get_next_directory($dir) {
		// Verzeichnis, in dem gerade eine Bilddatei gel�scht wird
		$aktdir = explode('/', $dir);
		// letztes Element des Array l�schen und in $letztes speichern
		$letztes = array_pop($aktdir);
		// wenn $letztes = _images oder _thumbs
		if ($letztes == '_images' || $letztes == '_thumbs') {
			$alternate = $letztes == '_images' ? '_thumbs' : '_images';
			// $alternate an das Array $aktdir anh�ngen
			array_push($aktdir, $alternate);
			// das Array $aktdir wieder zu einem String zusammensetzen
			$nextdir = implode('/', $aktdir);
		}
		return $nextdir;
	}

	/* $file muss entweder um das Pr�fix 'th_' erg�nzt werden oder nicht, oder $file wird leer zur�ckgegeben,
	* abh�ngig davon, ob in $nextdir = _images oder _thumbs steht
	*/
	private function get_next_file($nextdir, $file) {
		// die ersten 3 Stellen von $file abschneiden
		$thumb_prefix = substr($file, 0, 3);
		// $dir = _images?  --> vom $file werden die ersten 3 Stellen (th_) abgeschnitten
		if ($nextdir == '_images') {
			// Pr�fix th_ abschneiden
			$nextfile =  $thumb_prefix == 'th_' ? substr($file, 3, strlen($file)) : $file;
		} elseif ($nextdir == '_thumbs') {
			// Pr�fix th_ als Pr�fix an den Dateinamen anh�ngen
			$nextfile = 'th_' . $file;
		} else $nextfile = '';

		return $nextfile;
	}

	/* die Datei physisch l�schen */
	private function datei_loeschen($datei) {
		$file = basename($datei);
		if (file_exists($datei)) {
			if (unlink($datei)) {
				$this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DATEI_GELOESCHT'], $file);
			}
			else {
				$this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DATEI_NICHT_GELOESCHT'] , $file);
			}
		}
	}

	/* ein Verzeichnis physisch l�schen */
	private function verzeichnis_loeschen($verzeichnis) {
		$dir = basename($verzeichnis);
		if (rmdir($verzeichnis)) {
			$this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DIR_GELOESCHT'], $dir);
		}
		else {
			$this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DIR_NICHT_GELOESCHT'], $dir);
		}
	}

	/************************************************************************************************
	* alle Verzeichnisse in einem Array speichern -> zum Anlegen eines neuen Verzeichnisses
	************************************************************************************************/
	public function scan_directories($srcdir=MEDIA_ROOT, $verzeichnisse='')
	{
		// Erster Eintrag = MEDIA_ROOT = /bilder
		if ($verzeichnisse[0] != $srcdir) { $verzeichnisse[0] = MEDIA_ROOT; }
		// Beginn Scanning
		$files = scandir($srcdir);
		foreach ($files as $file) {
			// folgende Unterverzeichnisse ausschliessen
			if ($file != '.' && $file != '..' && $file != '_images' && $file != '_thumbs') {
				$srcfile = $srcdir .'/'.$file;
				if (is_dir($srcfile)) {
					$verzeichnisse[] = $srcfile;
					// Rekursiver Aufruf von scan_directories mit neuem Verzeichnisnamen
					$verzeichnisse = $this->scan_directories($srcfile, $verzeichnisse);
				}
			}
		}
		return $verzeichnisse;
	}

	/************************************************************************************************
	* ein Verzeichnis physisch anlegen
	************************************************************************************************/
	public function create_directory($dir_to_create='')
	{
		if ($dir_to_create == '') {
			$dir_to_create = $_POST['dirs'] . '/'. $_POST['verzeichnis'] ;
		}
		
		$verz = explode('/', $dir_to_create); 
		
		foreach ($verz as $key => $subdir) {			
			$dir .= $key > 0 ? '/'. $subdir : $subdir;
			if (preg_match('/media/', $dir) && $dir != MEDIA_ROOT) {
				if (!file_exists($dir)) {
					if (mkdir($dir)){
						$this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DIR_ANGELEGT'], $dir);
			 		}
				}
 			}
		}
		return $this->mMeldung;
	}

	/************************************************************************************************
	* alle Thumbnails / Bilder eines Verzeichnisses in einen Array �bernehmen
	************************************************************************************************/
	public function get_images($verzeichnis) {
		if (is_dir($verzeichnis)) {
			$scan = scandir($verzeichnis);
			foreach ($scan as $bild) {
				if (strtolower($bild) != 'thumbs.db' && $bild != '.' && $bild != '..') {
					$bilder[] = $verzeichnis.'/'.$bild;
				}
			}
		}
		return $bilder;
	}

	/************************************************************************************************
	* Dateien hochladen
	* im Array $_FILES sind folgende Informationen enthalten, falls im Input-Feld vom Typ file
	* eine Datei eingetragen ist:
	* @params: $_FILES (Array mit den eingegebenen Filenamen)
	*   [file1] => Array
	*   (
	*      [name] => background12.jpg
	*      [type] => image/pjpeg
	*      [tmp_name] => C:\xampp\xampp\tmp\phpB2.tmp
	*      [error] => 0
	*      [size] => 2629
	*	)
	* @params: $dirs (Array mit den vorhandenen Directories, mindestens MEDIA_ROOT)
	* @return: $msg - Array mit gesammelten Meldungen
	*
	************************************************************************************************/
	public function upload_files($aktdir='')
	{
		//		print_r($_FILES);
		global $bilddb;
        $pattern = '/[^a-zA-Z0-9]/';
		for($count=1; $count <= 10; $count++) {
			// lokale Variablen festlegen
			$dateiname = strtolower($_FILES["file".$count]['name']);
            $filenamen = pathinfo($dateiname,PATHINFO_FILENAME);
            $extension = pathinfo($dateiname,PATHINFO_EXTENSION);
            $dateiname = preg_replace($pattern,'',$filenamen).".".$extension;
			$dateiexte = strchr($dateiname, ".");
			$dateitype = $_FILES["file".$count]['type'];
			$dateisize = $_FILES["file".$count]['size'];
			$dateitemp = $_FILES["file".$count]['tmp_name'];
			$dateipfad = $this->set_dateipfad($aktdir);
			$create_thumbnails = isset($_POST['thumbnails']) ? $_POST['thumbnails'] : '';
			$pfad_thumbs = $dateipfad . THUMBS;
			$pfad_images = $dateipfad . IMAGES;
			$thumbs_possible = array('.jpg','.png','.gif');
			list($breite, $hoehe) = explode('x', $_POST['thumbdim']);
			

			// ist eigentlich ein Filename angegeben?
			if ($dateiname != '' && $dateitype != '') {
				// pr�fen, ob ein erlaubter Filetype �bertragen wurde
				$subrc = $this->check_filetype($dateitype);
				if ($subrc!=0) { $this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_FALSCHER_DATEITYP'], $dateiname); }
				
				// pr�fen, ob die Bild-Datei nicht zu gross ist - PDF-Dateien werden nicht nach Gr�sse �berpr�ft
				if ($subrc == 0 && $dateitype != 'application/pdf') {
					$subrc = $this->check_filesize($dateisize);
					if ($subrc!=0) {
						$size_kb = round(MAX_IMAGE_SIZE / 1024);
						$this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DATEI_ZU_GROSS'], $dateiname, $size_kb);
					}
				}

				// pr�fen, ob im gew�hlten Verzeichnis die Unterverzeichnisse thumbs und images vorhanden sind. Bei Bedarf anlegen
				$this->check_subdirectories($pfad_thumbs);
				$this->check_subdirectories($pfad_images);

				if ($subrc == 0 && $aktdir != '') {
					// sehen, ob die Datei existiert --> dann darf nicht uploaded werden
					$path_file = $this->set_bildpfad($dateitype, $dateipfad, $dateiname);
					if (file_exists($path_file)) {
						$this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DATEI_EXISTIERT_SCHON'], $dateiname);
					} else {						
						// Bildmasse �berpr�fen, um das Bild nach dem Upload ev. zu verkleinern
						$imagesize = getimagesize($dateitemp);
						$file_width  = $imagesize[0];  // Bildbreite
						$file_height = $imagesize[1];  // Bildh�he
						// Upload durchf�hren und Berechtigungen setzen
						if (move_uploaded_file($dateitemp, $path_file) && chmod($path_file, 0755 )) {
							$this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DATEI_HOCHGELADEN'], $dateiname);				    
							// Das upgeloadete Bild verkleinern falls n�tig
							if ($file_width > IMAGE_MAX_WIDTH || $file_height > IMAGE_MAX_HEIGHT) {
								$subrc = $this->resize_picture($path_file, $path_file, IMAGE_MAX_WIDTH, IMAGE_MAX_HEIGHT);
								$this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DATEI_RESIZED'], $dateiname, IMAGE_MAX_WIDTH, IMAGE_MAX_HEIGHT);							
							}
						} 
						else {
							$this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DATEI_NICHT_HOCHGELADEN'], $dateiname);
						}
						
						// falls Thumbnails erstellt und die Datei als Thumbnail verkleinert werden kann, so geschieht das hier
						if ($create_thumbnails && in_array($dateiexte, $thumbs_possible)) {
							$this->create_thumbnail($path_file, $pfad_thumbs, $breite, $hoehe);
						}
						// und jetzt werden die Bildinformationen auch noch in der DB-Tabelle art_galerien gespeichert
						if ($_SESSION['ref_id']  > 0 && $dateitype != 'application/pdf') {
							$kommentar = '';
							$this->mMeldung = $bilddb->bild_in_db_speichern($_SESSION['ref_id'], $path_file, $kommentar, 'insert', $this->mMeldung);
						}
					}
				}

			}
		}
		return $this->mMeldung;
	}

	/* Erlaubte Dateitypen festlegen und �berpr�fen
	* @params: $type, Dateityp - erlaubt sind jpg, gif, png und pdf
	* @return: $subrc - Return-Code
	*/
	private function check_filetype($type) {
		$subrc = 0;
		$filetypes = array("image/pjpeg","image/x-png","image/jpeg","image/png","image/gif","application/pdf");
		if (!in_array($type, $filetypes)) { $subrc = 4; }
		return $subrc;
	}

	/* Erlaubte Dateigr�sse �berpr�fen
	* @params: $size - Dateigr�sse, erlaubt sind max. 50 Kb
	* @return: $subrc - Return-Code
	*/
	private function check_filesize($size) {
		$subrc = 0;
		if ($size <= 0 || $size > MAX_IMAGE_SIZE) { $subrc = 4; }
		return $subrc;
	}

	/* Existenz der Unterverzeichnisse thumbs und images �berpr�fen - Bei Bedarf anlegen
	* @params: $pfad
	* @return: $meldung
	*/
	private function check_subdirectories($pfad) {
		// wenn das Verzeichnis /thumbs nicht existiert wird es angelegt
		if (!file_exists($pfad)) {
			if (mkdir($pfad)){
				$this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DIR_ANGELEGT'], $pfad);;
			} else {
				$this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_DIR_NICHT_ANGELEGT'], $pfad);
			}
		}
		return $msg;
	}

	/* Bild-Dateipfad f�r den Upload festlegen. Bilder werden in /images bzw. /thumbs gespeichert, PDF's im gew�hlten Verzeichnis
	* @params: $dateitype
	* @params: $aktdir
	* @params: $dateiname
	* @return: $path_file - Bildname inkl. Pfad
	*/
	private function set_bildpfad($filetype, $aktdir, $filename) {
		if ($filetype == 'application/pdf') {
			$path_file = $aktdir .'/'. $filename;
		} else {
			$path_file = $aktdir . IMAGES . $filename;
		}
		return $path_file;
	}

	/* Dateipfad f�r den Upload festlegen. Bilder werden in /images bzw. /thumbs gespeichert, PDF's im gew�hlten Verzeichnis
	* @params: $aktdir
	* @return: $dir - Pfad
	*/
	private function set_dateipfad($aktdir) {
		$verz = explode('/', $aktdir);
		foreach ($verz as $key => $subdir) {			
			$dir .= $key > 0 ? '/'. $subdir : $subdir;
			if (preg_match('/media/', $dir) && $dir != MEDIA_ROOT) {
				return $dir;
			}
		}
		return $dir;
	}


	/************************************************************************************************
	* Erstellen von Thumbnails
	* 1. pr�fen, ob die GD-Library installiert ist
	* 2. Bild verkleinern
	* 3. Meldung zur�ckgeben
	************************************************************************************************/

	/* Erstellen eines Thumbnails und Speichern in dem daf�r vorgesehenen Verzeichnis
	* @params: $image_file_path - Bildname inkl. Pfad
	* @params: $thumbnail_path - Zielpfad f�r das Thumbnail
	* @return: $text - Meldungstext
	*/
	private function create_thumbnail($image_file, $thumb_path, $breite, $hoehe)
	{
		$image =  basename($image_file);
		$thumbnail = THUMB_PREFIX . basename($image_file);
		$thumb_image = $thumb_path . $thumbnail;

		// Pr�fen, ob die GD-Library installiert ist, ansonsten kann kein Thumbnail erstellt werden
		// check_gd_lib liefert ein assoz. Array zur�ck
		$gd_version = $this->check_gd_lib();
		if ($gd_version) {
			$subrc = $this->resize_picture($image_file, $thumb_image, $breite, $hoehe);
			// Berechtigungen setzen
			if ($subrc && chmod($thumb_image, 0755 )) {
				$this->mMeldung[] = 'success'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_THUMBNAIL_GESPEICHERT'], $image, $thumbnail);
			} else {
				$this->mMeldung[] = 'error'; $this->mMeldung[] = sprintf($GLOBALS['MESSAGES']['MSG_THUMBNAIL_NICHT_GESPEICHERT'], $image);
			}
		}
	}

	/* pr�fen, welche Version der gd-Library installiert ist
	* Die GD-Library wird ben�tigt f�r das Erstellen der Thumbnails
	* @return: Version der GD-Library
	*
	Was ist zu tun, wenn die GD-Library nicht aktiviert ist?
	please follow below steps:

	my php install dir is: c:/php/
	first you must try to find:
	c:/php/php.ini
	c:/php/ext/php_gd2.dll(php 5)

	The php_gd2.dll is included in a standard PHP installation for Windows,
	however, it's not enabled by default.
	You have to turn it on,
	You may simply uncomment the line "extension=php_gd2.dll" in php.ini and restart the PHP extension.
	Change:
	,extension=php_gd2.dll
	To:
	extension=php_gd2.dll

	You may also have to correct the extension directory setting
	from:
	extension_dir = "./"
	extension_dir = "./extensions"
	To (FOR WINDOWS):
	extension_dir = "c:/php/extensions"(php 4)
	extension_dir = "c:/php/ext"(php 5)
	*/
	private function check_gd_lib()
	{
		$gd_info = gd_info();
		if ($gd_info && preg_match('/2.0/', $gd_info['GD Version'])) {
			return "gd2";
		} else {
			return "gd";
		}
	}


	/* mit der folgenden Methode kann ein Bild auf die max. zul�ssige Gr�sse verkleinert werden
	* @params: $image_file_path - Bildname inkl. Pfad,
	*/
	public function resize_picture($image_file_path, $new_image_file_path, $max_width=100, $max_height=100)
	{
		$return_val = 1;

		// create new image
		if(preg_match('/\.png$/',$image_file_path)) { // if is a png
			$return_val = ( ($img = ImageCreateFromPNG ( $image_file_path )) && $return_val == 1 ) ? "1" : "0";
		}

		if(preg_match('/\.(jpg|jpeg)$/',$image_file_path)) { // if is a jpg
			$return_val = ( ($img = ImageCreateFromJPEG ( $image_file_path )) && $return_val == 1 ) ? "1" : "0";
		}

		$FullImage_width = imagesx($img);    // original width
		$FullImage_height = imagesy($img);    // original height

		//		echo $FullImage_width . ' x ' . $FullImage_height . "<br />\n";
		// now we check for over-sized images and pare them down
		// to the dimensions we need for display purposes
		$ratio =  ( $FullImage_width > $max_width ) ? (real)($max_width / $FullImage_width) : 1 ;
		$new_width = ((int)($FullImage_width * $ratio));    //full-size widt
		$new_height = ((int)($FullImage_height * $ratio));    //full-size height

		//		echo 'Ratio= ' . $ratio . ' Breite x H�he: '. $new_width . ' x ' . $new_height . "<br />\n";
		//check for images that are still too high
		$ratio =  ( $new_height > $max_height ) ? (real)($max_height / $new_height) : 1 ;
		$new_width = ((int)($new_width * $ratio));    //mid-size width
		$new_height = ((int)($new_height * $ratio));    //mid-size height

		// --Start Full Creation, Copying--
		// now, before we get silly and 'resize' an image that doesn't need it...
		if ( $new_width == $FullImage_width && $new_height == $FullImage_height ) copy ( $image_file_path, $new_image_file_path );

		// check to see if gd2+ libraries are compiled with php
		$gd_version = ( $this->check_gd_lib() );

		if ( $gd_version == "gd2" )
		{
			$full_id =  ImageCreateTrueColor ( $new_width , $new_height ); //Crea un'immagine
			ImageCopyResampled ( $full_id, $img, 0,0,0,0, $new_width, $new_height, $FullImage_width, $FullImage_height );
		}
		elseif ( $gd_version == "gd" )
		{
			$full_id = ImageCreate ( $new_width , $new_height ); //Crea un'immagine
			ImageCopyResized ( $full_id, $img, 0,0,0,0, $new_width, $new_height, $FullImage_width, $FullImage_height );
		}

		else echo "GD Image Library is not installed.";

		if(preg_match('/\.(jpg|jpeg)$/',$image_file_path))
		{
			$return_val = ( $full = ImageJPEG( $full_id, $new_image_file_path, 80 ) && $return_val == 1 ) ? "1" : "0";
		}

		if(preg_match('/\.png$/',$image_file_path))
		{
			$return_val = ( $full = ImagePNG( $full_id, $new_image_file_path ) && $return_val == 1 ) ? "1" : "0";
		}

		ImageDestroy( $full_id );

		// --End Creation, Copying--
		return ($return_val) ? TRUE : FALSE ;
	}

}

?>
