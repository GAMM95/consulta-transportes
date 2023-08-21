<?php
if (!empty($_POST["btnIniciarSesion"])) {
  if (empty($_POST["username"]) and empty($_POST["password"])) {
    echo '<span class="mostrarMensaje">Estado de logeo - aquí </span>';;
  } else {
    $username = $_POST["username"];
    $password = $_POST["password"];
    $sql = $conexion->query("select * from USUARIO_APLICATIVO where USU_usuario=$username and USU_password=$password");
  }
}
