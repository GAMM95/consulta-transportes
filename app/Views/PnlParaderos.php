<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Enlaces a las hojas de estilo -->
  <link rel="stylesheet" href="./public/styles/appMenu.css">
  <link rel="stylesheet" href="./public/styles/partials/body.css">
  <!-- <link rel="stylesheet" href="./public/styles/partials/header.css"> -->
  <link rel="stylesheet" href="./public/styles/paraderos.css">

  <!-- Importacion de iconos -->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <title>Consulta Transportes</title>
</head>

<body>
  <!-- Contenedor principal -->
  <div class="mainContent">
    <div class="topSection">
      <div class="headerSection flex">
        <div class="titulo">
          <h2>
            Consulta de Paraderos Formales
          </h2>
        </div>
      </div>
    </div>

    <div class="paraderos_content">
      <form action="#" method="GET" class="form ">
        <div class="input flex">
          <input type="text" id="busqueda" name="busqueda" placeholder="Placa del vehículo" required focus>
          <button type="submit" class='btn btn-form  flex'>Buscar</button>
        </div>
      </form>


    </div>

    <div class="tabla">
        <?php
        include("app/Views/partials/tablaConsultarParaderos.php");
        ?>
      </div>
  </div>
</body>

</html>