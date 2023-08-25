<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Enlaces a las hojas de estilo -->
<link rel="stylesheet" href="./public/styles/appMenu.css">
<link rel="stylesheet" href="./public/styles/partials/body.css">

<!-- Importacion de iconos -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<title>Consulta Transportes</title>
</head>

<body>
  <div class="mainContent">
    <!-- header -->
    <h2>Bienvenido, <?php echo $_SESSION['username']; ?>!</h2>
    <!-- <p>Esta es tu página de menú.</p> -->
    <a href="logout.php">
      <i class='bx bx-log-out-circle icon'></i>
      Cerrar sesión
    </a> <!-- Agrega un enlace para cerrar sesión -->
  </div>
</body>

</html>