<?php
// Start einer Session muss immer als Erstes deklariert werden
session_start();
$session_name = session_name();
$session_id   = session_id();

/**
  * diese Funktion überprüft, ob die Sesssiondaten eines User noch gültig sind.
  * Wenn nicht, wird automatisch auf den Loginscreen gewechselt
  */


if ($_SESSION['username'] == "" || $_SESSION['password'] == "") {
	if (!headers_sent()) {
		$host  = $_SERVER['HTTP_HOST'];
		$uri   = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
		//header("Location: http://$host$uri/");
		header("Location: ../cmslogin.html");
	}
	exit;
}
?>
