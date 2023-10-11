<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Enlaces a las hojas de estilo -->
	<link rel="stylesheet" href="./public/styles/appMenu.css">
	<link rel="stylesheet" href="./public/styles/partials/body.css">
	<link rel="stylesheet" href="./public/styles/papeletas.css">

	<!-- Importación de iconos -->
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<script src="https://cdn.tailwindcss.com"></script>

	<!-- Título de la página -->
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
				CONSULTA DE PAPELETAS
			</spam>
		</div>

		<div class="papeletas_content mb-3">
			<form action="papeletas.php" method="GET" class="form mb-10">
				<div class="input flex">
					<input type="text" id="busqueda" name="busqueda" placeholder="Placa del veh&iacute;culo" required focus>
					<button type="submit" class='btn btn-form  flex'>Buscar</button>
				</div>
			</form>
		</div>

		<!-- TABLA DE RESULTADOS -->
		<?php if (!empty($busqueda)) : ?>

			<div class="w-full p-4 relative overflow-x-auto">
				<div class="w-full p-6 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
					<?php if (empty($resultadoBusqueda)) : ?>
						<p class="mb-2 text-2xl  tracking-tight text-gray-900 dark:text-white">
							No se encontraron papeletas pendientes de pago de la placa <span class="font-semibold"><?php echo $busqueda; ?></span>.
						</p>
					<?php else : ?>
						<h5 class="mb-2 text-2xl font-semibold tracking-tight text-gray-900 dark:text-white">
							Resultados para 
							<span class="font-semibold"><?php echo $busqueda; ?></span>
						</h5>

						<div class="overflow-x-auto">
							<table class="w-full mt-8 rounded text-sm text-left text-gray-500">
								<thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
									<tr>
										<th scope="col" class="px-6 py-3">
											Conductor
										</th>
										<th scope="col" class="px-6 py-3">
											Tarjeta de Propiedad
										</th>
										<th scope="col" class="px-6 py-3">
											Serie de Papeleta
										</th>
										<th scope="col" class="px-6 py-3">
											Fecha de Emisi&oacute;n
										</th>

										<th scope="col" class="px-6 py-3">
											C&oacute;digo de Infracci&oacute;n
										</th>
										<th scope="col" class="px-6 py-3">
											Infracci&oacute;n
										</th>
										<th scope="col" class="px-6 py-3">
											Monto
										</th>
										<th scope="col" class="px-6 py-3">
											Estado
										</th>
									</tr>
								</thead>
								<tbody>
									<?php foreach ($resultadoBusqueda as $papeleta) : ?>
										<tr class=" bg-white border-b dark:bg-gray-800 dark:border-gray-700">
											<th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-normal overflow-ellipsis dark:text-white">
												<?php echo $papeleta['conductor']; ?>
											</th>
											<td class="px-6 py-4 dark:text-white">
												<?php echo $papeleta['tarjetaPropiedad']; ?>
											</td>
											<td class="px-6 py-4 dark:text-white">
												<?php echo $papeleta['serie']; ?>
											</td>
											<td class="px-6 py-4 dark:text-white">
												<?php echo $papeleta['fechaEmisionFormateada']; ?>
											</td>
											<td class="px-6 py-4 dark:text-white">
												<?php echo $papeleta['codigoInfraccion']; ?>
											</td>
											<td class="px-6 py-4 dark:text-white">
												<?php echo $papeleta['infraccion']; ?>
											</td>
											<td class="px-6 py-4 dark:text-white">
												<?php echo $papeleta['monto']; ?>
											</td>
											<td class="px-6 py-4 dark:text-white">
												<?php echo $papeleta['estado']; ?>
											</td>
										</tr>
									<?php endforeach; ?>
								</tbody>
							</table>
						</div>
					<?php endif; ?>

				</div>

			</div>
		<?php endif; ?>

	</div>
</body>

</html>