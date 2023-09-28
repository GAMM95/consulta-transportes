<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Enlaces a las hojas de estilo -->
<!--    <link rel="stylesheet" href="./public/styles/appMenu.css">-->
    <link rel="stylesheet" href="./public/styles/partials/sidebar.css">
    <!-- <link rel="stylesheet" href="./public/styles/partials/header.css"> -->

    <!-- Importacion de iconos -->
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Consulta Transportes</title>

</head>

<body>
<!-- Contenedor de la barra lateral -->
<div class="sideBar hidden lg:block">

    <!-- División para el logo -->
    <div class="logoDiv flex ">
        <img src="public/assets/image.png" alt="Imagen logo MDE" class="img_logo">
    </div>

    <!-- División del menú -->
    <div class="menuDiv">
        <h3 class="divTitulo">
            Consultas
        </h3>
        <ul class="menuList grid">

            <!-- Item Inicio -->
            <li class="listItem">
                <a href="inicio.php" class="menuLink flex">
                    <i class='bx bxs-home icon'></i>
                    <span class="smallText">Inicio</span>
                </a>
            </li>

            <!-- Item Tarjetas de circulacion -->
            <li class="listItem">
                <a href="tarjetas_de_circulacion.php" class="menuLink flex">
                    <i class='bx bxs-id-card icon '></i>
                    <span class="smallText">Tarjetas de circulación</span>
                </a>
            </li>

            <!-- Item Papeletas -->
            <li class="listItem">
                <a href="papeletas.php" class="menuLink flex">
                    <i class='bx bxs-notepad icon'></i>
                    <span class="smallText">Papeletas</span>
                </a>
            </li>

            <!-- Item Paraderos -->
            <li class="listItem">
                <a href="paraderos.php" class="menuLink flex">
                    <i class='bx bxs-car icon'></i>
                    <span class="smallText">Paraderos</span>
                </a>
            </li>

        </ul>
    </div>


    <!-- División del menú -->
    <div class="menuDiv">
        <ul class="menuList grid">

            <!-- <div class="log flex"> -->

            <button class="btn logout flex">
                <a href="logout.php">
                    <i class='bx bx-log-out-circle icon'></i>
                    <span class="tituloBtn">Cerrar Sesión</span>
                </a>
            </button>
            <!-- </div> -->


        </ul>
    </div>


</div>

</body>

</html>