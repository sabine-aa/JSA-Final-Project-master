<?php

 $userid = "";
function invalidUid($username){
    $result;
    if(!preg_match("/^[a-zA-Z0-9]*$/", $username)){
        $result =true;
    }
    else{
        $result = false;
    }
    return false;
}

function pwdMatch($pwd, $pwdRepeat){
    $result;
    if($pwd !== $pwdRepeat){
        $result =true;
    }
    else{
        $result = false;
    }
    return false;
}

function createProduct($conn, $name, $quantity, $costperitem, $sellingprice, $userid){
  
    $sql = "INSERT INTO inventory(P_name, P_quantity, P_costperitem, P_sellingprice,U_id) VALUES (?, ?, ?, ?, ?);";
    $stmt = mysqli_stmt_init($conn);
    if(!mysqli_stmt_prepare($stmt, $sql)){
     header("location: ../index.php?error=stmtfailed2");

     exit();
    }
    print_r($stmt);

    mysqli_stmt_bind_param($stmt, "sssss",$name, $quantity, $costperitem, $sellingprice, $userid);
    if(!mysqli_stmt_execute($stmt)){
        print_r(mysqli_stmt_error($stmt));
    }else{

    mysqli_stmt_close($stmt);
    header("location: ./homepage.php");
}
}

function createCustomer($conn, $name, $surname, $email, $number, $address,$userid){
  
    $sql = "INSERT INTO customer(C_name, C_surname, C_email, C_number, C_address, U_id) VALUES (?, ?, ?, ?, ?, ?);";
    $stmt = mysqli_stmt_init($conn);
    if(!mysqli_stmt_prepare($stmt, $sql)){
     header("location: ../index.php?error=stmtfailed2");

     exit();
    }
    print_r($stmt);
    
    mysqli_stmt_bind_param($stmt, "ssssss",$name, $surname, $email, $number, $address,$userid);
    if(!mysqli_stmt_execute($stmt)){
        print_r(mysqli_stmt_error($stmt));
    }else{

    mysqli_stmt_close($stmt);
    header("location: ../index.php?error=none");
 }
}

   function deleteCustomer($conn, $customername)
    {

        $cidExists = cidExists($conn, $customername);

        $sql = "DELETE FROM customer WHERE C_id=? ";
    $stmt = $conn->stmt_init();
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('s', $cidExists);
    }

    function deleteProduct($conn, $productName)
    {
        $pidExists = pidExists($conn, $productName);
        $sql = "DELETE FROM inventory WHERE P_id=?";
        $stmt = $conn->stmt_init();
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('s', $pidExists["P_id"]);
    }



function uidExists($conn, $username){
    $sql = "SELECT * FROM user WHERE U_username = ? ;";
    $stmt = mysqli_stmt_init($conn);
    if(!mysqli_stmt_prepare($stmt, $sql)){
     header("location: ./index.php?error=stmtfailed");
     exit();
    }
    mysqli_stmt_bind_param($stmt, "s", $username);
    mysqli_stmt_execute($stmt);
 
    $resultData = mysqli_stmt_get_result($stmt);
 
    if($row = mysqli_fetch_assoc($resultData)){
         return $row;
    }else{
     $result = false;
     return $result;
    }
 
    mysqli_stmt_close($stmt);
 }

function pidExists($conn, $productName){
    $sql = "SELECT * FROM inventory WHERE P_name = ? ;";
    $stmt = mysqli_stmt_init($conn);
    if(!mysqli_stmt_prepare($stmt, $sql)){
     header("location: ./index.php?error=stmtfailed");
     exit();
    }
    mysqli_stmt_bind_param($stmt, "s", $productName);
    mysqli_stmt_execute($stmt);
 
    $resultData = mysqli_stmt_get_result($stmt);
 
    if($row = mysqli_fetch_assoc($resultData)){
         return $row;
    }else{
     $result = false;
     return $result;
    }
 
    mysqli_stmt_close($stmt);
 }
    

function cidExists($conn, $customername){
    $sql = "SELECT * FROM customer WHERE C_name = ? ;";
    $stmt = mysqli_stmt_init($conn);
    if(!mysqli_stmt_prepare($stmt, $sql)){
     header("location: ./index.php?error=stmtfailed");
     exit();
    }
    mysqli_stmt_bind_param($stmt, "s", $customername);
    mysqli_stmt_execute($stmt);
 
    $resultData = mysqli_stmt_get_result($stmt);
 
    if($row = mysqli_fetch_assoc($resultData)){
         return $row;
    }else{
     $result = false;
     return $result;
    }
 
    mysqli_stmt_close($stmt);
 }




function createUser($conn, $name,$surname  ,$number, $address, $email,$username, $password, $storename){

    
    $sql = "INSERT INTO user(U_name, U_surname, U_number, U_address, U_email,U_username, U_password, U_storename) VALUES (?, ?, ?, ?, ?,? ,? ,? );";
    $stmt = mysqli_stmt_init($conn);
    if(!mysqli_stmt_prepare($stmt, $sql)){
     header("location: ../index.php?error=stmtfailed2");

     exit();
    }
    print_r($stmt);
    $hashedpwd = password_hash($password, PASSWORD_DEFAULT);
    mysqli_stmt_bind_param($stmt, "ssssssss", $name ,$surname  ,$number, $address, $email, $username, $hashedpwd, $storename);
    if(!mysqli_stmt_execute($stmt)){
        print_r(mysqli_stmt_error($stmt));
    }else{

    mysqli_stmt_close($stmt);
    header("location: ./login.php");
}
}

 function debug_to_console($data) {
    $output = $data;
    if (is_array($output))
        $output = implode(',', $output);

    echo "<script>console.log('Debug Objects: " . $output . "' );</script>";
}

function getuserid($conn,$username){
    $sql = "SELECT U_id FROM user WHERE U_username=?"; 
    $stmt = mysqli_stmt_init($conn);


    if(!mysqli_stmt_prepare($stmt,$sql)){
        header("location: ../index.php?error=stmtfailed3");

        exit();
    }
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result(); 
    $userid = $result->fetch_assoc(); 
 
 

  
}
function searchInventory($conn, $productName){
    $sql = "SELECT * FROM inventory WHERE P_name = ? ;";
    $stmt = mysqli_stmt_init($conn);
    if(!mysqli_stmt_prepare($stmt, $sql)){
     header("location: ./index.php?error=stmtfailed");
     exit();
    }
    mysqli_stmt_bind_param($stmt, "s", $productName);
    mysqli_stmt_execute($stmt);
 
    $resultData = mysqli_stmt_get_result($stmt);
 
    if($row = mysqli_fetch_assoc($resultData)){
         return $row;
    }else{
     $result = false;
     return $result;
    }
 
    mysqli_stmt_close($stmt);

    


}


function loginUsr($conn, $username, $pass){
    
    $uidExists = uidExists($conn, $username);
    print_r($uidExists);

    if($uidExists === false){
        header("location: ./login.php?error=wronglogin1");
        exit();
    }

    $pwdHashed = $uidExists["U_password"];

    $checkPwd = password_verify($pass, $pwdHashed);

    if($checkPwd ===false){

    
        header("location: ./login.php?error=wronglogin2");
        
        exit();

    }else if($checkPwd === true){
        session_start();
        $_SESSION["U_id"] = $uidExists["U_id"];
        $_SESSION["username"] = $uidExists["U_username"];
        $_SESSION['username'] = $username;
        $userid = $username;
        $_SESSION['userid'] = $userid;
        header("location: ./homepage.php");


        exit();
    }


}

function showhistory(){

   
        echo "<div class='pdf'> <a  href=`C:\Users\User\Desktop\cov.pdf`> Vaccine Certificate  </a></div>";
    
    
 }
