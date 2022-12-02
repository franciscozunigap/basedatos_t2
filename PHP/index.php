<?php 

    require "header.php"; 

?>



<body>

    <div class="bienvenida">
        <h2> Bienvenido a BLOCKBUSM </h2>

    </div>
    
    <div class= "text1">
        <p>
            Bienvenido, aqui podras comentar, calificar y descubrir peliculas de todos los tiempos. Atrevete y registrate

        <p>


    </div>
 
    <div class="video">
        
        <iframe width="560" height="315" src="https://www.youtube.com/embed/uAQFxn2Ss84?start=3" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


    </div> 

    <div class= "Todas">
        <p>

            Todas las peliculas

        <p>

    </div> 


    <a href="movie.php">
        <img src="/IMG/movies/atrapame_si_puedes.jfif">
    </a>
    

    <div class="movies">
        <p>
            
            aqui todas

        <p>

    </div>

            
            


    <style>
        body{
            font-family: 'Times New Roman';
        }

        .video{
            display: flex;
            justify-content: center;
        }

        .text1{
            font-family: 'Franklin Gothic Medium';
            display: flex;
            justify-content: center;
        }

        .todas{
            font-family: 'Franklin Gothic Medium';
            display: flex;
            justify-content: center;
        }
        
        .bienvenida{
            background-color: dimgray;
            height: 6vh;
            margin: 5%;

            display: flex;
            justify-content: center;

        }
    </style>



</body>
</html>








