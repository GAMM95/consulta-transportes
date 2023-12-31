<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Enlaces a las hojas de estilo -->
	<link rel="stylesheet" href="./public/styles/appMenu.css">
	<link rel="stylesheet" href="./public/styles/partials/body.css">
	<link rel="stylesheet" href="./public/styles/tarjetaCirculacion.css">

	<!-- Importacion de iconos -->
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<title>Consulta Transportes</title>
</head>

<body>
	<!-- Contenedor principal -->
	<div class="mainContent !w-full">
		<?php
		include("app/Views/partials/header.php")
		?>

		<!-- Titulo de consulta -->
		<div class="consulta">
			<spam class="tituloConsulta">
				CONSULTA DE TARJETA DE CIRCULACI&Oacute;N
			</spam>
		</div>

		<div class="tarjetas_content mb-3">
			<form action="tarjetas_de_circulacion.php" method="GET" class="form mb-10 ">
				<div class="input flex p-4">
					<input type="text" id="busqueda" name="busqueda" placeholder="Placa del veh&iacute;culo" required focus>
					<button type="submit" class='btn btn-form  flex'>Buscar</button>
				</div>
			</form>
		</div>

		<!-- TABLA DE RESULTADOS -->
		<?php if (!empty($busqueda)) : ?>

			<div class="m-2 relative overflow-x-auto">
				<div class="p-6 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
					<?php if (empty($resultadoBusqueda)) : ?>
						<p class="mb-2 text-2xl  tracking-tight text-gray-900 dark:text-white">
							No se encontr&oacute; tarjeta de circulaci&oacute;n para la placa <span class="font-semibold"><?php echo $busqueda; ?></span>.
						</p>
					<?php else : ?>
						<h5 class="mb-2 text-2xl font-semibold tracking-tight text-gray-900 dark:text-white">Resultados</h5>

						<div style="gap: 0;" class="mt-4 grid mb-8 border border-gray-200 rounded-lg shadow-sm dark:border-gray-700 md:mb-12 xl:grid-cols-3 md:grid-cols-2">

							<!-- PRIMERA FILA -->
							<!-- MOSTRAR PLACA -->
							<figure class="flex flex-col items-center justify-center p-2 text-center bg-white border border-gray-200 rounded-t-lg md:rounded-t-none md:rounded-tl-lg md:border-r dark:bg-gray-800 dark:border-gray-700">
								<blockquote class="max-w-2xl mx-auto text-gray-500 dark:text-gray-400">
									<h3 class="text-lg font-semibold text-gray-900 dark:text-white">PLACA</h3>
									<p class="my-4"><?php echo $resultadoBusqueda[0]['placa']; ?></p>
								</blockquote>
							</figure>

							<!-- MOSTRAR NUMERO DE UNIDAD -->
							<figure class="flex flex-col items-center justify-center p-2 text-center bg-white border border-gray-200 rounded-t-lg md:rounded-t-none md:rounded-tl-lg md:border-r dark:bg-gray-800 dark:border-gray-700">
								<blockquote class="max-w-2xl mx-auto text-gray-500 dark:text-gray-400">
									<h3 class="text-lg font-semibold text-gray-900 dark:text-white">N° UNIDAD</h3>
									<p class="my-4"><?php echo $resultadoBusqueda[0]['numUnidad']; ?></p>
								</blockquote>
							</figure>

							<!-- MOSTRAR NUMERO DE TARJETA -->
							<figure class="flex flex-col items-center justify-center p-2 text-center bg-white border border-gray-200 rounded-t-lg md:rounded-t-none md:rounded-tl-lg md:border-r dark:bg-gray-800 dark:border-gray-700">
								<blockquote class="max-w-2xl mx-auto text-gray-500 dark:text-gray-400">
									<h3 class="text-lg font-semibold text-gray-900 dark:text-white">TARJETA CIRCULACI&Oacute;N</h3>
									<p class="my-4"><?php echo $resultadoBusqueda[0]['tarjetaCirculacion']; ?></p>
								</blockquote>
							</figure>

							<!-- MOSTRAR FECHA DE EMISION -->
							<figure class="flex flex-col items-center justify-center p-2 text-center bg-white border border-gray-200 rounded-t-lg md:rounded-t-none md:rounded-tl-lg md:border-r dark:bg-gray-800 dark:border-gray-700">
								<blockquote class="max-w-2xl mx-auto text-gray-500 dark:text-gray-400">
									<h3 class="text-lg font-semibold text-gray-900 dark:text-white">FECHA DE EMISI&Oacute;N</h3>
									<p class="my-4"><?php echo $resultadoBusqueda[0]['fechaEmision']; ?></p>
								</blockquote>
							</figure>

							<!-- MOSTRAR AFOCAT -->
							<figure class="flex flex-col items-center justify-center p-2 text-center bg-white border border-gray-200 rounded-tr-lg dark:bg-gray-800 dark:border-gray-700">
								<blockquote class="max-w-2xl mx-auto text-gray-500 dark:text-gray-400">
									<h3 class="text-lg font-semibold text-gray-900 dark:text-white">AFOCAT</h3>
									<p class="my-4"><?php echo $resultadoBusqueda[0]['aseguradora']; ?></p>
								</blockquote>
							</figure>

							<!-- MOSTRAR ESTADO -->
							<figure class="flex flex-col items-center justify-center p-2 text-center bg-white border border-gray-200 rounded-bl-lg dark:bg-gray-800 dark:border-gray-700">
								<blockquote class="max-w-2xl mx-auto text-gray-500 dark:text-gray-400">
									<h3 class="text-lg font-semibold text-gray-900 dark:text-white">ESTADO</h3>
									<p class="my-4"><?php echo $resultadoBusqueda[0]['estado']; ?></p>
								</blockquote>
							</figure>

							<!-- MOSTRAR NOMBRE DE ASOCIACION -->
							<figure class="flex flex-col items-center justify-center p-2 text-center bg-white border border-gray-200 rounded-b-lg md:rounded-br-lg dark:bg-gray-800 dark:border-gray-700">
								<blockquote class="max-w-2xl mx-auto text-gray-500 dark:text-gray-400">
									<h3 class="text-lg font-semibold text-gray-900 dark:text-white">ASOCIACI&Oacute;N</h3>
									<p class="my-4"><?php echo $resultadoBusqueda[0]['asociacion']; ?></p>
								</blockquote>
							</figure>

							<!-- MOSTRAR NOMBRE DEL PROPIETARIO -->
							<figure class="flex flex-col items-center justify-center p-2 text-center bg-white border  rounded-t-lg md:rounded-t-none md:rounded-tl-lg md:border-r border-gray-200 rounded-b-lg md:rounded-br-lg dark:bg-gray-800 dark:border-gray-700">
								<blockquote class="max-w-2xl mx-auto text-gray-500 dark:text-gray-400">
									<h3 class="text-lg font-semibold text-gray-900 dark:text-white">PROPIETARIO</h3>
									<p class="my-4"><?php echo $resultadoBusqueda[0]['propietario']; ?>
								</blockquote>
							</figure>

						</div>
					<?php endif; ?>

				</div>

			</div>
		<?php else : ?>
		<?php endif; ?>

	</div>
</body>

</html>