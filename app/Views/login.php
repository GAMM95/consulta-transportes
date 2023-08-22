<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="../public/assets/logo.ico" />

  <!-- Enlaces a las hojas de estilo -->
  <link rel="stylesheet" href="../public/styles/App.css">
  <link rel="stylesheet" href="../public/styles/login.css">
  <link rel="stylesheet" href="../public/styles/login_responsive.css">

  <!-- Importacion de iconos -->
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
        <video src="../public/assets/videoLogin.mp4" autoplay muted loop class='videoLogin'></video>

        <!-- Texto descriptivo -->
        <div class="textDiv">
          <h2 class='titulo'>SubGerencia de Transportes</h2>
          <p>Sistema de consultas de transportes</p>
        </div>
      </div>

      <!-- Panel del formulario -->
      <div class="formDiv flex">
        <!-- Encabezado y logo -->
        <div class="headerDiv">
          <img src="../public/assets/image.png" alt="imagen de mde" />
          <h3>Bienvenido</h3>
        </div>

        <!-- Formulario de inicio de sesión -->
        <form action="index.php?action=login" method="POST" class="form grid">
          <!-- Campos de entrada para usuario y contraseña -->
          <div class="inputDiv">
            <label for="username">Usuario</label>
            <div class="input flex">
              <i class='bx bxs-user icon-input icon'></i>
              <input type='text' id='username' placeholder='Ingrese su usuario' name='username' />
            </div>
          </div>

          <div class="inputDiv">
            <label for="password">Contraseña</label>
            <div class="input flex">
              <i class='bx bxs-lock icon-input icon'></i>
              <input type='password' id='password' placeholder='Ingrese su contraseña' name='password' />
            </div>
          </div>

          <!-- Botón de inicio de sesión -->
          <button type='submit' class='btn btn-form  flex' name='btnIniciarSesion' content='Iniciar Sesión'>
            <span>Iniciar Sesión</span>
            <!-- Icono (si fuera necesario) -->
            <!-- <AiOutlineSwapRight class='btn-icon icon' /> -->
          </button>
        </form>
      </div>
    </div>
  </div>
</body>

</html>