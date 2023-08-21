<?php
if (!empty($_POST["btnIniciarSesion"])) {
  if (empty($_POST["username"]) and empty($_POST["password"])) {
    echo '<div class="mostrarMensaje">Los campos estan vacios</div>';
  } else {
    $username = $_POST["username"];
    $password = $_POST["password"];
    $sql = $conexion->query("SELECT * FROM USUARIO_APLICATIVO WHERE USU_usuario='$username' AND USU_password='$password'");
    if ($datos = $sql->fetch_object()) {
      header("location:inicio.php");
    } else {
      echo '<div class="mostrarMensaje">Acceso denegado</div>';
    }
  }
}

