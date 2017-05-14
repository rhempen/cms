<?php
require_once 'MDB2.php';
$dsn = 'mysqli://hempenc_u1:7awq3LEV@localhost/hempenc_db1';

$mdb2 =& MDB2::factory($dsn);

/* rhe 30.03.2009 */
$mdb2->setFetchMode(MDB2_FETCHMODE_ASSOC);

if (PEAR::isError($mdb2)) {
    echo ($mdb2->getMessage().' - '.$mdb2->getUserinfo());
}

$query ='SELECT * FROM cms_config';

// run the query and get a result handler
$result = $mdb2->query($query);

// check if the query was executed properly
if (PEAR::isError($result)) {
    echo ($result->getMessage().' - '.$result->getUserinfo());
    exit();
}

// lets just get row:0 and free the result
$array = $result->fetchRow();
$result->free();
var_dump($array);
?>
