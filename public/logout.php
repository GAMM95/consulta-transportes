<?php
session_start();
session_destroy(); // Destruye la sesión
header("Location: index.php"); // Redirige a la página de inicio de sesión
exit();
