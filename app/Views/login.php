<!-- Archivo: login.php -->

<!-- Documento HTML para la página de inicio de sesión de Consulta Transportes -->

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="public/assets/logo.ico" />

  <!-- Enlaces a las hojas de estilo -->
  <link rel="stylesheet" href="./public/styles/App.css">
  <link rel="stylesheet" href="./public/styles/login.css">
  <link rel="stylesheet" href="./public/styles/login_responsive.css">

  <!-- Importación de librería jQuery -->
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
  <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

  <!-- Implementación de funcionalidades para la vista cliente -->
  <script src="app/Views/funciones/password-toggle.js"></script>

  <!-- Importación de iconos -->
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

  <!-- Título de la página -->
  <title>Consulta Transportes - Login</title>
</head>

<body>
  <!-- Contenedor principal de la página de inicio de sesión -->
  <div class='loginPage flex'>
    <div class="container-login flex">
      <!-- Panel de video  -->
      <div class="videoDiv">
        <!-- Reproductor de video de fondo -->
        <video src="public/assets/videoLogin.mp4" autoplay muted loop class='videoLogin'></video>

        <!-- Texto descriptivo -->
        <div class="textDiv">
          <h2 class='titulo'>Sub Gerencia de Transporte, Tr&aacute;nsito y Seguridad Vial</h2>
          <p>Sistema de consultas</p>
        </div>
      </div>

      <!-- Verificación del estado para mostrar mensajes de error -->
      <?php
      $state = $_GET['state'] ?? '';
      if ($state === 'failed') {
        echo "<script>
            toastr.error('Credenciales incorrectas.', 'Inicio de sesion fallido.');
            </script>";
      }
      ?>

      <!-- Panel del formulario -->
      <div class="formDiv flex">
        <!-- Encabezado y logo -->
        <div class="headerDiv">
          <img src="public/assets/image.png" alt="imagen de mde" class="img_logo_login" />
          <h3>Bienvenido</h3>
        </div>

        <!-- Formulario de inicio de sesión -->
        <form action="index.php?action=login" method="POST" class="form grid">
          <!-- Campos de entrada para usuario y contraseña -->
          <div class="inputDiv">
            <label for="username">Usuario</label>
            <div class="input flex">
              <i class='bx bxs-user icon-input icon'></i>
              <input type='text' id='username' placeholder='Ingrese su usuario' name='username' required autofocus />
            </div>
          </div>

          <div class="inputDiv">
            <label for="password">Contrase&ntilde;a</label>
            <div class="input flex">
              <i class='bx bxs-lock icon-input icon'></i>
              <input type="password" id="password" placeholder="Ingrese su contrase&ntilde;a" name="password" required />
              <!-- Icono para mostrar/ocultar contraseña -->
              <div id="togglePassword" class="show-hide-link icon"><i class='bx bx-show icon'></i></div>
            </div>
          </div>

          <!-- Botón de inicio de sesión -->
          <button type='submit' class='btn btn-form flex' name='btnIniciarSesion' content='Iniciar Sesi&oacute;n'>
            <span>Iniciar Sesi&oacute;n</span>
          </button>
        </form>
      </div>
    </div>
  </div>

</body>

</html>
