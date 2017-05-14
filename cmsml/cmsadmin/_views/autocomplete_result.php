<?php
$domain = isset($_REQUEST['domain']) ? $_REQUEST['domain'] : 'art';
$artexp = isset($_REQUEST['artexp']) ? $_REQUEST['artexp'] : 'xxxxx';

require_once '../../db/pear_mdb2.class.php';

$query = 'SELECT DISTINCT page_id, name FROM art_pages
		   WHERE domain="'.$domain.'" 
			 AND aktiv="j"
			 AND name LIKE "' . utf8_decode($artexp) . '%"';
$result = $db->query($query);

$html = '<ul>';
while ($row = $result->fetchRow(MDB2_FETCHMODE_ASSOC))
{
        $row = array_map('htmlentities', $row);
		$html .= '<li value="' . $row['page_id'] . '">' . $row['name'] . '</li>';
}
$html .= '</ul>';
echo $html;
$result->free();
$db->disconnect();
?>