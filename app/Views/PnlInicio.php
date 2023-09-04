<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Enlaces a las hojas de estilo -->
  <link rel="stylesheet" href="./public/styles/appMenu.css">
  <link rel="stylesheet" href="./public/styles/partials/body.css">
  <link rel="stylesheet" href="./public/styles/inicio.css">

  <!-- Implementacion de funcionalidades para la vista cliente -->
  <!-- <script src="app/Views/funciones/carrusel.js"></script> -->

  <!-- Importacion de iconos -->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <title>Consulta Transportes</title>
</head>

<body>

  <!-- Contenedor principal -->
  <div class="mainContent ">
    <!-- Incluir el encabezado desde un archivo externo -->
    <?php
    include("app/Views/partials/header.php");
    ?>

    <!-- <section class="inicio"> -->
    <div class="inicio_content">

      <!-- <div class="carousel-container img_dashboard">
          <div class="carousel ">
            <img src="./public/assets/fondo.png" alt="Imagen 1" class="img_inicio">
            <img src="./public/assets/home.jpg" alt="Imagen 2" class="img_inicio">
          </div>
        </div> -->

      <div class="sectionCard">
        <div class="card grid_Card">
          <img src="./public/assets/fondo.png" alt="Imagen de la tarjeta">
          <h2>Asociaciones</h2>
          <p class="cantidad_total">
            <?php echo $cantidadAsociaciones; ?>
          </p>
          <!-- <a href="#">Leer más</a> -->
        </div>

        <div class="card grid_Card">
          <!-- <img src="imagen.jpg" alt="Imagen de la tarjeta"> -->
          <h2>Paraderos</h2>
          <p class="cantidad_total">
            <?php echo $cantidadParaderos; ?>
          </p>
          <!-- <a href="#">Leer más</a> -->
        </div>

        <div class="card grid_Card">
          <!-- <img src="imagen.jpg" alt="Imagen de la tarjeta"> -->
          <h2>Papeletas Sin Pagar</h2>
          <p class="cantidad_total">
            <?php echo $cantidadPapeletas; ?>
          </p>
          <!-- <a href="#">Leer más</a> -->
        </div>
      </div>


    </div>

    <!-- </section> -->

  </div>

</body>

</html>