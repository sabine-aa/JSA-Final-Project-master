<?php

include 'db.php';
include 'api.php';

if(isset($_POST["yes"])){

    $pid = $_POST["P_id"];

session_start();
$U_id = $_SESSION['U_id'];

deleteProduct($conn,$pid,$U_id);}
else if(isset($_POST["no"])){

    header("location: ./homepage.php");

}
