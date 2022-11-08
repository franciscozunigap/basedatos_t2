
<?php

require('db.php');

// If form submitted, insert values into the database.
if ($_SERVER["REQUEST_METHOD"] == "POST"){

	$username = $_POST["user"];
	$password = $_POST["pass"];


    $query = "INSERT into `users` (userID, userName, pass, saldo, cantFollows,cantFollowers, descripcion) VALUES 
                                    ('', '$username', '$password', '100','0','0','')";

    $result = mysqli_query($con,$query);

    if($result){
        echo "  <div class='form'>
                <h3>TE REGISTRASTE EXITOSAMENTE.</h3> ";
    

    
    header('Location: /PHP/login.php');

    die();
}
    else{


        echo "<script>
        
        alert('Error al registrar usuario, intente nuevamente.');
        window.location.href='/PHP/register.php';
        </script>";
 
    }
    
}

$con ->close();

?>