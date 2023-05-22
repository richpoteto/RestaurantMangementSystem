<?php

namespace App\CentralLogics;

use Illuminate\Support\Facades\Storage;


class FileManagerLogic
{
    private static function get_file_name($path)
    {
        $temp = explode('/',$path);
        return end($temp);
    }

    private static function get_file_ext($name)
    {
        $temp = explode('.',$name);
        return end($temp);
    }

    private static function get_path_for_db($full_path)
    {
        $temp = explode('/',$full_path, 3);
        return end($temp);
    }

    public static function format_file_and_folders($files, $type)
    {
        $data = [];
        foreach($files as $file)
        {
            $name = self::get_file_name($file);
            $ext = self::get_file_ext($name);
            $path = '';
            if($type == 'file')
            {
                $path = $file;
            }
            if($type == 'folder')
            {
                $path = $file;
            }
            if(in_array($ext, ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'tif', 'tiff']) || $type=='folder')
            $data[] = [
                'name'=> $name,
                'path'=>  $path,
                'db_path'=>  self::get_path_for_db($file),
                'type'=>$type
            ];
        }
        return $data;
    }
    
}
