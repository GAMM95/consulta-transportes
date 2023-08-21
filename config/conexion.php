<?php
// Importa las configuraciones de la base de datos desde settings.php
require 'settings.php';

class Conexion
{
  private $conector = null;

  // Método para obtener una conexión a la base de datos
  public function getConexion()
  {
    // Crea una nueva instancia de PDO para conectarse a SQL Server
    $this->conector = new PDO("sqlsrv:server=" . SERVIDOR . ";database=" . DATABASE, USUARIO, PASSWORD);
    
    // Devuelve el objeto de conexión PDO
    return $this->conector;
  }
}

// Crea una instancia de la clase Conexion
$con = new Conexion();

// Intenta obtener una conexión a la base de datos y muestra un mensaje en consecuencia
if ($con->getConexion() != null) {
  // echo "Conexión exitosa";

  // Consulta para obtener datos 
  // $pps = $con->getConexion()->prepare("SELECT * FROM USUARIO_APLICATIVO");
  // $pps -> execute();
  // echo json_encode(['USUARIO_APLICATIVO'=>$pps->fetchAll(PDO::FETCH_ASSOC)]);

} else {
  echo "Error al conectarse a la base de datos";
}
?>



