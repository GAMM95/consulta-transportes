<?php
// Iniciar la sesión
session_start();

// Destruir la sesión actual
session_destroy();

// Redirigir al usuario a la página de inicio de sesión
header("Location: index.php");

// Finalizar la ejecución del script
exit();
