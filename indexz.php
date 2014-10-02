<HTML>
<head>
    <meta http-equiv="refresh" content="5" >    
</head>
<body>

<?php

require('db.php');

$q1 = mysql_query("INSERT INTO `track` VALUES ('','1','-6','106')");


$rad = 0.1; // in kMeters
$x = -6.233176;
$y = 106.869691;
$c_x = -6.2333176;
$c_y = 106.869691;


$r100 = 100;
$r200 = 200;
$r500 = 500;

$distDivider = 1000;

$debug = false;

if(inside($x, $y, $r100/$distDivider, $c_x, $c_y, $debug))
    echo "dist.: ".$r100."m -> yes <br />";

if(inside($x, $y, $r200/$distDivider, $c_x, $c_y, $debug))
    echo "dist.: ".$r200."m -> yes <br />";

if(inside($x, $y, $r500/$distDivider, $c_x, $c_y, $debug))
    echo "dist.: ".$r500."m -> yes <br />";


function inside($x, $y, $r, $c_x, $c_y, $debug){
    $value = false;
    
    if( pow($x - $c_x,2)+pow($y - $c_y,2) < pow($r,2) ){
        $value = true;
        
        if($debug){
            $r = sqrt(pow($x - $c_x,2) + pow($y - $c_y,2));        
            echo $r;
        }
    }
    
    return $value;
}

?>    
    </body>
</HTML>