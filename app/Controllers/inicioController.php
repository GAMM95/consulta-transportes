<?php
class InicioController
{
  public function mostrarPnlInicio()
  {
    /**
     * Muestra el panel de inicio.
     */
    include 'app/Views/partials/sideBar.php';
    include 'app/Views/PnlTarjetaDeCirculacion.php';
  }
}
