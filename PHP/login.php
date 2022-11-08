
<?php 

    require "configDB.php";
    require "header.php";


?>

<div class="login">
    <h1>Inicio de sesion</h1>
    <form method="post">
        <div class = "username">
            <input type="text" required>
            <label>Nombre de usuario</label>
        <div class="contraseña">
            <input type="password" required>
            <label>Contraseña</label>
        </div>
        
        <input type="submit" value="Iniciar">

        </div>
    </form>
</div>



<div class="signin">
    <h1>Registrarse</h1>
    <form method="post">
        <div class = "username">
            <input type="text" required>
            <label>Nombre de usuario</label>
        <div class="contraseña">
            <input type="password" required>
            <label>Contraseña</label>

        </div>
        
        <input type="submit" value="Registrar">

        </div>
    </form>
</div>


