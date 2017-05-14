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
setlocale(LC_ALL, 'it_IT');

// Set the language information
$language_code = 'IT';
$language_name = 'Italiano';

/* * *******************************************************************************************************************
 * Texte zum cmsadmin-Login und Benutzerverwaltung
 * ******************************************************************************************************************* */
$GLOBALS['TEXTE']['LBL_LOGIN'] = 'Login';
$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD'] = 'Modifica la password';
$GLOBALS['TEXTE']['LBL_NEW_PASSWORD'] = 'Richiedi la password';
$GLOBALS['TEXTE']['ANGEMELDET'] = 'Connessa/o: ';
$GLOBALS['TEXTE']['LOGIN_FAIL'] = 'Impossibile effettuare il login - Prego riprovare';
$GLOBALS['TEXTE']['NO_MENU'] = 'Per questo utente non è ancora stato definito nessun menu - Prego contattare l\'amministratore';
$GLOBALS['TEXTE']['EXEC_LOGIN'] = 'Accedi';
$GLOBALS['TEXTE']['WELCOME'] = 'Benvenuta/o ';
$GLOBALS['TEXTE']['USERNAME'] = 'Nome utente';
$GLOBALS['TEXTE']['PASSWORD'] = 'Password';
$GLOBALS['TEXTE']['OLD_PASSWORD'] = 'Vecchia password';
$GLOBALS['TEXTE']['NEW_PASSWORD'] = 'Nuova password &#8211; deve contenere almeno 6 caratteri';
$GLOBALS['TEXTE']['REPEAT_PASSWORD'] = 'Ripetere la password';
$GLOBALS['TEXTE']['EMAIL'] = 'Indirizzo e-mail';
$GLOBALS['TEXTE']['PASSWORD_CHANGED'] = 'La password è stata modificata &#8211; Prego riconnettersi';
$GLOBALS['TEXTE']['PASSWORD_CHANGE_FAILED'] = 'Impossibile modificare la password';
$GLOBALS['TEXTE']['PASSWORD_LENGTH'] = 'La nuova password deve contenere almeno 6 caratteri';
$GLOBALS['TEXTE']['PASSWORD_EQUAL'] = 'Ripetere la nuova password in modo identico';
$GLOBALS['TEXTE']['PASSWORD_NEW_EQALS_OLD'] = 'La nuova password non deve essere identica alla vecchia';
$GLOBALS['TEXTE']['ALLE_FELDER_FUELLEN'] = 'Prego compilare tutti i campi';
$GLOBALS['TEXTE']['USER_NOT_EXIST'] = 'Utente %s sconosciuto!';
$GLOBALS['TEXTE']['NEW_PASSWORD_IS'] = 'La nuova password è: ';
$GLOBALS['TEXTE']['WRONG_EMAIL'] = 'L\'indirizzo e-mail non è valido ';
$GLOBALS['TEXTE']['EMAIL_SENT'] = 'La nuova password è stata inviata al seguente indirizzo: %s';
$GLOBALS['TEXTE']['EMAIL_SEND_FAILED'] = 'Impossibile inviare e-mail - Prego riprovare più tardi ';
$GLOBALS['TEXTE']['EMAIL_BETREFF'] = 'Dati d\'accesso personali al CMS';
$GLOBALS['TEXTE']['EMAIL_TEXT'] = 'Buongiorno,' . "\n" . 'la nuova password è %s' . "\n" . 'E\' necessario modificare la password subito dopo averla ricevuta.' . "\n" . 'Cordiali saluti' . "\n" . 'info@hempenweb.ch';


/* * *******************************************************************************************************************
 * Menutexte zum CMS
 * ******************************************************************************************************************* */
$GLOBALS['CMS']['CMS_TITLE'] = 'CMS by hempenweb.ch';
$GLOBALS['CMS']['LBL_CMS'] = 'Sistema di gestione dei contenuti';
$GLOBALS['CMS']['MENU01'] = 'Navigazione';
$GLOBALS['CMS']['MENU02'] = 'Sottopagine';
$GLOBALS['CMS']['MENU03'] = 'Navigatore d\'immagini';
$GLOBALS['CMS']['MENU04'] = 'Explorer';
$GLOBALS['CMS']['MENU05'] = 'Php Info';
$GLOBALS['CMS']['MENU06'] = 'Link';
$GLOBALS['CMS']['MENU07'] = 'Copia di sicurezza';
$GLOBALS['CMS']['MENU08'] = 'Documentazione';
$GLOBALS['CMS']['MENU09'] = 'Logout';
$GLOBALS['CMS']['MENU10'] = 'Configurazione';
$GLOBALS['CMS']['MENU11'] = 'Frammenti';
$GLOBALS['CMS']['MENU12'] = 'Addons';
$GLOBALS['CMS']['TEXT_ANMELDEN'] = 'Prego connettersi';
$GLOBALS['CMS']['TEXT_WAEHLEN'] = 'Prego scegliere un\'opzione del menu';

/* * *******************************************************************************************************************
 * Texte zur Klasse frgmntsPresent
 * ******************************************************************************************************************* */
$GLOBALS['TEXTE']['FRAGMENTE'] = 'Frammenti';
$GLOBALS['TEXTE']['CSS'] = 'CSS';
$GLOBALS['TEXTE']['TEXT_NEW_FRGMNT'] = 'Nuovo frammento';
$GLOBALS['TEXTE']['TEXT_COPY_FRGMNT'] = 'Copia di %s';
$GLOBALS['TEXTE']['FRGMNT_CONFIRM_DELETE'] = 'Eliminare veramente il frammento %s?';
$GLOBALS['TEXTE']['TEXT_CREATE'] = 'Creare un nuovo frammento';
$GLOBALS['TEXTE']['TEXT_COPY'] = 'Copia';
$GLOBALS['TEXTE']['TEXT_MOVE'] = 'Sposta';
$GLOBALS['TEXTE']['CSS_START_TEXT'] = '/* Notazione CSS dei frammenti - Data di creazione: %s */';

// Erfolgsmeldungen
$GLOBALS['MESSAGES']['MSG_FRGMNT_GESPEICHERT'] = 'Il frammento %s è stato salvato';
$GLOBALS['MESSAGES']['MSG_FRGMNT_GELOESCHT'] = 'Il frammento %s è stato eliminato';
$GLOBALS['MESSAGES']['MSG_CSS_GESPEICHERT'] = 'Il file CSS %s è stato salvato';
$GLOBALS['MESSAGES']['MSG_CSS_NEU_ANGELEGT'] = 'Il file CSS %s è stato ricreato';
$GLOBALS['MESSAGES']['MSG_CSS_BEARBEITEN'] = 'File CSS: %s ';

// Fehlermeldungen
$GLOBALS['MESSAGES']['MSG_FRGMNT_NICHT_GESPEICHERT'] = 'Impossibile salvare il frammento %s';
$GLOBALS['MESSAGES']['MSG_FRGMNT_NICHT_GELOESCHT'] = 'Impossibile eliminare il frammento %s';
$GLOBALS['MESSAGES']['MSG_CSS_NICHT_GESPEICHERT'] = 'Impossibile salvare il file CSS %s';
$GLOBALS['MESSAGES']['MSG_CSS_NICHT_ANGELEGT'] = 'Impossibile creare il file CSS %s';
$GLOBALS['MESSAGES']['MSG_CSS_BERECHTIGUNG_FAILED'] = 'Impossibile assegnare l\'autorizzazione all\'utente %s';
$GLOBALS['MESSAGES']['MSG_FILE_KEINE_BERECHTIGUNG'] = 'Impossibile salvare il file %s per mancanza d\'autorizzazione ';

/* * *******************************************************************************************************************
 * Texte zur Klasse configPresent
 * ******************************************************************************************************************* */
$GLOBALS['TEXTE']['CONFIGURATION'] = 'Configurazione';
$GLOBALS['TEXTE']['CONFIG_DESCR'] = 'Descrizione';
$GLOBALS['TEXTE']['CONFIG_PARAM'] = 'Parametro';
$GLOBALS['TEXTE']['CONFIG_VALUE'] = 'Valore';
$GLOBALS['TEXTE']['THEME'] = 'Tema / Design';
$GLOBALS['TEXTE']['COPYRIGHT'] = 'Copyright a piè di pagina';
$GLOBALS['TEXTE']['VERSION'] = 'Versione ';
$GLOBALS['TEXTE']['MAX_THUMBS'] = 'Numero max. di thumbnail visualizzate';
$GLOBALS['TEXTE']['MAX_LIST_ITEMS'] = 'Numero max. di dati visualizzati nella lista';
$GLOBALS['TEXTE']['LANGUAGE'] = 'Lingua';
$GLOBALS['TEXTE']['THUMB_PAGE_MAX_WIDTH'] = 'Larghezza max. delle thumbnail nelle sottopagine';
$GLOBALS['TEXTE']['THUMB_PAGE_MAX_HEIGHT'] = 'Altezza max. delle thumbnail nelle sottopagine';
$GLOBALS['TEXTE']['THUMB_NAVI_MAX_WIDTH'] = 'Larghezza max. delle thumbnail nelle pagine di navigazione';
$GLOBALS['TEXTE']['THUMB_NAVI_MAX_HEIGHT'] = 'Altezza max. delle thumbnail nelle pagine di navigazione';
$GLOBALS['TEXTE']['IMAGE_MAX_WIDTH'] = 'Larghezza max. dell\'immagine visualizzata';
$GLOBALS['TEXTE']['IMAGE_MAX_HEIGHT'] = 'Altezza max. dell\'immagine visualizzata';
$GLOBALS['TEXTE']['DISK_DB_ADJUSTMENT'] = 'Allineamento tra le immagini del disco e quelle della banca dati';
$GLOBALS['TEXTE']['MEDIA_ROOT_ADJUSTMENT'] = 'Allineamento di MEDIA-Directory';
$GLOBALS['TEXTE']['HMENU_RICHTUNG'] = 'Orizzontale: impaginazione';
$GLOBALS['TEXTE']['HMENU_SUBMENU'] = 'Orizzontale: forma del sottomenu';
$GLOBALS['TEXTE']['SUBMENU_DIR'] = 'Posizione del sottomenu';
$GLOBALS['TEXTE']['SUBNAV_SOFORT'] = 'Accesso diretto alla sottonavigazione';
$GLOBALS['TEXTE']['SMURL'] = 'URL amichevoli per i motori di ricerca';
$GLOBALS['TEXTE']['SMURL_REFRESH'] = 'Attualizzare l\'indice degli URL amichevoli';
$GLOBALS['TEXTE']['ROOTDIR'] = 'Directory radice del CMS';
$GLOBALS['TEXTE']['TEMPLATE_DIR'] = 'Directory dei modelli';
$GLOBALS['TEXTE']['EMAIL_RECEIVER'] = 'Destinatario dell\'e-mail';
$GLOBALS['TEXTE']['AUTHOR'] = 'author';
$GLOBALS['TEXTE']['DESCRIPTION'] = 'description';
$GLOBALS['TEXTE']['KEYWORDS'] = 'keywords';
$GLOBALS['TEXTE']['PAGE_TOPIC'] = 'page-topic';
$GLOBALS['TEXTE']['PUBLISHER'] = 'publisher';
$GLOBALS['TEXTE']['GOOGLE_VERIFY'] = 'google-site-verification';
$GLOBALS['TEXTE']['GOOGLE_ANALYTICS'] = 'Conto Google-Analytics';

/* * *******************************************************************************************************************
 * Texte zur Klasse naviPresent
 * ******************************************************************************************************************* */
$GLOBALS['TEXTE']['NAVI_VERWALTUNG'] = 'Gestione della navigazione';
$GLOBALS['TEXTE']['TEXT_BILDER_HOCHLADEN'] = 'Carica immagini';
$GLOBALS['TEXTE']['TEXT_EDIT_HAUPTNAVI'] = 'Modifica un elemento della navigazione principale';
$GLOBALS['TEXTE']['TEXT_NEUE_UNTERNAVI'] = 'Aggiungi un elemento alla sottonavigazione';
$GLOBALS['TEXTE']['TEXT_DELE_HAUPTNAVI'] = 'Eliminare l\\\'elemento della navigazione principale';
$GLOBALS['TEXTE']['TEXT_DELE_UNTERNAVI'] = 'Eliminare l\\\'elemento della sottonavigazione';
$GLOBALS['TEXTE']['TEXT_COPY_HAUPTNAVI'] = 'Copiare l\\\'elemento della navigazione principale';
$GLOBALS['TEXTE']['TEXT_REIHENFOLGE'] = 'Modifica l\'ordine spostando l\'immagine verso l\'alto';
$GLOBALS['TEXTE']['TEXT_EDIT_UNTERNAVI'] = 'Modifica l\'elemento della sottonavigazione';
$GLOBALS['TEXTE']['TEXT_NEUE_HAUPTNAVI'] = 'Nuovo elemento della navigazione principale';
$GLOBALS['TEXTE']['NAVI_GUELTIGKEIT'] = 'Validità';
$GLOBALS['TEXTE']['NAVI_AKTIV'] = 'Pagina attiva';
$GLOBALS['TEXTE']['NAVI_BEZEICHNUNG'] = 'Denominazione';
$GLOBALS['TEXTE']['NAVI_BEARBEITEN'] = 'Modificare';
$GLOBALS['TEXTE']['NAVI_SERVICE'] = 'Tipo';
$GLOBALS['TEXTE']['NAVI_START'] = 'Pagina iniziale';
$GLOBALS['TEXTE']['TEXT_KEINE_UNAV'] = 'La navigazione di servizio non può avere una sottonavigazione';
$GLOBALS['TEXTE']['ABBRECHEN'] = 'Interrompere';
$GLOBALS['TEXTE']['SERVICENAVIGATION'] = 'Navigazione di servizio';
$GLOBALS['TEXTE']['HORIZ_HAUPTNAVIGATION'] = 'Navigazione principale orizzontale';
$GLOBALS['TEXTE']['VERTI_HAUPTNAVIGATION'] = 'Navigazione principale verticale';
$GLOBALS['TEXTE']['JA'] = 'Sì';
$GLOBALS['TEXTE']['NEIN'] = 'No';
$GLOBALS['TEXTE']['FREIGEGEBEN'] = 'rilasciato';
$GLOBALS['TEXTE']['BLOCKIERT'] = 'bloccato';
$GLOBALS['NAVI']['HORIZONTAL'] = 'H';
$GLOBALS['NAVI']['VERTIKAL'] = 'V';
$GLOBALS['NAVI']['SERVICE'] = 'S';


/* * *******************************************************************************************************************
 * Texte zur Klasse naviMaintain
 * ******************************************************************************************************************* */
// Erfolgsmeldungen
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_ANGELEGT'] = 'L\'elemento di navigazione %s e la pagina corrispondente sono stati creati';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_GESPEICHERT'] = 'La pagina %s è stata salvata';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_GELOESCHT'] = 'L\'elemento della navigazione %s e tutti i dati corrispondenti sono stati eliminati';
$GLOBALS['MESSAGES']['MSG_KAP_HOCHZIEHEN'] = 'L\'elemento della navigazione %s è stato spostato verso l\'alto';
$GLOBALS['MESSAGES']['MSG_UKAP_HOCHZIEHEN'] = 'L\'elemento della sottonavigazione %s è stato spostato verso l\'alto';
$GLOBALS['MESSAGES']['MSG_NEU_SORTIERT'] = 'Die Datens&auml;tze wurden neu sortiert!';

// Fehlermeldungen
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_GESPEICHERT'] = 'L\'elemento della navigazione %s non ha potuto essere salvata!';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_ANGELEGT'] = 'L\'elemento della navigazione %s non ha potuto essere creato!';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_GELOESCHT'] = 'Si sono verificati errori al momento della cancellazione dell\'elemento di navigazione %s!';
$GLOBALS['MESSAGES']['MSG_NAVI_NICHT_LOESCHBAR'] = '%s sottopagina(e) ancora disponibile(i) - prego prima eliminare sottopagina(e)!';
$GLOBALS['MESSAGES']['MSG_NICHT_NEU_SORTIERT'] = 'Die Datens&auml;tze konnten nicht neu sortiert werden!';

/* * *******************************************************************************************************************
 * Labels zu Formularen navi_edit, page_edit
 * ******************************************************************************************************************* */
$GLOBALS['LABELS']['SIE_BEARBEITEN_SEITE'] = 'Pagina in elaborazione:';
$GLOBALS['LABELS']['SEITEN_INFO'] = 'Info pagina';
$GLOBALS['LABELS']['SEITEN_INFO_VALUES'] = 'ID pagina: %s / Id nav: %s / Directory: %s';
$GLOBALS['LABELS']['MESSAGE'] = 'Messagio';
$GLOBALS['LABELS']['TEMPLATE'] = 'Modello';
$GLOBALS['LABELS']['INTEGRATION'] = 'Integrazione';
$GLOBALS['LABELS']['MODUL'] = 'Modulo';
$GLOBALS['LABELS']['SEITENTITEL'] = 'Titolo della pagina<br />(60 caratteri)';
$GLOBALS['LABELS']['ZUSATZTEXT'] = 'Testo supplementare<br />(60 caratteri)';
$GLOBALS['LABELS']['KURZTEXT'] = 'Testo breve';
$GLOBALS['LABELS']['INHALTSTEXT'] = 'Testo del contenuto';
$GLOBALS['LABELS']['INHALT2'] = 'Testo del contenuto, colonna supplementare';
$GLOBALS['LABELS']['VONBIS'] = 'dal &#8211; al';
$GLOBALS['LABELS']['BILD'] = 'Immagine';
$GLOBALS['LABELS']['BILD1'] = 'Immagine 1';
$GLOBALS['LABELS']['BILD2'] = 'Immagine 2';
$GLOBALS['LABELS']['BILDERGALERIE'] = 'Galleria d\'immagini';
$GLOBALS['LABELS']['LINK1'] = 'Link 1';
$GLOBALS['LABELS']['LINK2'] = 'Link 2';
$GLOBALS['LABELS']['SEITE_AKTIV'] = 'La pagina è attiva';
$GLOBALS['LABELS']['ESCAPE'] = 'interrompi';
$GLOBALS['LABELS']['RESET'] = 'ripristina';
$GLOBALS['LABELS']['SAVE'] = 'salva';
$GLOBALS['LABELS']['ZEICHEN'] = 'Caratteri restanti: ';
$GLOBALS['LABELS']['MEMBERLOGIN'] = 'Accesso membri';
$GLOBALS['LABELS']['ERFORDERLICH'] = 'richiesto';
$GLOBALS['LABELS']['NICHT_ERFORDERLICH'] = 'non è necessario';

/* * *******************************************************************************************************************
 * Texte zur Klasse redirectMaintain
 * ******************************************************************************************************************* */
// ErfolgsmeldungenMESSAGES']['REDIRECT_GESPEICHERT']
//$GLOBALS['MESSAGES']['REDIRECT_GESPEICHERT']			= 'I dati sono stati registrati nella tabella degli indici: %s';
//$GLOBALS['MESSAGES']['REDIRECT_GELOESCHT']				= 'I dati sono stati eliminati dalla tabella degli indici: %s';
$GLOBALS['MESSAGES']['REDIRECT_GESPEICHERT'] = 'I dati sono stati registrati: %s';
$GLOBALS['MESSAGES']['REDIRECT_GELOESCHT'] = 'I dati sono stati eliminati: %s';

// Fehlermeldungen
$GLOBALS['MESSAGES']['REDIRECT_NO_NAVID'] = 'Operazione di reindirizzamento verso ' . TABLE_PREFIX . ' non è possibile. Non è disponibile nessuna ID di navigazione! %s';
$GLOBALS['MESSAGES']['REDIRECT_NICHT_GESPEICHERT'] = 'Il reindirizzamento verso ' . TABLE_PREFIX . ' non ha potuto essere salvato: %s';
$GLOBALS['MESSAGES']['REDIRECT_NICHT_GELOESCHT'] = 'I dati non hanno potuto essere eliminati dalla tabella degli indici: %s';

/* * *******************************************************************************************************************
 * Meldungstexte zur Klasse pagesMaintain
 * ******************************************************************************************************************* */
// Texte zu Seitenverwaltung
$GLOBALS['TEXTE']['TEXT_MODUL_SELECT'] = 'Nessun modulo = viene visualizzato il contenuto di questa pagina';
$GLOBALS['TEXTE']['TEXT_UNTERSEITE'] = 'Sottopagina di ';

// Texte zu SEITEN-Verwaltung
$GLOBALS['TEXTE']['TEXT_PLUS_MINUS'] = 'visualizza o nascondi';
//$GLOBALS['TEXTE']['TEXT_UPLOAD'] 						= "Gestione immagini:\ninformazioni sulle immagini\ncarica immagini\nelimina immagini";
$GLOBALS['TEXTE']['TEXT_UPLOAD'] = "Gestione immagini";
$GLOBALS['TEXTE']['TEXT_EDIT'] = 'Modifica';
$GLOBALS['TEXTE']['TEXT_DELETE'] = 'Elimina';
$GLOBALS['TEXTE']['TEXT_PAGE_EDIT'] = 'Modifica il contenuto della pagina';
$GLOBALS['TEXTE']['TEXT_PAGE_DELETE'] = 'Elimina la pagina';
$GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE'] = 'Eliminare veramente la pagina?';
$GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE_FILE'] = 'Eliminare veramente il file?';
$GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE_DIR'] = 'Eliminare veramente la directory?';
$GLOBALS['TEXTE']['TEXT_NEUE_SEITE'] = 'Nuova pagina';
$GLOBALS['TEXTE']['TEXT_SELECTBOX_AUWAHL'] = 'Selezionare...';
$GLOBALS['TEXTE']['TEXT_SELECTBOX_LEER'] = 'Non è stato trovato nessun dato...';
$GLOBALS['TEXTE']['TEXT_AKTIV'] = 'attivo';
$GLOBALS['TEXTE']['TEXT_INAKTIV'] = 'inattivo';
$GLOBALS['TEXTE']['TEXT_AUFWAERTS'] = '^Livello superiore';
$GLOBALS['TEXTE']['TEXT_SHOW'] = 'visualizza';
$GLOBALS['TEXTE']['TEXT_BILD_SHOW'] = 'Visualizza l\'immagine alla dimensione originale';
$GLOBALS['TEXTE']['TEXT_BILDER_EDIT'] = "Modifica commento delle immagini\nModifica ordine";
$GLOBALS['TEXTE']['TEXT_BILD_DELETE'] = 'Elimina questa immagine';
$GLOBALS['TEXTE']['TEXT_DIR_DELETE'] = 'Elimina questa directory';
$GLOBALS['TEXTE']['TEXT_FILETYPE'] = 'Apri la directory';
$GLOBALS['TEXTE']['TEXT_TRANSLATE'] = 'Tradurre';

// Texte zu Medienbrowser
$GLOBALS['TEXTE']['TEXT_SEITE'] = 'Pagina: ';
$GLOBALS['TEXTE']['TEXT_BASIS_BILDER'] = 'Directory di base delle immagini: ';
$GLOBALS['TEXTE']['TEXT_AKT_VERZEICHNIS'] = 'Directory';
$GLOBALS['TEXTE']['TEXT_VORHANDENE_DIRS'] = 'Directory disponibili';
$GLOBALS['TEXTE']['TEXT_ZIELVERZEICHNIS'] = 'Directory target';
$GLOBALS['TEXTE']['TEXT_NEUES_VERZEICHNIS'] = 'Nuova directory';
$GLOBALS['TEXTE']['TEXT_DATEIEN_LADEN'] = 'Caricare i dati sul server';
$GLOBALS['TEXTE']['TEXT_THUMBNAILS_ERSTELLEN'] = 'Crea delle thumbnail';
$GLOBALS['TEXTE']['TEXT_KOMMENTARE_ERFASSEN'] = 'Aggiungi un commento alle immagini';

// Menupositionen fuer Medienbrowser
$GLOBALS['MENUE']['TEXT_CREATE_DIR'] = 'Crea una directory';
$GLOBALS['MENUE']['TEXT_UPLOAD_PICS'] = 'Carica le immagini';
$GLOBALS['MENUE']['TEXT_EDIT_COMMENTS'] = 'Gestisci i commenti delle immagini';
$GLOBALS['MENUE']['TEXT_SHOW_PICS'] = 'Visualizza le immagini';
$GLOBALS['MENUE']['TEXT_HIDE_PICS'] = 'Nascondi le immagini';
$GLOBALS['MENUE']['TEXT_GOTO_PICS'] = 'Va alla directory delle immagini';
$GLOBALS['MENUE']['TEXT_GOTO_REFID'] = 'Modifica pagina';
$GLOBALS['MENUE']['TEXT_ZURUECK'] = 'indietro';

// Erfolgs - Meldungen 
$GLOBALS['MESSAGES']['MSG_SEITE_GESPEICHERT'] = 'La pagina %s è stata salvata';
$GLOBALS['MESSAGES']['MSG_SEITE_GELOESCHT'] = 'La pagina %s è stata eliminata';
$GLOBALS['MESSAGES']['MSG_BILD_IN_DB_GESPEICHERT'] = '%s è stata salvata nella banca dati';
$GLOBALS['MESSAGES']['MSG_BILD_IN_DB_GELOESCHT'] = '%s è stata eliminata dalla banca dati';
$GLOBALS['MESSAGES']['MSG_KOMMENTAR_GESPEICHERT'] = 'Il commento è stato salvato';
$GLOBALS['MESSAGES']['MSG_BILD_HOCHGEZOGEN'] = 'L\'immagine è stata spostata verso l\'alto';
$GLOBALS['MESSAGES']['MSG_BILDER_PRO_REF_GELOESCHT'] = 'Tutte le immagini della pagina %s sono state eliminate dalla banca dati';

// Fehler - Meldungen 
$GLOBALS['MESSAGES']['MSG_NOTHING_FOUND'] = 'Non è stato trovato nessun dato modificabile';
$GLOBALS['MESSAGES']['MSG_SEITENTITEL_EINGEBEN'] = 'Inserire un titolo per la pagina';
$GLOBALS['MESSAGES']['MSG_KURZTEXT_EINGEBEN'] = 'Inserire un testo breve';
$GLOBALS['MESSAGES']['MSG_LANGTEXT_EINGEBEN'] = 'Inserire un testo descrittivo';
$GLOBALS['MESSAGES']['MSG_DATUM_UNGUELTIG'] = '%s non è una data valida';
$GLOBALS['MESSAGES']['MSG_DATUM_FORMAT'] = 'Inserire la data nel formato GG.MM.AAAA';
$GLOBALS['MESSAGES']['MSG_DATUMBIS_KLEINER_DATUMVON'] = 'La data finale %s è anteriore alla data iniziale %s';
$GLOBALS['MESSAGES']['MSG_SEITE_NICHT_GESPEICHERT'] = 'La pagina %s non è stata salvata';
$GLOBALS['MESSAGES']['MSG_SEITE_NICHT_GELOESCHT'] = 'La pagina %s non ha potuto essere eliminata';
$GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB_GESPEICHERT'] = '%s non ha potuto essere salvata nella banca dati';
$GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB_GELOESCHT'] = '%s non ha potuto essere eliminata dalla banca dati';
$GLOBALS['MESSAGES']['MSG_BILD_EXISTIERT_IN_DB'] = '%s è già disponibile nella banca dati';
$GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB'] = '%s non è disponibile nella banca dati';
$GLOBALS['MESSAGES']['MSG_KOMMENTAR_NICHT_GESPEICHERT'] = 'Il commento non è stato salvato';
$GLOBALS['MESSAGES']['MSG_BILDER_PRO_REF_NICHT_GELOESCHT'] = 'Al momento dell\'eliminazione della pagina %s non tutte le immagini hanno potuto essere eliminate dalla banca dati';


/* * *******************************************************************************************************************
 * Meldungstexte zur Klasse picturesMaintain
 * ******************************************************************************************************************* */

// Erfolgs - Meldungen 
$GLOBALS['MESSAGES']['MSG_DATEI_UMBENANNT'] = 'Il nome del file è stato modificato';
$GLOBALS['MESSAGES']['MSG_DATEI_GELOESCHT'] = 'Il file %s è stato eliminato';
$GLOBALS['MESSAGES']['MSG_DIR_GELOESCHT'] = 'La directory %s è stata eliminata';
$GLOBALS['MESSAGES']['MSG_DIR_ANGELEGT'] = 'La directory %s è stata creata';
$GLOBALS['MESSAGES']['MSG_DIR_EXISTS'] = 'La directory %s è già esistente';
$GLOBALS['MESSAGES']['MSG_THUMBNAIL_GESPEICHERT'] = '%s è stato salvato come thumbnail %s';
$GLOBALS['MESSAGES']['MSG_DATEI_HOCHGELADEN'] = 'Il file %s è stato caricato';
$GLOBALS['MESSAGES']['MSG_DATEI_RESIZED'] = 'Il file %s è stato ridotto alla dimensione massima consentita di %s x %s pixel';

// Fehler - Meldungen 
$GLOBALS['MESSAGES']['MSG_DATEI_NICHT_UMBENANNT'] = 'Impossibile rinominare il file';
$GLOBALS['MESSAGES']['MSG_DATEI_NICHT_GELOESCHT'] = 'Impossibile eliminare il file %s';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_ANGELEGT'] = 'Impossibile creare la directory %s';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_GELOESCHT'] = 'Impossibile eliminare la directory %s';
$GLOBALS['MESSAGES']['MSG_DIR_EXISTIERT_SCHON'] = 'La directory %s esiste già - impossibile crearla';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_LEER'] = 'Impossibile eliminare la directory %s - non è vuota';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_ANGELEGT'] = 'Impossibile creare la directory %s';
$GLOBALS['MESSAGES']['MSG_THUMBNAIL_NICHT_GESPEICHERT'] = '%s non ha potuto essere salvato come thumbnail';
$GLOBALS['MESSAGES']['MSG_FALSCHER_DATEITYP'] = 'Il tipo di file %s non può essere caricato';
$GLOBALS['MESSAGES']['MSG_DATEI_ZU_GROSS'] = 'Il file %s supera la dimensione massima consentita di %s Kb';
$GLOBALS['MESSAGES']['MSG_DATEI_EXISTIERT_SCHON'] = 'Il file %s è già esistente';
$GLOBALS['MESSAGES']['MSG_DATEI_NICHT_HOCHGELADEN'] = 'Il file %s non ha potuto essere caricato';
$GLOBALS['MESSAGES']['MSG_KEINE_DATEIEN_GEFUNDEN'] = 'Nessun file disponibile';
$GLOBALS['MESSAGES']['MSG_FEHLER'] = 'Si è verificato un errore!';
$GLOBALS['MESSAGES']['MSG_DISKFILE_FEHLT'] = 'Il file non è disponibile sul disco: %s';

// Texte
$GLOBALS['TEXTE']['INDEX_AKTUALISIEREN'] = 'Attualizzare l\'indice';
$GLOBALS['TEXTE']['NO_THUMBNAIL'] = 'Nessuna thumbnail esistente per l\'immagine: ';

/* * *******************************************************************************************************************
 * Texte zum Frontend
 * ******************************************************************************************************************* */
$GLOBALS['BACKUP']['VERZEICHNIS_EXISTIERT_NICHT'] = 'La directory %s non esiste!';
$GLOBALS['BACKUP']['DOWNLOAD'] = 'Salvare il file localmente';
$GLOBALS['BACKUP']['EXPLANATION'] = 'Una copia di sicurezza viene creata automaticamente cliccando sul link che si trova qui di seguito.';
$GLOBALS['BACKUP']['DURCHFUEHREN'] = 'Eseguire una copia di sicurezza della banca dati';
$GLOBALS['BACKUP']['SICHERUNG'] = 'Salvare la tabella: %s';
$GLOBALS['BACKUP']['SUCCESS'] = 'La copia di sicurezza è stata eseguita con successo.';
$GLOBALS['BACKUP']['ERROR'] = 'La copia di sicurezza non ha potuto essere eseguita.';
$GLOBALS['BACKUP']['DATEI'] = 'File copia di sicurezza';
$GLOBALS['BACKUP']['ERSTELLT'] = 'Data di creazione';
$GLOBALS['BACKUP']['DATEIGROESSE'] = 'Dimensione in KB';



/* * *******************************************************************************************************************
 * Texte zum Frontend
 * ******************************************************************************************************************* */
$GLOBALS['GALERIE']['FIRST_PAGE'] = 'vai alla prima pagina';
$GLOBALS['GALERIE']['PREV_PAGE'] = 'pagina precedente';
$GLOBALS['GALERIE']['NEXT_PAGE'] = 'pagina seguente';
$GLOBALS['GALERIE']['LAST_PAGE'] = 'vai all\'ultima pagina';

$GLOBALS['LINKS']['UEBERSICHT'] = '&lt; indietro';
$GLOBALS['LINKS']['WEITER'] = '&gt; continua';
$GLOBALS['LINKS']['GALERIE'] = '&gt; galleria';

$GLOBALS['LINKS']['GALERIE_AKTIV'] = 'con link verso la galleria';
$GLOBALS['LINKS']['GALERIE_INAKTIV'] = 'senza link verso la galleria';
$GLOBALS['LINKS']['BILDLEISTE'] = 'con barra d\'immagini e link verso l\'immagine';
$GLOBALS['LINKS']['AUTOBILDWECHSEL'] = 'con immagini che scorrono automaticamente';

$GLOBALS['LINKS']['SIEHE_AUCH'] = '&gt; ';
$GLOBALS['WEBMAIL']['TITEL'] = 'Login Webmail';

/* * *******************************************************************************************************************
 * Kontaktformular
 * ******************************************************************************************************************* */
$GLOBALS['KONTAKTFORM']['TITEL'] = 'Formulario di contatto';
$GLOBALS['KONTAKTFORM']['SENT'] = 'Grazie per avermi contattato!' . "<br />\n";
$GLOBALS['KONTAKTFORM']['NOT_SENT'] = 'La posta non ha potuto essere inviato!' . "<br />\n";
$GLOBALS['KONTAKTFORM']['DATA_SENT'] = 'Le seguenti informazioni sono state presentate: ' . "<br />\n";
$GLOBALS['KONTAKTFORM']['OBLIGATORY'] = '* Si prega di compilare tutti i campi!';
$GLOBALS['KONTAKTFORM']['NAME'] = 'Nome *';
$GLOBALS['KONTAKTFORM']['ADRESSE'] = 'Indirizzo *';
$GLOBALS['KONTAKTFORM']['PLZ_ORT'] = 'CAP / Città *';
$GLOBALS['KONTAKTFORM']['TELEFON'] = 'Telefono *';
$GLOBALS['KONTAKTFORM']['EMAIL'] = 'Email *';
$GLOBALS['KONTAKTFORM']['MITTEILUNG'] = 'Messaggio';
$GLOBALS['KONTAKTFORM']['BILDCODE'] = 'Codice immagine *';
$GLOBALS['KONTAKTFORM']['SENDEN'] = 'inviare';
$GLOBALS['KONTAKTFORM']['RESET'] = 'indietro';
$GLOBALS['KONTAKTFORM']['CODE_FALSCH'] = 'Il codice di sicurezza non è corretto!';
$GLOBALS['KONTAKTERROR']['MARKEDFIELDS'] = 'Compila i campi evidenziati';
$GLOBALS['KONTAKTERROR']['WRONGEMAIL'] = 'L\'indirizzo email non è valido!';

/* * *******************************************************************************************************************
 * Texte zum Member-Login
 * ******************************************************************************************************************* */
$GLOBALS['MEMBER']['TITLE_LOGIN'] = 'Accedere';
$GLOBALS['MEMBER']['TITLE_FORGOTTEN'] = 'Richiedi una nuova password';
$GLOBALS['MEMBER']['TITLE_CHANGE'] = 'Modifica della password';
$GLOBALS['MEMBER']['TITLE_REGISTER'] = 'nuova registrazione';
$GLOBALS['MEMBER']['LBL_EXECUTE'] = 'eseguire';
$GLOBALS['MEMBER']['EMAIL'] = 'Email';
$GLOBALS['MEMBER']['CHANGE_PW'] = 'Vuoi cambiare la tua password?';
$GLOBALS['MEMBER']['CHANGE_PW_MELDUNG'] = 'La password è stata cambiata!';
$GLOBALS['MEMBER']['FORGOTTEN'] = 'Hai dimenticato la password?';
$GLOBALS['MEMBER']['REGISTER'] = 'Vuoi registrarti?';
$GLOBALS['MEMBER']['REGISTER_MELDUNG'] = 'La registrazione è stata completata con successo - si prega iscriviti adesso.';
$GLOBALS['MEMBER']['EXEC_LOGIN'] = 'Accedi eseguire';
$GLOBALS['MEMBER']['EXEC_FORGOTTEN'] = 'Richiedi una nuova password';
$GLOBALS['MEMBER']['EXEC_REGISTER'] = 'Registrazione per l\'esecuzione';
$GLOBALS['MEMBER']['LOGIN_AND_PASSWORD'] = 'Inserisci credenziali valide!';
$GLOBALS['MEMBER']['EMAIL_SEND_FAILED'] = 'La tua nuova password non può essere inviato via e-mail - si prega di riprovare più tardi, grazie!';
$GLOBALS['MEMBER']['USER_NOT_EXISTS'] = 'L\'utente %s NON è memorizzato nel sistema!';
$GLOBALS['MEMBER']['USER_ALREADY_EXISTS'] = 'L\'utente %s è già memorizzato nel sistema!';
$GLOBALS['MEMBER']['SAVE_FAILED'] = 'Si è verificato un errore!';
?>
