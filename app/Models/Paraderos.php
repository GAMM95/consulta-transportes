<?php
// Importar el archivo de configuración de la conexión a la base de datos
require_once 'config/conexion.php';

// Definir la clase Paraderos
class Paraderos
{
	private $conector;

	// Constructor de la clase que recibe una conexión a la base de datos
	public function __construct($conector)
	{
		$this->conector = $conector;
	}

	// Método para obtener información de paraderos por placa de unidad
	public function obtenerParaderosporplaca($uniPlaca)
	{
		// Consulta SQL para obtener información de paraderos
		$query = "SELECT DISTINCT CONCAT(P.PER_apellidos, ', ', P.PER_nombre) AS conductor, A.ASO_razonsocial as asociacion, rp.PAR_descripcion as direccion, rp.PAR_referencia as referencia
                FROM UNIDAD U
                LEFT JOIN ASOCIACION A ON U.UNI_codigo = A.ASO_codigo
                INNER JOIN PERSONA P ON P.PER_codigo = U.PRO_codigo
                INNER JOIN RESOLUCION R ON r.ASO_codigo = a.ASO_codigo
                INNER JOIN RESOLUCION_PARADERO rp on rp.RES_codigo = r.RES_codigo
                WHERE U.UNI_placa = :placa";

		// Preparar la consulta SQL con parámetros
		$stmt = $this->conector->prepare($query);
		$stmt->bindParam("placa", $uniPlaca);
		$stmt->execute();

		// Obtener los resultados de la consulta en un arreglo asociativo
		$paraderos = $stmt->fetchAll(PDO::FETCH_ASSOC);

		// Devolver el resultado de la consulta
		return $paraderos;
	}
}
