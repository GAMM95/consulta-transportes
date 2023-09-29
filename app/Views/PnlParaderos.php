<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Enlaces a las hojas de estilo -->
  <link rel="stylesheet" href="./public/styles/appMenu.css">
  <link rel="stylesheet" href="./public/styles/partials/body.css">
  <!-- <link rel="stylesheet" href="./public/styles/partials/header.css"> -->
  <link rel="stylesheet" href="./public/styles/paraderos.css">

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

    <!-- ... Contenido principal de la página ... -->
    <div class="paraderos_content mb-3">
      <form action="paraderos.php" method="GET" class="form">
        <div class="input flex">
          <input type="text" id="busqueda" name="busqueda" placeholder="Placa del vehículo" required focus>
          <button type="submit" class='btn btn-form  flex'>Buscar</button>
        </div>
      </form>
    </div>

    <?php if (!empty($busqueda)) : ?>

      <div class="w-full p-4 relative overflow-x-auto">
        <div class="w-full p-6 bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700">
          <?php if (empty($resultadoBusqueda)) : ?>
            <p class="mb-2 text-2xl  tracking-tight text-gray-900 dark:text-white">
              No se hallaron resultados para la placa <span class="font-semibold"><?php echo $busqueda; ?></span>.
            </p>
          <?php else : ?>
            <h5 class="mb-2 text-2xl font-semibold tracking-tight text-gray-900 dark:text-white">Resultados</h5>

            <div class="overflow-x-auto">
              <table class="w-full mt-8 rounded text-sm text-left text-gray-500">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                  <tr>
                    <th scope="col" class="px-6 py-3">
                      Conductor
                    </th>
                    <th scope="col" class="px-6 py-3">
                      Asociación
                    </th>
                    <th scope="col" class="px-6 py-3">
                      Dirección
                    </th>
                    <th scope="col" class="px-6 py-3">
                      Colores
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($resultadoBusqueda as $paraderos) : ?>
                    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                      <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        <?php echo $paraderos['Conductor']; ?>
                      </th>
                      <td class="px-6 py-4 dark:text-white">
                        <?php echo $paraderos['asociacion']; ?>
                      </td>
                      <td class="px-6 py-4 dark:text-white">
                        <?php echo $paraderos['ASO_direccion']; ?>
                      </td>
                      <td class="px-6 py-4 dark:text-white">
                        <?php echo $paraderos['colores']; ?>
                      </td>
                    </tr>
                  <?php endforeach; ?>
                </tbody>
              </table>
            </div>
          <?php endif; ?>

        </div>

      </div>
    <?php else : ?>
    <?php endif; ?>
  </div>
</body>

</html>