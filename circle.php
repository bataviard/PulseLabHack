<?php

function inside($x, $y, $r, $c_x, $c_y, $debug){
    $value = false;
    
    if( pow($x - $c_x,2)+pow($y - $c_y,2) < pow($r,2) ){
        $value = true;
//    echo 'hell';    
        if($debug){
            $r = sqrt(pow($x - $c_x,2) + pow($y - $c_y,2));        
            echo $r;
        }
    }
    
    return $value;
}

function inside_dist($x, $y, $r, $c_x, $c_y, $debug){
    $r = sqrt(pow($x - $c_x,2) + pow($y - $c_y,2));        
    
    return $r;
}


?>