<html>
<head>
<script>
function pasteur(){
    document.getElementById("lat").value = -6.890810115;
    document.getElementById("lon").value = 107.5758719;
}
function buahbatu(){
    document.getElementById("lat").value = -6.961827895;
    document.getElementById("lon").value = 107.6375628;
}
function pasirkoja(){
    document.getElementById("lat").value = -6.931399991;
    document.getElementById("lon").value = 107.5727031;
}
function kopo(){
    document.getElementById("lat").value = -6.956460398;
    document.getElementById("lon").value = 107.5811291;
}

</script>
</head>
<body>
<form action="index.php" method="post">

<?php
if(isset($_POST['go'])){
//    require_once('db.php');
//    require_once('circle.php');
        
    $dest = $_POST['destination'];
    $depa = $_POST['depart'];
    
//    $q1 = mysql_query("SELECT * FROM `route` WHERE `GT_NAME`='$dest'");
//    $r1 = mysql_fetch_array($q1);
//    $lat1 = $r1['LAT'];
//    $lon1 = $r1['LON'];
//    
//    $q2 = mysql_query("SELECT * FROM `route` WHERE `GT_NAME`='$depa'");
//    $r2 = mysql_fetch_array($q2);
//    $lat2 = $r2['LAT'];
//    $lon2 = $r2['LON'];
    
//    echo $dest." -to- ".$depa;
//    $r = inside_dist($lat1, $lon1, 0, $lat2, $lon2, false);
//    echo "estimasi jarak: ".($r*100)."<br />";
    
    header('location:go.php?dest='.$dest.'&depa='.$depa);
    
}else{

    if(isset($_POST['login'])){
    
//    $uname = $_POST['uname'];
    $c_x = $_POST['lat'];
    $c_y = $_POST['lon'];
    $radius = $_POST['radius'];
    
    $rad = $radius / 100;
    $debug = false;
    
    require_once('db.php');
    require_once('circle.php');
    $q = mysql_query("SELECT `GT_NAME`,`LAT`,`LON` FROM `route` ORDER BY `GT_NAME` ASC");
    echo "GT Terdekat (".$radius." kM) dari tempat Anda:<br />";
    
    $idx = 0;
    
    while($r = mysql_fetch_array($q)){
        $lat = $r['LAT'];
        $lon = $r['LON'];
        
        $distance = inside_dist($lat, $lon, $rad, $c_x, $c_y, $debug);
        
        if($distance < $rad){
            
            echo "<input type='radio' name='depart' value='".$r['GT_NAME']."'> (".substr($distance*100,0,4)." kM) ".$r['GT_NAME']."<br />";    
        }
        
        $gt_idx[$idx] = $r['GT_NAME'];
        $lat_idx[$idx] = $r['LAT'];
        $lon_idx[$idx] = $r['LON'];
        $idx++;
    }
    echo "Tujuan: <br /><select name='destination'>";
    
    for($i=0;$i<$idx;$i++){
        echo "<option value='".$gt_idx[$i]."'>".$gt_idx[$i]."</option>";
    }
    echo "</select>";
    echo "<input type='submit' name='go' value='go' /><hr />";
}


?>
    
    
    
    
        RADIUS: <input name="radius" width="3" type="text" value="7" /> kM dari:<br />
    
    <input type="button" value="GT Pasteur" onclick="pasteur()" />
    <input type="button" value="GT Buah Batu" onclick="buahbatu()" />
    <input type="button" value="GT Pasir Koja" onclick="pasirkoja()" />
    <input type="button" value="GT Kopo" onclick="kopo()" />
    
    <br />
    
    LAT <input id="lat" name="lat" value="" width="6" type="text" />
    LON <input id="lon" name="lon" value="" width="6" type="text" /><br />
    
    
    
    
    <hr />
    
<!--
    <small>Login to get nearest gates</small><br />
    Username <input name="uname" value="" type="text" /><br />
    Password <input name="passw" value="" type="password" /><br />
-->
    
    <input name="login" type="submit" value="Search" />
    
<?php
    
}
    ?>    
    
</form>
</body>
</html>