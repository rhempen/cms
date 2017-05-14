<?php

// Content Management System 

/**
 * ----------------------------------------------------------
 * (c) 2007  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Sprachabhaengige Texte fuer das CMS von hempenweb
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erwaehnt wird
 * @version     1.0 | 2007-08-18
 */
// Define that this file is loaded
if (!defined('LANGUAGE_LOADED')) {
    define('LANGUAGE_LOADED', true);
}

// Set Locale auf Deutsch
setlocale(LC_ALL, 'en_EN');

// Set the language information
$language_code = 'EN';
$language_name = 'English';

/* * *******************************************************************************************************************
 * Texte zum cmsadmin-Login und Benutzerverwaltung
 * ******************************************************************************************************************* */
$GLOBALS['TEXTE']['LBL_LOGIN'] = 'Login';
$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD'] = 'Change Password';
$GLOBALS['TEXTE']['LBL_NEW_PASSWORD'] = 'Request a Password';
$GLOBALS['TEXTE']['ANGEMELDET'] = 'Logged in as: ';
$GLOBALS['TEXTE']['LOGIN_FAIL'] = 'Login was not successfull - try again!';
$GLOBALS['TEXTE']['NO_MENU'] = 'For this user no menu has been maintained - Please inform the Administrator!';
$GLOBALS['TEXTE']['EXEC_LOGIN'] = 'Login';
$GLOBALS['TEXTE']['WELCOME'] = 'Welcom ';
$GLOBALS['TEXTE']['USERNAME'] = 'Username';
$GLOBALS['TEXTE']['PASSWORD'] = 'Password';
$GLOBALS['TEXTE']['OLD_PASSWORD'] = 'Old Password';
$GLOBALS['TEXTE']['NEW_PASSWORD'] = 'New Password &#8211; at least 6 characters';
$GLOBALS['TEXTE']['REPEAT_PASSWORD'] = 'Repeat the Password';
$GLOBALS['TEXTE']['EMAIL'] = 'Email-Address';
$GLOBALS['TEXTE']['PASSWORD_CHANGED'] = 'The Password has been changed successfully &#8211; Please login';
$GLOBALS['TEXTE']['PASSWORD_CHANGE_FAILED'] = 'The Password could has been changed';
$GLOBALS['TEXTE']['PASSWORD_LENGTH'] = 'The new Password has to be at least 6 characters long';
$GLOBALS['TEXTE']['PASSWORD_EQUAL'] = 'Please repeat the new Password identically!';
$GLOBALS['TEXTE']['PASSWORD_NEW_EQALS_OLD'] = 'The new Password must not equals to the old one!';
$GLOBALS['TEXTE']['ALLE_FELDER_FUELLEN'] = 'Please fill in all requested fields';
$GLOBALS['TEXTE']['USER_NOT_EXIST'] = 'User %s is unknown!';
$GLOBALS['TEXTE']['NEW_PASSWORD_IS'] = 'The new Password is: ';
$GLOBALS['TEXTE']['WRONG_EMAIL'] = 'Email-Adress is invalid ';
$GLOBALS['TEXTE']['EMAIL_SENT'] = 'The new Password has been sent to: %s';
$GLOBALS['TEXTE']['EMAIL_SEND_FAILED'] = 'Send Email was erroneous - Please try again later!';
$GLOBALS['TEXTE']['EMAIL_BETREFF'] = 'Your Account to the CMS';
$GLOBALS['TEXTE']['EMAIL_TEXT'] = 'Hello,' . "\n" . 'the new Password is %s' . "\n" . 'Please change it immediatly' . "\n" . 'Thank you very much' . "\n" . 'info@hempenweb.ch';


/* * *******************************************************************************************************************
 * Menutexte zum CMS
 * ******************************************************************************************************************* */
$GLOBALS['CMS']['CMS_TITLE'] = 'CMS by hempenweb.ch';
$GLOBALS['CMS']['LBL_CMS'] = 'Content Management System';
$GLOBALS['CMS']['MENU01'] = 'Navigation';
$GLOBALS['CMS']['MENU02'] = 'Subpages';
$GLOBALS['CMS']['MENU03'] = 'Media-Explorer';
$GLOBALS['CMS']['MENU04'] = 'Explorer';
$GLOBALS['CMS']['MENU05'] = 'Php Info';
$GLOBALS['CMS']['MENU06'] = 'Links';
$GLOBALS['CMS']['MENU07'] = 'Backup';
$GLOBALS['CMS']['MENU08'] = 'Documentation';
$GLOBALS['CMS']['MENU09'] = 'Logout';
$GLOBALS['CMS']['MENU10'] = 'Configuration';
$GLOBALS['CMS']['MENU11'] = 'Fragments';
$GLOBALS['CMS']['MENU12'] = 'Addons';
$GLOBALS['CMS']['TEXT_ANMELDEN'] = 'Please login';
$GLOBALS['CMS']['TEXT_WAEHLEN'] = 'Please choose from the menu';

/* * *******************************************************************************************************************
 * Texte zur Klasse frgmntsPresent
 * ******************************************************************************************************************* */
$GLOBALS['TEXTE']['FRAGMENTE'] = 'Fragments';
$GLOBALS['TEXTE']['CSS'] = 'CSS';
$GLOBALS['TEXTE']['TEXT_NEW_FRGMNT'] = 'New Fragment';
$GLOBALS['TEXTE']['TEXT_COPY_FRGMNT'] = 'Copy of %s';
$GLOBALS['TEXTE']['FRGMNT_CONFIRM_DELETE'] = 'Really delete fragment %s?';
$GLOBALS['TEXTE']['TEXT_CREATE'] = 'Create a new fragment';
$GLOBALS['TEXTE']['TEXT_COPY'] = 'Copy';
$GLOBALS['TEXTE']['TEXT_MOVE'] = 'Move';
$GLOBALS['TEXTE']['CSS_START_TEXT'] = '/* CSS-Notations for fragments - Created: %s */';

// Erfolgsmeldungen
$GLOBALS['MESSAGES']['MSG_FRGMNT_GESPEICHERT'] = 'The fragment %s has been saved';
$GLOBALS['MESSAGES']['MSG_FRGMNT_GELOESCHT'] = 'The fragment %s has been deleted';
$GLOBALS['MESSAGES']['MSG_CSS_GESPEICHERT'] = 'The CSS-File %s has been saved';
$GLOBALS['MESSAGES']['MSG_CSS_NEU_ANGELEGT'] = 'The CSS-File %s has been created';
$GLOBALS['MESSAGES']['MSG_CSS_BEARBEITEN'] = 'CSS-File: %s ';

// Fehlermeldungen
$GLOBALS['MESSAGES']['MSG_FRGMNT_NICHT_GESPEICHERT'] = 'The fragment %s could not be saved';
$GLOBALS['MESSAGES']['MSG_FRGMNT_NICHT_GELOESCHT'] = 'The fragment %s could not be deleted';
$GLOBALS['MESSAGES']['MSG_CSS_NICHT_GESPEICHERT'] = 'The CSS-File %s could not be saved';
$GLOBALS['MESSAGES']['MSG_CSS_NICHT_ANGELEGT'] = 'The CSS-File %s could not be created';
$GLOBALS['MESSAGES']['MSG_CSS_BERECHTIGUNG_FAILED'] = 'Setting rights was not successful for %s';
$GLOBALS['MESSAGES']['MSG_FILE_KEINE_BERECHTIGUNG'] = 'File %s cannot be saved because of leaking rights';

/* * *******************************************************************************************************************
 * Texte zur Klasse configPresent
 * ******************************************************************************************************************* */
$GLOBALS['TEXTE']['CONFIGURATION'] = 'Configuration';
$GLOBALS['TEXTE']['CONFIG_DESCR'] = 'Description';
$GLOBALS['TEXTE']['CONFIG_PARAM'] = 'Parameter';
$GLOBALS['TEXTE']['CONFIG_VALUE'] = 'Value';
$GLOBALS['TEXTE']['THEME'] = 'Theme / Design';
$GLOBALS['TEXTE']['COPYRIGHT'] = 'Copyright-Text in the footer';
$GLOBALS['TEXTE']['VERSION'] = 'Version ';
$GLOBALS['TEXTE']['MAX_THUMBS'] = 'Max. number of thumbnails';
$GLOBALS['TEXTE']['MAX_LIST_ITEMS'] = 'Max. number of listitems';
$GLOBALS['TEXTE']['MAX_LENGTH_KURZTEXT'] = 'Max. length of the shorttext';
$GLOBALS['TEXTE']['LANGUAGE'] = 'Language';
$GLOBALS['TEXTE']['THUMB_PAGE_MAX_WIDTH'] = 'Max. width of thumbnails in Subpages';
$GLOBALS['TEXTE']['THUMB_PAGE_MAX_HEIGHT'] = 'Max. height of thumbnails in Subpages';
$GLOBALS['TEXTE']['THUMB_NAVI_MAX_WIDTH'] = 'Max. width of thumbnails in Navigationpages';
$GLOBALS['TEXTE']['THUMB_NAVI_MAX_HEIGHT'] = 'Max. height of thumbnails in Navigationpages';
$GLOBALS['TEXTE']['IMAGE_MAX_WIDTH'] = 'Max. displayed imagewidth';
$GLOBALS['TEXTE']['IMAGE_MAX_HEIGHT'] = 'Max. displayed imageheight';
$GLOBALS['TEXTE']['DISK_DB_ADJUSTMENT'] = 'Adjustment of pictures on disk - DB';
$GLOBALS['TEXTE']['MEDIA_ROOT_ADJUSTMENT'] = 'Adjustment of the MEDIA-Directory';
$GLOBALS['TEXTE']['HMENU_RICHTUNG'] = 'Horizontal: Alignment';
$GLOBALS['TEXTE']['HMENU_SUBMENU'] = 'Horizontal: Form Submenu';
$GLOBALS['TEXTE']['SUBMENU_DIR'] = 'Position of submenues';
$GLOBALS['TEXTE']['SUBNAV_SOFORT'] = 'go directly to subnavigation';
$GLOBALS['TEXTE']['SMURL'] = 'Search engine friendly URL\'s (SEFU)';
$GLOBALS['TEXTE']['SMURL_REFRESH'] = 'refresh SEFU-Index';
$GLOBALS['TEXTE']['ROOTDIR'] = 'Root-Directory of the CMS';
$GLOBALS['TEXTE']['TEMPLATE_DIR'] = 'Templates-Directory';
$GLOBALS['TEXTE']['EMAIL_RECEIVER'] = 'Email-Recipient';
$GLOBALS['TEXTE']['AUTHOR'] = 'author';
$GLOBALS['TEXTE']['DESCRIPTION'] = 'description';
$GLOBALS['TEXTE']['KEYWORDS'] = 'keywords';
$GLOBALS['TEXTE']['PAGE_TOPIC'] = 'page-topic';
$GLOBALS['TEXTE']['PUBLISHER'] = 'publisher';
$GLOBALS['TEXTE']['GOOGLE_VERIFY'] = 'google-site-verification';
$GLOBALS['TEXTE']['GOOGLE_ANALYTICS'] = 'Google-Analytics Account';

/* * *******************************************************************************************************************
 * Texte zur Klasse naviPresent
 * ******************************************************************************************************************* */
$GLOBALS['TEXTE']['NAVI_VERWALTUNG'] = 'Navigation Management';
$GLOBALS['TEXTE']['TEXT_BILDER_HOCHLADEN'] = 'Upload images';
$GLOBALS['TEXTE']['TEXT_EDIT_HAUPTNAVI'] = 'Edit Main-Navigation-Point';
$GLOBALS['TEXTE']['TEXT_NEUE_UNTERNAVI'] = 'Insert a new Sub-Navigation-Point';
$GLOBALS['TEXTE']['TEXT_DELE_HAUPTNAVI'] = 'Delete a Main-Navigation-Point';
$GLOBALS['TEXTE']['TEXT_DELE_UNTERNAVI'] = 'Delete Sub-Navigation-Point';
$GLOBALS['TEXTE']['TEXT_COPY_HAUPTNAVI'] = 'Copy a Main-Navigation-Point';
$GLOBALS['TEXTE']['TEXT_REIHENFOLGE'] = 'Change order, pull up image';
$GLOBALS['TEXTE']['TEXT_EDIT_UNTERNAVI'] = 'Edit Sub-Navigation-Point';
$GLOBALS['TEXTE']['TEXT_NEUE_HAUPTNAVI'] = 'New Main-Navigation-Point';
$GLOBALS['TEXTE']['NAVI_GUELTIGKEIT'] = 'Validity';
$GLOBALS['TEXTE']['NAVI_AKTIV'] = 'Active';
$GLOBALS['TEXTE']['NAVI_BEZEICHNUNG'] = 'Description';
$GLOBALS['TEXTE']['NAVI_BEARBEITEN'] = 'Maintenance';
$GLOBALS['TEXTE']['NAVI_SERVICE'] = 'Type';
$GLOBALS['TEXTE']['NAVI_START'] = 'Start';
$GLOBALS['TEXTE']['TEXT_KEINE_UNAV'] = 'Servicenavigation cannot have a Sub-Navigation-Point';
$GLOBALS['TEXTE']['ABBRECHEN'] = 'Escape';
$GLOBALS['TEXTE']['SERVICENAVIGATION'] = 'Servicenavigation';
$GLOBALS['TEXTE']['HORIZ_HAUPTNAVIGATION'] = 'Main-Navigation horizontal';
$GLOBALS['TEXTE']['VERTI_HAUPTNAVIGATION'] = 'Main-Navigation vertikal';
$GLOBALS['TEXTE']['JA'] = 'Yes';
$GLOBALS['TEXTE']['NEIN'] = 'No';
$GLOBALS['TEXTE']['FREIGEGEBEN'] = 'released';
$GLOBALS['TEXTE']['BLOCKIERT'] = 'blocked';
$GLOBALS['NAVI']['HORIZONTAL'] = 'H';
$GLOBALS['NAVI']['VERTIKAL'] = 'V';
$GLOBALS['NAVI']['SERVICE'] = 'S';


/* * *******************************************************************************************************************
 * Texte zur Klasse naviMaintain
 * ******************************************************************************************************************* */
// Erfolgsmeldungen
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_ANGELEGT'] = 'Navigation-Point %s and the associated page has been created';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_GESPEICHERT'] = 'Page %s was saved';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_GELOESCHT'] = 'Navigation-Point %s and all associated data were deleted';
$GLOBALS['MESSAGES']['MSG_KAP_HOCHZIEHEN'] = 'Navigation-Point %s was pulled up';
$GLOBALS['MESSAGES']['MSG_UKAP_HOCHZIEHEN'] = 'Sub-Navigation-Point %s was pulled up';
$GLOBALS['MESSAGES']['MSG_NEU_SORTIERT'] = 'Die Datens&auml;tze wurden neu sortiert!';

// Fehlermeldungen
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_GESPEICHERT'] = 'Page %s was not saved';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_ANGELEGT'] = 'The Navigation-Point %s was not created!';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_GELOESCHT'] = 'Deleting Navigation-Point %s was erroneous!';
$GLOBALS['MESSAGES']['MSG_NAVI_NICHT_LOESCHBAR'] = 'Still %s associated subpages - please first delete subpages!';
$GLOBALS['MESSAGES']['MSG_NICHT_NEU_SORTIERT'] = 'Die Datens&auml;tze konnten nicht neu sortiert werden!';

/* * *******************************************************************************************************************
 * Labels zu Formularen navi_edit, page_edit
 * ******************************************************************************************************************* */
$GLOBALS['LABELS']['SIE_BEARBEITEN_SEITE'] = 'You edit page:';
$GLOBALS['LABELS']['SEITEN_INFO'] = 'Pageinfo';
$GLOBALS['LABELS']['SEITEN_INFO_VALUES'] = 'PageID: %s / NavID: %s / Directory: %s';
$GLOBALS['LABELS']['MESSAGE'] = 'Message';
$GLOBALS['LABELS']['TEMPLATE'] = 'Template';
$GLOBALS['LABELS']['INTEGRATION'] = 'Integration';
$GLOBALS['LABELS']['MODUL'] = 'Modul';
$GLOBALS['LABELS']['SEITENTITEL'] = 'Pagetitle<br />(60 Zeichen)';
$GLOBALS['LABELS']['ZUSATZTEXT'] = 'Additional text<br />(60 Zeichen)';
$GLOBALS['LABELS']['KURZTEXT'] = 'Short text';
$GLOBALS['LABELS']['INHALTSTEXT'] = 'Content';
$GLOBALS['LABELS']['INHALT2'] = 'Content additional column';
$GLOBALS['LABELS']['VONBIS'] = 'from &#8211; to';
$GLOBALS['LABELS']['BILD'] = 'Image';
$GLOBALS['LABELS']['BILD1'] = 'Image 1';
$GLOBALS['LABELS']['BILD2'] = 'Image 2';
$GLOBALS['LABELS']['BILDERGALERIE'] = 'Gallery';
$GLOBALS['LABELS']['LINK1'] = 'Link 1';
$GLOBALS['LABELS']['LINK2'] = 'Link 2';
$GLOBALS['LABELS']['SEITE_AKTIV'] = 'Page is active';
$GLOBALS['LABELS']['ESCAPE'] = 'escape';
$GLOBALS['LABELS']['RESET'] = 'reset';
$GLOBALS['LABELS']['SAVE'] = 'save';
$GLOBALS['LABELS']['ZEICHEN'] = 'characters remaining: ';
$GLOBALS['LABELS']['MAXZEICHEN'] = 'Max. characters: ';
$GLOBALS['LABELS']['MEMBERLOGIN'] = 'Member Login';
$GLOBALS['LABELS']['ERFORDERLICH'] = 'required';
$GLOBALS['LABELS']['NICHT_ERFORDERLICH'] = 'not necessary';

/* * *******************************************************************************************************************
 * Texte zur Klasse redirectMaintain
 * ******************************************************************************************************************* */
// Erfolgsmeldungen
//$GLOBALS['MESSAGES']['REDIRECT_GESPEICHERT']			= 'Entry in index table was successfully saved: %s';
//$GLOBALS['MESSAGES']['REDIRECT_GELOESCHT']				= 'Entry in index table was successfully deleted: %s';
$GLOBALS['MESSAGES']['REDIRECT_GESPEICHERT'] = 'Entry saved: %s';
$GLOBALS['MESSAGES']['REDIRECT_GELOESCHT'] = 'Entry deleted: %s';

// Fehlermeldungen
$GLOBALS['MESSAGES']['REDIRECT_NO_NAVID'] = 'Operation on ' . TABLE_PREFIX . 'redirect is not possible as no Navid was passed! %s';
$GLOBALS['MESSAGES']['REDIRECT_NICHT_GESPEICHERT'] = 'Entry in ' . TABLE_PREFIX . 'redirect could not be saved: %s';
$GLOBALS['MESSAGES']['REDIRECT_NICHT_GELOESCHT'] = 'Entry in ' . TABLE_PREFIX . 'redirect could not be deleted: %s';

/* * *******************************************************************************************************************
 * Meldungstexte zur Klasse pagesMaintain
 * ******************************************************************************************************************* */
// Texte zu Seitenverwaltung
$GLOBALS['TEXTE']['TEXT_MODUL_SELECT'] = 'No module = the content of this page is displayed';
$GLOBALS['TEXTE']['TEXT_UNTERSEITE'] = 'Subpage to ';

// Texte zu SEITEN-Verwaltung
$GLOBALS['TEXTE']['TEXT_PLUS_MINUS'] = 'Open or close';
//$GLOBALS['TEXTE']['TEXT_UPLOAD'] 						= "Managing Pictures:\nImageinfos\nUpload images\nDelete images";
$GLOBALS['TEXTE']['TEXT_UPLOAD'] = "Managing Pictures";
$GLOBALS['TEXTE']['TEXT_EDIT'] = 'Edit';
$GLOBALS['TEXTE']['TEXT_DELETE'] = 'Delete';
$GLOBALS['TEXTE']['TEXT_PAGE_EDIT'] = 'Edit content';
$GLOBALS['TEXTE']['TEXT_PAGE_DELETE'] = 'Delete Page';
$GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE'] = 'Really delete this page?';
$GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE_FILE'] = 'Really delete this file?';
$GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE_DIR'] = 'Really delete this folder?';
$GLOBALS['TEXTE']['TEXT_NEUE_SEITE'] = 'New Page';
$GLOBALS['TEXTE']['TEXT_SELECTBOX_AUWAHL'] = 'Please choose...';
$GLOBALS['TEXTE']['TEXT_SELECTBOX_LEER'] = 'No data found...';
$GLOBALS['TEXTE']['TEXT_AKTIV'] = 'active';
$GLOBALS['TEXTE']['TEXT_INAKTIV'] = 'inactive';
$GLOBALS['TEXTE']['TEXT_AUFWAERTS'] = '^Up';
$GLOBALS['TEXTE']['TEXT_SHOW'] = 'Display';
$GLOBALS['TEXTE']['TEXT_BILD_SHOW'] = 'Display image in full size';
$GLOBALS['TEXTE']['TEXT_BILDER_EDIT'] = "Edit comment to image\nChange Order";
$GLOBALS['TEXTE']['TEXT_BILD_DELETE'] = 'Delete Image';
$GLOBALS['TEXTE']['TEXT_DIR_DELETE'] = 'Delete folder';
$GLOBALS['TEXTE']['TEXT_FILETYPE'] = 'Open folder';
$GLOBALS['TEXTE']['TEXT_TRANSLATE'] = 'Translate';

// Texte zu Medienbrowser
$GLOBALS['TEXTE']['TEXT_SEITE'] = 'Page: ';
$GLOBALS['TEXTE']['TEXT_BASIS_BILDER'] = 'Rootfolger for images: ';
$GLOBALS['TEXTE']['TEXT_AKT_VERZEICHNIS'] = 'Folder';
$GLOBALS['TEXTE']['TEXT_VORHANDENE_DIRS'] = 'Existing folders';
$GLOBALS['TEXTE']['TEXT_ZIELVERZEICHNIS'] = 'Destination folder';
$GLOBALS['TEXTE']['TEXT_NEUES_VERZEICHNIS'] = 'New folder';
$GLOBALS['TEXTE']['TEXT_DATEIEN_LADEN'] = 'Upload files on the server';
$GLOBALS['TEXTE']['TEXT_THUMBNAILS_ERSTELLEN'] = 'Create thumbnails';
$GLOBALS['TEXTE']['TEXT_KOMMENTARE_ERFASSEN'] = 'Edit image comments';

// Menupositionen fuer Medienbrowser
$GLOBALS['MENUE']['TEXT_CREATE_DIR'] = 'Create folder';
$GLOBALS['MENUE']['TEXT_UPLOAD_PICS'] = 'Upload images';
$GLOBALS['MENUE']['TEXT_EDIT_COMMENTS'] = 'Edit image comments';
$GLOBALS['MENUE']['TEXT_SHOW_PICS'] = 'Display images';
$GLOBALS['MENUE']['TEXT_HIDE_PICS'] = 'Hide images';
$GLOBALS['MENUE']['TEXT_GOTO_PICS'] = 'Go to image folder';
$GLOBALS['MENUE']['TEXT_GOTO_REFID'] = 'Edit page';
$GLOBALS['MENUE']['TEXT_ZURUECK'] = 'back';

// Erfolgs - Meldungen 
$GLOBALS['MESSAGES']['MSG_SEITE_GESPEICHERT'] = 'Page %s was saved';
$GLOBALS['MESSAGES']['MSG_SEITE_GELOESCHT'] = 'Page %s was deleted successfully';
$GLOBALS['MESSAGES']['MSG_BILD_IN_DB_GESPEICHERT'] = '%s was saved in the database';
$GLOBALS['MESSAGES']['MSG_BILD_IN_DB_GELOESCHT'] = '%s was deleted in the database';
$GLOBALS['MESSAGES']['MSG_KOMMENTAR_GESPEICHERT'] = 'Comment was saved';
$GLOBALS['MESSAGES']['MSG_BILD_HOCHGEZOGEN'] = 'Image was pulled up';
$GLOBALS['MESSAGES']['MSG_BILDER_PRO_REF_GELOESCHT'] = 'All images were deleted in the database for this page %s';

// Fehler - Meldungen 
$GLOBALS['MESSAGES']['MSG_NOTHING_FOUND'] = 'Nothing found!';
$GLOBALS['MESSAGES']['MSG_SEITENTITEL_EINGEBEN'] = 'Please enter a page title';
$GLOBALS['MESSAGES']['MSG_KURZTEXT_EINGEBEN'] = 'Please enter a short text';
$GLOBALS['MESSAGES']['MSG_LANGTEXT_EINGEBEN'] = 'Please enter a long text';
$GLOBALS['MESSAGES']['MSG_DATUM_UNGUELTIG'] = '%s is not a valid date';
$GLOBALS['MESSAGES']['MSG_DATUM_FORMAT'] = 'Please enter the date in the format DD.MM.JJJJ';
$GLOBALS['MESSAGES']['MSG_DATUMBIS_KLEINER_DATUMVON'] = '%s is smaller than the From date %s';
$GLOBALS['MESSAGES']['MSG_SEITE_NICHT_GESPEICHERT'] = 'Page %s was not saved';
$GLOBALS['MESSAGES']['MSG_SEITE_NICHT_GELOESCHT'] = 'Page %s could not be deleted';
$GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB_GESPEICHERT'] = '%s could not be saved in the database';
$GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB_GELOESCHT'] = '%s could not be deleted in the database';
$GLOBALS['MESSAGES']['MSG_BILD_EXISTIERT_IN_DB'] = '%s is already saved in the database';
$GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB'] = '%s is not saved in the database';
$GLOBALS['MESSAGES']['MSG_KOMMENTAR_NICHT_GESPEICHERT'] = 'The comment was not saved in the database';
$GLOBALS['MESSAGES']['MSG_BILDER_PRO_REF_NICHT_GELOESCHT'] = 'When deleting page %s not all images could be deleted from the database';


/* * *******************************************************************************************************************
 * Meldungstexte zur Klasse picturesMaintain
 * ******************************************************************************************************************* */

// Erfolgs - Meldungen 
$GLOBALS['MESSAGES']['MSG_DATEI_UMBENANNT'] = 'The file was renamed successfully';
$GLOBALS['MESSAGES']['MSG_DATEI_GELOESCHT'] = 'File %s was deleted successfully';
$GLOBALS['MESSAGES']['MSG_DIR_GELOESCHT'] = 'Folder %s was deleted successfully';
$GLOBALS['MESSAGES']['MSG_DIR_ANGELEGT'] = 'Folder %s was created successfully';
$GLOBALS['MESSAGES']['MSG_DIR_EXISTS'] = 'Folder %s already exists';
$GLOBALS['MESSAGES']['MSG_THUMBNAIL_GESPEICHERT'] = '%s was saved successfully as a thumbnail %s';
$GLOBALS['MESSAGES']['MSG_DATEI_HOCHGELADEN'] = 'File %s was uploaded successfully';
$GLOBALS['MESSAGES']['MSG_DATEI_RESIZED'] = 'Image %s was reduced to %s x %s Pixel (max. size limit)';

// Fehler - Meldungen 
$GLOBALS['MESSAGES']['MSG_DATEI_NICHT_UMBENANNT'] = 'The file could not be renamed';
$GLOBALS['MESSAGES']['MSG_DATEI_NICHT_GELOESCHT'] = 'File %s could not be deleted!';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_ANGELEGT'] = 'Folder %s could not be created!';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_GELOESCHT'] = 'Folder %s could not be deleted!';
$GLOBALS['MESSAGES']['MSG_DIR_EXISTIERT_SCHON'] = 'Folder %s already exists - not possible to create again!';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_LEER'] = 'Folder %s cannot be deleted - it is not empty!';
$GLOBALS['MESSAGES']['MSG_THUMBNAIL_NICHT_GESPEICHERT'] = '%s could not be saved as a thumbnail!';
$GLOBALS['MESSAGES']['MSG_FALSCHER_DATEITYP'] = 'File %s does not have the correct file type to upload!';
$GLOBALS['MESSAGES']['MSG_DATEI_ZU_GROSS'] = 'The file %s exceeds the max. allowable size of %s Kb!';
$GLOBALS['MESSAGES']['MSG_DATEI_EXISTIERT_SCHON'] = 'The file %s already exists!';
$GLOBALS['MESSAGES']['MSG_DATEI_NICHT_HOCHGELADEN'] = 'The file %s could not be uploaded!';
$GLOBALS['MESSAGES']['MSG_KEINE_DATEIEN_GEFUNDEN'] = 'There are no files!';
$GLOBALS['MESSAGES']['MSG_FEHLER'] = 'There was an error!';
$GLOBALS['MESSAGES']['MSG_DISKFILE_FEHLT'] = 'File missing on the disk: %s';

// Texte
$GLOBALS['TEXTE']['INDEX_AKTUALISIEREN'] = 'Refresh index';
$GLOBALS['TEXTE']['NO_THUMBNAIL'] = 'There is no thumbnail for image: %s ';

/* * *******************************************************************************************************************
 * Texte zum Frontend
 * ******************************************************************************************************************* */
$GLOBALS['BACKUP']['VERZEICHNIS_EXISTIERT_NICHT'] = 'Folder %s does not exist!';
$GLOBALS['BACKUP']['DOWNLOAD'] = 'Save file locally';
$GLOBALS['BACKUP']['EXPLANATION'] = 'A backup is created automatically when you click the link below.';
$GLOBALS['BACKUP']['DURCHFUEHREN'] = 'Perform a database backup';
$GLOBALS['BACKUP']['SICHERUNG'] = 'Backup table: %s';
$GLOBALS['BACKUP']['SUCCESS'] = 'The backup completed successfully.';
$GLOBALS['BACKUP']['ERROR'] = 'The backup could not be completed successfully.';
$GLOBALS['BACKUP']['DATEI'] = 'Backupfile';
$GLOBALS['BACKUP']['ERSTELLT'] = 'Created';
$GLOBALS['BACKUP']['DATEIGROESSE'] = 'Size in KB';


/* * *******************************************************************************************************************
 * Texte zum Frontend
 * ******************************************************************************************************************* */
$GLOBALS['GALERIE']['FIRST_PAGE'] = 'to the first page';
$GLOBALS['GALERIE']['PREV_PAGE'] = 'previous page';
$GLOBALS['GALERIE']['NEXT_PAGE'] = 'next page';
$GLOBALS['GALERIE']['LAST_PAGE'] = 'to the last page';

$GLOBALS['LINKS']['UEBERSICHT'] = '&lt; back';
$GLOBALS['LINKS']['WEITER'] = '&gt; more';
$GLOBALS['LINKS']['GALERIE'] = '&gt; gallery';

$GLOBALS['LINKS']['GALERIE_AKTIV'] = 'Provide a link for gallery';
$GLOBALS['LINKS']['GALERIE_INAKTIV'] = 'Provide no link for gallery';
$GLOBALS['LINKS']['BILDLEISTE'] = 'Provide a image bar with links to images';
$GLOBALS['LINKS']['AUTOBILDWECHSEL'] = 'Auto image change';

$GLOBALS['LINKS']['SIEHE_AUCH'] = '&gt; ';
$GLOBALS['WEBMAIL']['TITEL'] = 'Webmail Login';

/* * *******************************************************************************************************************
 * Kontaktformular
 * ******************************************************************************************************************* */
$GLOBALS['KONTAKTFORM']['TITEL'] = 'Contactform';
$GLOBALS['KONTAKTFORM']['SENT'] = 'Thank you for contacting us!' . "<br />\n";
$GLOBALS['KONTAKTFORM']['NOT_SENT'] = 'The email could not be sent!' . "<br />\n";
$GLOBALS['KONTAKTFORM']['DATA_SENT'] = 'The following information has been submitted: ' . "<br />\n";
$GLOBALS['KONTAKTFORM']['OBLIGATORY'] = '* Please complete all fields!';
$GLOBALS['KONTAKTFORM']['NAME'] = 'Name *';
$GLOBALS['KONTAKTFORM']['ADRESSE'] = 'Address *';
$GLOBALS['KONTAKTFORM']['PLZ_ORT'] = 'ZIP / City *';
$GLOBALS['KONTAKTFORM']['TELEFON'] = 'Phone *';
$GLOBALS['KONTAKTFORM']['EMAIL'] = 'Email*';
$GLOBALS['KONTAKTFORM']['MITTEILUNG'] = 'Message';
$GLOBALS['KONTAKTFORM']['BILDCODE'] = 'Image code *';
$GLOBALS['KONTAKTFORM']['SENDEN'] = 'send';
$GLOBALS['KONTAKTFORM']['RESET'] = 'reset';
$GLOBALS['KONTAKTFORM']['CODE_FALSCH'] = 'The security code is incorrect!';
$GLOBALS['KONTAKTERROR']['MARKEDFIELDS'] = 'Please complete the highlighted fields!';
$GLOBALS['KONTAKTERROR']['WRONGEMAIL'] = 'The email address is invalid!';


/* * *******************************************************************************************************************
 * Texte zum Member-Login
 * ******************************************************************************************************************* */
$GLOBALS['MEMBER']['TITLE_LOGIN'] = 'Logon';
$GLOBALS['MEMBER']['TITLE_FORGOTTEN'] = 'Request new password';
$GLOBALS['MEMBER']['TITLE_CHANGE'] = 'Changing the password';
$GLOBALS['MEMBER']['TITLE_REGISTER'] = 'New registration';
$GLOBALS['MEMBER']['LBL_EXECUTE'] = 'Perform';
$GLOBALS['MEMBER']['EMAIL'] = 'Email';
$GLOBALS['MEMBER']['CHANGE_PW'] = 'Do you want to change your password?';
$GLOBALS['MEMBER']['CHANGE_PW_MELDUNG'] = 'Your password was successfully changed!';
$GLOBALS['MEMBER']['FORGOTTEN'] = 'Did you forget your password?';
$GLOBALS['MEMBER']['REGISTER'] = 'Do you want to register?';
$GLOBALS['MEMBER']['REGISTER_MELDUNG'] = 'Your registration was successfully completed - Please sign up now.';
$GLOBALS['MEMBER']['EXEC_LOGIN'] = 'Login';
$GLOBALS['MEMBER']['EXEC_FORGOTTEN'] = 'Request new password';
$GLOBALS['MEMBER']['EXEC_REGISTER'] = 'Registration to run';
$GLOBALS['MEMBER']['LOGIN_AND_PASSWORD'] = 'Please enter valid credentials!';
$GLOBALS['MEMBER']['EMAIL_SEND_FAILED'] = 'Your new password can not be sent by email - please try again later, thank you!';
$GLOBALS['MEMBER']['USER_NOT_EXISTS'] = 'User %s is NOT stored in the system!';
$GLOBALS['MEMBER']['USER_ALREADY_EXISTS'] = 'User %s is already stored in the system!';
$GLOBALS['MEMBER']['SAVE_FAILED'] = 'An error has occurred!';
?>
