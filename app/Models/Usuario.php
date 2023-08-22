<?php
require_once '../config/conexion.php';

class Usuario
{
  private $conector = null;
  protected $username; // Almacena el nombre de usuario proporcionado
  protected $password; // Almacena la contraseña proporcionada

  /**
   * Constructor de la clase Usuario.
   * @param string $username El nombre de usuario proporcionado.
   * @param string $password La contraseña proporcionada.
   */
  public function __construct($username, $password)
  {
    $conexion = new conexion(); // Crea una instancia de la clase de conexión
    $this->conector = $conexion->getConexion(); // Obtiene la conexión a la base de datos
    $this->username = $username; // Asigna el nombre de usuario al atributo protegido
    $this->password = $password; // Asigna la contraseña al atributo protegido
  }

  /**
   * Intenta iniciar sesión utilizando el nombre de usuario y la contraseña proporcionados.
   * @return bool Retorna true si el inicio de sesión es exitoso, o false si falla.
   */
  public function iniciarSesion()
  {
    $query = "SELECT * FROM USUARIO_APLICATIVO WHERE USU_usuario= :username AND USU_password = :password";
    $stmt = $this->conector->prepare($query);
    $stmt->bindParam(':username', $this->username); // Vincula el nombre de usuario
    $stmt->bindParam(':password', $this->password); // Vincula la contraseña
    $stmt->execute(); // Ejecuta la consulta

    return $stmt->fetch() !== false; // Retorna true si hay resultados, o false si no los hay
  }
}
