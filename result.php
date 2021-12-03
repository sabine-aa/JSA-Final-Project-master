
    
<?php
include_once 'header.php';
session_start();
$username = $_SESSION['username'];
echo("<script>console.log('PHP: " . $username . "');</script>");


?><link rel="stylesheet" href="./css/homepage1.css">

<main class='main-container'>

   <?php 
    require_once 'db.php';
    $search = $_POST['search']; 

    $sql1 = "SELECT  `P_id`,`P_name`, `p_quantity`, `p_sellingprice`, `U_id` FROM `inventory` where U_id = $username and P_name=$search";
    $result1 = mysqli_query( $conn, $sql1);

    
    if ($result1->num_rows > 0) {
        while($row = $result1->fetch_assoc()) {
          
            echo" 

    <div class='product-item'> 
        <div class='image-box'>  
            <img src='./resources/images/product.jpg' alt='' class='product-image'>
                 <div class='edit'>
                        <div class='edit-im'>

                        <a></a>
                            <img src='./resources/images/edit.png' onclick='document.getElementById('edit-product').style.display='block'' alt=''>
                        </div>
                        <div class='edit-delete'>
                            <img src='./resources/images/delete.png' alt=''>
                            <script>console.log('PHP: " . $row['P_id'] . "');</script>
                        </div>        
                 </div>
                            <div class='product-desc'>
                            <h1 class='p-name'> {$row['P_name']}  </h1>
                            <h3 class='desc'>Quantity: {$row['p_quantity']}</h3>
                            <h3 class='desc'>Price:{$row['p_sellingprice']}</h3>
                        </div>
                 </div>            
         </div> ";    
        }
      }  
      
      else {
    echo "0 results";
    }
    
?>    
  
</div>
</main>



</body>

</html>