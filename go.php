<?php
session_start();
require_once('db.php');
    require_once('circle.php');
        
    $dest = $_GET['dest'];
    $depa = $_GET['depa'];
    
    $q1 = mysql_query("SELECT GT_NAME, LAT, LON, code FROM `route` WHERE `GT_NAME`='$depa'");
    $r1 = mysql_fetch_array($q1);
    $lat1 = $r1['LAT'];
    $lon1 = $r1['LON'];
    $code1 = $r1['code'];
    
    $q2 = mysql_query("SELECT GT_NAME, LAT, LON, code FROM `route` WHERE `GT_NAME`='$dest'");
    $r2 = mysql_fetch_array($q2);
    $lat2 = $r2['LAT'];
    $lon2 = $r2['LON'];
    $code2 = $r2['code'];

    echo $depa." | ".$code1." to ".$dest." | ".$code2."<br />";


    $code1_mark = substr($code1,0,1);
    $code2_mark = substr($code2,0,1);

    $code1_count = substr($code1,1,strlen($code1));
    $code2_count = substr($code2,1,strlen($code2));
    
    
    if($code1_mark == $code2_mark){
        if($code1_count < $code2_count){
            for($i=$code1_count; $i<=$code2_count; $i++){
                $path[$i] = $code1_mark.$i;
                echo $path[$i];
            }
        }else{
            for($i=$code1_count; $i>=$code2_count; $i--){
                $path[$i] = $code1_mark.$i;
                echo $path[$i];
            }
        }
    }else{
        require_once("path.php");
        $counter = 0;
        
        $graph = array(
          'A1' => array('C1' => 0, 'D1' => 0, 'A9'=>16,'A11'=>20),
          'A9' => array('E1' => 0, 'A1'=>16,'A11'=>20),
          'A11' => array('B1' => 0, 'A9'=>4,'A1'=>20),
          'B1' => array('A11' => 0),
          'C1' => array('A1' => 1),
          'D1' => array('A1' => 0,'D13' => 67,'D15' => 73),
          'D13' => array('F1' => 1,'D1' => 67,'D15' => 6),
          'D15' => array('G1' => 0,'D13' => 6,'D1' => 73),
          'E1' => array('A9' => 0),
          'F1' => array('D13' => 1),
          'G1' => array('D15' => 0),
        );
        
        $vertex_start = $code1_mark.'1';
        $vertex_finish = $code2_mark.'1';
        
        //echo $vertex_start." ~ ".$vertex_finish."<br />";

        $g = new Dijkstra($graph);
        $r = $g->shortestPath($vertex_start, $vertex_finish);                
        
        if($code1_count > 1){
            for($i=$code1_count;$i>=1; $i--){
                $path[$counter] = $code1_mark.$i;
//                echo $path[$i];
                $counter++;
            }        
        }else{
            $path[0] = $code1_mark.'1';
            $counter++;
        }
        
//        $counter = count($path);
        
//        echo"<hr />";
        
        $sep = '';
        foreach ($r as $v) {
            if(substr($v,0,1)!=$code1_mark){
                
                $code_sub_count = substr($v,1,strlen($v));
//                echo $code_sub_count;
                
                for($j=$code_sub_count;$j>=1;$j--){
                    $path[$counter] = substr($v,0,1).$j;
//                    echo $path[$counter];
                    $counter++;
                }
                
//                echo $sep, $v;
//                $sep = '->';    
            }
        }
//        
    
        
    }

    

$_SESSION['path'] = $path;


//foreach($_SESSION['path'] as $val){
//        echo $val." -> ";
//    }

?>
<br />
<a href="jm.php" >GO!</a>