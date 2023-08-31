<?php
/**
 * Página de menú principal para el sistema de Consulta de Transportes.
 *
 * Esta página se encarga de mostrar el menú principal después de que un usuario ha iniciado sesión.
 * Verifica si el usuario ha iniciado sesión y redirige a la página de inicio de sesión si no lo ha hecho.
 * Incluye la barra lateral y el contenido principal de la página.
 *
 * @package ConsultaTransportes
 */

// Iniciar la sesión para mantener el estado del usuario
session_start();

// Verificar si el usuario no ha iniciado sesión
if (!isset($_SESSION['username'])) {
    // Redirigir al usuario a la página de inicio de sesión si no hay una sesión iniciada
    header("Location: index.php");
    exit(); // Terminar el script para evitar que se siga ejecutando
}
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="public/assets/logo.ico" />

    <!-- Importación de estilos -->
    <link rel="stylesheet" href="./public/styles/appMenu.css">
    <title>Consulta Transportes</title>
</head>

<body>
    <!-- Contenedor principal -->
    <div class="container">
        <?php
        // Incluir la barra lateral desde un archivo externo
        include("app/Views/partials/sideBar.php");
        ?>
        <?php
        // Incluir el cuerpo de la página desde un archivo externo (PnlInicio.php)
        include("app/Views/PnlInicio.php");
        ?>
    </div>
</body>

</html>
