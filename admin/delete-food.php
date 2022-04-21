<?php

    include('../config/constants.php'); 

    if(isset($_GET['id']) AND isset($_GET['image_name']))
    {
        $id = $_GET['id'];
        $image_name = $_GET['image_name'];
    

        if($image_name != "")
        {
            $path = "../images/food/".$image_name;
            $remove = unlink($path);

            if($remove==false)
            {
                $_SESSION['remove'] = "<div class='erroradmin'>Failed to remove food Image!!</div>";

                header('location:'.SITEURL.'admin/manage-food.php');
                die();
            }
        }

        $sql = "DELETE FROM tbl_food WHERE id=$id";

        $res = mysqli_query($conn, $sql);

        if($res==TRUE)
        {
            $_SESSION['delete'] = "<div class='addadmin'>Food Deleted Successfully..</div>";

            header('location:'.SITEURL.'admin/manage-food.php');
        }
        else
        {   
            $_SESSION['delete'] = "<div class='erroradmin'>Failed to Delete Food, Try again!</div>";

            header('location:'.SITEURL.'admin/manage-food.php');
        }
    }
    else
    {
        header('location:'.SITEURL.'admin/manage-food.php');
    }

?>