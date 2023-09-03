<?php
spl_autoload_register(function ($class) {
    // Define la ruta base del directorio de clases
    $classPath = 'app/Models/' . $class . '.php';

    // Verifica si el archivo de la clase existe antes de incluirlo
    if (file_exists($classPath)) {
        include $classPath;
    }
});
?>
