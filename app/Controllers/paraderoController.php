<?php
// Incluye el archivo que define la clase Usuario
require_once 'app/Models/Paraderos.php';

// Clase LoginController: controlador para la gestión del inicio de sesión
class ParaderosController
{
  private $paraderosModel;
  public function __construct($paraderosModel)
  {
    $this->paraderosModel = $paraderosModel;
  }
  /**
   * Realiza la consulta de paraderos al pulsar el botón Buscar.
   */
  public function consultarParaderos()
  {
    // Verifica si la solicitud es POST (es decir, se envió el formulario)
    if ($_SERVER['REQUEST_METHOD'] === 'GET') {
      // Obtener los valores de usuario y contraseña del formulario
      $placa = $_GET['busqueda'];
      $paraderosConsulta = $this->paraderosModel->obtenerParaderosporplaca($placa);
      return $paraderosConsulta;
      exit(); // Termina la ejecución después de mostrar los resultados
    }
  }
}
