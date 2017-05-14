<?php
session_start();

// Verzeichnis wo die TTF-Schriften liegen
// die muessen durchnumeriert sein, in dem Beispiel 1.ttf - 7.ttf
// hier aktuelles Verzeichnis
$font_dir = './fonts';


function erzeugeCode($anz = 6){
    $arr1 = range(2, 9);
    $arr2 = range('a', 'h');
    $arr2 = array_map('strtolower', $arr2);
    $arr1und2 = array_merge($arr1, $arr2);
    srand ((float)microtime()*1000000);
    shuffle($arr1und2);
    $code = array_slice($arr1und2, 0, $anz);    
	//header('Set-Cookie: code='.$code); 
    return $code;
}

$code = erzeugeCode();
$_SESSION['code'] = implode('', $code);

//setcookie('code', $code);
// leeres weisses Bild erzeugen
//$image = imagecreatetruecolor(155,40);
//$bgColor = ImageColorAllocate($image, 255, 255, 255);
//ImageFilledRectangle($image, 0, 0, 155, 40, $bgColor);

$image = ImageCreateFromPNG('./img/hg.png');

// Schriftfarbe
$color = imagecolorallocate($image, 0, 0, 0);

// Schriftgroesse
$size = 20;

// Zahlen auf das Bild zeichnen, Position etwas variieren, zuf&auml;llig eine Schriftart ausw&auml;hlen (1.ttf-7.ttf)
imagettftext($image, $size, 0, 5,   25+rand(0,10), $color, $font_dir.'/'.rand(1,7).'.ttf',$code[0]);
imagettftext($image, $size, 0, 30,  25+rand(0,10), $color, $font_dir.'/'.rand(1,7).'.ttf',$code[1]);
imagettftext($image, $size, 0, 55,  25+rand(0,10), $color, $font_dir.'/'.rand(1,7).'.ttf',$code[2]);
imagettftext($image, $size, 0, 80,  25+rand(0,10), $color, $font_dir.'/'.rand(1,7).'.ttf',$code[3]);
imagettftext($image, $size, 0, 105, 25+rand(0,10), $color, $font_dir.'/'.rand(1,7).'.ttf',$code[4]);
imagettftext($image, $size, 0, 130, 25+rand(0,10), $color, $font_dir.'/'.rand(1,7).'.ttf',$code[5]);

// Header f&uuml;r JPEG-Bild ausgeben
header('Content-type: image/jpeg');

// Bild ausgeben
imagejpeg($image);

imagedestroy($image);

print_r('Code='. $code);

?>


