<?php
require_once 'config/conexion.php';

class Paradero
{
    private $conector;

    public function __construct()
    {
        $this->conector = (new Conexion())->getConexion();
    }

    public function consultarParaderoPorPlaca($placa)
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
