<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Enlaces a las hojas de estilo -->
<link rel="stylesheet" href="./public/styles/appMenu.css">
<link rel="stylesheet" href="./public/styles/partials/header.css">

<!-- Importacion de iconos -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<title>Consulta Transportes</title>
</head>

<body>
  <div class="topSection">
    <div class="headerSection flex">
      <div class="titulo">
        <h2>Bienvenido, <?php echo $_SESSION['username']; ?>!</h2>
      </div>

      <div class="logout">
        <a href="logout.php">
          <i class='bx bx-log-out-circle icon'></i>
          Cerrar sesión
        </a> <!-- Agrega un enlace para cerrar sesión -->
      </div>
    </div>

    <div class="cardSection flex">
      <div class="rightCard flex">
        
      </div>
    </div>

  </div>
</body>

</html>