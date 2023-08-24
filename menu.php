<?php
session_start();
if (!isset($_SESSION['username'])) {
  header("Location: index.php"); // Redirige a la página de inicio de sesión si no hay sesión iniciada
  exit();
}
?>

<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="public/assets/logo.ico" />

  <!-- Importacion de estilos -->
  <link rel="stylesheet" href="http://localhost/ConsultaTransportes/public/styles/appMenu.css">
  <title>Consulta Transportes</title>
</head>

<!-- Reutilizacion de codigo - partials -->


<body>
  <div class="container">
    <?php
    include("app/Views/partials/sideBar.php");
    ?>
        <?php
    include("app/Views/partials/body.php");
    ?>


    <h2>Bienvenido, <?php echo $_SESSION['username']; ?>!</h2>
    <p>Esta es tu página de menú.</p>
    <a href="logout.php">Cerrar sesión</a> <!-- Agrega un enlace para cerrar sesión -->
  </div>

</body>

</html>