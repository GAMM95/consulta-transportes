<?php
require_once '../app/Models/Usuario.php';

class LoginController
{
    public function showLoginForm()
    {
        require_once '../app/Views/login.php';
    }

    public function processLogin()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $username = $_POST['username'];
            $password = $_POST['password'];

            $usuario = new Usuario();
            if ($usuario->iniciarSesion($username, $password)) {
                session_start();
                $_SESSION['username'] = $username; // Almacena el nombre de usuario en la sesión
                header("Location: menu.php"); // Redirige a la página de menú
                exit();
            } else {
                echo "Inicio de sesión fallido. Verifica tus credenciales.";
            }
        }
    }
}
