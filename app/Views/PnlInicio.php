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
  <div class="mainContent !w-full">
    <!-- Incluir el encabezado desde un archivo externo -->
    <?php
    include("app/Views/partials/header.php");
    ?>

    <!-- <section class="inicio"> -->
    <div class="inicio_content">

      <div class="sectionCard">

        <!-- Card de Asociaciones -->
        <div class="card grid_Card">
          <div class="logoCard">
            <img src="./public/assets/asociaciones.png" class="imgCardLogo" alt="Imagen de la tarjeta">
          </div>
          <!-- Cantidad Asociaciones -->
          <h2>Asociaciones</h2>
          <p class="cantidad_total">
            <?php echo $cantidadAsociaciones; ?>
          </p>
          <!-- <a href="#">Leer más</a> -->
        </div>

        <!-- Card de Mototaxis -->
        <div class="card grid_Card">
          <div class="logoCard">
            <img src="./public/assets/mototaxi.png" class="imgCardLogo" alt="Imagen de la tarjeta">
          </div>
          <!-- Cantidad Unidades -->
          <h2>Unidades</h2>
          <p class="cantidad_total">
            <?php echo $cantidadUnidades; ?>
          </p>
        </div>

        <!-- Card de Papeletas Sin Pagar -->
        <div class="card grid_Card">
          <div class="logoCard">
            <img src="./public/assets/papeleta.png" class="imgCardLogo" alt="Imagen de la tarjeta">
          </div>
          <!-- Cantidad Papeletas Sin Pagar -->
          <h2>Papeletas Sin Pagar</h2>
          <p class="cantidad_total">
            <?php echo $cantidadPapeletas; ?>
          </p>
        </div>
      </div>


    </div>

  </div>

</body>

</html>