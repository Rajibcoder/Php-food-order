<?php

    include('../config/constants.php'); 

    $id = $_GET['id'];

    $sql = "DELETE FROM tbl_order WHERE id=$id";

    $res = mysqli_query($conn, $sql);

    if($res==TRUE)
    {
        $_SESSION['delete'] = "<div class='addadmin'>Order Deleted Successfully..</div>";

        header('location:'.SITEURL.'admin/manage-order.php');
    }
    else
    {   
        $_SESSION['delete'] = "<div class='erroradmin'>Failed to Delete Order, Try again!</div>";

        header('location:'.SITEURL.'admin/manage-order.php');
    }

?>