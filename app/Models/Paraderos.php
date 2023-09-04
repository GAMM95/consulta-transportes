<?php
// Incluye el archivo de configuración de la base de datos
require_once 'config/conexion.php';

class Paradero
{
    private $conector;

    public function __construct()
    {
        $this->conector = (new Conexion())->getConexion(); // Obtén la conexión a la base de datos directamente
    }
    
    public function consultarParadero(){
        
    }
}
