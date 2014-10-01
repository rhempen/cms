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
    <script type="text/javascript" src="scripts/jquery.js"></script>
    <script type="text/javascript" src="scripts/jquery.dataTables.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?region=CH&sensor=false"></script>
    <script type="text/javascript" src="scripts/gmaps.js" charset="utf-8"></script>
  </head>

  <body onload="initialize()">
  	<div id="gmapsWrapper">
  		<div id="gmapsInputs">
  			<form action="index.php" method="get">
              <ul>
                <li><span><?php echo $GLOBALS['TEXTE']['LBL_SUCHEN']; ?></span></li>&nbsp;
				<li>
                  <input type="hidden" size="2" name="langu" value="<?php echo $langu;?>"/>
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
                <li><button id="liste" class="switch hide" type="button" onclick="switchView('<?php echo $GLOBALS['TEXTE']['BTN_LISTE'];?>','<?php echo $GLOBALS['TEXTE']['BTN_KARTE'];?>');"><b><?php echo $GLOBALS['TEXTE']['BTN_LISTE'];?></b></button></li>
              </ul>
			</form>
  		</div>
        <div id="lst" class="hide"></div>
        <div id="map"></div>
	</div>	
  </body>
</html>
