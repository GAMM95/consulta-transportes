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

  public function obtenerPapeletasNoPagadasPorPlaca($uniPlaca) {
      $query ="SELECT CONCAT(PER_nombre, ' ', PER_apellidos) AS Conductor, PAP_fechaemision, PAP_monto
            FROM PAPELETA P
            INNER JOIN UNIDAD U ON U.UNI_codigo = P.UNI_codigo
            INNER JOIN PERSONA PER ON PER.PER_codigo = U.PRO_codigo
            WHERE PAP_estado IN (24) AND UNI_placa = :s
            ORDER BY PAP_fechaemision";

      $stmt = $this->conector->prepare($query);
      $stmt->bindParam("s", $uniPlaca);
      $stmt->execute();

      $papeletas = $stmt->fetchAll(PDO::FETCH_ASSOC);

      return $papeletas;
  }
}
