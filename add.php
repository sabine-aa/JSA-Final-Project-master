<?php

if(isset($_POST["submit"])){
    
    $name = $_POST["name"];
    $quantity = $_POST["quantity"];
    $costperitem = $_POST["costperitem"];
    $sellingprice = $_POST["sellingprice"];

    
session_start();
$U_id = $_SESSION['U_id'];
//echo("<script>console.log('PHP: " . $username . "');</script>");

    require_once 'db.php';
    require_once 'api.php';
    
        createProduct($conn, $name, $quantity, $costperitem,$sellingprice,$U_id );

    
    
}else{
    header("location: index.php");
    exit(); 
}
?>