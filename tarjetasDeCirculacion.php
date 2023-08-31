<?php
session_start();
// Verificar si no hay una sesión iniciada
if (!isset($_SESSION['username'])) {
  header("Location: index.php"); // Redirigir a la página de inicio de sesión si no hay sesión iniciada
  exit();
}
?>

<!DOCTYPE html>
<html lang="es">
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
<div class="container">
    <?php
    // Incluir la barra lateral desde un archivo externo
    include("app/Views/partials/sideBar.php");
    ?>
    <?php
    // Incluir el cuerpo de la página desde un archivo externo
    include("app/Views/tarjetaCirculacion.php");
    ?>
  </div>
</body>
</html>