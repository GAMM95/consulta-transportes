<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Enlaces a las hojas de estilo -->
<link rel="stylesheet" href="./public/styles/appMenu.css">
<link rel="stylesheet" href="./public/styles/partials/header.css">
<link rel="stylesheet" href="./public/styles/partials/body.css">



<!-- Importacion de iconos -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<script src="https://cdn.tailwindcss.com"></script>
<title>Consulta Transportes</title>
</head>

<body>
	<section class="topSection">

		<!-- icono de menu -->
		<div class="relative px-3 py-3 flex justify-between items-center bg-green">
			<div class="lg:hidden">
				<button class="navbar-burger flex items-center text-green-800 p-3">
					<svg class="block h-4 w-4 fill-current" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
						<title>Mobile menu</title>
						<path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"></path>
					</svg>
				</button>
			</div>

			<!-- Saludo -->
			<div class="titulo">
				<h2 id="saludo">
					<?php echo $_SESSION['nombreDePersona']; ?>!
				</h2>
			</div>
	</section>

	<!-- Script para mostrar saludo segun horario -->
	<script>
		// Obtener la hora actual del usuario
		const horaActual = new Date().getHours();

		// Obtener el elemento donde se mostrará el saludo
		const saludoElemento = document.getElementById('saludo');

		// Definir los saludos según la hora del día
		let saludo;
		if (horaActual >= 6 && horaActual < 12) {
			saludo = '¡Buenos días, <?php echo $_SESSION['nombreDePersona']; ?>!';
		} else if (horaActual >= 12 && horaActual < 18) {
			saludo = '¡Buenas tardes, <?php echo $_SESSION['nombreDePersona']; ?>!';
		} else {
			saludo = '¡Buenas noches, <?php echo $_SESSION['nombreDePersona']; ?>!';
		}

		// Actualizar el contenido del elemento con el saludo
		saludoElemento.textContent = saludo;
	</script>

</body>