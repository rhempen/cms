<?php
/**
 * ----------------------------------------------------------
 * (c) 2012  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Sprachabhaengige Texte fuer das Addon Filialsuchen mit Google-Maps von hempenweb
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erwaehnt wird
 * @version     1.0 | 2012-05-06
 */

// Wurde eine Sprache übergeben, sonst Default DE
$language_code = $_GET['langu'] != '' ? strtoupper($_GET['langu']) : 'de';

/*********************************************************************************************************************
 * Sprachabhängige Texte zum Addon
 *********************************************************************************************************************/
switch($language_code) {
  case 'EN':
    setlocale (LC_ALL, 'en_EN');
    $GLOBALS['TEXTE']['LBL_SUCHEN']                   = 'Search by ZIP/City';
    $GLOBALS['TEXTE']['LBL_UMKREIS']                  = 'Perimeter';
    $GLOBALS['TEXTE']['BTN_SUCHEN']                   = 'Search';
    $GLOBALS['TEXTE']['BTN_LISTE']                    = 'List';
    $GLOBALS['TEXTE']['BTN_KARTE']                    = 'Map';
    break;
  case 'FR':
    setlocale (LC_ALL, 'fr_FR');
    $GLOBALS['TEXTE']['LBL_SUCHEN']                   = 'Recherche par Code postal/Ville';
    $GLOBALS['TEXTE']['LBL_UMKREIS']                  = 'Périmètre';
    $GLOBALS['TEXTE']['BTN_SUCHEN']                   = 'Rechercher';
    $GLOBALS['TEXTE']['BTN_LISTE']                    = 'Liste';
    $GLOBALS['TEXTE']['BTN_KARTE']                    = 'Carte';
    break;
  case 'IT':
    setlocale (LC_ALL, 'it_IT');
    $GLOBALS['TEXTE']['LBL_SUCHEN']                   = 'Ricerca per CAP/Città';
    $GLOBALS['TEXTE']['LBL_UMKREIS']                  = 'Perimetro';
    $GLOBALS['TEXTE']['BTN_SUCHEN']                   = 'Ricerca';
    $GLOBALS['TEXTE']['BTN_LISTE']                    = 'Lista';
    $GLOBALS['TEXTE']['BTN_KARTE']                    = 'Carta';
    break;
  default:
    setlocale (LC_ALL, 'de_DE');
    $GLOBALS['TEXTE']['LBL_SUCHEN']                   = 'Suchen nach PLZ/Ort';
    $GLOBALS['TEXTE']['LBL_UMKREIS']                  = 'Umkreis';
    $GLOBALS['TEXTE']['BTN_SUCHEN']                   = 'Suchen';
    $GLOBALS['TEXTE']['BTN_LISTE']                    = 'Liste';
    $GLOBALS['TEXTE']['BTN_KARTE']                    = 'Karte';
    break;
}

?>
