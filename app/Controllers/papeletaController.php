<?php
// Incluye el archivo que define la clase Usuario
require_once 'app/Models/Papeletas.php';

// Clase LoginController: controlador para la gestión del inicio de sesión
class PapeletaController
{
    private $papeletasModel;
    public function __construct($papeletasModel){
        $this->papeletasModel = $papeletasModel;
    }
    /**
     * Realiza la consulta de papeletas al pulsar el botón Buscar.
     */
    public function consultarPapeletas()
    {
        // Verifica si la solicitud es POST (es decir, se envió el formulario)
        if ($_SERVER['REQUEST_METHOD'] === 'GET') {
            // Obtén los valores de usuario y contraseña del formulario
            $placa = $_GET['busqueda'];
//            $placa = '8596-1T';
            $papeletasConsulta = $this->papeletasModel->obtenerPapeletasNoPagadasPorPlaca($placa);
            return $papeletasConsulta;
            exit(); // Termina la ejecución después de mostrar los resultados
        }
    }
}
