<?php
    //check whether the user is logged or not
    if(!isset($_SESSION['user'])) 
    {
        $_SESSION['no-login-message'] = "<div class='erroradmin text-center'>Please login to Access Admin Panel!!</div>";

        header('location:'.SITEURL.'admin/login.php');
    }
    
?>
