<?php
function erzeuge_code($laenge = 3){
    $code     = '';
    $arr1     = range(0, 9);
    $arr2     = range('a', 'z');
    $arr1und2 = array_merge($arr1, $arr2);

    srand ((float)microtime() * 1000000);
	shuffle($arr1und2);
	
	if ($laenge < 3 || $laenge > 12) 
	{
		$laenge = 3;
	}
	
    foreach(array_slice($arr1und2, 0, $laenge) as $zeichen)
    {
    	$code .= $zeichen;
    }
    
    return $code;
}
//echo erzeuge_code();
?>