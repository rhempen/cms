<?php echo "<?xml version=\"1.0\" encoding=\"utf-8\"?".">\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/2000/REC-xhtml1-20000126/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="imagetoolbar" content="no" /> 
<meta http-equiv="Content-Style-Type" content="text/css" />
<title>Backup Uebersicht</title>

<link href="../css/cmsadmin_admin.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="content">
   
	<?php require_once '../../includes/includes.php';?>

	<p><?php echo $GLOBALS['BACKUP']['EXPLANATION'];?>
			
	<br/><br/><a href="backup2.php" style="font-size:16px;"><?php echo $GLOBALS['BACKUP']['DURCHFUEHREN']; ?></a><br />
	
	<?php include_once "maintain_backups.php"; ?></p>
	
</div>

</body>
</html>
