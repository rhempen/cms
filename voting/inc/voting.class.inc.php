<?php

/**
 * Title........: Voting Class
 * Filename.....: voting.class.inc.php
 * Author.......: Ralf Stadtaus
 * Homepage.....: http://www.stadtaus.com/
 * Contact......: http://www.stadtaus.com/forum/
 * Version......: 0.3
 * Notes........:
 * Last changed.: 2004-03-18
 * Last change..: IP check
 */

/**
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY
 * OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
 * LIMITED   TO  THE WARRANTIES  OF  MERCHANTABILITY,
 * FITNESS    FOR    A    PARTICULAR    PURPOSE   AND
 * NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
 * OR  OTHER  LIABILITY,  WHETHER  IN  AN  ACTION  OF
 * CONTRACT,  TORT OR OTHERWISE, ARISING FROM, OUT OF
 * OR  IN  CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */

class Voting
{

    /**
     * Log all downloads - new line for each download
     */
    function log($log_path, $vote_name, $intern_value, $extern_value)
    {
        $email_address = '';
        if (isset($_POST['email_address'])) {
            $email_address = str_replace(array("\n", "\r"), '', $_POST['email_address']);
        }

        $log_content = array(
            get_ip(), // (Required) IP address of the remote host
            @gethostbyaddr(get_ip()), // (Required) Name of the remote host
            date("Y-m-d (H:i)", mktime()), // (Required) Date of the download (in international ISO format)
            mktime(), // (Required) Date of the download (in Unix timestamp)
            $vote_name, // (Required) Internal vote name
            $intern_value, // (Required) Internal voting option number
            $extern_value, // (Optional) Actual voting option name
            $email_address, // (Optional) e-mail address
            getenv('HTTP_REFERER'), // (Optional) Referring URL
            getenv('HTTP_USER_AGENT'), // (Optional) User agent
            );

        $log_content = join(' - ', $log_content);

        debug_mode($log_content, 'Log Entry');

        if ($logfile = fopen($log_path, 'a')) {
            flock($logfile, 2);
            if (fputs($logfile, $log_content . "\n")) {
                fclose($logfile);
                return 1;
            }
            fclose($logfile);
        }
    }

    /**
     * Content of the count file
     */
    function count_content($file_name, $download_number, $first_download, $last_download)
    {
        $log_content = array($file_name,/* Name of the download file */
            $download_number + 1,/* Adds 1 to current number of downloads */
            date("Y-m-d (H:i)", $first_download),/* Date of the first download (in international ISO format) */
            date("Y-m-d (H:i)", $last_download),/* Date of the last download (in international ISO format) */
            $first_download,/* Date of the first download in Unix timestamp */
            $last_download/* Date of the last download in Unix timestamp */

            );

        $log_content = join(' - ', $log_content);

        return $log_content;
    }

    /**
     * Reads the numbers of downloads and calculates the
     * new download number.
     */
    function count($log_path, $download_path, $file_name)
    {
        unset($log_template_content);

        $query_file_name = trim($file_name);
        $current_time = mktime();

        if (is_file($log_path)) {
            $count_file_content = file($log_path);
            $log_template_content = array();

            while (list($key, $line) = each($count_file_content)) {
                $line = trim($line);

                if (!empty($line)) {
                    $data = explode(' - ', $line);
                    $stored_file_name = trim($data[0]);

                    if (trim($data[0]) == trim($file_name)) {
                        $download_number = trim($data[1]);
                        $first_download = trim($data[4]);
                        $last_download = mktime();

                        $log_template_content_temp = $this->count_content($stored_file_name, $download_number, $first_download, $last_download);
                        $log_template_content[] = $log_template_content_temp;

                        debug_mode($log_template_content_temp, 'Replace Entry');

                        unset($log_template_content_temp);

                        $check = 'true';
                    } else {
                        $log_template_content[] = $line;
                    }
                }
            }

            if (!isset($check) or $check != 'true') {
                $log_template_content_temp = $this->count_content($query_file_name, 0, $current_time, $current_time);
                $log_template_content[] = $log_template_content_temp;

                debug_mode($log_template_content_temp, 'New Entry');

                unset($log_template_content_temp);
            }

            $new_file_content = join("\n", $log_template_content);

            if ($logfile = fopen($log_path, 'w+')) {
                flock($logfile, 2);
                fputs($logfile, $new_file_content);
                fclose($logfile);
            }
        } else {
            $log_template_content = $this->count_content($query_file_name, 0, mktime(), mktime());

            debug_mode($log_template_content, 'First Entry');

            if ($logfile = fopen($log_path, 'a')) {
                flock($logfile, 2);
                fputs ($logfile, $log_template_content . "\n");
                fclose ($logfile);
            }
        }
    }

    /**
     * Get number of votes
     */
    function get_vote_result($log_path, $vote_name)
    {
        if (!is_file($log_path)) {
            return false;
        }

        $handle = fopen($log_path, "r");

        if (!$handle) {
            return false;
        }

        $log_template_content = array();
        $rating = 0;

        while (!feof($handle))
        {
            $line = fgets($handle, 4096);
            $line = trim($line);

            if (!empty($line)) {
                $data = explode(' - ', $line);
                $intern_value = trim($data[5]);

                if ($vote_name == trim($data[4])) {
                    if (isset($option[$intern_value])) {
                        $option[$intern_value]++;
                    } else {
                        $option[$intern_value] = 1;
                    }

                    $rating_value = trim($data[6]);

                    if (is_numeric($rating_value)) {
                        $rating += $rating_value;
                    }

                    $check = 'true';
                }
            }
        }

        fclose($handle);

        if (isset($check) and $check == 'true') {
            return array('voting' => $option, 'rating' => $rating);
        }
    }

    /**
     * Check last voting time by ip address
     */
    function check_ip_address($log_path, $name, $time, $ip)
    {
        if (!is_file($log_path)) {
            return false;
        }

        $handle = fopen($log_path, "r");

        if (!$handle) {
            return false;
        }

        $log_template_content = array();

        while (!feof($handle))
        {
            $line = fgets($handle, 4096);
            $line = trim($line);

            if (!empty($line)) {
                $data = explode(' - ', $line);
                // echo trim($data[4]);
                if ($name == trim($data[4]) and trim($data[3]) >= $time and $ip == trim($data[0])) {
                    return trim($data[0]);
                }
            }
        }
    }

    /**
     * Check last voting time by e-mail address
     */
    function check_email_address($log_path, $name, $time, $email_address)
    {
        if (!is_file($log_path)) {
            return false;
        }
        $handle = fopen($log_path, "r");

        if (!$handle) {
            return false;
        }

        $log_template_content = array();

        while (!feof($handle))
        {
            $line = fgets($handle, 4096);
            $line = trim($line);

            if (!empty($line)) {
                $data = explode(' - ', $line);
                if ($name == trim($data[4]) and trim($data[3]) >= $time and $email_address == trim($data[7])) {
                    return trim($data[7]);
                }
            }
        }
    }

    /**
     * Referrer check
     */
    function check_referrer()
    {
        global $allow_empty_referrer, $allowed_referrers;

        // Skip empty referrers
        if ($allow_empty_referrer == 'yes'
                and getenv('HTTP_REFERER') == '') {
            return true;
        }
        if ($allow_empty_referrer != 'yes'
                and getenv('HTTP_REFERER') == '') {
            return false;
        }

        $http_referrer = parse_url(getenv('HTTP_REFERER'));
        $http_referrer = trim(str_replace('www.', '', strtolower($http_referrer['host'])));
        if ($allowed_referrers != null) {
            $referrers = explode (',', $allowed_referrers);
        } else {
            $referrers = array();
        }
        $referrers[] = getenv('HTTP_HOST');
        foreach ($referrers AS $key => $val)
        {
            $allowed = trim(preg_replace('/^www\./', '', strtolower($val)));
            if ($allowed == $http_referrer) {
                return true;
            }
        }
    }

} // End of class
