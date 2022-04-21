<?php

    include('../config/constants.php'); 

    $id = $_GET['id'];

    $sql = "DELETE FROM tbl_admin WHERE id=$id";

    $res = mysqli_query($conn, $sql);

    if($res==TRUE)
    {
        $_SESSION['delete'] = "<div class='addadmin'>Admin Deleted Successfully..</div>";

        header('location:'.SITEURL.'admin/manage-admin.php');
    }
    else
    {   
        $_SESSION['delete'] = "<div class='erroradmin'>Failed to Delete Admin, Try again!</div>";

        header('location:'.SITEURL.'admin/manage-admin.php');
    }

?>