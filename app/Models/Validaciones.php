<?php
// Incluye el archivo de configuración de la base de datos
require_once 'config/conexion.php';

// Clase Validaciones: representa un modelo para la gestión de validaciones
class Validaciones
{
  private $conector; // Almacena la conexión a la base de datos

  /**
   * Constructor de la clase Validaciones.
   *
   * @param PDO $conector La instancia de conexión a la base de datos.
   */
  public function __construct($conector)
  {
    $this->conector = $conector;
  }

  /**
   * Obtiene la cantidad de unidades desde la base de datos.
   *
   * @param string $uniPlaca La placa a validar.
   * @return int Retorna la cantidad de unidades como un entero. Si hay un error, retorna 0.
   */
  public function validarPlaca($uniPlaca)
  {
    $query = "SELECT count(UNI_codigo) as placa_count FROM UNIDAD WHERE UNI_placa = ?";
    $stmt = $this->conector->prepare($query);
    $stmt->bindParam(1, $uniPlaca, PDO::PARAM_STR); // En PDO, el primer parámetro es el índice del marcador y el segundo es el valor

    if ($stmt->execute()) {
      $result = $stmt->fetch(PDO::FETCH_ASSOC);
      if ($result) {
        return $result['placa_count'];
      } else {
        return 1; // Si no se encuentra la placa, se devuelve 1
      }
    } else {
      return 0; // En caso de error, se devuelve 0
    }
  }
}

