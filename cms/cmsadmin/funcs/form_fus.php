<?php
function sql_quote($value)
{
   if( is_array($value) ) {
       return array_map("quote_smart", $value);
   } else {
       if( get_magic_quotes_gpc() ) {
           $value = stripslashes($value);
       }
       if( $value == '' ) {
           $value = 'NULL';
       } if( !is_numeric($value) || $value[0] == '0' ) {
           $value = "'".mysql_real_escape_string($value)."'";
       }
       return $value;
   }
}

function filter_data($value)
{
    if (get_magic_quotes_gpc())
    {
        $value = stripslashes($value);
    }
    $value = str_replace('location.href', '', $value);
    $value = str_replace('DELETE', '', $value);
    $value = str_replace('UPDATE', '', $value);
    $value = str_replace('SELECT', '', $value);
    $value = str_replace('WHERE', '', $value);
    return strip_tags($value);
}

function html_encode($string){
     $ret_string = '';
     $len = strlen($string);
     for ($x = 0; $x < $len; $x++)
     {
             $ord = ord(substr($string, $x, 1));
             $ret_string .= "&#$ord;";
     }
     return $ret_string;
}

function convert_umlaute($text){
	 //DIE UMLAUTE WERDEN KONVERTIERT  /////
	 $pattern1="/ä/";
	 $replace1="&#228;";
	 $text=preg_replace($pattern1,$replace1, $text);
	 $pattern2="/ö/";
	 $replace2="&#246;";
	 $text=preg_replace($pattern2,$replace2, $text);
	 $pattern3="/ü/";
	 $replace3="&#252;";
	 $text=preg_replace($pattern3,$replace3, $text);
	 $pattern1a="/Ä/";
	 $replace1a="&#196;";
	 $text=preg_replace($pattern1a,$replace1a, $text);
	 $pattern2a="/Ö/";
	 $replace2a="&#214;";
	 $text=preg_replace($pattern2a,$replace2a, $text);
	 $pattern3a="/Ü/";
	 $replace3a="&#220;";
	 $text=preg_replace($pattern3a,$replace3a, $text);
	 $pattern4="/ß/";
	 $replace4="&#xDF;";
	 $text=preg_replace($pattern4,$replace4, $text);
	 $pattern5a="/\"/";
	 $replace5a="&quot;";
	 $text=preg_replace($pattern5a,$replace5a, $text);
	 $pattern5b="/</";
	 $replace5b="&lt;";
	 $text=preg_replace($pattern5b,$replace5b, $text);
	 $pattern5c="/>/";
	 $replace5c="&gt;";
	 $text=preg_replace($pattern5c,$replace5c, $text);
//	 $pattern5d="/&/";
//	 $replace5d="&amp;";
//	 $text=preg_replace($pattern5d,$replace5d, $text);
	 
	 return $text;
}


function convert_umlaute2($text) {
    $text = str_replace('–', '_', $text);
	// Alle ungültigen Zeichen ersetzen
	$suchmuster[0] = '/ä/'; $ersetzung[0] = 'ae';
	$suchmuster[1] = '/ö/'; $ersetzung[1] = 'oe';
	$suchmuster[2] = '/ü/'; $ersetzung[2] = 'ue';
	$suchmuster[3] = '/Ä/'; $ersetzung[3] = 'Ae';
	$suchmuster[4] = '/Ö/'; $ersetzung[4] = 'Oe';
	$suchmuster[5] = '/Ü/'; $ersetzung[5] = 'Ue';
	$suchmuster[6] = '/à|á|â/'; $ersetzung[6] = 'a';
	$suchmuster[7] = '/é|è|ê/'; $ersetzung[7] = 'e';
	$suchmuster[8] = '/ò|ó|ô/'; $ersetzung[8] = 'o';
	$suchmuster[9] = '/ù|ú|û/'; $ersetzung[9] = 'u';
	$suchmuster[10] = '/À|Á|Â/'; $ersetzung[10] = 'A';
	$suchmuster[11] = '/É|È|Ê/'; $ersetzung[11] = 'E';
	$suchmuster[12] = '/Ó|Ò|Ô/'; $ersetzung[12] = 'O';
	$suchmuster[13] = '/Ú|Ù|Û/'; $ersetzung[13] = 'U';
	$suchmuster[14] = '/ç/'; $ersetzung[14] = 'c';
	$suchmuster[15] = '/\s/'; $ersetzung[15] = '_'; // Leerschlag durch _ ersetzen	
	$suchmuster[16] = '/[^a-zA-Z0-9]*\./'; $ersetzung[16] = ''; // Alle Sonderzeichen durch space ersetzen
	$suchmuster[17] = '/-{1,}/'; $ersetzung[17] = '_'; // doppelte oder mehr Bindestriche durch einen ersetzen
	$suchmuster[18] = '/_{2,}/'; $ersetzung[18] = '_'; // doppelte oder mehr Unterstriche durch einen ersetzen
	$text=preg_replace($suchmuster,$ersetzung, $text);
	return $text;
}

?>