<?php include('partials/menu.php') ?>

<div class="main-content">
    <div class="wrapper">
        <h1 class="headline">Add Category</h1>
        <br><br>    

        <?php
            if(isset($_SESSION['add']))
            {
                echo $_SESSION['add'];
                unset($_SESSION['add']);
            }

            if(isset($_SESSION['upload']))
            {
                echo $_SESSION['upload'];
                unset($_SESSION['upload']);
            }
        ?>

        <form action="" method="POST" enctype="multipart/form-data">

<table class="tbl-40">
    <tr>
        <td>Title:</td>
        <td><input type="text" name="title" class="cate" placeholder="Category Title..."></td>
    </tr>
    <tr>
        <td>Select Image:</td>
        <td>
            <input type="file" name="image">
        </td>
    </tr>
    <tr>
        <td>Featured:</td>
        <td>
            <input type="radio" name="featured" value="Yes"> Yes
            <input type="radio" name="featured" value="No"> No
        </td>
    </tr>
    <tr>
        <td>Active:</td>
        <td>
            <input type="radio" name="active" value="Yes"> Yes
            <input type="radio" name="active" value="No"> No
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="submit" name="submit" value="add category" class="btn-update cate">
        </td>
    </tr>
</table>

</form> 

    <?php
        if(isset($_POST['submit']))
        {
            $title = $_POST['title'];

            if(isset($_POST['featured']))
            {
                $featured = $_POST['featured'];
            }
            else
            {
                $featured = "No";
            }

            if(isset($_POST['active']))
            {
                $active = $_POST['active'];
            }
            else
            {
                $active = "No";
            }

            // print_r($_FILES['image']);

            // die();
            if(isset($_FILES['image']['name']))
            {
                $image_name=$_FILES['image']['name'];
                if($image_name!="")
                {
                    $source_path=$_FILES['image']['tmp_name'];

                    $destination_path="../images/category/".$image_name;

                    $upload = move_uploaded_file($source_path, $destination_path);

                    if($upload==false)
                    {
                        $_SESSION['upload'] = '<div class="erroradmin">Failed to upload image!!</div>';

                        header('location:'.SITEURL.'admin/add-category.php');

                        die();
                    }
                }
            }
            else
            {
                $image_name="";
            }

            $sql = "INSERT INTO tbl_category SET
                title='$title',
                image_name='$image_name',
                featured='$featured',
                active='$active'
            ";

            $res = mysqli_query($conn, $sql);

            if($res==true)
            {
                $_SESSION['add'] = "<div class='addadmin'>Category Added Successfully..</div>";
                header('location:'.SITEURL.'admin/manage-category.php');
            }
            else
            {
                $_SESSION['add'] = "<div class='addadmin'>Failed to Add Category!!</div>";  
                header('location:'.SITEURL.'admin/add-category.php'); 
            }

        }
    ?>


    </div>
</div>


<?php include('partials/footer.php') ?>