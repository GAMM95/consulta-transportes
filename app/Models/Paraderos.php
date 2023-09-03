<?php
// Incluye el archivo de configuración de la base de datos
require_once 'config/conexion.php';

// Clase Paraderos: representa un modelo para la gestión de paraderos
class Paraderos
{
  private $conector; // Almacena la conexión a la base de datos

  // Constructor de la clase Paraderos
  public function __construct()
  {
    // Crea una nueva instancia de la clase de conexión
    $conexion = new Conexion();
    // Obtiene la conexión a la base de datos
    $this->conector = $conexion->getConexion();
  }

  /**
   * Obtiene la cantidad de paraderos desde la base de datos.
   *
   * @return int Retorna la cantidad de paraderos como un entero. Si hay un error, retorna 0.
   */
  public function obtenerCantidadParaderos()
  {
    // Consulta SQL para contar la cantidad de registros en la tabla 'UNIDAD'
    $query = "SELECT COUNT(*) AS total FROM UNIDAD";
    // Ejecuta la consulta en la base de datos
    $result = $this->conector->query($query);

    if ($result) { // Comprueba si la consulta se realizó con éxito
      // Obtiene una fila de resultados como un array asociativo
      $row = $result->fetch(PDO::FETCH_ASSOC);
      // Retorna la cantidad total de paraderos
      return $row['total'];
    } else {
      // Si hay un error en la consulta, retorna 0
      return 0;
    }
  }
}