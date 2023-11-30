<?php
// Incluye el archivo que define la clase Usuario
require_once 'app/Models/Tarjeta.php';

// Clase LoginController: controlador para la gestión del inicio de sesión
class TarjetaController
{
	private $tarjetaModel;
	public function __construct($tarjetaModel)
	{
		$this->tarjetaModel = $tarjetaModel;
	}
	/**
	 * Realiza la consulta de papeletas al pulsar el botón Buscar.
	 */
	public function consultarTarjeta()
	{
		// Verifica si la solicitud es POST (es decir, se envió el formulario)
		if ($_SERVER['REQUEST_METHOD'] === 'GET') {
			// Obtener los valores de usuario y contraseña del formulario
			$placa = $_GET['busqueda'];
			$tarjetaConsulta = $this->tarjetaModel->obtenerTarjetaPorPlaca($placa);
			return $tarjetaConsulta;
			exit(); // Termina la ejecución después de mostrar los resultados
		}
	}
}
