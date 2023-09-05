<?php
// Incluye el archivo que define la clase Usuario
require_once 'app/Models/Tarjeta.php';

// Clase LoginController: controlador para la gestión del inicio de sesión
class TarjetaController
{
    private $tarjetaModel;
    public function __construct($tarjetaModel){
        $this->tarjetaModel = $tarjetaModel;
    }
    /**
     * Realiza la consulta de papeletas al pulsar el botón Buscar.
     */
    public function consultarTarjeta()
    {
        // Verifica si la solicitud es POST (es decir, se envió el formulario)
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            // Obtén los valores de usuario y contraseña del formulario
            $placa = $_GET['busqueda'];
//            $placa = '8596-1T';
            $tarjetaConsulta = $this->tarjetaModel->obtenerTarjetaPorPlaca($placa);

            return $tarjetaConsulta;
//            include("papeletas.php");
            exit(); // Termina la ejecución después de mostrar los resultados
        }
    }
}
