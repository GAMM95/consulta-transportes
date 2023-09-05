<?php
require_once 'app/Models/Paraderos.php';

class ParaderoController
{
  private $paraderoModel;

  public function __construct()
  {
    $this->paraderoModel = new Paradero();
  }

  public function buscarParaderos($placa)
  {
    if ($this->validarPlaca($placa)) {
      $paraderos = $this->paraderoModel->consultarParaderoPorPlaca($placa);

      if ($paraderos !== false) {
        $this->mostrarParaderos($paraderos);
      } else {
        $this->mostrarError("Error al consultar los paraderos.");
      }
    } else {
      $this->mostrarError("Placa no válida. Por favor, ingrese una placa válida.");
    }
  }

  private function validarPlaca($placa)
  {
    // Implementa aquí la lógica de validación de placa
    // Ejemplo simple: Debe contener 7 caracteres alfanuméricos
    return preg_match('/^[A-Za-z0-9]{7}$/', $placa);
  }

  private function mostrarParaderos($paraderos)
  {
    // Aquí puedes definir cómo se muestra la vista de paraderos
    // Por ejemplo, puedes cargar una plantilla HTML o utilizar un framework de vista
    echo "<h1>Paraderos</h1>";
    echo "<table>";
    echo "<tr><th>Conductor</th><th>Razón Social</th><th>Dirección</th><th>Colores</th></tr>";
    foreach ($paraderos as $paradero) {
      echo "<tr>";
      echo "<td>{$paradero['Conductor']}</td>";
      echo "<td>{$paradero['ASO_razonsocial']}</td>";
      echo "<td>{$paradero['ASO_direccion']}</td>";
      echo "<td>{$paradero['ASO_colores']}</td>";
      echo "</tr>";
    }
    echo "</table>";
  }

  private function mostrarError($mensaje)
  {
    // Puedes personalizar cómo se muestra el error al usuario
    echo "Error: " . $mensaje;
  }
}
