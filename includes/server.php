<?php
/* Dokumenten Rootverzeichnis anhand der Super-Globalen Variable $_SERVER*/
// WebRoot-Verzeichnis kann /cms2 oder / oder /cms... oder irgendwas sein zb. auch /beta/nexttext etc...
// erst mal den Pfad in seine Bestandteile (Unterverzeichnisse) aufteilen
$pfad = explode("/",$_SERVER['SCRIPT_NAME']);
$cms = "";
foreach ($pfad as $key => $value) {
	if(!stristr($value,"cmsadmin") && !stristr($value,"index.php"))  {
		$cms .= $value . "/";
	} else {
		break; // foreach beenden
	}
}

define('ROOTDIR',$cms);
define('DOCUROOT',$_SERVER['DOCUMENT_ROOT'].$cms);

?>
