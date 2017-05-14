<?php

/** 
 * Garbage Collector -   garbage_collector.class.inc.php
 * 
 * (C) Ralf Stadtaus http://www.stadtaus.com/
 */
 
include 'Find.php';



/**
 * 
 */
class garbage_collector
{


    /**
     * Number of files to be deleted at once
     */
    var $number = 20;

    /**
     * Time in minutes until a file gets deleted
     */
    var $time = 120;

    /**
     * Directory that contains the garbage
     */
    var $directory = '';

// -----------------------------------------------------------------------------




    /**
     * Constructor
     */
    function garbage_collector($config)
    {
        
        // Extract configuration array
        if (is_array($config)) {
            $valid = array_keys(get_class_vars(get_class($this)));
            while (list($key, $val) = each($config))
            {
                if (in_array($key, $valid)) {
                    $this->$key = $val;
                }
            }
        }
    }

// -----------------------------------------------------------------------------




    /**
     * Get file list
     */
    function file_list()
    {
        if (!is_dir($this->directory)) {
            return false;
        }
        $items = &File_Find::glob(  '#([a-zA-Z0-9])\.png#', 
                                    $this->directory, 
                                    'perl');
        if (!is_array($items) or sizeof($items) <= 0) {
            return false;
        }
        $list = array();
        while (list($key, $val) = each($items))
        {
            if (sizeof($list) >= ($this->number - 1)) {
                return $list;
            }
            $diff = (time() - filectime($this->directory . $val))/60;

            if ($diff > $this->time) {
                $list[] = $val;
            }
        }
        return $list;
    }

// -----------------------------------------------------------------------------




    /**
     * Display file list
     */
    function display()
    {
        if ($list = $this->file_list()) {
            $list = join('<br />', $list);
            echo $list;
        }
    }

// -----------------------------------------------------------------------------




    /**
     * Delete files
     */
    function delete()
    {
        if ($list = $this->file_list()) {
            if (!is_array($list)) {
                return false;
            }
            reset($list);
            while (list($key, $val) = each($list))
            {
                if (!is_file($this->directory . $val)) {
                    continue;
                }
                unlink($this->directory . $val);
            }
        }
    }

// -----------------------------------------------------------------------------




} // Scool's out








?>
