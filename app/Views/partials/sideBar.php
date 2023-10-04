<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Enlaces a las hojas de estilo -->
	<!--    <link rel="stylesheet" href="./public/styles/appMenu.css">-->
	<link rel="stylesheet" href="./public/styles/partials/sidebar.css">
	<!-- <link rel="stylesheet" href="./public/styles/partials/header.css"> -->


	<!-- Implementación de funcionalidades para la vista cliente -->
	<script src="app/Views/funciones/navbar.js"></script>

	<!-- Importacion de iconos -->
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<script src="https://cdn.tailwindcss.com"></script>
	<title>Consulta Transportes</title>

</head>

<body>
	<!-- Contenedor de la barra lateral -->
	<div class="sideBar hidden lg:block">

		<!-- División para el logo -->
		<div class="logoDiv flex ">
			<img src="public/assets/image.png" alt="Imagen logo MDE" class="img_logo">
		</div>

		<!-- División del menú -->
		<div class="menuDiv">
			<h3 class="divTitulo">

			</h3>
			<ul class="menuList grid">

				<!-- Item Inicio -->
				<li class="listItem">
					<a href="inicio.php" class="menuLink flex">
						<i class='bx bxs-home icon'></i>
						<span class="smallText">Inicio</span>
					</a>
				</li>

				<!-- Item Tarjetas de circulacion -->
				<li class="listItem">
					<a href="tarjetas_de_circulacion.php" class="menuLink flex">
						<i class='bx bxs-id-card icon '></i>
						<span class="smallText">Tarjetas de circulaci&oacute;n</span>
					</a>
				</li>

				<!-- Item Papeletas -->
				<li class="listItem">
					<a href="papeletas.php" class="menuLink flex">
						<i class='bx bxs-notepad icon'></i>
						<span class="smallText">Papeletas</span>
					</a>
				</li>

				<!-- Item Paraderos -->
				<li class="listItem">
					<a href="paraderos.php" class="menuLink flex">
						<i class='bx bxs-car icon'></i>
						<span class="smallText">Paraderos</span>
					</a>
				</li>

			</ul>
		</div>


		<!-- División del menú -->
		<div class="menuDiv">
			<ul class="menuList grid">

				<div class="mt-auto">
					<button class="btn !shadow-2xl logout flex">
						<a href="logout.php">
							<i class='bx bx-log-out-circle icon'></i>
							<span class="tituloBtn">Cerrar Sesi&oacute;n</span>
						</a>
					</button>
				</div>

			</ul>
		</div>

	</div>

	<div class="navbar-menu relative z-50 hidden">
		<div class="navbar-backdrop fixed inset-0 bg-gray-800 opacity-25"></div>
		<nav class="fixed top-0 left-0 bottom-0 flex flex-col w-3/6 max-w-sm py-6 px-6 bg-white border-r overflow-y-auto">
			<div class="flex items-center justify-end mb-8 w-full">
				<button class="navbar-close">
					<svg class="h-6 w-6 text-gray-400 cursor-pointer hover:text-gray-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
					</svg>
				</button>
			</div>
			<div class="w-full">
				<ul>
					<li class="mb-1">
						<a href="inicio.php" class="block p-4 text-sm font-semibold text-gray-400 hover:bg-green-50 hover:text-green-600 rounded" href="#">Inicio</a>
					</li>
					<li class="mb-1">
						<a href="tarjetas_de_circulacion.php" class="block p-4 text-sm font-semibold text-gray-400 hover:bg-green-50 hover:text-green-600 rounded" href="#">Tarjetas de Circulación</a>
					</li>
					<li class="mb-1">
						<a href="papeletas.php" class="block p-4 text-sm font-semibold text-gray-400 hover:bg-green-50 hover:text-green-600 rounded" href="#">Papeletas</a>
					</li>
					<li class="mb-1">
						<a href="paraderos.php" class="block p-4 text-sm font-semibold text-gray-400 hover:bg-green-50 hover:text-green-600 rounded" href="#">Paraderos</a>
					</li>
				</ul>
			</div>
			<div class="mt-auto">
				<button class="btn !shadow-2xl logout flex">
					<a href="logout.php">
						<i class='bx bx-log-out-circle icon'></i>
						<span class="tituloBtn">Cerrar Sesi&oacute;n</span>
					</a>
				</button>

			</div>

	</div>

</body>

</html>