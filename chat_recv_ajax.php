<?php
session_start();
     require_once('dbconnect.php');

     db_connect();
     
    // $sql = "SELECT *, date_format(chatdate,'%d-%m-%Y %r') as cdt from chat order by ID desc limit 200";
    // $sql = "SELECT * FROM (" . $sql . ") as ch order by ID";
     $sql = "SELECT * FROM `chat` ORDER BY chatdate DESC  LIMIT 1";
     $result = mysql_query($sql) or die('Query failed: ' . mysql_error());
     
     // Update Row Information
     $msg="<table border='0' style='font-size: 10pt; color: blue; font-family: verdana, arial;'>";
     while ($line = mysql_fetch_array($result, MYSQL_ASSOC))
     {
//           $msg = $msg . "<tr><td>" . $line["cdt"] . "&nbsp;</td>" .
//                "<td>" . $line["username"] . ":&nbsp;</td>" .
//                "<td>" . $line["msg"] . "</td></tr>";
         
         $msg = $msg . 
                "<td>" . $line["username"] . ":&nbsp;</td>" .
                "<td>" . $line["chatdate"]." | ". $line["msg"] . " | [".$line["lat"]." , ".$line["lon"]."]";
        
        require_once("circle.php");
         
        $idx = $_SESSION['IDX'];
//         $idx++;
         $path = $_SESSION['path'];
        $code = $path[$idx];
        $q2 = mysql_query("select lat,lon from route where code='$code'");
        $r2 = mysql_fetch_array($q2);
         
         
         
        $rad = 0.1; // in kMeters
        $x = $line["lat"];
        $y = $line["lon"];
        $c_x = $r2['lat'];
        $c_y = $r2['lon'];
         
         echo 'target lat.:'.$c_x.' source:'.$x;
         echo '<br />';
         echo 'target lon.:'.$c_y.' source:'.$y;
         
         echo '<hr />';


        $r100 = 100;
        $r200 = 200;
        $r500 = 500;

        $distDivider = 100000;

        $debug = true;

         echo"distance: ".(inside_dist($x, $y, $r100/$distDivider, $c_x, $c_y, $debug))."<br />";
         
         
        if(inside($x, $y, $r100/$distDivider, $c_x, $c_y, $debug))
            echo "dist.: ".$r100."m -> yes <br />";
         else
             echo "no<br />";

         
//         echo(inside_dist($x, $y, $r200/$distDivider, $c_x, $c_y, $debug));
         
        if(inside($x, $y, $r200/$distDivider, $c_x, $c_y, $debug))
            echo "dist.: ".$r200."m -> yes <br />";
         else
             echo "no<br />";
         
//         echo(inside_dist($x, $y, $r500/$distDivider, $c_x, $c_y, $debug));

        if(inside($x, $y, $r500/$distDivider, $c_x, $c_y, $debug))
            echo "dist.: ".$r500."m -> yes <br />";
         else
             echo "no<br />";

         
         
         
         echo "</td></tr>";

     }
     $msg=$msg . "</table>";
     
     echo $msg;

?>





