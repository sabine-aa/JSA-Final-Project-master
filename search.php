<?php
if(isset($_POST["searchbutton"])){
    $productName = $_POST["search"];


require_once 'db.php';
require_once 'api.php';

$productresult=searchInventory($conn, $productName)
if(!empty($productresult)){

header("location: ./result.php");
}


}else {
    header("location: ./login.php");
            exit();
}
