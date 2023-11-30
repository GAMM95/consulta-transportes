<?php
// Incluye el archivo de configuración de la base de datos
require_once 'config/conexion.php';

// Clase Asociaciones: representa un modelo para la gestión de asociaciones
class Asociaciones
{
  private $conector; // Almacena la conexión a la base de datos

  /**
   * Constructor de la clase Asociaciones.
   * @param PDO $conector La instancia de conexión a la base de datos.
   */
  public function __construct($conector)
  {
    $this->conector = $conector;
  }

  /**
   * Obtiene la cantidad de asociaciones desde la base de datos.
   * @return int Retorna la cantidad de asociaciones como un entero. Si hay un error, retorna 0.
   */
  public function obtenerCantidadAsociaciones()
  {
    // Consulta SQL para contar la cantidad de registros en la tabla 'ASOCIACION'
    $query = "SELECT COUNT(*) AS total FROM ASOCIACION";

    // Ejecuta la consulta en la base de datos
    $result = $this->conector->query($query);

    if ($result) { // Comprueba si la consulta se realizó con éxito
      // Obtiene una fila de resultados como un array asociativo
      $row = $result->fetch(PDO::FETCH_ASSOC);
      // Retorna la cantidad total de asociaciones
      return $row['total'];
    } else {
      // Si hay un error en la consulta, retorna 0
      return 0;
    }
  }
}
