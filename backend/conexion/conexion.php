<?php
// Define las credenciales de la base de datos (pueden provenir de variables de entorno)
$nombreServidor = "localhost";
$usuario = "sa";
$contrasena = "sql";
$nombreBaseDatos = "TRANSPORTE";

try {
  $conexionInfo = array("Database" => $nombreBaseDatos, "UID" => $usuario, "PWD" => $contrasena, "CharacterSet" => "UTF-8", "TrustServerCertificate" => true);
  $conn = sqlsrv_connect($nombreServidor, $conexionInfo);

  if ($conn === false) {
    echo "Ocurrió un error en la conexión.\n";
    handleDatabaseError();
  } else {
    // echo "Conexión establecida correctamente.";
    // Aquí puedes realizar operaciones con la base de datos
    // ...
    // Luego cierra la conexión
    sqlsrv_close($conn);
  }
} catch (Exception $e) {
  echo "Ocurrió un error en la conexión. " . $e->getMessage();
  handleDatabaseError();
}

function handleDatabaseError()
{
  // Manejo de errores, por ejemplo, registrar en un archivo de registro
  // o mostrar un mensaje genérico al usuario.
  // No reveles detalles sensibles del sistema.
  die("Error en la base de datos.");
}
