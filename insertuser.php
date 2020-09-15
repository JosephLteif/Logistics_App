<?php 
include "config.php";
// REGISTER USER

  
    $name = mysqli_real_escape_string($connect, $_POST['name']);
    $email = mysqli_real_escape_string($connect, $_POST['email']);
    $Password = mysqli_real_escape_string($connect, $_POST['Password']);
  
 
        $query = "INSERT INTO registereduser (name, email,Password)
  			  VALUES('$name', '$email','$Password')";
    $results = mysqli_query($connect, $query);
    if($results>0)
    {
        echo "user added successfully";
    }
    
    


    
    
    ?>