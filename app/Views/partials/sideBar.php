<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Enlaces a las hojas de estilo -->
  <link rel="stylesheet" href="http://localhost/ConsultaTransportes/public/styles/appMenu.css">
  <link rel="stylesheet" href="http://localhost/ConsultaTransportes/public/styles/sidebar.css">

  <!-- Importacion de iconos -->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <title>Consulta Transportes</title>
</head>

<body>
  <div class="sideBar grid">

    <div class="logoDiv flex">
      <img src="public/assets/image.png" alt="Imagen logo MDE">
    </div>

    <div class="menuDiv">
      <h3 class="divTitulo">
        Menu
      </h3>
      <ul class="menuList grid">
        <!-- Item Dashboard -->
        <li class="listItem">
          <a href="index.php" class="menuLink flex">
            <i class='bx bxs-home'></i>
            <span class="smallText">Dashboard</span>
          </a>
        </li>

        <!-- Item Clientes -->
        <li class="listItem">
          <a href="clientes.php" class="menuLink flex">
            <i class='bx bx-user'></i>
            <span class="smallText">Clientes</span>
          </a>
        </li>

        <!-- Item Vehiculos -->
        <li class="listItem">
          <a href="vehiculos.php" class="menuLink flex">
            <i class='bx bx-car'></i>
            <span class="smallText">Vehiculos</span>
          </a>
        </li>

        <!-- Item Transportes -->
        <li class="listItem">
          <a href="transportes.php" class="menuLink flex">
            <i class='bx bx-truck'></i>
            <span class="smallText">20:13</span>
          </a>
        </li>

        <!-- Item Usuarios -->
        <li class="listItem">
          <a href="usuarios.php" class="menuLink flex">
            <i class='bx bx-user'></i>
            <span class="smallText">Usuarios</span>
          </a>
        </li>



      </ul>
    </div>
  </div>
</body>

</html>