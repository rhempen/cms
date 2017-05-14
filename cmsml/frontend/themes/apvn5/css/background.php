<?php
header('Content-type: text/css');

function get_random_image() {  
  $media_dir = '../../../../media_apvn/page/background/';
  $ext_array = array('.png','.gif','.jpg');
  $bilder_arr = array();
  if (file_exists($media_dir)) {
      $handle  = opendir($media_dir);
      while (false !== ($file = readdir($handle)))
      {
          // Pfad und Datei
          $mediafile = $media_dir. $file;
          $extension	= strrchr($file, ".");
          if (is_file($mediafile) &&  in_array($extension, $ext_array) ) {
              array_push($bilder_arr,$mediafile);
          }
      }
      /* Zufallsgenerator waehlt ein Bild */
      if (count($bilder_arr) > 0) {
          $numr = array_rand($bilder_arr,1);
          $bild = $bilder_arr[$numr];
          $html =  $bild != '' ? '<img src="'.HOST.$bild.'" border="0" alt="" />' : '';
      }
      return $bild;
  }
  
}

?>

#page_margins
{
  background:  url("<?php echo get_random_image(); ?>") #ffffff no-repeat left top; 
}