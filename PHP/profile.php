<?php


require "header.php";
require "functions/db.php";


if ( !isset($_SESSION['loggedin'])){
   
    header("Location: /PHP/login.php");

}

$id_url = $_GET['id'];



$query = "SELECT * FROM users WHERE userID=$id_url";
$result = mysqli_query($con,$query);

if($result->num_rows > 0  ){


    $result = mysqli_fetch_array($result); 

    
    $username = $result[1];
    $cantFollows = $result[4];
    $cantFollowers = $result[5];
    $description = $result[6];



}

echo  "<h3>Nombre de usuario: $username </h3>";
echo  "<h3>Seguidos: $cantFollows </h3>";
echo  "<h3>Seguidores: $cantFollowers </h3>";
echo  "<h5>Descripcion: $description </h5>";


if ($id_url != $id){

    $query = "SELECT * FROM reluser WHERE userID=$id_url AND followerid=$id" ;
    $result = mysqli_query($con,$query);

    if($result->num_rows > 0  ){

        echo "
        <form action='/PHP/profile.php?id=$id_url' method='post'>
        <button type='submit' class='btn btn-primary' >Dejar de seguir</button>
        </form>"
        ;

        if($_SERVER['REQUEST_METHOD'] == "POST") {

            $query = "DELETE FROM reluser WHERE userId=$id_url AND followerId=$id";

            $result = mysqli_query($con,$query);    

            header("Location: /php/profile.php?id=$id_url");

        }


    }

    else {
        echo "
        <form action='/PHP/profile.php?id=$id_url' method='post'>
        <button type='submit' class='btn btn-primary' >Seguir</button>
        </form>";

        if($_SERVER['REQUEST_METHOD'] == "POST") {
            $query = "INSERT INTO `reluser` (`id`, `userId`, `followerId`) VALUES (NULL, '$id_url', '$id')";
            $result = mysqli_query($con,$query);   
            header("Location: /php/profile.php?id=$id_url");
        }

    }


}




?>