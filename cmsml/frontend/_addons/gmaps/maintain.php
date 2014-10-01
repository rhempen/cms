<?php 
  include_once './languages/Language.php';
  $langu = $_GET['langu'];
  $query = $_GET['query'];
  $dista = $_GET['dista'];
  $param = $query != '' ? '?query='.$query : '';
  $gmapfile .= $param;
  if ($dista != '') { 
    $param = $query != '' ? '&dista='.$dista : '?dista='.$dista;
    $gmapfile .= $param; 
  }
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Filialsuche mit Google Maps AJAX/mySQL/PHP</title>
    <link href="css/gmaps.css" rel="stylesheet" type="text/css"/>
    <link href="css/jquery-ui-1.8.17.custom.css" rel="stylesheet" type="text/css"/>
    <link href="css/demo_table.css" rel="stylesheet" type="text/css"/>
    <link href="css/demo_table_jui.css" rel="stylesheet" type="text/css"/>
    <link href="css/jquery.alerts.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?region=CH&sensor=false"></script>
    <script type="text/javascript" src="scripts/jquery.js"></script>
    <script type="text/javascript" src="scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="scripts/jquery.jeditable.js"></script>
    <script type="text/javascript" src="scripts/jquery-ui.js"></script>
    <script type="text/javascript" src="scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="scripts/jquery.dataTables.editable.js"></script>
    <script type="text/javascript" src="scripts/jquery.alerts.js"></script>
    <script type="text/javascript" src="scripts/gmaps.js"></script>
  </head>

  <body onload="initMaintenance()">
  	<div id="gmapsWrapperMaint">
      <div id="gmapsInputsMaint">
  		<form action="maintain.php" method="get">
          <ul>
            <li><span><?php echo $GLOBALS['TEXTE']['LBL_SUCHEN'];?></span></li>&nbsp;
			<li>
              <input type="hidden" name="langu" value="<?php echo $langu;?>" size="2"/>
              <input type="text" name="query" value="<?php echo $query;?>" size="20"/>
            </li>&nbsp;
            <li><span><?php echo $GLOBALS['TEXTE']['LBL_UMKREIS'];?></span>&nbsp;
                <select id="umkreis" name="dista" size="1">
                  <option value="05" <?php if ($dista == 05) echo 'selected';?>>5 Km</option>
                  <option value="10" <?php if ($dista == 10) echo 'selected';?>>10 Km</option>
                  <option value="20" <?php if ($dista == 20) echo 'selected';?>>20 Km</option>
                  <option value="30" <?php if ($dista == 30) echo 'selected';?>>30 Km</option>
                  <option value="40" <?php if ($dista == 40) echo 'selected';?>>40 Km</option>
                  <option value="50" <?php if ($dista == 50) echo 'selected';?>>50 Km</option>
                </select>
            </li>&nbsp;
            <li><button class="submit" type="submit"><b><?php echo $GLOBALS['TEXTE']['BTN_SUCHEN'];?></b></button></li>&nbsp;
            <li><span id="ergebnis"></span></li>&nbsp;
          </ul>
		</form>
      </div>
      <div id="lstMaint" class="show"></div>
      <div id="ajaxLoad" class="hide">Bitte warten...</div>
      <div id="processing_message" style="display:none" title="Processing">Bitte warten...</div>

      <!-- Custom form for adding new records -->
      <form id="formAddNewRow" action="#" title="Neuer Datensatz" style="display:none;">
        <fieldset>
          <div class="clear"></div>
          <div class="label"><label id="lblAddError" style="display:none" class="error"></label></div>
          <div class="clear"></div>
          <div class="label"><label for="nam">Name</label></div>
          <div class="input"><input type="text" name="nam" id="nam" class="required" rel="0" /></div>
          <div class="clear"></div>
          <div class="label"><label for="adr">Adresse</label></div>
          <div class="input"><input type="text" name="adr" id="adr" class="required" rel="1" /></div>
          <div class="clear"></div>
          <div class="label"><label for="ort">PLZ/Ort</label></div>
          <div class="input"><input type="text" name="ort" id="ort" class="required" rel="2" onchange="getLatLngByAddress();"/></div>
          <div class="clear"></div>
          <div class="label"><label for="lat">Breitengrad</label></div>
          <div class="input"><input name="lat" id="lat" rel="3"></input></div>          
          <div class="clear"></div>
          <div class="label"><label for="lng">L&auml;ngengrad</label></div>
          <div class="input"><input name="lng" id="lng" rel="4"></input></div>
          <div class="clear"></div>
          <div class="label"><label for="typ">Type</label></div>
          <div class="input"><select name="typ" id="typ" rel="5">
                                  <option value="lager">lager</option>
                                  <option value="onlineshop">onlineshop</option>
                          </select></div>
          <div class="clear"></div>
          <div class="label"><label for="act">Aktiv</label></div>
          <div class="input"><select name="act" id="act" rel="6">
                                  <option value="aktiv">aktiv</option>
                                  <option value="inaktiv">inaktiv</option>
                          </select></div>
        </fieldset>
     	</form>
		</div>    
  </body>
</html>
