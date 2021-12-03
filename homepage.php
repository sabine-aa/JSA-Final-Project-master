<?php
include_once 'header.php';
session_start();
//$_SESSION["userid"] = $uidExists["U_id"];

$username = $_SESSION['username'];
$U_id = $_SESSION['U_id'];
echo ("<script>console.log('PHP: " . $username . "');</script>");


?>

<link rel="stylesheet" href="./css/homepage.css">
<!--CSS-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!--JS-->
<main class='main-container'>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <?php
    require_once 'db.php';
    echo ("<script>console.log('PHP: " . $username . "');</script>");

    $sql = "SELECT  `P_id`,`P_name`, `p_quantity`, `p_sellingprice`, `P_filename` FROM `inventory` where U_id= ?";

    $stmt = mysqli_stmt_init($conn);
    if (!mysqli_stmt_prepare($stmt, $sql)) {
        echo "<script>console.log('error bro')</script>";
    }

    mysqli_stmt_bind_param($stmt, "s", $U_id);
    mysqli_stmt_execute($stmt);

    $resultData = mysqli_stmt_get_result($stmt);

    // if($row = mysqli_fetch_assoc($resultData)){
    if (mysqli_num_rows($resultData) > 0) {
        while ($row = $resultData->fetch_assoc()) {
            echo "
        <div class='product-item'> 
            <div class='image-box'>  
                <img src='./resources/images/{$row['P_filename']}' alt='' class='product-image'>
                     <div class='edit'>
                            <div class='edit-im'>
    
                            <a></a>
                                <img src='./resources/images/edit.png' onclick='displayUpdateForm()' alt=''>
                            </div>
                            <div class='edit-delete'>
                                <img src='./resources/images/delete.png' alt='' onclick='showDeleteForm()'>
                            </div>        
                     </div>
                                <div class='product-desc'  >
                                <input type='text' name='P_id' id='username1' class='username' value=' {$row['P_id']}'>
                                <h1 class='p-name' > {$row['P_name']}  </h1>
                                <h3 class='desc'>Quantity: {$row['p_quantity']}</h3>
                                <h3 class='desc'>Price:{$row['p_sellingprice']}</h3>


                            </div>
                     </div>            
             </div> ";
        }
    } else {
        $result = 0;
        echo "0 results";
    }
    $data[] = "";
    ?>

    </div>
</main>


<form action="" id="edit-product">
    <input type="text" name="quantity" placeholder="Quantity" class="edit-input">
    <input type="text" name="price" placeholder="price" class="edit-input">
    <button name="submit" value="Submit">Submit</button>
</form>

<a href="#" class="float">
    <span class="glyphicon glyphicon-plus my-float"></span>
</a>

<div style="position:fixed; top:50%; left:50%; transform: translate(-50%, -50%);   width: 50%;" id="newmodal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-md">

        <div class="modal-content">
            <div class="modal-header">

                <h4 class="modal-title" style="color:#000000">
                    Add New Product
                </h4>
            </div>
            <div class="modal-body">
                <form action="./add.php" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control" name="name" style="width:100%" placeholder="Enter product name!" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="quantity" style="width:100%" placeholder="Enter product Quantity!" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="costperitem" style="width:100%" placeholder="Enter cost per item!" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="sellingprice" style="width:100%" placeholder="Enter selling price!" required>
                    </div>
                    <div class="form-group">
                        <input type="file" name="uploadfile" value="" />
                    </div>
                    <div class="form-group">
                        <button type="submit" name="submit" class="btn btn-default">Add</button>
                    </div>


                </form>
            </div>
        </div>
    </div>
</div>


<form action="delete.php" id="delete-container" method="post">

    <h1>Are You Sure You Want To Delete?</h1>
    <input type="text" class="username" name="P_id" id="uid" value="">
    <script>
        document.getElementById('uid').value = document.getElementById('username1').value;
    </script>
    <button name="yes">
        Yes
    </button>
    <button name="no">
        no
    </button>

</form>

<form action="update.php" id="update-container" method="post">
    <h1>Update Product</h1>
    <h3>leave fields empty if you dont want to change</h3>
    <input type="text" class="username" name="P_id" id="uid1" value="">
    <script>
        document.getElementById('uid1').value = document.getElementById('username1').value;
    </script>
    <input type="text" name="name" placeholder="Enter new name">
    <input type="text" name="cost" placeholder="Enter new cost">
    <input type="text" name="price" placeholder="Enter new price">
    <input type="text" name="quantity" placeholder="Enter new quantity">
    <input type="file" name="uploadfile" value="" />
                    

    <button type="submit" name="submit">Update</button>
</form>
<script>
    $(function() {
        $(".float").click(function() {
            $("#newmodal").modal('show');
        });
    });
</script>
<script>
    function showId() {
        console.log(document.getElementById('username').value);


    }

    function showDeleteForm() {
        document.getElementById('delete-container').style.display = "block";
    }

    function displayUpdateForm() {
        document.getElementById('update-container').style.display = "block"
    }
</script>

</body>

</html>