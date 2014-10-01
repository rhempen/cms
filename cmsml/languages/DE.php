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
if(!defined('LANGUAGE_LOADED')) {
	define('LANGUAGE_LOADED', true);
}

// Set Locale auf Deutsch
setlocale (LC_ALL, 'de_DE');

// Set the language information
$language_code = 'DE';
$language_name = 'Deutsch';

/*********************************************************************************************************************
 * Texte zum cmsadmin-Login und Benutzerverwaltung
 *********************************************************************************************************************/
$GLOBALS['TEXTE']['LBL_LOGIN']							= 'Login';
$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD']				= 'Passwort &auml;ndern';
$GLOBALS['TEXTE']['LBL_NEW_PASSWORD']					= 'Passwort anfordern';
$GLOBALS['TEXTE']['ANGEMELDET']							= 'Angemeldet: ';
$GLOBALS['TEXTE']['LOGIN_FAIL']							= 'Login misslungen - Bitte nochmals versuchen!';
$GLOBALS['TEXTE']['NO_MENU']							= 'f&uuml;r diesen Benutzer ist noch kein Menu festgelegt - Bitte Administrator verst&auml;ndigen!';
$GLOBALS['TEXTE']['EXEC_LOGIN']							= 'Login ausf&uuml;hren';
$GLOBALS['TEXTE']['WELCOME']							= 'Willkommen ';
$GLOBALS['TEXTE']['USERNAME']							= 'Benutzername';
$GLOBALS['TEXTE']['PASSWORD']							= 'Passwort';
$GLOBALS['TEXTE']['OLD_PASSWORD']						= 'Altes Passwort';
$GLOBALS['TEXTE']['NEW_PASSWORD']						= 'Neues Passwort &#8211; mind. 6 Zeichen';
$GLOBALS['TEXTE']['REPEAT_PASSWORD']					= 'Passwort wiederholen';
$GLOBALS['TEXTE']['EMAIL']								= 'Emailadresse';
$GLOBALS['TEXTE']['PASSWORD_CHANGED']					= 'Das Passwort wurde erfolgreich ge&auml;ndert &#8211; Bitte neu anmelden';
$GLOBALS['TEXTE']['PASSWORD_CHANGE_FAILED']				= 'Das Passwort konnte nicht ge&auml;ndert werden';
$GLOBALS['TEXTE']['PASSWORD_LENGTH']					= 'Das neue Passwort muss mind. 6 Zeichen lang sein';
$GLOBALS['TEXTE']['PASSWORD_EQUAL']						= 'Bitte das neue Passwort identisch wiederholen';
$GLOBALS['TEXTE']['PASSWORD_NEW_EQALS_OLD']				= 'Das neue Passwort darf nicht identisch sein zum alten Passwort';
$GLOBALS['TEXTE']['ALLE_FELDER_FUELLEN']				= 'Bitte alle Felder ausf&uuml;llen';
$GLOBALS['TEXTE']['USER_NOT_EXIST']						= 'Der Benutzer %s ist unbekannt!';
$GLOBALS['TEXTE']['NEW_PASSWORD_IS']					= 'Das neue Passwort lautet: ';
$GLOBALS['TEXTE']['WRONG_EMAIL']						= 'Emailadresse ist ung&uuml;ltig ';
$GLOBALS['TEXTE']['EMAIL_SENT']							= 'Das neue Passwort wurde an folgende Adresse gesendet: %s';
$GLOBALS['TEXTE']['EMAIL_SEND_FAILED']					= 'Der Emailversand hat nicht geklappt - Bitte sp&auml;ter wieder versuchen ';
$GLOBALS['TEXTE']['EMAIL_BETREFF']						= 'Ihre Zugangsdaten zum CMS';
$GLOBALS['TEXTE']['EMAIL_TEXT']							= 'Guten Tag,'."\n".'Ihr neues Passwort lautet %s'."\n".'Bitte ändern Sie es sofort nach Erhalt.'."\n".'Vielen Dank und freundliche Grüsse'."\n".'info@hempenweb.ch';


/*********************************************************************************************************************
 * Menutexte zum CMS
 *********************************************************************************************************************/
$GLOBALS['CMS']['CMS_TITLE']							= 'CMS by hempenweb.ch';
$GLOBALS['CMS']['LBL_CMS'] 								= 'Content Management System';
$GLOBALS['CMS']['MENU01'] 								= 'Navigation';
$GLOBALS['CMS']['MENU02'] 								= 'Unterseiten';
$GLOBALS['CMS']['MENU03'] 								= 'Medienbrowser';
$GLOBALS['CMS']['MENU04'] 								= 'Explorer';
$GLOBALS['CMS']['MENU05'] 								= 'Php Info';
$GLOBALS['CMS']['MENU06'] 								= 'Links';
$GLOBALS['CMS']['MENU07'] 								= 'Backup';
$GLOBALS['CMS']['MENU08'] 								= 'Dokumentation';
$GLOBALS['CMS']['MENU09'] 								= 'Logout';
$GLOBALS['CMS']['MENU10'] 								= 'Konfiguration';
$GLOBALS['CMS']['MENU11'] 								= 'Fragmente';
$GLOBALS['CMS']['MENU12'] 								= 'Addons';
$GLOBALS['CMS']['TEXT_ANMELDEN'] 						= 'Bitte anmelden';
$GLOBALS['CMS']['TEXT_WAEHLEN'] 						= 'Bitte aus dem Menu w&auml;hlen';

/*********************************************************************************************************************
 * Texte zur Klasse frgmntsPresent
 *********************************************************************************************************************/
$GLOBALS['TEXTE']['FRAGMENTE']							= 'Fragmente';
$GLOBALS['TEXTE']['CSS']								= 'CSS';
$GLOBALS['TEXTE']['TEXT_NEW_FRGMNT']					= 'Neues Fragment';
$GLOBALS['TEXTE']['TEXT_COPY_FRGMNT']					= 'Kopie von %s';
$GLOBALS['TEXTE']['FRGMNT_CONFIRM_DELETE']				= 'Fragment %s wirklich l&ouml;schen?';
$GLOBALS['TEXTE']['TEXT_CREATE']						= 'Neues Fragment anlegen';
$GLOBALS['TEXTE']['TEXT_COPY']							= 'Kopieren';
$GLOBALS['TEXTE']['TEXT_MOVE']							= 'Verschieben';
$GLOBALS['TEXTE']['CSS_START_TEXT']						= '/* CSS-Notationen f&uuml;r Fragmente - Erstellt am: %s */';

// Erfolgsmeldungen
$GLOBALS['MESSAGES']['MSG_FRGMNT_GESPEICHERT']			= 'Das Fragment %s wurde gespeichert';
$GLOBALS['MESSAGES']['MSG_FRGMNT_GELOESCHT']			= 'Das Fragment %s wurde gel&ouml;scht';
$GLOBALS['MESSAGES']['MSG_CSS_GESPEICHERT']				= 'Die CSS-Datei %s wurde gespeichert';
$GLOBALS['MESSAGES']['MSG_CSS_NEU_ANGELEGT']			= 'Die CSS-Datei %s wurde neu erstellt';
$GLOBALS['MESSAGES']['MSG_CSS_BEARBEITEN']				= 'CSS-Datei: %s ';

// Fehlermeldungen
$GLOBALS['MESSAGES']['MSG_FRGMNT_NICHT_GESPEICHERT']	= 'Das Fragment %s konnte nicht gespeichert werden';
$GLOBALS['MESSAGES']['MSG_FRGMNT_NICHT_GELOESCHT']		= 'Das Fragment %s konnte nicht gel&ouml;scht werden';
$GLOBALS['MESSAGES']['MSG_CSS_NICHT_GESPEICHERT']		= 'Die CSS-Datei %s konnte nicht gespeichert werden';
$GLOBALS['MESSAGES']['MSG_CSS_NICHT_ANGELEGT']			= 'Die CSS-Datei %s konnte nicht erstellt werden';
$GLOBALS['MESSAGES']['MSG_CSS_BERECHTIGUNG_FAILED']		= 'Berechtigung setzen misslungen für %s';
$GLOBALS['MESSAGES']['MSG_FILE_KEINE_BERECHTIGUNG']		= 'Datei %s kann mangels Berechtigung nicht gespeichert werden ';

/*********************************************************************************************************************
 * Texte zur Klasse configPresent
 *********************************************************************************************************************/
$GLOBALS['TEXTE']['CONFIGURATION']						= 'Konfiguration';
$GLOBALS['TEXTE']['CONFIG_DESCR']						= 'Beschreibung';
$GLOBALS['TEXTE']['CONFIG_PARAM']						= 'Parameter';
$GLOBALS['TEXTE']['CONFIG_VALUE']						= 'Wert';
$GLOBALS['TEXTE']['THEME']								= 'Theme / Design / Website';
$GLOBALS['TEXTE']['COPYRIGHT']	   						= 'Copyright-Text in der Fusszeile';
$GLOBALS['TEXTE']['MAX_THUMBS']							= 'Max. angezeigte Thumbnails';
$GLOBALS['TEXTE']['MAX_LIST_ITEMS']						= 'Max. angezeigte Listeneintr&auml;ge';
$GLOBALS['TEXTE']['MAX_LENGTH_KURZTEXT']                = 'Max. L&auml;nge Kurztext';
$GLOBALS['TEXTE']['LANGUAGE']							= 'Sprache';
$GLOBALS['TEXTE']['THUMB_PAGE_MAX_WIDTH']               = 'Max. Breite der Thumbnails auf Unterseiten';
$GLOBALS['TEXTE']['THUMB_PAGE_MAX_HEIGHT']              = 'Max. H&ouml;he der Thumbnails auf Unterseiten';
$GLOBALS['TEXTE']['THUMB_NAVI_MAX_WIDTH']               = 'Max. Breite der Thumbnails auf Navigationsseiten';
$GLOBALS['TEXTE']['THUMB_NAVI_MAX_HEIGHT']              = 'Max. H&ouml;he der Thumbnails auf Navigationsseiten';
$GLOBALS['TEXTE']['IMAGE_MAX_WIDTH']					= 'Max. angezeigte Bildbreite';
$GLOBALS['TEXTE']['IMAGE_MAX_HEIGHT']					= 'Max. angezeigte Bildh&ouml;he';
$GLOBALS['TEXTE']['DISK_DB_ADJUSTMENT']                 = 'Abgleich Bilder Disk - DB';
$GLOBALS['TEXTE']['MEDIA_ROOT_ADJUSTMENT']              = 'Anpassung MEDIA-Verzeichnis';
$GLOBALS['TEXTE']['HMENU_RICHTUNG']						= 'Horizontal: Ausrichtung';
$GLOBALS['TEXTE']['HMENU_SUBMENU']						= 'Horizontal: Form Submenu';
$GLOBALS['TEXTE']['SUBMENU_DIR']						= 'Position des Submenues';
$GLOBALS['TEXTE']['SUBNAV_SOFORT']						= 'Direkt Unternavigation ansteuern';
$GLOBALS['TEXTE']['SMURL']								= 'Suchmaschinenfreundliche URL\'s';
$GLOBALS['TEXTE']['SMURL_REFRESH']						= 'SMURL-Index aktualisieren';
$GLOBALS['TEXTE']['ROOTDIR']							= 'Root-Verzeichnis des CMS';
$GLOBALS['TEXTE']['TEMPLATE_DIR']						= 'Templates-Verzeichnis';
$GLOBALS['TEXTE']['EMAIL_RECEIVER']						= 'Email-Empf&auml;nger';
$GLOBALS['TEXTE']['AUTHOR']								= 'author';
$GLOBALS['TEXTE']['DESCRIPTION']						= 'description';
$GLOBALS['TEXTE']['KEYWORDS']							= 'keywords';
$GLOBALS['TEXTE']['PAGE_TOPIC']							= 'page-topic';
$GLOBALS['TEXTE']['PUBLISHER']							= 'publisher';
$GLOBALS['TEXTE']['GOOGLE_VERIFY']						= 'google-site-verification';
$GLOBALS['TEXTE']['GOOGLE_ANALYTICS']					= 'Google-Analytics Konto';

/*********************************************************************************************************************
 * Texte zur Klasse naviPresent
 *********************************************************************************************************************/
$GLOBALS['TEXTE']['NAVI_VERWALTUNG']	 				= 'Navigation Verwaltung';
$GLOBALS['TEXTE']['TEXT_BILDER_HOCHLADEN'] 				= 'Bilder hochladen';
$GLOBALS['TEXTE']['TEXT_EDIT_HAUPTNAVI'] 				= 'Hauptnavigations-Punkt bearbeiten';
$GLOBALS['TEXTE']['TEXT_NEUE_UNTERNAVI'] 				= 'Neuen Unternavigations-Punkt einf&uuml;gen';
$GLOBALS['TEXTE']['TEXT_DELE_HAUPTNAVI'] 				= 'Hauptnavigations-Punkt l&ouml;schen';
$GLOBALS['TEXTE']['TEXT_DELE_UNTERNAVI'] 				= 'Unternavigations-Punkt l&ouml;schen';
$GLOBALS['TEXTE']['TEXT_COPY_HAUPTNAVI'] 				= 'Hauptnavigations-Punkt kopieren';
//$GLOBALS['TEXTE']['TEXT_REIHENFOLGE'] 	 				= 'Reihenfolge &auml;ndern, Bild hochziehen';
$GLOBALS['TEXTE']['TEXT_REIHENFOLGE'] 	 				= 'Reihenfolge &auml;ndern';
$GLOBALS['TEXTE']['TEXT_EDIT_UNTERNAVI'] 				= 'Unternavigations-Punkt bearbeiten';
$GLOBALS['TEXTE']['TEXT_NEUE_HAUPTNAVI'] 				= 'Neuer Hauptnavigationspunkt';
$GLOBALS['TEXTE']['NAVI_GUELTIGKEIT'] 	 				= 'G&uuml;ltigkeit';
$GLOBALS['TEXTE']['NAVI_AKTIV']							= 'Aktiv';
$GLOBALS['TEXTE']['NAVI_BEZEICHNUNG'] 	 				= 'Bezeichnung';
$GLOBALS['TEXTE']['NAVI_BEARBEITEN'] 	 				= 'Bearbeiten';
$GLOBALS['TEXTE']['NAVI_SERVICE'] 		 				= 'Type';
$GLOBALS['TEXTE']['NAVI_START']							= 'Start';
$GLOBALS['TEXTE']['TEXT_KEINE_UNAV'] 	 				= 'Servicenavigation kann keine Unternavigation haben';
$GLOBALS['TEXTE']['ABBRECHEN']							= 'Abbrechen';
$GLOBALS['TEXTE']['SERVICENAVIGATION']	 				= 'Servicenavigation';
$GLOBALS['TEXTE']['HORIZ_HAUPTNAVIGATION']	 			= 'Hauptnavigation horizontal';
$GLOBALS['TEXTE']['VERTI_HAUPTNAVIGATION']	 			= 'Hauptnavigation vertikal';
$GLOBALS['TEXTE']['JA']									= 'Ja';
$GLOBALS['TEXTE']['NEIN']								= 'Nein';
$GLOBALS['TEXTE']['FREIGEGEBEN']						= 'freigegeben';
$GLOBALS['TEXTE']['BLOCKIERT']							= 'blockiert';
$GLOBALS['NAVI']['HORIZONTAL']							= 'H';
$GLOBALS['NAVI']['VERTIKAL']							= 'V';
$GLOBALS['NAVI']['SERVICE']								= 'S';


/*********************************************************************************************************************
 * Texte zur Klasse naviMaintain
 *********************************************************************************************************************/
// Erfolgsmeldungen
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_ANGELEGT'] 		= 'Der Navigationspunkt %s und die zugeh&ouml;rige Seite wurden erstellt';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_GESPEICHERT'] 		= 'Die Seite %s wurde gespeichert';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_GELOESCHT'] 		= 'Der Navigationspunkt %s und alle zugeh&ouml;rigen Daten wurden entfernt';
$GLOBALS['MESSAGES']['MSG_KAP_HOCHZIEHEN']				= 'Der Navigationspunkt %s wurde hochgezogen';
$GLOBALS['MESSAGES']['MSG_UKAP_HOCHZIEHEN']				= 'Der Unternavigationspunkt %s wurde hochgezogen';
$GLOBALS['MESSAGES']['MSG_NEU_SORTIERT']   				= 'Die Datens&auml;tze wurden neu sortiert!';

// Fehlermeldungen
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_GESPEICHERT']= 'Die Seite %s wurde nicht gespeichert';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_ANGELEGT'] 	= 'Der Navigationspunkt %s konnte nicht erfolgreich angelegt werden!';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_GELOESCHT'] 	= 'Beim L&ouml;schen des Navigationspunktes %s sind Fehler aufgetreten!';
$GLOBALS['MESSAGES']['MSG_NAVI_NICHT_LOESCHBAR']		= 'Noch %s verkn&uuml;pfte Unterseite(n) - bitte zuerst Unterseite(n) l&ouml;schen!';
$GLOBALS['MESSAGES']['MSG_NICHT_NEU_SORTIERT']   		= 'Die Datens&auml;tze konnten nicht neu sortiert werden!';

/*********************************************************************************************************************
 * Labels zu Formularen navi_edit, page_edit
 *********************************************************************************************************************/
$GLOBALS['LABELS']['SIE_BEARBEITEN_SEITE']				= 'Sie bearbeiten die Seite:';
$GLOBALS['LABELS']['SEITEN_INFO']						= 'Seiteninfo';
$GLOBALS['LABELS']['SEITEN_INFO_VALUES']				= 'SeitenID: %s / NavID: %s / Verzeichnis: %s';
$GLOBALS['LABELS']['MESSAGE']							= 'Meldung';
$GLOBALS['LABELS']['TEMPLATE']							= 'Template';
$GLOBALS['LABELS']['INTEGRATION']						= 'Integration';
$GLOBALS['LABELS']['MODUL']								= 'Modul';
$GLOBALS['LABELS']['MEMBERLOGIN']						= 'Member-Login';
$GLOBALS['LABELS']['SEITENTITEL']						= 'Seitentitel<br />(60 Zeichen)';
$GLOBALS['LABELS']['ZUSATZTEXT']						= 'Zusatztext<br />(60 Zeichen)';
$GLOBALS['LABELS']['KURZTEXT']							= 'Kurztext';
$GLOBALS['LABELS']['INHALTSTEXT']						= 'Inhaltstext';
$GLOBALS['LABELS']['INHALT2']							= 'Inhaltstext Zusatzspalte';
$GLOBALS['LABELS']['VONBIS']							= 'von &#8211; bis';
$GLOBALS['LABELS']['BILD']								= 'Bild';
$GLOBALS['LABELS']['BILD1']								= 'Bild 1';
$GLOBALS['LABELS']['BILD2']								= 'Bild 2';
$GLOBALS['LABELS']['BILDERGALERIE']						= 'Bildergalerie';
$GLOBALS['LABELS']['LINK1']								= 'Link 1';
$GLOBALS['LABELS']['LINK2']								= 'Link 2';
$GLOBALS['LABELS']['SEITE_AKTIV']						= 'Seite ist aktiv';
$GLOBALS['LABELS']['ESCAPE']							= 'abbrechen';
$GLOBALS['LABELS']['RESET']								= 'zur&uuml;cksetzen';
$GLOBALS['LABELS']['SAVE']								= 'sichern';
$GLOBALS['LABELS']['ZEICHEN']							= 'Restl. Zeichen: ';
$GLOBALS['LABELS']['MAXZEICHEN']						= 'Max. Zeichen: ';
$GLOBALS['LABELS']['MEMBERLOGIN']						= 'Member-Login';
$GLOBALS['LABELS']['ERFORDERLICH']						= 'erforderlich';
$GLOBALS['LABELS']['NICHT_ERFORDERLICH']				= 'nicht erforderlich';

/*********************************************************************************************************************
 * Texte zur Klasse redirectMaintain
 *********************************************************************************************************************/
// Erfolgsmeldungen
//$GLOBALS['MESSAGES']['REDIRECT_GESPEICHERT']			= 'Eintrag in Indextabelle wurde erfolgreich gespeichert: %s';
//$GLOBALS['MESSAGES']['REDIRECT_GELOESCHT']				= 'Eintrag in Indextabelle erfolgreich gel&ouml;scht: %s';
$GLOBALS['MESSAGES']['REDIRECT_GESPEICHERT']			= 'Eintrag gespeichert: %s';
$GLOBALS['MESSAGES']['REDIRECT_GELOESCHT']				= 'Eintrag gel&ouml;scht: %s';

// Fehlermeldungen
$GLOBALS['MESSAGES']['REDIRECT_NO_NAVID']				= 'Operation auf '.TABLE_PREFIX.'redirect nicht m&ouml;glich, da keine Navid &uuml;bergeben wurde! %s';
$GLOBALS['MESSAGES']['REDIRECT_NICHT_GESPEICHERT'] 		= 'Eintrag in '.TABLE_PREFIX.'redirect konnte nicht gespeichert werden: %s';
$GLOBALS['MESSAGES']['REDIRECT_NICHT_GELOESCHT'] 		= 'Eintrag in Indextabelle konnte nicht gel&ouml;scht werden: %s';
 
/*********************************************************************************************************************
 * Meldungstexte zur Klasse pagesMaintain
 *********************************************************************************************************************/
// Texte zu Seitenverwaltung
$GLOBALS['TEXTE']['TEXT_MODUL_SELECT'] 					= 'Kein Modul = es wird der Inhalt dieser Seite angezeigt';
$GLOBALS['TEXTE']['TEXT_UNTERSEITE']					= 'Unterseite zu ';

// Texte zu SEITEN-Verwaltung
$GLOBALS['TEXTE']['TEXT_PLUS_MINUS'] 					= 'Auf- oder Zuklappen';
// $GLOBALS['TEXTE']['TEXT_UPLOAD'] 						= "Bilder verwalten: Informationen zu Bilder / Bilder hochladen / Bilder l&ouml;schen";
$GLOBALS['TEXTE']['TEXT_UPLOAD'] 						= "Bilder verwalten";
$GLOBALS['TEXTE']['TEXT_EDIT'] 							= 'Bearbeiten';
$GLOBALS['TEXTE']['TEXT_DELETE'] 						= 'L&ouml;schen';
$GLOBALS['TEXTE']['TEXT_PAGE_EDIT'] 					= 'Seiteninhalt bearbeiten';
$GLOBALS['TEXTE']['TEXT_PAGE_DELETE'] 					= 'Seite l&ouml;schen';
$GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE'] 				= 'Seite wirklich L&ouml;schen?';
$GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE_FILE'] 			= 'Datei wirklich L&ouml;schen?';
$GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE_DIR'] 			= 'Verzeichnis wirklich L&ouml;schen?';
$GLOBALS['TEXTE']['TEXT_NEUE_SEITE'] 					= 'Neue Seite';
$GLOBALS['TEXTE']['TEXT_SELECTBOX_AUWAHL'] 				= 'Bitte ausw&auml;hlen...';
$GLOBALS['TEXTE']['TEXT_SELECTBOX_LEER'] 				= 'Keine Daten gefunden...';
$GLOBALS['TEXTE']['TEXT_AKTIV'] 						= 'aktiv';
$GLOBALS['TEXTE']['TEXT_INAKTIV'] 						= 'inaktiv';
$GLOBALS['TEXTE']['TEXT_AUFWAERTS'] 					= '^Aufw&auml;rts';
$GLOBALS['TEXTE']['TEXT_SHOW'] 							= 'Anzeigen';
$GLOBALS['TEXTE']['TEXT_BILD_SHOW'] 					= 'Bild in voller Gr&ouml;sse anzeigen';
$GLOBALS['TEXTE']['TEXT_BILDER_EDIT'] 					= "Kommentar zu Bildern bearbeiten / Reihenfolge &auml;ndern";
$GLOBALS['TEXTE']['TEXT_BILD_DELETE'] 					= 'Dieses Bild l&ouml;schen';
$GLOBALS['TEXTE']['TEXT_DIR_DELETE'] 					= 'Dieses Verzeichnis l&ouml;schen';
$GLOBALS['TEXTE']['TEXT_FILETYPE'] 						= 'Verzeichnis &ouml;ffnen';
$GLOBALS['TEXTE']['TEXT_TRANSLATE']						= '&Uuml;bersetzen';

// Texte zu Medienbrowser
$GLOBALS['TEXTE']['TEXT_SEITE'] 						= 'Seite: ';
$GLOBALS['TEXTE']['TEXT_BASIS_BILDER'] 					= 'Basisverzeichnis f&uuml;r Bilder: ';
$GLOBALS['TEXTE']['TEXT_AKT_VERZEICHNIS'] 				= 'Verzeichnis';
$GLOBALS['TEXTE']['TEXT_VORHANDENE_DIRS'] 				= 'vorhandene Verzeichnisse';
$GLOBALS['TEXTE']['TEXT_ZIELVERZEICHNIS'] 				= 'Zielverzeichnis';
$GLOBALS['TEXTE']['TEXT_NEUES_VERZEICHNIS'] 			= 'Neues Verzeichnis';
$GLOBALS['TEXTE']['TEXT_DATEIEN_LADEN'] 				= 'Dateien auf den Server laden';
$GLOBALS['TEXTE']['TEXT_THUMBNAILS_ERSTELLEN'] 			= 'Thumbnails erstellen';
$GLOBALS['TEXTE']['TEXT_KOMMENTARE_ERFASSEN'] 			= 'Kommentar zu Bildern erfassen';

// Menupositionen f�r Medienbrowser
$GLOBALS['MENUE']['TEXT_CREATE_DIR'] 					= 'Verzeichnis anlegen';
$GLOBALS['MENUE']['TEXT_UPLOAD_PICS'] 					= 'Bilder hochladen';
$GLOBALS['MENUE']['TEXT_EDIT_COMMENTS'] 				= 'Bilderkommentare pflegen';
$GLOBALS['MENUE']['TEXT_SHOW_PICS'] 					= 'Bilder zeigen';
$GLOBALS['MENUE']['TEXT_HIDE_PICS'] 					= 'Bilder verbergen';
$GLOBALS['MENUE']['TEXT_GOTO_PICS'] 					= 'zum Bilderverzeichnis';
$GLOBALS['MENUE']['TEXT_GOTO_REFID']					= 'Seite bearbeiten';
$GLOBALS['MENUE']['TEXT_ZURUECK'] 						= 'zur&uuml;ck';

// Erfolgs - Meldungen 
$GLOBALS['MESSAGES']['MSG_SEITE_GESPEICHERT'] 			= 'Die Seite %s wurde gespeichert';
$GLOBALS['MESSAGES']['MSG_SEITE_GELOESCHT'] 			= 'Die Seite %s wurde erfolgreich gel&ouml;scht';
$GLOBALS['MESSAGES']['MSG_BILD_IN_DB_GESPEICHERT'] 		= '%s wurde in der Datenbank gespeichert';
$GLOBALS['MESSAGES']['MSG_BILD_IN_DB_GELOESCHT'] 		= '%s wurde in der Datenbank gel&ouml;scht';
$GLOBALS['MESSAGES']['MSG_KOMMENTAR_GESPEICHERT'] 		= 'Der Kommentar wurde gespeichert';
$GLOBALS['MESSAGES']['MSG_BILD_HOCHGEZOGEN'] 			= 'Das Bild wurde hochgezogen';
$GLOBALS['MESSAGES']['MSG_BILDER_PRO_REF_GELOESCHT'] 	= 'F&uuml;r die Seite %s wurden alle Bilder aus der DB gel&ouml;scht';

// Fehler - Meldungen 
$GLOBALS['MESSAGES']['MSG_NOTHING_FOUND'] 				= 'Es wurden keine Daten zum Bearbeiten gefunden';
$GLOBALS['MESSAGES']['MSG_SEITENTITEL_EINGEBEN'] 		= 'Bitte einen Seitentitel eingeben';
$GLOBALS['MESSAGES']['MSG_KURZTEXT_EINGEBEN'] 			= 'Bitte einen Kurztext eingeben';
$GLOBALS['MESSAGES']['MSG_LANGTEXT_EINGEBEN'] 			= 'Bitte einen Langtext eingeben';
$GLOBALS['MESSAGES']['MSG_DATUM_UNGUELTIG'] 			= '%s ist kein g&uuml;ltiges Datum';
$GLOBALS['MESSAGES']['MSG_DATUM_FORMAT'] 				= 'Bitte das Datum im Format DD.MM.JJJJ eingeben';
$GLOBALS['MESSAGES']['MSG_DATUMBIS_KLEINER_DATUMVON'] 	= '%s ist kleiner als das Von-Datum %s';
$GLOBALS['MESSAGES']['MSG_SEITE_NICHT_GESPEICHERT'] 	= 'Die Seite %s wurde nicht gespeichert';
$GLOBALS['MESSAGES']['MSG_SEITE_NICHT_GELOESCHT'] 		= 'Die Seite %s konnte nicht gel&ouml;scht werden';
$GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB_GESPEICHERT'] = '%s konnte nicht in der Datenbank gespeichert werden';
$GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB_GELOESCHT'] 	= '%s konnte nicht in der Datenbank gel&ouml;scht werden';
$GLOBALS['MESSAGES']['MSG_BILD_EXISTIERT_IN_DB'] 		= '%s war bereits in der Datenbank gespeichert';
$GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB'] 			= '%s ist nicht der Datenbank gespeichert';
$GLOBALS['MESSAGES']['MSG_KOMMENTAR_NICHT_GESPEICHERT'] = 'Der Kommentar wurde nicht gespeichert';
$GLOBALS['MESSAGES']['MSG_BILDER_PRO_REF_NICHT_GELOESCHT'] = 'Beim L&ouml;schen der Seite %s konnten nicht alle Bilder aus der DB gel&ouml;scht werden';


/*********************************************************************************************************************
 * Meldungstexte zur Klasse picturesMaintain
 *********************************************************************************************************************/

// Erfolgs - Meldungen 
$GLOBALS['MESSAGES']['MSG_DATEI_UMBENANNT'] 			= 'Die Datei wurde erfolgreich umbenannt';
$GLOBALS['MESSAGES']['MSG_DATEI_GELOESCHT'] 			= 'Die Datei %s wurde erfolgreich gel&ouml;scht';
$GLOBALS['MESSAGES']['MSG_DIR_GELOESCHT'] 				= 'Das Verzeichnis %s wurde erfolgreich gel&ouml;scht';
$GLOBALS['MESSAGES']['MSG_DIR_ANGELEGT'] 				= 'Das Verzeichnis %s wurde erfolgreich angelegt';
$GLOBALS['MESSAGES']['MSG_DIR_EXISTS'] 					= 'Das Verzeichnis %s existiert bereits';
$GLOBALS['MESSAGES']['MSG_THUMBNAIL_GESPEICHERT'] 		= '%s wurde erfolgreich als Thumbnail %s gespeichert';
$GLOBALS['MESSAGES']['MSG_DATEI_HOCHGELADEN'] 			= 'Die Datei %s wurde erfolgreich hochgeladen';
$GLOBALS['MESSAGES']['MSG_DATEI_RESIZED'] 				= 'Die Datei %s wurde auf die max. zul&auml;ssige Gr&ouml;sse von %s x %s Pixel verkleinert';

// Fehler - Meldungen 
$GLOBALS['MESSAGES']['MSG_DATEI_NICHT_UMBENANNT'] 		= 'Die Datei konnte nicht umbenannt werden';
$GLOBALS['MESSAGES']['MSG_DATEI_NICHT_GELOESCHT'] 		= 'Die Datei %s konnte nicht gel&ouml;scht werden!';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_ANGELEGT'] 			= 'Das Verzeichnis %s konnte nicht angelegt werden!';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_GELOESCHT'] 		= 'Das Verzeichnis %s konnte nicht gel&ouml;scht werden!';
$GLOBALS['MESSAGES']['MSG_DIR_EXISTIERT_SCHON'] 		= 'Verzeichnis %s existiert schon - Anlegen nicht m&ouml;glich!';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_LEER'] 				= 'Das Verzeichnis %s kann nicht gel&ouml;scht werden - Es ist nicht leer!';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_ANGELEGT'] 			= 'Verzeichnis %s konnte nicht angelegt werden!';
$GLOBALS['MESSAGES']['MSG_THUMBNAIL_NICHT_GESPEICHERT'] = '%s konnte nicht als Thumbnail gespeichert werden!';
$GLOBALS['MESSAGES']['MSG_FALSCHER_DATEITYP'] 			= 'Die Datei %s hat nicht den richtigen Dateityp zum Hochladen!';
$GLOBALS['MESSAGES']['MSG_DATEI_ZU_GROSS'] 				= 'Die Datei %s &uuml;berschreitet die max. zul&auml;ssige Gr&ouml;sse von %s Kb!';
$GLOBALS['MESSAGES']['MSG_DATEI_EXISTIERT_SCHON'] 		= 'Die Datei %s existiert bereits!';
$GLOBALS['MESSAGES']['MSG_DATEI_NICHT_HOCHGELADEN'] 	= 'Die Datei %s  konnte nicht hochgeladen werden!';
$GLOBALS['MESSAGES']['MSG_KEINE_DATEIEN_GEFUNDEN']		= 'Keine Dateien vorhanden!';
$GLOBALS['MESSAGES']['MSG_FEHLER'] 						= 'Es ist ein Fehler aufgetreten!';
$GLOBALS['MESSAGES']['MSG_DISKFILE_FEHLT'] 				= 'Datei fehlt auf der Disk: %s';

// Texte
$GLOBALS['TEXTE']['INDEX_AKTUALISIEREN']				= 'Index aktualisieren';
$GLOBALS['TEXTE']['NO_THUMBNAIL']						= 'Es existiert kein Thumbnail zum Bild: ';

/*********************************************************************************************************************
 * Texte zum Frontend
 *********************************************************************************************************************/
$GLOBALS['BACKUP']['VERZEICHNIS_EXISTIERT_NICHT'] 		= 'Das Verzeichnis %s existiert nicht!';
$GLOBALS['BACKUP']['DOWNLOAD'] 							= 'Datei lokal speichern';
$GLOBALS['BACKUP']['EXPLANATION']	 					= 'Ein Backup wird automatisch erstellt, wenn sie unten stehenden Link anw&auml;hlen.';
$GLOBALS['BACKUP']['DURCHFUEHREN']	 					= 'Backup der Datenbank durchf&uuml;hren';
$GLOBALS['BACKUP']['SICHERUNG']		 					= 'Sicherung der Tabelle: %s';
$GLOBALS['BACKUP']['SUCCESS']	 						= 'Der Backup wurde erfolgreich beendet.';
$GLOBALS['BACKUP']['ERROR']		 						= 'Der Backup konnte nicht erfolgreich beendet werden.';
$GLOBALS['BACKUP']['DATEI']		 						= 'Backupdatei';
$GLOBALS['BACKUP']['ERSTELLT']		 					= 'Erstellt am';
$GLOBALS['BACKUP']['DATEIGROESSE']		 				= 'Gr&ouml;sse in KB';


/*********************************************************************************************************************
 * Texte zum Frontend
 *********************************************************************************************************************/
$GLOBALS['GALERIE']['FIRST_PAGE'] 						= 'zur ersten Seite';
$GLOBALS['GALERIE']['PREV_PAGE'] 						= 'eine Seite zur&uuml;ck';
$GLOBALS['GALERIE']['NEXT_PAGE'] 						= 'eine Seite vorw&auml;rts' ;
$GLOBALS['GALERIE']['LAST_PAGE'] 						= 'zur letzten Seite';

$GLOBALS['LINKS']['UEBERSICHT']							= '&lt; zur&uuml;ck';
$GLOBALS['LINKS']['WEITER']								= '&gt; mehr'; 
$GLOBALS['LINKS']['GALERIE'] 							= '&gt; galerie';

$GLOBALS['LINKS']['GALERIE_AKTIV'] 						= 'Link f&uuml;r Galerie anbieten';
$GLOBALS['LINKS']['GALERIE_INAKTIV'] 					= 'Keinen Link f&uuml;r Galerie anbieten';
$GLOBALS['LINKS']['BILDLEISTE'] 						= 'Bildleiste mit Links auf Bilder anbieten';
$GLOBALS['LINKS']['AUTOBILDWECHSEL'] 					= 'Automatischer Bildwechsel';

$GLOBALS['LINKS']['SIEHE_AUCH'] 						= '&gt; ';
$GLOBALS['WEBMAIL']['TITEL'] 							= 'Webmail Login';

/*********************************************************************************************************************
 * Kontaktformular
 *********************************************************************************************************************/
$GLOBALS['KONTAKTFORM']['TITEL'] 						= 'Kontaktformular';
$GLOBALS['KONTAKTFORM']['SENT'] 						= 'Vielen Dank f&uuml;r Ihre Kontaktaufnahme!'."<br />\n";
$GLOBALS['KONTAKTFORM']['NOT_SENT']						= 'Das Mail konnte leider nicht gesendet werden!'."<br />\n";
$GLOBALS['KONTAKTFORM']['DATA_SENT']					= 'Folgende Daten wurden gesendet: '."<br />\n";
$GLOBALS['KONTAKTFORM']['OBLIGATORY']                   = 'Bitte alle * Felder ausf&uuml;llen!';
$GLOBALS['KONTAKTFORM']['NAME']                         = 'Name *';
$GLOBALS['KONTAKTFORM']['ADRESSE']                      = 'Adresse *';
$GLOBALS['KONTAKTFORM']['PLZ_ORT']                      = 'Plz / Ort *';
$GLOBALS['KONTAKTFORM']['TELEFON']                      = 'Telefon *';
$GLOBALS['KONTAKTFORM']['EMAIL']                        = 'E-Mail *';
$GLOBALS['KONTAKTFORM']['MITTEILUNG']                   = 'Mitteilung';
$GLOBALS['KONTAKTFORM']['BILDCODE']                     = 'Bild-Code *';
$GLOBALS['KONTAKTFORM']['SENDEN']                       = 'senden';
$GLOBALS['KONTAKTFORM']['RESET']                        = 'zur&uuml;cksetzen';
$GLOBALS['KONTAKTFORM']['CODE_FALSCH']                  = 'Der Sicherheitscode ist nicht korrekt!';
$GLOBALS['KONTAKTERROR']['MARKEDFIELDS']                = 'Bitte f&uuml;llen Sie die markierten Felder aus';
$GLOBALS['KONTAKTERROR']['WRONGEMAIL']                  = 'Die Emailadresse ist ung&uuml;ltig!';

/*********************************************************************************************************************
 * Texte zum Member-Login
 *********************************************************************************************************************/
$GLOBALS['MEMBER']['TITLE_LOGIN']                       = 'Anmelden';
$GLOBALS['MEMBER']['TITLE_FORGOTTEN']                   = 'Neues Passwort anfordern';
$GLOBALS['MEMBER']['TITLE_CHANGE']                      = 'Passwort &auml;ndern';
$GLOBALS['MEMBER']['TITLE_REGISTER']                    = 'Neue Registrierung';
$GLOBALS['MEMBER']['LBL_EXECUTE']                       = 'Ausf&uuml;hren';
$GLOBALS['MEMBER']['EMAIL']                             = 'Email';
$GLOBALS['MEMBER']['CHANGE_PW']                         = 'Wollen Sie Ihr Passwort &auml;ndern?';
$GLOBALS['MEMBER']['CHANGE_PW_MELDUNG']                 = 'Ihr Passwort wurde erfolgreich ge&auml;ndert!';
$GLOBALS['MEMBER']['FORGOTTEN']                         = 'Haben Sie Ihr Passwort vergessen?';
$GLOBALS['MEMBER']['REGISTER']                          = 'Wollen Sie sich neu registrieren?';
$GLOBALS['MEMBER']['REGISTER_MELDUNG']    				= 'Ihre Registrierung wurde erfolgreich abgschlossen - Bitte melden Sie sich jetzt an.';
$GLOBALS['MEMBER']['EXEC_LOGIN']                        = 'Login ausf&uuml;hren';
$GLOBALS['MEMBER']['EXEC_FORGOTTEN']                    = 'Neues Passwort anfordern';
$GLOBALS['MEMBER']['EXEC_REGISTER']                     = 'Registrierung ausf&uuml;hren';
$GLOBALS['MEMBER']['LOGIN_AND_PASSWORD']                = 'Bitte geben Sie g&uuml;ltige Anmeldedaten ein!';
$GLOBALS['MEMBER']['EMAIL_SEND_FAILED']					= 'Ihr neues Passwort konnte nicht per Email gesendet werden - Bitte versuchen Sie es sp&auml;ter wieder, Danke!';
$GLOBALS['MEMBER']['IHR_NEUES_PASSWORT']                = 'Ihr neues Passwort für den Memberbereich';
$GLOBALS['MEMBER']['USER_NOT_EXISTS']   				= 'Der Benutzer %s ist NICHT im System gespeichert!';
$GLOBALS['MEMBER']['USER_ALREADY_EXISTS']				= 'Der Benutzer %s ist bereits im System gespeichert!';
$GLOBALS['MEMBER']['SAVE_FAILED']        				= 'Beim Speichern Ihrer Anmeldedaten ist ein Fehler aufgetreten!';


?>
