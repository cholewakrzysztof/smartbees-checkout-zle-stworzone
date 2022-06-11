<?php 
    header('Access-Control-Allow-Origin: *');
    $conn = new mysqli("localhost","root","","checkout");

    if ($conn->connect_errno) {
        echo "Connect failed";
    }
    $code = $_GET["q"];

    if(strlen($code)>10){
        echo "Wrong code";exit();
    }
    $sql = "SELECT active,discount_percent FROM discount_codes WHERE code='$code'";
    $buffor = $conn->query($sql);
    $result = $buffor->fetch_assoc();

    $active = $result["active"];
    $discount_percent = $result["discount_percent"];
    if($active==''){
        echo "Wrong code";
    }
    if($active=="0"){
        echo "Not active code";
    }
    if($active=="1"){
        echo $discount_percent;
    }

    $conn->close();
?>