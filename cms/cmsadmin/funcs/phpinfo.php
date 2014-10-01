
<?php
	ob_start();                                                                                                       
	phpinfo();                                                                                                       
	$info = ob_get_contents();
	ob_end_clean();            
// mit dem folgenden Befehle k�nnen die Formatierungen entfernt werden	                                                                                       
//	$info = preg_replace('%^.*<body>(.*)</body>.*$%ms', '$1', $info);
	echo $info;
    echo '<br>Geladene Extensions<br>';
    var_dump(get_loaded_extensions());
    echo '<br>Funktionen der GD-Library<br>';
    var_dump(get_extension_funcs('gd'));
    echo '<br>'
    
?>
