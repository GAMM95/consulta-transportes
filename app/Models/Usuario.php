<?php
require_once 'config/conexion.php';

class Usuario
{
  private $conector;
  protected $username;
  protected $password;
  // protected $nombre;

  /**
   * Constructor de la clase Usuario.
   * @param string $username El nombre de usuario proporcionado.
   * @param string $password La contraseña proporcionada.
   */
  // public function __construct($username, $password,$nombre)
  public function __construct($username, $password)
  {
    $this->conector = (new Conexion())->getConexion(); // Obtén la conexión a la base de datos directamente
    $this->username = $username;
    $this->password = $password;
    // $this->nombre = $nombre;
  }

  /**
   * Intenta iniciar sesión utilizando el nombre de usuario y la contraseña proporcionados.
   * @return bool Retorna true si el inicio de sesión es exitoso, o false si falla.
   */
  public function iniciarSesion()
  {
    $query = "EXEC SP_Usuario_login :username, :password";
    $stmt = $this->conector->prepare($query);
    $stmt->bindParam(':username', $this->username);
    $stmt->bindParam(':password', $this->password);
    $stmt->execute();

    return $stmt->fetch() !== false;
  }
}
