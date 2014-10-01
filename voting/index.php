<?php

  /*****************************************************
  ** Title........: Configuration File
  ** Filename.....: config.php
  ** Author.......: Ralf Stadtaus
  ** Homepage.....: http://www.stadtaus.com/
  ** Contact......: http://www.stadtaus.com/forum/
  ** Notes........: This file contains the configuration
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





  /*****************************************************
  ** Script configuration - for the documentation of
  ** following variables please take a look at the
  ** documentation file in folder 'docu'.
  *****************************************************/


          $vote_title             = 'Favourite Operating System';
          $vote_text              = 'What is your favourite operating system?';

          $vote_option[]          = 'Linux';
          $vote_option[]          = 'Macintosh';
          $vote_option[]          = 'OS/2';
          $vote_option[]          = 'Unix, Solaris';
          $vote_option[]          = 'Windows';

          $intern_vote_name       = 'operating_system';
          $form_field_type        = 'radio';             // (radio, select, radio_image)
          $bar_image_name         = 'blue.gif';
          $max_bar_width          = '200';               // (pixel)

          $check_ip_address       = 'no';                // (yes/no)
          $check_cookie           = 'no';
          $check_referrers        = 'no';
          $check_email            = 'no';
          $check_captcha          = 'no';

          $language               = 'en';                // See folder "languages"

          $script_root            = './';
          $path['templates']      = $script_root . 'templates/';
          $path['logfiles']       = $script_root . 'logfiles/';

          $tmpl['layout']         = 'voting.tpl.html';

          $log['logfile']         = 'log.txt';

          $show_error_messages    = 'yes';





  /*****************************************************
  ** Add here further words, text, variables and stuff
  ** that you want to appear in the template.
  *****************************************************/
          $add_text = array(

                              'txt_additional'  => 'Additional',  //  {txt_additional}
                              'txt_more'        => 'More',        //  {txt_more}

                              'txt_script_name' => 'Voting Script'

                            );








  /*****************************************************
  ** Send safety signal to included files
  *****************************************************/
          define('IN_SCRIPT', 'true');




  /*****************************************************
  ** Include script code
  *****************************************************/
          include $script_root . 'inc/core.inc.php';

          echo $v4g_output;

?>