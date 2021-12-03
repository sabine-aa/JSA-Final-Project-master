<?php

$serverName = "sql6.freesqldatabase.com";
$dBUserName = "sql6456217";
$dBPassword = "nKhDbuCIMR";
$dBName = "sql6456217";


$conn =  mysqli_connect($serverName, $dBUserName, $dBPassword, $dBName);

if(!$conn){
    die("Connection failed: " . mysqli_connect_error());

}