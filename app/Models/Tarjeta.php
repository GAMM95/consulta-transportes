<?php
// Incluye el archivo de configuración de la base de datos
require_once 'config/conexion.php';

// Clase Papeletas: representa un modelo para la gestión de papeletas
class Tarjeta
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
	 * Obtiene información de la tarjeta de circulación por placa.
	 * @param string $uniPlaca La placa del vehículo para buscar la tarjeta.
	 * @return array La información de la tarjeta de circulación.
	 */
	public function obtenerTarjetaPorPlaca($uniPlaca)
	{
		$query = "SELECT U.UNI_placa AS placa, U.UNI_numerounidad AS numUnidad, 
		TAR_serie AS tarjetaCirculacion,
		CONVERT(VARCHAR(10),TAR_fechaemision, 103) AS fechaEmision,
		ASE_descripcion AS aseguradora,
		EST_descripcion AS estado, ASO_razonsocial AS asociacion,
		(PER_apellidos +', '+PER_nombre) AS propietario
		FROM TARJETA_CIRCULACION  TJ
		INNER JOIN UNIDAD U ON U.UNI_codigo=TJ.UNI_codigo
		INNER JOIN PERSONA PER ON PER.PER_codigo = U.PRO_codigo
		INNER JOIN ASOCIACION A ON A.ASO_codigo=U.ASO_codigo
		LEFT JOIN RESOLUCION R ON R.ASO_codigo =A.ASO_codigo
		INNER JOIN MODELO M ON M.MOD_codigo = U.MOD_codigo
		INNER JOIN MARCA MA ON MA.MAR_codigo=M.MAR_codigo
		JOIN ESTADO E ON E.EST_codigo=TJ.TAR_estado	
		INNER JOIN ASEGURADORA_VEHICULO AV ON AV.UNI_codigo = U.UNI_codigo
		INNER JOIN ASEGURADORA ASE  ON ASE.ASE_codigo = AV.ASE_codigo		
        WHERE UNI_placa = :s
        ORDER BY TAR_fechaemision DESC";
		$stmt = $this->conector->prepare($query);
		$stmt->bindParam("s", $uniPlaca);
		$stmt->execute();

		$tarjeta = $stmt->fetchAll(PDO::FETCH_ASSOC);

		return $tarjeta;
	}
}
