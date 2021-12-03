<?php
$pid = $_POST["P_id"];
$name = $_POST["name"];
$price = $_POST["price"];
$cost = $_POST["cost"];
$quantity = $_POST["quantity"];
session_start();
$u_id = $_SESSION["U_id"];

include_once 'db.php';
include_once 'api.php';

updateProduct($conn, $pid, $u_id, $name, $quantity, $cost, $price);
