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
		<div class="relative px-4 py-10 flex justify-between items-center bg-green">
			<div class="titulo">
				<h2>Bienvenido,
					<?php echo $_SESSION['nombreDePersona']; ?>!
					<?php
					$label = 'Consulta de ';
					$url = basename($_SERVER["REQUEST_URI"]);
					$url = str_replace('.php', '', $url);
					$url = ucwords($url);
					$url = strtok($url, "?");
					$label .= $url;
					echo ' | ';
					echo $label;
					?>
				</h2>
			</div>

			
			<div class="lg:hidden">
				<button class="navbar-burger flex items-center text-green-800 p-3">
					<svg class="block h-4 w-4 fill-current" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
						<title>Mobile menu</title>
						<path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"></path>
					</svg>
				</button>
			</div>


	</section>
</body>