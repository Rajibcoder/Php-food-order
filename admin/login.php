<?php include('../config/constants.php') ?>

<html>
    <head>
        <title>Login - Food Order</title>
        <link rel="stylesheet" href="../css/admin.css">
    </head>

    <body class="log-back">
        
        <div class="login"> 
            <h1 class="text-center">Log-In</h1> <br><hr><br>
            <?php
                if(isset($_SESSION['login']))
                {
                    echo $_SESSION['login'];
                    unset($_SESSION['login']);
                }
            
                if(isset($_SESSION['no-login-message']))
                {
                    echo $_SESSION['no-login-message'];
                    unset($_SESSION['no-login-message']);
                }
            ?>
            <br>
            <form action="" method="POST" class="login-d"x>
                Username:
                <br>
                <input type="text" name="username" placeholder="Enter Username:">
                <br><br>
                Password: <br>
                <input type="password" name="password" placeholder="Enter Password:">
                <br><br>
                <input type="submit" name="submit" value="login" class="btn-primary" >
                <br><br>
            </form>
            <p class="text-center">Created by <a href="#"><b>Rajib</b></a></p>
        </div>
    </body>
</html>


<?php
    // check submit button
    if(isset($_POST['submit']))
    {
        // * process for login
        // get the data from login form
       $username = $_POST['username'];
       $password = ($_POST['password']);

        // sql to check the data exist or not
       $sql = "SELECT * FROM tbl_admin WHERE username='$username' AND password='$password'";

    //    execute the query
       $res = mysqli_query($conn, $sql);

    //    count row to check whether the user exist or not
        $count = mysqli_num_rows($res);

        if($count==1)
        {
            // user available and login success
            $_SESSION['login'] = "<div class='addadmin'>Login Successfull.</div>";
            $_SESSION['user'] = $username; //to check whether the user login or not and logout will unset it
            // redirect to homepage
            header('location:'.SITEURL.'admin/');
        }
        else
        {
            $_SESSION['login'] = "<div class='erroradmin text-center'><b>Username and Password did not match!!</b></div>";
            // redirect to loginpage
            header('location:'.SITEURL.'admin/login.php');
        }
    }

   

?>