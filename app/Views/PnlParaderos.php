<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Enlaces a las hojas de estilo -->
  <link rel="stylesheet" href="./public/styles/appMenu.css">
  <link rel="stylesheet" href="./public/styles/partials/body.css">
  <link rel="stylesheet" href="./public/styles/paraderos.css">

  <!-- Importacion de iconos -->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <title>Consulta Transportes</title>
</head>

<body>
  <!-- Contenedor principal -->
  <div class="mainContent">

    <!-- Incluir el encabezado desde un archivo externo -->
    <?php
    include("app/Views/partials/header.php");
    ?>

    <div class="paraderos_content">
      <h3>Consulta de Paraderos Formales</h3>

      <form action="#" method="GET" class="form ">
        <div class="input flex">
          <input type="text" id="busqueda" name="busqueda" placeholder="Placa del vehículo" required focus>
          <button type="submit">Buscar</button>
        </div>
      </form>

    </div>
  </div>
</body>

</html>