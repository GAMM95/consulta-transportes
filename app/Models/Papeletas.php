<?php
// Incluye el archivo de configuración de la base de datos
require_once 'config/conexion.php';

// Clase Papeletas: representa un modelo para la gestión de papeletas
class Papeletas
{
  private $conector; // Almacena la conexión a la base de datos

  /**
   * Constructor de la clase Papeletas.
   * @param PDO $conector La instancia de conexión a la base de datos.
   */
  public function __construct($conector)
  {
    $this->conector = $conector;
  }

  /**
   * Obtiene la cantidad de papeletas sin pago desde la base de datos.
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

  /**
   * Obtiene las papeletas no pagadas asociadas a una placa de vehículo.
   * @param string $uniPlaca La placa del vehículo para buscar las papeletas.
   * @return array La información de las papeletas no pagadas.
   */
  public function obtenerPapeletasNoPagadasPorPlaca($uniPlaca)
  {
    $query = "SELECT (PER_nombre+ ', '+ PER_apellidos) AS conductor,  
    CONVERT(VARCHAR(10),PAP_fechaemision,103) +' '+PAP_hora AS fechaEmisionFormateada, 
    PAP_serie as serie, UNI_tarjetapropiedad as tarjetaPropiedad, 
    I.INF_codigodesc as codigoInfraccion, EST_descripcion AS estado
    FROM PAPELETA P
    INNER JOIN UNIDAD U ON U.UNI_codigo = P.UNI_codigo
    INNER JOIN PERSONA PER ON PER.PER_codigo = U.CON_codigo
    INNER JOIN INFRACCION I ON I.INF_codigo = P.INF_codigo
		INNER JOIN ESTADO E ON E.EST_codigo = P.PAP_estado
    WHERE UNI_placa = :s AND PAP_fechapago IS NULL
    ORDER BY PAP_fechaemision DESC";

    $stmt = $this->conector->prepare($query);
    $stmt->bindParam("s", $uniPlaca);
    $stmt->execute();

    $papeletas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    return $papeletas;
  }
}
