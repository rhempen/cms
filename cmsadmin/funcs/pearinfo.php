<?php

if ($_SERVER['HTTP_HOST'] == 'localhost') {
    ini_set('include_path', ini_get('include_path') . ';c:\xampp\php\PEAR');
} else {
    ini_set('include_path', ini_get('include_path'));
}
require_once('System.php');
var_dump(class_exists('System', false));
var_dump('Pear-Lib: '. ini_get('include_path'));
?>
