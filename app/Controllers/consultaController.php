<?php
require_once 'autoloader.php';

/**
 * Controlador de Consulta.
 *
 * Este controlador se encarga de gestionar las consultas y obtener cantidades relacionadas
 * con papeletas, paraderos y asociaciones a partir de los modelos correspondientes.
 *
 * @package ConsultaTransportes
 */
class ConsultaController
{
  /**
   * @var Papeletas Modelo de Papeletas
   */
  private $papeletasModel;

  /**
   * @var Paraderos Modelo de Paraderos
   */
  private $paraderosModel;

  /**
   * @var Asociaciones Modelo de Asociaciones
   */
  private $asociacionesModel;

  /**
   * Constructor de la clase ConsultaController.
   *
   * @param Papeletas     $papeletasModel     Modelo de Papeletas
   * @param Paraderos     $paraderosModel     Modelo de Paraderos
   * @param Asociaciones  $asociacionesModel  Modelo de Asociaciones
   */
  public function __construct($papeletasModel, $paraderosModel, $asociacionesModel)
  {
    $this->papeletasModel = $papeletasModel;
    $this->paraderosModel = $paraderosModel;
    $this->asociacionesModel = $asociacionesModel;
  }

  /**
   * Obtiene las cantidades relacionadas con papeletas, paraderos y asociaciones.
   *
   * @return array Un arreglo asociativo con las cantidades.
   * @throws Exception Si ocurre un error al obtener las cantidades.
   */
  public function mostrarCantidades()
  {
    try {
      $cantidadPapeletas = $this->papeletasModel->obtenerCantidadPapeletasSinPago();
      $cantidadParaderos = $this->paraderosModel->obtenerCantidadParaderos();
      $cantidadAsociaciones = $this->asociacionesModel->obtenerCantidadAsociaciones();

      // Aquí puedes realizar cualquier otra lógica necesaria antes de devolver las cantidades

      // Retorna las cantidades en un arreglo asociativo
      return [
        'papeletas' => $cantidadPapeletas,
        'paraderos' => $cantidadParaderos,
        'asociaciones' => $cantidadAsociaciones,
        // Puedes agregar aquí otras cantidades si es necesario
      ];
    } catch (Exception $e) {
      // Manejo de errores
      throw new Exception('Error al obtener las cantidades: ' . $e->getMessage());
    }
  }
}
