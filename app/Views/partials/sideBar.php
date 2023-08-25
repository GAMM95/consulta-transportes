<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Enlaces a las hojas de estilo -->
  <link rel="stylesheet" href="http://localhost/ConsultaTransportes/public/styles/appMenu.css">
  <link rel="stylesheet" href="http://localhost/ConsultaTransportes/public/styles/partials/sidebar.css">

  <!-- Importacion de iconos -->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <title>Consulta Transportes</title>
</head>

<body>
  <!-- Contenedor de la barra lateral -->
  <div class="sideBar grid">

    <!-- División para el logo -->
    <div class="logoDiv flex">
      <img src="public/assets/image.png" alt="Imagen logo MDE">
    </div>

    <!-- División del menú -->
    <div class="menuDiv">
      <h3 class="divTitulo">
        Menu
      </h3>
      <ul class="menuList grid">
        <!-- Item Inicio -->
        <li class="listItem">
          <a href="menu.php" class="menuLink flex">
            <i class='bx bxs-home icon'></i>
            <span class="smallText">Inicio</span>
          </a>
        </li>

        <!-- Item Trajetas de circulacion -->
        <li class="listItem">
          <a href="clientes.php" class="menuLink flex">
            <i class='bx bx-id-card icon'></i>
            <span class="smallText">Clientes</span>
          </a>
        </li>

        <!-- Item Vehiculos -->
        <li class="listItem">
          <a href="vehiculos.php" class="menuLink flex">
            <i class='bx bx-car icon'></i>
            <span class="smallText">Vehiculos</span>
          </a>
        </li>

        <!-- Item Transportes -->
        <li class="listItem">
          <a href="transportes.php" class="menuLink flex">
            <i class='bx bx-truck icon'></i>
            <span class="smallText">20:13</span>
          </a>
        </li>

        <!-- Item Usuarios -->
        <li class="listItem">
          <a href="usuarios.php" class="menuLink flex">
            <i class='bx bx-user icon'></i>
            <span class="smallText">Usuarios</span>
          </a>
        </li>
      </ul>
    </div>


    <div class="settingDiv">
      <h3 class="divTitulo">
        Configuración - 27:05
      </h3>

      <ul class="menuList grid">
        <li class="listItem">

        </li>
      </ul>

    </div>


    <div class="sideBarCard">

    </div>
  </div>
</body>

</html>