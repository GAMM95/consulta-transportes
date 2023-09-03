<?php
// Iniciar la sesión para mantener el estado del usuario
session_start();

// Verificar si el usuario no ha iniciado sesión
if (!isset($_SESSION['username'])) {
    // Redirigir al usuario a la página de inicio de sesión si no hay una sesión iniciada
    header("Location: index.php");
    exit(); // Terminar el script para evitar que se siga ejecutando
}

require_once 'config/conexion.php';

// Cargar modelos y controladores
require_once 'app/Models/Papeletas.php';
require_once 'app/Models/Paraderos.php';
require_once 'app/Models/Asociaciones.php';
require_once 'app/Controllers/ConsultaController.php';

// Crear una instancia de la conexión a la base de datos
$conexion = new Conexion();
$conector = $conexion->getConexion();

// Crear instancias de los modelos
$modelPapeletas = new Papeletas($conector);
$modelParaderos = new Paraderos($conector);
$modelAsociaciones = new Asociaciones($conector);

// Crear una instancia del controlador de consulta
$controller = new ConsultaController($modelPapeletas, $modelParaderos, $modelAsociaciones);

// Obtener las cantidades utilizando el controlador
$cantidades = $controller->mostrarCantidades();

// Cantidades individuales
$cantidadPapeletas = $cantidades['papeletas'];
$cantidadParaderos = $cantidades['paraderos'];
$cantidadAsociaciones = $cantidades['asociaciones'];
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
        <?php include("app/Views/partials/sideBar.php"); ?>
        <?php include("app/Views/PnlInicio.php"); ?>
    </div>
</body>
</html>
