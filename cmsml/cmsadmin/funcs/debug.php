<?php
/**
* Beschreibung und Einsatz dieser Funktionen ist zu finden auf:
* http://devzone.zend.com/node/view/id/1256
*/

function debug_open_window()
{
    static $window_opened = FALSE;
    if(!$window_opened)
    {
        ?>
        <script type="text/javascript">
        var debugWindow = window.open("","debugWin","toolbar=no,scrollbars,width=700,height=400");
        debugWindow.document.writeln('<html>');
        debugWindow.document.writeln('<head>');
        debugWindow.document.writeln('<title>PHP Remote Debug Window</title>');
        debugWindow.document.writeln('</head>');
        debugWindow.document.writeln('<body><font face="verdana,arial">');
        debugWindow.document.writeln('<hr size=1 width="100%" style="backround-color: black;">');
        </script>
        <?php
        $window_opened = TRUE;
    }
} 

function debug_finish()
{
	?>
	<script  type="text/javascript">
	debugWindow.document.writeln('<hr size=1 width="100%">');
	debugWindow.document.writeln('<a href="javascript:window.close()">Close</a>');
	debugWindow.document.writeln('</body>');
	debugWindow.document.writeln('</html>');
	</script>
	<?php
} 

function debug_msg($mesg)
{
    debug_open_window();
    echo "<script language='JavaScript'>\n";
    echo "debugWindow.document.writeln('".trim(nl2br($mesg))."<br>');\n";
    echo "self.focus();\n";
    echo "</script>\n";
}

function debug_capture_print_r($data)
{
    ob_start();
    print_r($data);
    $result = ob_get_contents();
    ob_end_clean();
    return $result;
}

function debug_colorize_string($string)
{
    /* turn array indexes to red */
    $string = str_replace('[','[<font color="red">',$string);
    $string = str_replace(']','</font>]',$string);
    /* turn the word Array blue */
    $string = str_replace('Array','<font color="blue">Array</font>',$string);
    /* turn arrows graygreen */
    $string = str_replace('=>','<font color="#556F55">=></font>',$string);
    return $string;
}

function debug_var($name,$data)
{
    debug_open_window();
    $captured = explode("\n",debug_capture_print_r($data));
    echo "<script language='JavaScript'>\n";
    echo "debugWindow.document.writeln('<b>$name</b>');\n";
    echo "debugWindow.document.writeln('<pre>');\n";
    foreach($captured as $line)
    {
        echo "debugWindow.document.writeln('".debug_colorize_string($line)."');\n";
    }
    echo "debugWindow.document.writeln('</pre>');\n";
    echo "self.focus();\n";
    echo "</script>\n";
}

function get_request_headers() {
    $headers = array();
    foreach($_SERVER as $key => $value) {
        if(strpos($key, 'HTTP_') === 0) {
            $headers[str_replace(' ', '-', ucwords(str_replace('_', ' ', strtolower(substr($key, 5)))))] = $value;
        }
    }
    return $headers;
}


?>