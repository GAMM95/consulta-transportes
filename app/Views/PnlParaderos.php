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
<div class="mainContent">
    <!-- ... Contenido principal de la página ... -->
    <div class="paraderos_content">
      <form action="/buscar-paraderos" method="POST" class="form">
        <div class="input flex">
          <input type="text" id="placa" name="placa" placeholder="Placa del vehículo" required>
          <button type="submit" class="btn btn-form flex">Buscar</button>
        </div>
      </form>
    </div>
    <div class="tabla">
      <!-- Aquí mostrarás los resultados de la búsqueda si los tienes -->
      <?php
      if (isset($resultados)) {
        // Mostrar los resultados aquí
        echo "<h2>Resultados</h2>";
        echo "<table>";
        echo "<tr><th>Conductor</th><th>Razón Social</th><th>Dirección</th><th>Colores</th></tr>";
        foreach ($resultados as $paradero) {
          echo "<tr>";
          echo "<td>{$paradero['Conductor']}</td>";
          echo "<td>{$paradero['ASO_razonsocial']}</td>";
          echo "<td>{$paradero['ASO_direccion']}</td>";
          echo "<td>{$paradero['ASO_colores']}</td>";
          echo "</tr>";
        }
        echo "</table>";
      }
      ?>
    </div>
  </div>
</body>

</html>