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
setlocale (LC_ALL, 'fr_FR');

// Set the language information
$language_code = 'FR';
$language_name = 'Français';

/*********************************************************************************************************************
 * Texte zum cmsadmin-Login und Benutzerverwaltung
 *********************************************************************************************************************/
$GLOBALS['TEXTE']['LBL_LOGIN']							= 'Login';
$GLOBALS['TEXTE']['LBL_CHANGE_PASSWORD']				= 'Modifier le mot de passe';
$GLOBALS['TEXTE']['LBL_NEW_PASSWORD']					= 'Demander un mot de passe';
$GLOBALS['TEXTE']['ANGEMELDET']							= 'Connecté(e): ';
$GLOBALS['TEXTE']['LOGIN_FAIL']							= 'Le login a échoué - Veuillez réessayer!';
$GLOBALS['TEXTE']['NO_MENU']							= 'Le menu n\'a pas encore été défini pour cet utilisateur - Veuillez contacter l\'administrateur';
$GLOBALS['TEXTE']['EXEC_LOGIN']							= 'Se connecter';
$GLOBALS['TEXTE']['WELCOME']							= 'Bienvenue! ';
$GLOBALS['TEXTE']['USERNAME']							= 'Nom d\'utilisateur';
$GLOBALS['TEXTE']['PASSWORD']							= 'Mot de passe';
$GLOBALS['TEXTE']['OLD_PASSWORD']						= 'Ancien mot de passe';
$GLOBALS['TEXTE']['NEW_PASSWORD']						= 'Nouveau mot de passe &#8211; '."\n".'au minimum 6 caractères';
$GLOBALS['TEXTE']['REPEAT_PASSWORD']					= 'Répéter le mot de passe';
$GLOBALS['TEXTE']['EMAIL']								= 'Adresse e-mail';
$GLOBALS['TEXTE']['PASSWORD_CHANGED']					= 'Le mot de passe a été modifié &#8211; Veuillez vous reconnecter';
$GLOBALS['TEXTE']['PASSWORD_CHANGE_FAILED']				= 'Le mot de passe n\'a pas pu être modifié';
$GLOBALS['TEXTE']['PASSWORD_LENGTH']					= 'Le nouveau mot de passe doit comprendre au moins 6 caractères';
$GLOBALS['TEXTE']['PASSWORD_EQUAL']						= 'Répétez le nouveau mot de passe de manière identique';
$GLOBALS['TEXTE']['PASSWORD_NEW_EQALS_OLD']				= 'Le nouveau mot de passe ne doit pas être identique à l\'ancien mot de passe';
$GLOBALS['TEXTE']['ALLE_FELDER_FUELLEN']				= 'Veuillez renseigner tous les champs';
$GLOBALS['TEXTE']['USER_NOT_EXIST']						= 'L\'utilisateur %s est inconnu!';
$GLOBALS['TEXTE']['NEW_PASSWORD_IS']					= 'Le nouveau mot de passe est: ';
$GLOBALS['TEXTE']['WRONG_EMAIL']						= 'L\'adresse e-mail est invalide ';
$GLOBALS['TEXTE']['EMAIL_SENT']							= 'Le nouveau mot de passe a été envoyé à l\'adresse suivante: %s';
$GLOBALS['TEXTE']['EMAIL_SEND_FAILED']					= 'L\'envoi de l\'e-mail a échoué - Veuillez réessayer plus tard ';
$GLOBALS['TEXTE']['EMAIL_BETREFF']						= 'Vos données d\'accès au CMS';
$GLOBALS['TEXTE']['EMAIL_TEXT']							= 'Madame, Monsieur,'."\n".'Votre nouveau mot de passe est : %s'."\n".'Veuillez modifier le mot de passe dès sa réception.'."\n".'Je vous remercie de votre intérêt et vous adresse mes meilleures salutations'."\n".'info@hempenweb.ch';


/*********************************************************************************************************************
 * Menutexte zum CMS
 *********************************************************************************************************************/
$GLOBALS['CMS']['CMS_TITLE']							= 'CMS by hempenweb.ch';
$GLOBALS['CMS']['LBL_CMS'] 								= 'Content Management System';
$GLOBALS['CMS']['MENU01'] 								= 'Navigation';
$GLOBALS['CMS']['MENU02'] 								= 'Sous-pages';
$GLOBALS['CMS']['MENU03'] 								= 'Navigateur d\'images';
$GLOBALS['CMS']['MENU04'] 								= 'Explorer';
$GLOBALS['CMS']['MENU05'] 								= 'Php Info';
$GLOBALS['CMS']['MENU06'] 								= 'Liens';
$GLOBALS['CMS']['MENU07'] 								= 'Copie de sauvegarde';
$GLOBALS['CMS']['MENU08'] 								= 'Documentation';
$GLOBALS['CMS']['MENU09'] 								= 'Logout';
$GLOBALS['CMS']['MENU10'] 								= 'Configuration';
$GLOBALS['CMS']['MENU11'] 								= 'Fragments';
$GLOBALS['CMS']['MENU12'] 								= 'Addons';
$GLOBALS['CMS']['TEXT_ANMELDEN'] 						= 'Veuillez vous connecter';
$GLOBALS['CMS']['TEXT_WAEHLEN'] 						= 'Sélectionnez une option du menu';

/*********************************************************************************************************************
 * Texte zur Klasse frgmntsPresent
 *********************************************************************************************************************/
$GLOBALS['TEXTE']['FRAGMENTE']							= 'Fragments';
$GLOBALS['TEXTE']['CSS']								= 'CSS';
$GLOBALS['TEXTE']['TEXT_NEW_FRGMNT']					= 'Nouveau fragment';
$GLOBALS['TEXTE']['TEXT_COPY_FRGMNT']					= 'Copie de %s';
$GLOBALS['TEXTE']['FRGMNT_CONFIRM_DELETE']				= 'Voulez-vous vraiment supprimer le fragment %s?';
$GLOBALS['TEXTE']['TEXT_CREATE']						= 'Créer un nouveau fragment';
$GLOBALS['TEXTE']['TEXT_COPY']							= 'Copier';
$GLOBALS['TEXTE']['TEXT_MOVE']							= 'Déplacer';
$GLOBALS['TEXTE']['CSS_START_TEXT']						= '/* Notations CSS des fragments - Date de création: %s */';

// Erfolgsmeldungen
$GLOBALS['MESSAGES']['MSG_FRGMNT_GESPEICHERT']			= 'Le fragment %s a été sauvegardé';
$GLOBALS['MESSAGES']['MSG_FRGMNT_GELOESCHT']			= 'Le fragment %s a été supprimé';
$GLOBALS['MESSAGES']['MSG_CSS_GESPEICHERT']				= 'Le fichier CSS %s a été sauvegardé';
$GLOBALS['MESSAGES']['MSG_CSS_NEU_ANGELEGT']			= 'Le fichier CSS %s a été recréé';
$GLOBALS['MESSAGES']['MSG_CSS_BEARBEITEN']				= 'Fichier CSS: %s ';

// Fehlermeldungen
$GLOBALS['MESSAGES']['MSG_FRGMNT_NICHT_GESPEICHERT']	= 'Le fragment %s n\'a pas pu être sauvegardé';
$GLOBALS['MESSAGES']['MSG_FRGMNT_NICHT_GELOESCHT']		= 'Le fragment %s n\'a pas pu être supprimé';
$GLOBALS['MESSAGES']['MSG_CSS_NICHT_GESPEICHERT']		= 'Le fichier CSS %s n\'a pas pu être sauvegardé';
$GLOBALS['MESSAGES']['MSG_CSS_NICHT_ANGELEGT']			= 'Le fichier CSS %s n\'a pas pu être créé';
$GLOBALS['MESSAGES']['MSG_CSS_BERECHTIGUNG_FAILED']		= 'L\'autorisation n\'a pas pu être donnée à %s';
$GLOBALS['MESSAGES']['MSG_FILE_KEINE_BERECHTIGUNG']		= 'Le fichier %s ne peut pas être sauvegardé par manque d\'autorisation ';

/*********************************************************************************************************************
 * Texte zur Klasse configPresent
 *********************************************************************************************************************/
$GLOBALS['TEXTE']['CONFIGURATION']						= 'Configuration';
$GLOBALS['TEXTE']['CONFIG_DESCR']						= 'Description';
$GLOBALS['TEXTE']['CONFIG_PARAM']						= 'Paramètre';
$GLOBALS['TEXTE']['CONFIG_VALUE']						= 'Valeur';
$GLOBALS['TEXTE']['THEME']	   							= 'Thème / Design';
$GLOBALS['TEXTE']['COPYRIGHT']	   						= 'Texte de copyright dans le pied de page';
$GLOBALS['TEXTE']['MAX_THUMBS']							= 'Nombre max. de vignettes affichées';
$GLOBALS['TEXTE']['MAX_LIST_ITEMS']						= 'Nombre max. d\'entrées affichées dans la liste';
$GLOBALS['TEXTE']['MAX_LENGTH_KURZTEXT']				= 'Longueur max. du texte court';
$GLOBALS['TEXTE']['LANGUAGE']	   						= 'Langue';
$GLOBALS['TEXTE']['THUMB_PAGE_MAX_WIDTH']				= 'Largeur max. des vignettes sur les sous-pages';
$GLOBALS['TEXTE']['THUMB_PAGE_MAX_HEIGHT']				= 'Hauteur max. des vignettes sur les sous-pages';
$GLOBALS['TEXTE']['THUMB_NAVI_MAX_WIDTH']				= 'Largeur max. des vignettes sur les pages de navigation';
$GLOBALS['TEXTE']['THUMB_NAVI_MAX_HEIGHT']				= 'Hauteur max. des vignettes sur les pages de navigation';
$GLOBALS['TEXTE']['IMAGE_MAX_WIDTH']					= 'Largeur max. de l\'image affichée';
$GLOBALS['TEXTE']['IMAGE_MAX_HEIGHT']					= 'Hauteur max. de l\'image affichée';
$GLOBALS['TEXTE']['DISK_DB_ADJUSTMENT']					= 'Alignement images disque - BD';
$GLOBALS['TEXTE']['MEDIA_ROOT_ADJUSTMENT']              = 'Alignement du Répertoire MEDIA';
$GLOBALS['TEXTE']['HMENU_RICHTUNG']						= 'Horizontale: mise en page';
$GLOBALS['TEXTE']['HMENU_SUBMENU']						= 'Horizontale: forme du sous-menu';
$GLOBALS['TEXTE']['SUBMENU_DIR']						= 'Position du sous-menu';
$GLOBALS['TEXTE']['SUBNAV_SOFORT']						= 'Acheminement direct vers la sous-navigation';
$GLOBALS['TEXTE']['SMURL']								= 'URL adaptée aux moteurs de recherche\'s';
$GLOBALS['TEXTE']['SMURL_REFRESH']						= 'Mettre à jour l\'indice des URL adaptées';
$GLOBALS['TEXTE']['ROOTDIR']							= 'Répertoire racine du CMS';
$GLOBALS['TEXTE']['TEMPLATE_DIR']						= 'Répertoire des modèles';
$GLOBALS['TEXTE']['EMAIL_RECEIVER']						= 'Destinataire de l\'e-mail';
$GLOBALS['TEXTE']['AUTHOR']								= 'author';
$GLOBALS['TEXTE']['DESCRIPTION']						= 'description';
$GLOBALS['TEXTE']['KEYWORDS']							= 'keywords';
$GLOBALS['TEXTE']['PAGE_TOPIC']							= 'page-topic';
$GLOBALS['TEXTE']['PUBLISHER']							= 'publisher';
$GLOBALS['TEXTE']['GOOGLE_VERIFY']						= 'google-site-verification';
$GLOBALS['TEXTE']['GOOGLE_ANALYTICS']					= 'Compte Google-Analytics';

/*********************************************************************************************************************
 * Texte zur Klasse naviPresent
 *********************************************************************************************************************/
$GLOBALS['TEXTE']['NAVI_VERWALTUNG']	 				= 'Gestion de la navigation';
$GLOBALS['TEXTE']['TEXT_BILDER_HOCHLADEN'] 				= 'Télécharger les images';
$GLOBALS['TEXTE']['TEXT_EDIT_HAUPTNAVI'] 				= 'Modifier un élément de la navigation principale';
$GLOBALS['TEXTE']['TEXT_NEUE_UNTERNAVI'] 				= 'Insérer un nouvel élément de sous-navigation';
$GLOBALS['TEXTE']['TEXT_DELE_HAUPTNAVI'] 				= 'Supprimer l\\\'élément de la navigation principale';
$GLOBALS['TEXTE']['TEXT_DELE_UNTERNAVI'] 				= 'Supprimer l\\\'élément de la sous-navigation';
$GLOBALS['TEXTE']['TEXT_COPY_HAUPTNAVI'] 				= 'Copier l\\\'élément de la navigation principale';
$GLOBALS['TEXTE']['TEXT_REIHENFOLGE'] 	 				= 'Modifier l\'ordre en déplaçant l\'image vers le haut';
$GLOBALS['TEXTE']['TEXT_EDIT_UNTERNAVI'] 				= 'Modifier l\'élément de la sous-navigation';
$GLOBALS['TEXTE']['TEXT_NEUE_HAUPTNAVI'] 				= 'Nouvel élément de la navigation principale';
$GLOBALS['TEXTE']['NAVI_GUELTIGKEIT'] 	 				= 'Validité';
$GLOBALS['TEXTE']['NAVI_AKTIV']							= 'Page active';
$GLOBALS['TEXTE']['NAVI_BEZEICHNUNG'] 	 				= 'Désignation';
$GLOBALS['TEXTE']['NAVI_BEARBEITEN'] 	 				= 'Modifier';
$GLOBALS['TEXTE']['NAVI_SERVICE'] 		 				= 'Type';
$GLOBALS['TEXTE']['NAVI_START']							= 'Page d\'accueil';
$GLOBALS['TEXTE']['TEXT_KEINE_UNAV'] 	 				= 'La navigation de service ne peut pas avoir une sous-navigation';
$GLOBALS['TEXTE']['ABBRECHEN']							= 'Interrompre';
$GLOBALS['TEXTE']['SERVICENAVIGATION']	 				= 'Navigation de service';
$GLOBALS['TEXTE']['HORIZ_HAUPTNAVIGATION']				= 'Navigation principale horizontale';
$GLOBALS['TEXTE']['VERTI_HAUPTNAVIGATION']				= 'Navigation principale verticale';
$GLOBALS['TEXTE']['JA']									= 'Oui';
$GLOBALS['TEXTE']['NEIN']								= 'Non';
$GLOBALS['TEXTE']['FREIGEGEBEN']						= 'libéré';
$GLOBALS['TEXTE']['BLOCKIERT']							= 'bloqué';
$GLOBALS['NAVI']['HORIZONTAL']							= 'H';
$GLOBALS['NAVI']['VERTIKAL']							= 'V';
$GLOBALS['NAVI']['SERVICE']								= 'S';


/*********************************************************************************************************************
 * Texte zur Klasse naviMaintain
 *********************************************************************************************************************/
// Erfolgsmeldungen
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_ANGELEGT'] 		= 'L\'élément de la navigation %s et la page correspondante ont été créés';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_GESPEICHERT'] 		= 'La page %s a été sauvegardée';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_GELOESCHT'] 		= 'L\'élément de la navigation %s et toutes les données correspondantes ont été supprimés';
$GLOBALS['MESSAGES']['MSG_KAP_HOCHZIEHEN']				= 'L\'élément de la navigation %s a été déplacé vers le haut';
$GLOBALS['MESSAGES']['MSG_UKAP_HOCHZIEHEN']				= 'L\'élément de la sous-navigation %s a été déplacé vers le haut';
$GLOBALS['MESSAGES']['MSG_NEU_SORTIERT']   				= 'Die Datens&auml;tze wurden neu sortiert!';

// Fehlermeldungen
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_GESPEICHERT'] 		= 'L\'élément de navigation %s n\'a pas pu être sauvegardée!';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_ANGELEGT'] 	= 'L\'élément de navigation %s n\'a pas pu être créé!';
$GLOBALS['MESSAGES']['MSG_NAVI_SEITE_NICHT_GELOESCHT'] 	= 'Des erreurs sont survenues lors de la suppression de l\'élément de la navigation %s!';
$GLOBALS['MESSAGES']['MSG_NAVI_NICHT_LOESCHBAR']		= '%s sous-page(s) encore disponible(s) - supprimez d\'abord la(les) sous-page(s)!';
$GLOBALS['MESSAGES']['MSG_NICHT_NEU_SORTIERT']   		= 'Die Datens&auml;tze konnten nicht neu sortiert werden!';

/*********************************************************************************************************************
 * Labels zu Formularen navi_edit, page_edit
 *********************************************************************************************************************/
$GLOBALS['LABELS']['SIE_BEARBEITEN_SEITE']				= 'Vous modifiez la page:';
$GLOBALS['LABELS']['SEITEN_INFO']						= 'Info page';
$GLOBALS['LABELS']['SEITEN_INFO_VALUES']				= 'ID page: %s / ID nav.: %s / Répertoire: %s';
$GLOBALS['LABELS']['MESSAGE']							= 'Message';
$GLOBALS['LABELS']['TEMPLATE']							= 'Modèle';
$GLOBALS['LABELS']['INTEGRATION']						= 'Intégration';
$GLOBALS['LABELS']['MODUL']								= 'Module';
$GLOBALS['LABELS']['SEITENTITEL']						= 'Titre de page<br />(60 caractères)';
$GLOBALS['LABELS']['ZUSATZTEXT']						= 'Texte supplémentaire<br />(60 caractères)';
$GLOBALS['LABELS']['KURZTEXT']							= 'Texte bref';
$GLOBALS['LABELS']['INHALTSTEXT']						= 'Texe du contenu';
$GLOBALS['LABELS']['INHALT2']							= 'Texte du contenu, colonne supplémentaire';
$GLOBALS['LABELS']['VONBIS']							= 'du &#8211; au';
$GLOBALS['LABELS']['BILD']								= 'Image';
$GLOBALS['LABELS']['BILD1']								= 'Image 1';
$GLOBALS['LABELS']['BILD2']								= 'Image 2';
$GLOBALS['LABELS']['BILDERGALERIE']						= 'Galerie d\'images';
$GLOBALS['LABELS']['LINK1']								= 'Lien 1';
$GLOBALS['LABELS']['LINK2']								= 'Lien 2';
$GLOBALS['LABELS']['SEITE_AKTIV']						= 'La page est active';
$GLOBALS['LABELS']['ESCAPE']							= 'interrompre';
$GLOBALS['LABELS']['RESET']								= 'réinitialiser';
$GLOBALS['LABELS']['SAVE']								= 'sauvegarder';
$GLOBALS['LABELS']['ZEICHEN']							= 'Caractères restants: ';
$GLOBALS['LABELS']['MAXZEICHEN']						= 'Max. Caractères: ';
$GLOBALS['LABELS']['MEMBERLOGIN']						= 'Accès des membres';
$GLOBALS['LABELS']['ERFORDERLICH']						= 'requis';
$GLOBALS['LABELS']['NICHT_ERFORDERLICH']				= 'pas nécessaire';

/*********************************************************************************************************************
 * Texte zur Klasse redirectMaintain
 *********************************************************************************************************************/
// Erfolgsmeldungen
//$GLOBALS['MESSAGES']['REDIRECT_GESPEICHERT']			= 'Les données ont été enregistrées dans le tableau des indices: %s';
//$GLOBALS['MESSAGES']['REDIRECT_GELOESCHT']				= 'Les données ont été supprimées du tableau des indices: %s';
$GLOBALS['MESSAGES']['REDIRECT_GESPEICHERT']			= 'Les données ont été enregistrées: %s';
$GLOBALS['MESSAGES']['REDIRECT_GELOESCHT']				= 'Les données ont été supprimées: %s';

// Fehlermeldungen
$GLOBALS['MESSAGES']['REDIRECT_NO_NAVID']				= 'L\'opération de réacheminement vers '.TABLE_PREFIX.'n\'est pas possible. Aucune ID de navigation disponbile! %s';
$GLOBALS['MESSAGES']['REDIRECT_NICHT_GESPEICHERT'] 		= 'L\'enregistrement de réacheminement vers '.TABLE_PREFIX.'n\'a pas pu être sauvegardé: %s';
$GLOBALS['MESSAGES']['REDIRECT_NICHT_GELOESCHT'] 		= 'Les données n\'ont pas pu être supprimées du tableau des indices: %s';
 
/*********************************************************************************************************************
 * Meldungstexte zur Klasse pagesMaintain
 *********************************************************************************************************************/
// Texte zu Seitenverwaltung
$GLOBALS['TEXTE']['TEXT_MODUL_SELECT'] 					= 'Aucun module = le contenu de cette page est affiché';
$GLOBALS['TEXTE']['TEXT_UNTERSEITE']					= 'Sous-page de ';

// Texte zu SEITEN-Verwaltung
$GLOBALS['TEXTE']['TEXT_PLUS_MINUS'] 					= 'afficher ou masquer';
//$GLOBALS['TEXTE']['TEXT_UPLOAD'] 						= "Gérer les images:\nInformations concernant les images\nTélécharger les images\nSupprimer les images";
$GLOBALS['TEXTE']['TEXT_UPLOAD'] 						= "Gérer les images";
$GLOBALS['TEXTE']['TEXT_EDIT'] 							= 'Modifier';
$GLOBALS['TEXTE']['TEXT_DELETE'] 						= 'Supprimer';
$GLOBALS['TEXTE']['TEXT_PAGE_EDIT'] 					= 'Modifier le contenu de la page';
$GLOBALS['TEXTE']['TEXT_PAGE_DELETE'] 					= 'Supprimer la page';
$GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE'] 				= 'Voulez-vous vraiment supprimer la page?';
$GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE_FILE']			= 'Voulez-vous vraiment supprimer le fichier?';
$GLOBALS['TEXTE']['TEXT_CONFIRM_DELETE_DIR'] 			= 'Voulez-vous vraiment supprimer le répertoire?';
$GLOBALS['TEXTE']['TEXT_NEUE_SEITE'] 					= 'Nouvelle page';
$GLOBALS['TEXTE']['TEXT_SELECTBOX_AUWAHL'] 				= 'Veuillez sélectionner...';
$GLOBALS['TEXTE']['TEXT_SELECTBOX_LEER'] 				= 'Aucune donnée n\'a été trouvée...';
$GLOBALS['TEXTE']['TEXT_AKTIV'] 						= 'active';
$GLOBALS['TEXTE']['TEXT_INAKTIV'] 						= 'inactive';
$GLOBALS['TEXTE']['TEXT_AUFWAERTS'] 					= '^Vers le haut';
$GLOBALS['TEXTE']['TEXT_SHOW'] 							= 'Afficher';
$GLOBALS['TEXTE']['TEXT_BILD_SHOW'] 					= 'Afficher l\'image à sa taille réelle';
$GLOBALS['TEXTE']['TEXT_BILDER_EDIT'] 					= "Modifier le commentaire des images\nModifier l'ordre";
$GLOBALS['TEXTE']['TEXT_BILD_DELETE'] 					= 'Supprimer cette image';
$GLOBALS['TEXTE']['TEXT_DIR_DELETE'] 					= 'Supprimer ce répertoire';
$GLOBALS['TEXTE']['TEXT_FILETYPE'] 						= 'Ouvrir le répertoire';
$GLOBALS['TEXTE']['TEXT_TRANSLATE']						= 'Traduire';

// Texte zu Medienbrowser
$GLOBALS['TEXTE']['TEXT_SEITE'] 						= 'Page: ';
$GLOBALS['TEXTE']['TEXT_BASIS_BILDER'] 					= 'Répertoire de base des images: ';
$GLOBALS['TEXTE']['TEXT_AKT_VERZEICHNIS'] 				= 'Répertoire';
$GLOBALS['TEXTE']['TEXT_VORHANDENE_DIRS'] 				= 'Répertoires disponibles';
$GLOBALS['TEXTE']['TEXT_ZIELVERZEICHNIS'] 				= 'Répertoire cible';
$GLOBALS['TEXTE']['TEXT_NEUES_VERZEICHNIS'] 			= 'Nouveau répertoire';
$GLOBALS['TEXTE']['TEXT_DATEIEN_LADEN'] 				= 'Télécharger les données sur le serveur';
$GLOBALS['TEXTE']['TEXT_THUMBNAILS_ERSTELLEN'] 			= 'Créer des vignettes';
$GLOBALS['TEXTE']['TEXT_KOMMENTARE_ERFASSEN'] 			= 'Enregistrer un commentaire pour une image';

// Menupositionen fuer Medienbrowser
$GLOBALS['MENUE']['TEXT_CREATE_DIR'] 					= 'Créer un répertoire';
$GLOBALS['MENUE']['TEXT_UPLOAD_PICS'] 					= 'Télécharger les images';
$GLOBALS['MENUE']['TEXT_EDIT_COMMENTS'] 				= 'Gérer les commentaires des images';
$GLOBALS['MENUE']['TEXT_SHOW_PICS'] 					= 'Afficher les images';
$GLOBALS['MENUE']['TEXT_HIDE_PICS'] 					= 'Masquer les images';
$GLOBALS['MENUE']['TEXT_GOTO_PICS'] 					= 'Passer au répertoire des images';
$GLOBALS['MENUE']['TEXT_GOTO_REFID']					= 'Modifier la page';
$GLOBALS['MENUE']['TEXT_ZURUECK'] 						= 'retour';

// Erfolgs - Meldungen 
$GLOBALS['MESSAGES']['MSG_SEITE_GESPEICHERT'] 			= 'La page %s a été sauvegardée';
$GLOBALS['MESSAGES']['MSG_SEITE_GELOESCHT'] 			= 'La page %s a été supprimée';
$GLOBALS['MESSAGES']['MSG_BILD_IN_DB_GESPEICHERT'] 		= '%s a été sauvgegardée dans la banque de données';
$GLOBALS['MESSAGES']['MSG_BILD_IN_DB_GELOESCHT'] 		= '%s a été suprimée de la banque de données';
$GLOBALS['MESSAGES']['MSG_KOMMENTAR_GESPEICHERT'] 		= 'Le commentaire a été sauvegardé';
$GLOBALS['MESSAGES']['MSG_BILD_HOCHGEZOGEN'] 			= 'L\'image a été déplacée vers le haut';
$GLOBALS['MESSAGES']['MSG_BILDER_PRO_REF_GELOESCHT']	= 'Toutes les images de la page %s ont été supprimées de la BD';

// Fehler - Meldungen 
$GLOBALS['MESSAGES']['MSG_NOTHING_FOUND'] 				= 'Aucune donnée modifiable n\'a été trouvée';
$GLOBALS['MESSAGES']['MSG_SEITENTITEL_EINGEBEN'] 		= 'Saisissez un titre de page';
$GLOBALS['MESSAGES']['MSG_KURZTEXT_EINGEBEN'] 			= 'Saisissez un texte bref';
$GLOBALS['MESSAGES']['MSG_LANGTEXT_EINGEBEN'] 			= 'Saisissez un texte descriptif';
$GLOBALS['MESSAGES']['MSG_DATUM_UNGUELTIG'] 			= '%s n\'est pas une date valable';
$GLOBALS['MESSAGES']['MSG_DATUM_FORMAT'] 				= 'Saisissez la date au format JJ.MM.AAAA';
$GLOBALS['MESSAGES']['MSG_DATUMBIS_KLEINER_DATUMVON'] 	= 'La date finale %s est antérieure à la date initale %s';
$GLOBALS['MESSAGES']['MSG_SEITE_NICHT_GESPEICHERT'] 	= 'La page %s n\'a pas pu être sauvegardée';
$GLOBALS['MESSAGES']['MSG_SEITE_NICHT_GELOESCHT'] 		= 'La page %s n\'a pas pu être supprimée';
$GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB_GESPEICHERT']= '%s n\'a pas pu être sauvegardée dans la banque de données';
$GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB_GELOESCHT'] 	= '%s n\'a pas pu être supprimée de la banque de données';
$GLOBALS['MESSAGES']['MSG_BILD_EXISTIERT_IN_DB'] 		= '%s est déjà disponible dans la banque de données';
$GLOBALS['MESSAGES']['MSG_BILD_NICHT_IN_DB'] 			= '%s n\'est pas disponible dans la banque de données';
$GLOBALS['MESSAGES']['MSG_KOMMENTAR_NICHT_GESPEICHERT'] = 'Le commentaire n\'a pas été sauvegardé';
$GLOBALS['MESSAGES']['MSG_BILDER_PRO_REF_NICHT_GELOESCHT'] 	= 'Lors de la suppression de la page %s, les images n\'ont pas toutes pu être supprimées de la BD';


/*********************************************************************************************************************
 * Meldungstexte zur Klasse picturesMaintain
 *********************************************************************************************************************/

// Erfolgs - Meldungen 
$GLOBALS['MESSAGES']['MSG_DATEI_UMBENANNT'] 			= 'Le nom du fichier a été modifié';
$GLOBALS['MESSAGES']['MSG_DATEI_GELOESCHT'] 			= 'Le fichier %s a été supprimé';
$GLOBALS['MESSAGES']['MSG_DIR_GELOESCHT'] 				= 'Le répertoire %s a été supprimé';
$GLOBALS['MESSAGES']['MSG_DIR_ANGELEGT'] 				= 'Le répertoire %s a été créé';
$GLOBALS['MESSAGES']['MSG_DIR_EXISTS'] 					= 'Le répertoire %s existe déjà';
$GLOBALS['MESSAGES']['MSG_THUMBNAIL_GESPEICHERT'] 		= '%s a été sauvegardé en tant que vignette %s ';
$GLOBALS['MESSAGES']['MSG_DATEI_HOCHGELADEN'] 			= 'Le fichier %s a été téléchargé';
$GLOBALS['MESSAGES']['MSG_DATEI_RESIZED'] 				= 'Le fichier %s a été réduit à la taille maximale autorisée de %s x %s pixels';

// Fehler - Meldungen 
$GLOBALS['MESSAGES']['MSG_DATEI_NICHT_UMBENANNT'] 		= 'Le fichier n\'a pas pu être renommé';
$GLOBALS['MESSAGES']['MSG_DATEI_NICHT_GELOESCHT'] 		= 'Le fichier %s n\'a pas pu être supprimé!';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_ANGELEGT'] 			= 'Le répertoire %s n\'a pas pu être créé!';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_GELOESCHT'] 		= 'Le répertoire %s n\'a pas pu être supprimé!';
$GLOBALS['MESSAGES']['MSG_DIR_EXISTIERT_SCHON'] 		= 'Le répertoire %s existe déjà - impossible de le créer!';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_LEER'] 				= 'Le répertoire %s ne peut pas être supprimé - il n\'est pas vide!';
$GLOBALS['MESSAGES']['MSG_DIR_NICHT_ANGELEGT'] 			= 'Le répertoire %s n\'a pas pu être créé!';
$GLOBALS['MESSAGES']['MSG_THUMBNAIL_NICHT_GESPEICHERT'] = '%s n\'a pas pu être sauvegardé en tant que vignette!';
$GLOBALS['MESSAGES']['MSG_FALSCHER_DATEITYP'] 			= 'Le type de fichier de %s ne peut pas être téléchargé!';
$GLOBALS['MESSAGES']['MSG_DATEI_ZU_GROSS'] 				= 'Le fichier %s dépasse la taille maximale autorisée de %s KB!';
$GLOBALS['MESSAGES']['MSG_DATEI_EXISTIERT_SCHON'] 		= 'Le fichier %s existe déjà!';
$GLOBALS['MESSAGES']['MSG_DATEI_NICHT_HOCHGELADEN'] 	= 'Le fichier %s n\'a pas pu être téléchargé!';
$GLOBALS['MESSAGES']['MSG_KEINE_DATEIEN_GEFUNDEN']		= 'Aucun fichier disponible!';
$GLOBALS['MESSAGES']['MSG_FEHLER'] 						= 'Une erreur est survenue!';
$GLOBALS['MESSAGES']['MSG_DISKFILE_FEHLT'] 				= 'Le fichier n\'est pas disponible sur le disque: %s';

// Texte
$GLOBALS['TEXTE']['INDEX_AKTUALISIEREN']				= 'Mettre à jour l\'indice';
$GLOBALS['TEXTE']['NO_THUMBNAIL']						= 'Aucune vignette n\'est disponible pour l\'image: ';

/*********************************************************************************************************************
 * Texte zum Frontend
 *********************************************************************************************************************/
$GLOBALS['BACKUP']['VERZEICHNIS_EXISTIERT_NICHT'] 		= 'Le répertoire %s n\'existe pas!';
$GLOBALS['BACKUP']['DOWNLOAD'] 							= 'Sauvegarder le fichier localement';
$GLOBALS['BACKUP']['EXPLANATION']	 					= 'Une copie de sauvegarde est créée automatiquement en cliquant sur le lien ci-après.';
$GLOBALS['BACKUP']['DURCHFUEHREN']	 					= 'Effectuer une copie de sauvegarde de la banque de données';
$GLOBALS['BACKUP']['SICHERUNG']							= 'Sauvegarder le tableau: %s';
$GLOBALS['BACKUP']['SUCCESS']	 	 					= 'La copie de sauvegarde a été effectuée.';
$GLOBALS['BACKUP']['ERROR']		 						= 'La copie de sauvegarde n’a pas pu être effectuée.';
$GLOBALS['BACKUP']['DATEI']		 						= 'Fichier de copie de sauvegarde';
$GLOBALS['BACKUP']['ERSTELLT']	 						= 'Date de création';
$GLOBALS['BACKUP']['DATEIGROESSE']	 					= 'Taille en KB';


/*********************************************************************************************************************
 * Texte zum Frontend
 *********************************************************************************************************************/
$GLOBALS['GALERIE']['FIRST_PAGE'] 						= 'vers la première page';
$GLOBALS['GALERIE']['PREV_PAGE'] 						= 'une page en arrière';
$GLOBALS['GALERIE']['NEXT_PAGE'] 						= 'une page en avant' ;
$GLOBALS['GALERIE']['LAST_PAGE'] 						= 'vers la dernière page';

$GLOBALS['LINKS']['UEBERSICHT']							= '&lt; retour';
$GLOBALS['LINKS']['WEITER']								= '&gt; continuer'; 
$GLOBALS['LINKS']['GALERIE'] 							= '&gt; galerie';

$GLOBALS['LINKS']['GALERIE_AKTIV'] 						= 'Ajouter un lien vers la galerie';
$GLOBALS['LINKS']['GALERIE_INAKTIV'] 					= 'N\'ajouter aucun lien vers la galerie';
$GLOBALS['LINKS']['BILDLEISTE'] 						= 'Ajouter une barre d\'images contenant des liens';
$GLOBALS['LINKS']['AUTOBILDWECHSEL'] 					= 'Images défilant automatiquement';

$GLOBALS['LINKS']['SIEHE_AUCH'] 						= '&gt; ';
$GLOBALS['WEBMAIL']['TITEL'] 							= 'Login Webmail';

/*********************************************************************************************************************
 * Kontaktformular
 *********************************************************************************************************************/
$GLOBALS['KONTAKTFORM']['TITEL'] 						= 'Formulaire de contact';
$GLOBALS['KONTAKTFORM']['SENT'] 						= 'Je vous remercie de m\'avoir contacté!'."<br />\n";
$GLOBALS['KONTAKTFORM']['NOT_SENT']						= 'Le mail n\'a pas pu être envoyé!'."<br />\n";
$GLOBALS['KONTAKTFORM']['DATA_SENT']					= 'L\'information suivante a été présentée: '."<br />\n";
$GLOBALS['KONTAKTFORM']['OBLIGATORY']                   = '* S\'il vous plaît remplir tous les champs!';
$GLOBALS['KONTAKTFORM']['NAME']                         = 'Nom *';
$GLOBALS['KONTAKTFORM']['ADRESSE']                      = 'Adresse *';
$GLOBALS['KONTAKTFORM']['PLZ_ORT']                      = 'NPA / Lieu *';
$GLOBALS['KONTAKTFORM']['TELEFON']                      = 'Téléphone *';
$GLOBALS['KONTAKTFORM']['EMAIL']                        = 'Email *';
$GLOBALS['KONTAKTFORM']['MITTEILUNG']                   = 'Message';
$GLOBALS['KONTAKTFORM']['BILDCODE']                     = 'Code de l\'image *';
$GLOBALS['KONTAKTFORM']['SENDEN']                       = 'envoyer';
$GLOBALS['KONTAKTFORM']['RESET']                        = 'reculer';
$GLOBALS['KONTAKTFORM']['CODE_FALSCH']                  = 'Le code de sécurité est incorrect!';
$GLOBALS['KONTAKTERROR']['MARKEDFIELDS']                = 'Veuillez remplir les champs en surbrillance!';
$GLOBALS['KONTAKTERROR']['WRONGEMAIL']                  = 'L\'adresse e-mail n\'est pas valide!';


/*********************************************************************************************************************
 * Texte zum Member-Login
 *********************************************************************************************************************/
$GLOBALS['MEMBER']['TITLE_LOGIN']                       = 'Connecter';
$GLOBALS['MEMBER']['TITLE_FORGOTTEN']                   = 'Demander un nouveau mot de passe';
$GLOBALS['MEMBER']['TITLE_CHANGE']                      = 'Changer le mot de passe';
$GLOBALS['MEMBER']['TITLE_REGISTER']                    = 'Inscription';
$GLOBALS['MEMBER']['LBL_EXECUTE']                       = 'effectuer';
$GLOBALS['MEMBER']['EMAIL']                             = 'Email';
$GLOBALS['MEMBER']['CHANGE_PW']                         = 'Voulez-vous changer votre mot de passe?';
$GLOBALS['MEMBER']['CHANGE_PW_MELDUNG']                 = 'Votre mot de passe a été changé!';
$GLOBALS['MEMBER']['FORGOTTEN']                         = 'Avez-vous oublié votre mot de passe?';
$GLOBALS['MEMBER']['REGISTER']                          = 'Voulez-vous vous inscrire?';
$GLOBALS['MEMBER']['REGISTER_MELDUNG']    				= 'Votre inscription a été terminé avec succès - S\'il vous plaît inscrivez-vous maintenant.';
$GLOBALS['MEMBER']['EXEC_LOGIN']                        = 'Connectez-vous';
$GLOBALS['MEMBER']['EXEC_FORGOTTEN']                    = 'Demander nouveau mot de passe';
$GLOBALS['MEMBER']['EXEC_REGISTER']                     = 'Inscription';
$GLOBALS['MEMBER']['LOGIN_AND_PASSWORD']                = 'S\'il vous plaît entrer les informations d\'identification valides!';
$GLOBALS['MEMBER']['EMAIL_SEND_FAILED']					= 'Votre nouveau mot de passe ne peut pas être envoyé par e-mail - s\'il vous plaît essayer à nouveau plus tard';
$GLOBALS['MEMBER']['USER_NOT_EXISTS']   				= 'L\'utilisateur %s n\'est pas stocké dans le système!';
$GLOBALS['MEMBER']['USER_ALREADY_EXISTS']				= 'L\'utilisateur %s est déjà stocké dans le système!';
$GLOBALS['MEMBER']['SAVE_FAILED']        				= 'Une erreur s\'est produite';

?>
