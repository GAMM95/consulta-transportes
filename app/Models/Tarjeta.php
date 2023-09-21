<?php
// Incluye el archivo de configuración de la base de datos
require_once 'config/conexion.php';

// Clase Papeletas: representa un modelo para la gestión de papeletas
class Tarjeta
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


    public function obtenerTarjetaPorPlaca($uniPlaca)
    {
        $query = "SELECT ASO_razonsocial, ASO_ruc, 
                    TAR_codigo, TAR_serie, FORMAT(TAR_fechaemision, 'dd/MM/yyyy') AS FechaEmisionFormateada,FORMAT(TAR_fechavencimiento, 'dd/MM/yyyy') AS FechaVencimientoFormateada,
                    RES_numero,
                    UNI_aniofabrica,UNI_motor, MOD_descripcion, MAR_descripcion
                     ,EST_descripcion
                    FROM TARJETA_CIRCULACION  TJ
                    INNER JOIN UNIDAD U ON U.UNI_codigo=TJ.UNI_codigo
                    INNER JOIN ASOCIACION A ON A.ASO_codigo=U.ASO_codigo
                    LEFT JOIN RESOLUCION R ON R.ASO_codigo =A.ASO_codigo
                    INNER JOIN MODELO M ON M.MOD_codigo = U.MOD_codigo
                    INNER JOIN MARCA MA ON MA.MAR_codigo=M.MAR_codigo
                     JOIN ESTADO E ON E.EST_codigo=TJ.TAR_estado
                    WHERE UNI_placa = :s
                    ORDER BY TAR_fechaemision DESC";

        $stmt = $this->conector->prepare($query);
        $stmt->bindParam("s", $uniPlaca);
        $stmt->execute();

        $tarjeta = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $tarjeta;
    }
}