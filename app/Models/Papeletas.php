<?php
// Incluye el archivo de configuración de la base de datos
require_once 'config/conexion.php';

// Clase Papeletas: representa un modelo para la gestión de papeletas
class Papeletas
{
  private $conector; // Almacena la conexión a la base de datos

  /**
   * Constructor de la clase Papeletas.
   *
   * @param PDO $conector La instancia de conexión a la base de datos.
   */
  public function __construct($conector)
  {
    $this->conector = $conector;
  }

  /**
   * Obtiene la cantidad de papeletas sin pago desde la base de datos.
   *
   * @return int Retorna la cantidad de papeletas sin pago como un entero. Si hay un error, retorna 0.
   */
  public function obtenerCantidadPapeletasSinPago()
  {
    // Consulta SQL para contar la cantidad de registros en la tabla 'PAPELETA' donde 'PAP_fechapago' es nulo
    $query = "SELECT COUNT(*) AS total FROM PAPELETA WHERE PAP_fechapago IS NULL";

    // Ejecuta la consulta en la base de datos
    $result = $this->conector->query($query);

    if ($result) { // Comprueba si la consulta se realizó con éxito
      // Obtiene una fila de resultados como un array asociativo
      $row = $result->fetch(PDO::FETCH_ASSOC);
      // Retorna la cantidad total de papeletas sin pago
      return $row['total'];
    } else {
      // Si hay un error en la consulta, retorna 0
      return 0;
    }
  }


  public function consultarPapeletasPorPlaca($placa)
  {
    $sql = "SELECT DISTINCT CONCAT(P.PER_apellidos, ', ', P.PER_nombre) AS Conductor, A.ASO_razonsocial, A.ASO_direccion, A.ASO_colores 
              FROM UNIDAD U
              LEFT JOIN ASOCIACION A ON U.UNI_codigo = A.ASO_codigo
              INNER JOIN PERSONA P ON P.PER_codigo = U.PRO_codigo
              WHERE U.UNI_placa = :placa";

    try {
      $stmt = $this->conector->prepare($sql);
      $stmt->bindParam(":placa", $placa, PDO::PARAM_STR);
      $stmt->execute();

      // Utiliza fetchAll para obtener todos los resultados de una vez
      $resultados = $stmt->fetchAll(PDO::FETCH_ASSOC);

      // Cierra la conexión para liberar recursos
      $stmt->closeCursor();

      return $resultados;
    } catch (PDOException $e) {
      // Puedes manejar el error aquí (por ejemplo, log de errores)
      return false;
    }
  }
}
