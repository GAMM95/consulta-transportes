<?php
require_once '../config/conexion.php';

class Usuario
{
  private $conector = null;

  public function __construct()
  {
    $conexion = new conexion();
    $this->conector = $conexion->getConexion();
  }

  public function iniciarSesion($username, $password)
  {
    $query = "SELECT * FROM USUARIO_APLICATIVO WHERE USU_usuario= :username AND USU_password = :password";
    $stmt = $this->conector->prepare($query);
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':password', $password);
    $stmt->execute();

    return $stmt->fetch() !== false;
  }
}
