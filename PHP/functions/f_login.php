
<?php

require('db.php');
session_start();


if ($_SERVER["REQUEST_METHOD"] == "POST"){

	$username = $_POST["user"];
	$password = $_POST["pass"];


    $query = "SELECT pass FROM `users` WHERE username='$username'";

    $result = mysqli_query($con,$query);

    if($result->num_rows > 0  ){


        $pass = mysqli_fetch_array($result)[0];  

        if($pass==$password ){
           
            session_regenerate_id();
            $_SESSION['loggedin'] = TRUE;
            $_SESSION['username'] = $username;


            echo "<h3>Bienvenido '$username', iniciaste sesion correctamente.</h3>";

        }


        else{

            echo "  <h3>No existe ningun usuario con ese usuario y contraseña.</h3> ";
        
        }

    } 


    else { echo "  <h3>No existe ningun usuario con ese usuario y contraseña.</h3> ";}



}


else{

    echo "  <h3>Error1.</h3> ";

}

$con->close();

?>