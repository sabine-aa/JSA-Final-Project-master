<?php
if(isset($_POST["submit"])){
    $username = $_POST["username"];
    $pwd = $_POST["password"];


require_once 'db.php';
require_once 'api.php';

loginUsr($conn, $username, $pwd);


}else {
    header("location: ./login.php");
            exit();
}
?>