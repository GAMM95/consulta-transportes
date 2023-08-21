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
  <title>Menú</title>
</head>

<body>
  <h2>Bienvenido, <?php echo $_SESSION['username']; ?>!</h2>
  <p>Esta es tu página de menú.</p>
  <a href="logout.php">Cerrar sesión</a> <!-- Agrega un enlace para cerrar sesión -->
</body>

</html>