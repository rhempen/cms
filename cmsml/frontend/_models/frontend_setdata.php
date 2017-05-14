<?php
/**
 * ----------------------------------------------------------
 * (c) 2012  Roland Hempen
 *           www.hempenweb.ch
 * ----------------------------------------------------------
 *
 * Function-Pool zum Setzen einzelner Werte, die im Frontend benötigt werden
 *
 * @author      Roland Hempen
 * @copyright   Frei einsetz- und veraenderbar, wenn der Autor erwaehnt wird
 * @version     1.0 | 2012-03-23
 */
session_start();

$action = $_GET['action'];
$classHeader = $_GET['class'];

/* ----------------------------------------------------------
 * Funktionen deklarieren
 * ----------------------------------------------------------*/

/* 
 * Funktion wird per Ajax aus events.js aufgerufen, wenn der Benutzer auf das 
 * DOM-Objekt mit der ID "klappe" klickt
 * Es wird die CSS-Klasse des Headers in der $_SESSION gespeichert, damit bei
 * einem HTTP-Request der Zustand des Headers wieder herstellen kann.
 * Der Wert in der $_SESSION['classHeader] wird im Headerbereich in der main_tpl.html
 * an das versteckte Feld $("classHeader") weitergereicht 
 * $params: $_GET['class']
 */
function saveClassHeader($classHeader) 
{
  if (preg_match('/(hide|show)/',$classHeader)) {
    unset ($_SESSION['classHeader']);
    $_SESSION['classHeader'] = $classHeader;
    $GLOBALS['CLASSHEADER'] = $classHeader;
    echo 'Ok!';
  } else {
    echo 'Failure!';
  }
}


/* ----------------------------------------------------------
 * Funktionen aufrufen gemäss $action
 * ----------------------------------------------------------*/
switch ($action) {
  case 'saveHeaderClass':
    saveClassHeader($classHeader);
    break;
  default:
    break;
}
  
  
?>
