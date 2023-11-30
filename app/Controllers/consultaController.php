<?php
require_once 'autoloader.php';

/**
 * Controlador de Consulta.
 * Este controlador se encarga de gestionar las consultas y obtener cantidades relacionadas
 * con papeletas, unidades y asociaciones a partir de los modelos correspondientes.
 * @package ConsultaTransportes
 */
class ConsultaController
{
  /**
   * @var Papeletas Modelo de Papeletas
   */
  private $papeletasModel;

  /**
   * @var Unidades Modelo de Unidades
   */
  private $unidadesModel;

  /**
   * @var Asociaciones Modelo de Asociaciones
   */
  private $asociacionesModel;

  /**
   * Constructor de la clase ConsultaController.
   * @param Papeletas     $papeletasModel     Modelo de Papeletas
   * @param Unidades     $unidadesModel     Modelo de Unidades
   * @param Asociaciones  $asociacionesModel  Modelo de Asociaciones
   */
  public function __construct($papeletasModel, $unidadesModel, $asociacionesModel)
  {
    $this->papeletasModel = $papeletasModel;
    $this->unidadesModel = $unidadesModel;
    $this->asociacionesModel = $asociacionesModel;
  }

  /**
   * Obtiene las cantidades relacionadas con papeletas, paraderos y asociaciones.
   * @return array Un arreglo asociativo con las cantidades.
   * @throws Exception Si ocurre un error al obtener las cantidades.
   */
  public function mostrarCantidades()
  {
    try {
      $cantidadPapeletas = $this->papeletasModel->obtenerCantidadPapeletasSinPago();
      $cantidadUnidades = $this->unidadesModel->obtenerCantidadUnidades();
      $cantidadAsociaciones = $this->asociacionesModel->obtenerCantidadAsociaciones();

      // Retorna las cantidades en un arreglo asociativo
      return [
        'papeletas' => $cantidadPapeletas,
        'unidades' => $cantidadUnidades,
        'asociaciones' => $cantidadAsociaciones,
      ];
    } catch (Exception $e) {
      // Manejo de excepcion de errores
      throw new Exception('Error al obtener las cantidades: ' . $e->getMessage());
    }
  }
}
