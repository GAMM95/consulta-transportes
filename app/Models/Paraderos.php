<?php
require_once 'config/conexion.php';

class Paraderos
{
    private $conector;

    public function __construct($conector)
    {
        $this->conector = $conector;
    }

    public function obtenerParaderosporplaca($uniPlaca)
    {
        $query = "SELECT DISTINCT CONCAT(P.PER_apellidos, ', ', P.PER_nombre) AS Conductor, A.ASO_direccion, A.ASO_colores as colores
                FROM UNIDAD U
                LEFT JOIN ASOCIACION A ON U.UNI_codigo = A.ASO_codigo
                INNER JOIN PERSONA P ON P.PER_codigo = U.PRO_codigo
                WHERE U.UNI_placa = :placa";

        $stmt = $this->conector->prepare($query);
        $stmt->bindParam("placa", $uniPlaca);
        $stmt->execute();

        $paraderos = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $paraderos;
    }
}
