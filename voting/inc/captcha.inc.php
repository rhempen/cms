<?php

$image_temp_path = $configuration['temp_folder'];
$captcha_content = '';
$captcha_note    = '';

if (!function_exists('file_put_contents')) {
    function file_put_contents($filename, $content, $flags = 0) {
        if (!($file = fopen($filename, ($flags & 1) ? 'a' : 'w'))) {
            return false;
        }
        $n = fwrite($file, $content);
        fclose($file);
        return $n ? $n : false;
    }
}

// Start PHP session support
session_start();
unset($GLOBALS['phrase']);

$ok = false;
$captcha_error = false;

if ($_SERVER['REQUEST_METHOD'] == 'POST' and !isset($_POST['mode_preview']) and !isset($message)) {

    if (isset($_POST['phrase']) && isset($_SESSION['phrase']) &&
        strlen($_POST['phrase']) > 0 && strlen($_SESSION['phrase']) > 0 &&
        strtolower($_POST['phrase']) == strtolower($_SESSION['phrase'])) {
        $ok = true;
        $captcha_content = '<input type="hidden" name="phrase" value="' . $_SESSION['phrase'] . '" />';
    } else {
        $message[] = array('message' => $txt['txt_captcha_try_again'], 'fields' => '');
    }


    if (is_file($image_temp_path . session_id() . '.png')) {
        unlink($image_temp_path . session_id() . '.png');
    }

}


if (!$ok) {

    require_once 'Text/CAPTCHA.php';


    // Set CAPTCHA options (font must exist!)
    $options = array(
        'font_size' => 20,
        'font_path' => $configuration['captcha_font_path'],
        'font_file' => 'daft.ttf'
    );

    // Generate a new Text_CAPTCHA object, Image driver
    $c = Text_CAPTCHA::factory('Image');
    $retval = $c->init(200, 60, null, $options);
    if (PEAR::isError($retval)) {
//        var_dump($retval);
        $message[] = array('message' => $txt['txt_error_captcha'], 'fields' => '');
        $captcha_error = true;
    }

    if ($captcha_error == false) {
        // Get CAPTCHA secret passphrase
        $_SESSION["phrase"] = $c->getPhrase();

        // Get CAPTCHA image (as PNG)
        $png = $c->getCAPTCHAAsPNG();
        if (PEAR::isError($png)) {
            $message[] = array('message' => $txt['txt_error_captcha'], 'fields' => '');
            $captcha_error = true;
        }

        if ($captcha_error == false) {
            file_put_contents($image_temp_path . session_id() . ".png", $png);
            $captcha_note = $txt['txt_captcha_note'];
            $captcha_content = '<img src="' . $image_temp_path . session_id() . '.png?' . time() . '" align="absmiddle" />&nbsp;&nbsp;' .
                 '<input type="text" name="phrase" />';
        }
    }
}
?>