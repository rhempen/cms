
<?php
	ob_start();                                                                                                       
	phpinfo();                                                                                                       
	$info = ob_get_contents();                                                                                       
	ob_end_clean();            
// mit dem folgenden Befehle können die Formatierungen entfernt werden	                                                                                       
//	$info = preg_replace('%^.*<body>(.*)</body>.*$%ms', '$1', $info);
	echo $info;
?>
