<?php

set_include_path(
    './library' . PATH_SEPARATOR . 
    ini_get('include_path')
    );

$va = new gentlesourceVotingAdmin();

echo $va->process();



class gentlesourceVotingAdmin
{
    /**
     * Form field default values
     */
    private $default = array(
        'barImage'          => 'red.gif',
        'barWidth'          => '200',
        'checkCookie'       => 'no',
        'checkIP'           => 'no',
        'fieldType'         => '',
        'internVotingName'  => '',
        'language'          => 'en',
        'votingTitle'       => '',
        'votingText'        => '',
        'votingOptions'     => array(''),
        );
    /**
     * Currently used data
     */
    private $data = null;
    
    /**
     * Available languages
     */
    private $language = array(
        'en' => array(
            'txtAddOption'              => 'Add Option',
            'txtBarImage'               => 'Color of the result',
            'txtBarWidth'               => 'Length of the result bar (in Pixel)',
            'txtCheckCookie'            => 'Restrict to one vote by cookie',
            'txtCheckIP'                => 'Restrict to one vote by IP address',
            'txtDownloadFile'           => 'Download Voting File',
            'txtFieldType'              => 'Display voting options as',
            'txtFieldTypeRadio'         => 'Radio Buttons',    
            'txtFieldTypeRadioImage'    => 'Radio Buttons (Images - requires you to set image files as voting options)',    
            'txtFieldTypeSelect'        => 'Select Menu',
            'txtLanguage'               => 'Language',
            'txtNo'                     => 'No',    
            'txtRemoveOption'           => 'Remove Option',
            'txtStartOver'              => 'Clear Form',
            'txtVotingOption'           => 'Voting option',
            'txtVotingText'             => 'Voting text',
            'txtVotingTitle'            => 'Voting title',
            'txtYes'                    => 'Yes',
            ),
        );
        
    /**
     * Available languages
     */
    private $votingLanguages = array(
        'cz' => 'Czech',
        'nl' => 'Dutch',
        'de' => 'German',
        'en' => 'English',
        'es' => 'Spanish',
        'hu' => 'Hungarian',
        'it' => 'Italian',
        'no' => 'Norwegian',
        'pl' => 'Polish',
        'ro' => 'Romania',
        'ru' => 'Russia',
        'sk' => 'Slovakia',
        'sv' => 'Svedish',
        'tr' => 'Turkey',
        'ua' => 'Ukraine',
        );
        
    /**
     * Configuration file template
     */
    private $fileName = './voting.tpl';
    
    /**
     * Configuration download file name
     */
    private $downloadFileName = 'voting.php';
        
    /**
     * Array with filtered post vars
     */
    private $post = null;
    
    /**
     * Send download constants
     */
    const file      = 1;
    const data      = 2;
    const resource  = 3;
    
    /**
     * Voting options
     */
    private $votingOptions = array('');
    
    /**
     * Constructor
     */
    public function __construct()
    {        
        $this->data = $this->default;
        $this->post = $_POST;
        
        // Start Session
        if (session_id() == '') {
            ini_set('session.use_trans_sid', 0);
            session_set_cookie_params(false, '/');
            session_start();
        }
        $this->saveData();
        
        
        // Add voting option
        if (isset($this->post['addOption'])) {
            $this->votingOptions[] = '';
        }
        
        // Remove voting option
        if (isset($this->post['removeOption'])) {
            if (count($this->votingOptions) > 1) {
                array_pop($this->votingOptions);
            }
        }
    }
    
    /**
     * Save form data in session
     */
    private function saveData()
    {   
        // Save form data in session
        if (count($this->post) > 0) {
            $_SESSION['gentlesource_voting_configuration'] = $this->post;
            $this->data = $this->post;
            $this->votingOptions = $this->post['votingOptions'];
        } else {
            if (isset($_SESSION['gentlesource_voting_configuration'])) {
                $this->data = $_SESSION['gentlesource_voting_configuration'];
                $this->votingOptions = $this->data['votingOptions'];
            }
        }
    }
    
    /**
     * Do the work
     */
    public function process()
    {        
        // Send the finished file to download   
        if (isset($this->post['downloadFile'])) {
            file_put_contents('./files/' . time(), $this->processConfigurationFile());
            
            
            $this->sendDownload(
                $this->processConfigurationFile(),
                $this->downloadFileName,
                self::data
                );
        }
        
        // Clear form   
        if (isset($this->post['startOver'])) {
            $this->data = $this->default;
            $_SESSION['gentlesource_voting_configuration'] = $this->default;
            $this->votingOptions = array('');
        }
        
        return $this->getHTMLtemplate();
    }
    
    /**
     * Configuration file
     */
    private function processConfigurationFile()
    {
        $content = file_get_contents($this->fileName);
        
        $data = $this->post;
        
        $data['votingOptions']    = $this->fileVotingOptions();
        $data['internVotingName'] = $this->convertVotingTitle($this->data['votingTitle']);
        $data['barWidth']         = abs(intval(($this->data['barWidth'])));
        
        foreach (array_keys($this->default) AS $field)
        {
            if (!isset($data[$field])) {
                $data[$field] = $this->default[$field];
            }
            $content = str_replace('{' . $field . '}', $data[$field], $content);
        }
        return $content;
    }
    
    /**
     * HTML template
     */
    private function filterOutput($data)
    {
        foreach ($data AS $key => $val)
        {
            if (is_array($val)) {
                foreach ($val AS $k => $v) 
                {
                    $val[$k] = htmlentities(stripslashes($v));
                }
                $data[$key] = $val;
                continue;
            }
            $data[$key] = htmlentities(stripslashes($val));
        }
        return $data;
    }
    
    /**
     * HTML template
     */
    private function getHTMLtemplate()
    {
        $data = $this->filterOutput($this->data);
        extract($data);
        extract($this->language[$this->selectLanguage()]);
        return '
            <html>
              <head>
                <title></title>
                <style type="text/css">
                <!--
            
                    div, p, body, td {
                        font-family:Arial, Helvetica, Sans-serif;
                    }
                    input[type="text"],
                    select {
                        width:400px;
                    }
                    dl.form dt {                    
                        float: left;                    
                        width: 300px;                    
                        font-weight: normal;                    
                        text-align: right;                    
                        padding-top: 0;                    
                        padding-bottom: 0;                    
                    }
                    dl.form dd {                    
                        margin: 0 0 10px 310px;                    
                        text-align: left;                    
                        padding-top: 0;                    
                        padding-bottom: 0;                    
                    }

                    input.downloadFile {
                        padding:20px 5px 20px 5px;
                        margin-right:80px;
                        font-weight:bold;
                        font-size:120%;
                        color:#2AAF00;
                    }

                    input.startOver {
                        padding:5px;
                        color:#FF0000;
                    }
            
                -->
                </style>
              </head>
              <body>
                <form action="./index.php" method="post">
                <dl class="form">
                    <dt><label for="votingTitle">' . $txtVotingTitle . '</label></dt>
                    <dd><input type="text" name="votingTitle" value="' . $votingTitle . '" /></dd>

                    <dt><label for="votingText">' . $txtVotingText . '</label></dt>
                    <dd><input type="text" name="votingText" value="' . $votingText . '" /></dd>
        
                    ' . $this->formVotingOptions() . '

                    <dt></dt>
                    <dd>
                        <input type="submit" name="addOption" value="' . $txtAddOption. '" />
                        <input type="submit" name="removeOption" value="' . $txtRemoveOption. '" />
                    </dd>

                    <dt><label for="fieldType">' . $txtFieldType . '</label></dt>
                    <dd>
                        <select name="fieldType" size="1">
                            <option value="radio">' . $txtFieldTypeRadio . '</option>
                            <option value="select">' . $txtFieldTypeSelect . '</option>
                            <option value="radio_image">' . $txtFieldTypeRadioImage . '</option>
                        </select>
                    </dd>

                    <dt><label for="barImage">' . $txtBarImage . '</label></dt>
                    <dd>
                            ' . $this->barColors() . '
                    </dd>

                    <dt><label for="barWidth">' . $txtBarWidth. '</label></dt>
                    <dd><input type="text" name="barWidth" value="' . $barWidth. '" /></dd>

                    <dt><label for="checkIP">' . $txtCheckIP. '</label></dt>
                    <dd>
                        <input type="radio" name="checkIP" id="checkIPYes" value="yes" /> <label for="checkIPYes">' . $txtYes . '</label>
                        <input type="radio" name="checkIP" id="checkIPNo" value="no" /> <label for="checkIPNo">' . $txtNo . '</label>
                    </dd>

                    <dt><label for="checkCookie">' . $txtCheckCookie. '</label></dt>
                    <dd>
                        <input type="radio" name="checkCookie" id="checkCookieYes" value="yes" /> <label for="checkCookieYes">' . $txtYes . '</label>
                        <input type="radio" name="checkCookie" id="checkCookieNo" value="no"/> <label for="checkCookieNo">' . $txtNo . '</label>
                    </dd>

                    <dt><label for="fieldType">' . $txtLanguage . '</label></dt>
                    <dd>
                        <select name="language" size="5">
                            ' . $this->votingLanguage() . '
                        </select>
                    </dd>

                    <dd>
                        <input type="submit" name="downloadFile" value="' . $txtDownloadFile. '" class="downloadFile" />
                        <input type="submit" name="startOver" value="' . $txtStartOver. '" class="startOver" />
                    </dd>

                </dl>
                </form>
              </body>
            </html>';
    }
    
    /**
     * Voting language
     */
    private function votingLanguage()
    {
        $content = '';
        foreach ($this->votingLanguages AS $language => $name)
        {
            $selected = '';
            if ($this->data['language'] == $language) {
                $selected = 'selected="selected"';
            }
            $content .= '<option value="' . $language . '" ' . $selected . '>' . $name . '</option>';
        }
        return $content;
    }
    
    /**
     * Form voting option template
     */
    private function formVotingOptions()
    {
        $content    = '';
        $count      = 1;
        extract($this->language[$this->selectLanguage()]);
        foreach ($this->votingOptions AS $option)
        {
            $content .= '
                    <dt><label for="votingText">' . $txtVotingOption. ' #' . $count++ . '</label></dt>
                    <dd><input type="text" name="votingOptions[]" value="' . $option . '" /></dd>';
        }
        return $content;
    }
    
    /**
     * Bar color images
     */
    private function barColors()
    {
        $content = '';
        $handle = opendir('./images/');
        $count = 1;
        while (false !== ($file = readdir($handle)))
        {
            $pos = strpos($file, '.');
            if ($pos === 0) {
                continue;
            }
            
            $file = trim($file);
            
            $selected = '';
            if ($this->data['barImage'] == $file) {
                $selected = 'checked="checked"';
            }
            
            $content .= '<input type="radio" name="barImage" id="' . md5($file) . '" value="' . $file . '" ' . $selected . ' /> <label for="' . md5($file) . '"><img src="./images/' . $file . '" height="15" width="15" border="0" /></label>&nbsp;&nbsp;';
            if ($count == 7) {
                $content .= '<br />';
            }
            $count++;
        }        
        closedir($handle);
        return $content;
    }
    
    /**
     * File voting option template
     */
    private function fileVotingOptions()
    {
        $content    = '';
        foreach ($this->post['votingOptions'] AS $option)
        {
            $content .= "\$vote_option[]          = '" . addslashes($option) . "';\n          ";
        }
        return $content;
    }
    
    /**
     * Select language
     */
    private function selectLanguage()
    {        
        $list = array();
        
        // From post
        if (isset($this->post['language_selector']) and
            $this->post['language_selector'] != '') {
            $list[] = $this->post['language_selector'];
        }
        
        // Default
        $list[] = 'en';
        
        return $list[0];
    }    
    
    /**
     * Send download to browser
     * 
     * @param string $file_name Download file name including complete path
     * @param string $new_file_name Public file name
     * @param string $type FILE = 1|DATA = 2 |RESOURCE = 3
     */
    private function sendDownload($content, $name = null, $type = 1)
    {
        // Backward compatibilty for ob_list_handlers
        if (!function_exists('ob_list_handlers')) {
            function ob_list_handlers()
            {
                $res = array();
                if (ini_get('output_buffering')) {
                    $res[] = 'default output handler';
                }
                return $res;
            }
        }
      
      
        require_once 'Download.php';
        $dl = &new HTTP_Download();
   
        switch ($type) {
            case 1:
                if (is_file($content)) {
                    $dl->setFile($content);
                } else {
                    die('Download File/Path Not Found: ' . $content);
                    return false;
                }
                break;
        
            case 2:
                $dl->setData($content);
                break;
        
            case 3:
                $dl->setResource($content);
                break;
        
            default:
                return false;
                break;
        }

        $dl->setContentDisposition(HTTP_DOWNLOAD_ATTACHMENT, $name);
        
        // Set content type        
        if (preg_match('#Opera(/| )([0-9].[0-9]{1,2})#', getenv('HTTP_USER_AGENT')) or 
            preg_match('#MSIE ([0-9].[0-9]{1,2})#', getenv('HTTP_USER_AGENT'))) {
                
            $content_type = 'application/octetstream';
        } else {
            $content_type = 'application/octet-stream';
        }
        $dl->setContentType($content_type);
        $res = $dl->send();
        
        if (PEAR::isError($res)) {
            die('Send Download Failed: ' . $res->message);
        } else {
            exit;
        }
    }
    
    /**
     * Convert voting title into intern_vote_name
     */
    private function convertVotingTitle($title)
    {
        $source= array(
                    ' ', 'Ä', 'ä', 'Ö', 'ö', 'Ü', 'ü', 'ß', 'é', 'è', 'ê',
                    'í', 'ì', 'î', 'á', 'à', 'â', 'å', 'ó', 'ò', 'ô', 'õ',
                    'ú', 'ù', 'û', 'ç', 'Ç', 'ñ', 'ý');

        $target = array(
                     '-', 'AE', 'ae', 'OE', 'oe', 'UE', 'ue', 'ss', 'e', 'e',
                     'e', 'i', 'i', 'i', 'a', 'a', 'a', 'a', 'o', 'o', 'o',
                     'o', 'u', 'u', 'u', 'c', 'C', 'n', 'y');
        $path = trim($title);
        $path = str_replace($source, $target, $path);
        $path = strtolower($path);
        $path = preg_replace('/[^0-9a-z\.\_!;,\+\-]/i', '-', $path);
        $pattern = array('/\-{2,}/', '/\-$/');
        $replace = array('-', '');        
        $path = preg_replace($pattern, $replace, $path);
        $path = substr($path, 0, 240);
        return $path;
    }
}