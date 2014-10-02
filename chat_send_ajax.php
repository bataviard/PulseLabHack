<?php

     require_once('dbconnect.php');

     db_connect();

     $msg = $_GET["msg"];
     $dt = date("Y-m-d H:i:s");
     $user = $_GET["name"];
     $lat = $_GET["lat"];
     $long = $_GET["long"];

    echo $long;

     $sql="INSERT INTO chat(USERNAME,CHATDATE,MSG,LAT,LON) " .
          "values(" . quote($user) . "," . quote($dt) . "," . quote($msg) . "," . quote($lat) . "," . quote($long) . ");";

          echo $sql;

     $result = mysql_query($sql);
     if(!$result)
     {
        throw new Exception('Query failed: ' . mysql_error());
        exit();
     }

?>





