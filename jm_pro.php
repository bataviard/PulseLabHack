<?php
session_start();

$path = $_SESSION['path'];

foreach($path as $val){
    echo $val;
    
    
}


?>