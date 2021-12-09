<?php

if(isset($_POST["submit"])){

$pid = $_POST["P_id"];
$name = $_POST["name"];
$price = $_POST["price"];
$cost = $_POST["cost"];
$quantity = $_POST["quantity"];
$filename = $_FILES["uploadfile"]["name"];
$tempname = $_FILES["uploadfile"]["tmp_name"]; 

$folder = "resources/images/".$filename;
session_start();
$u_id = $_SESSION["U_id"];

include_once 'db.php';
include_once 'api.php';

updateProduct($conn, $pid, $u_id, $name, $quantity, $cost, $price,$filename);
if (move_uploaded_file($tempname, $folder))  {
    $msg = "Image uploaded successfully";
}else{
    $msg = "Failed to upload image";
}
}else if(isset($_POST["cancel"])){

    header("location: ./homepage.php");

}
