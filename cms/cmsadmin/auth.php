<?php
	if ($_SESSION['username'] == "" || $_SESSION['password'] == "") {
		$cmslogin = '../index.php';
		header('Location: ' . $cmslogin);
	}
?>