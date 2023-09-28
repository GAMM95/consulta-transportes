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
                    <?php echo $_SESSION['username']; ?>!
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
                                <span class="tituloBtn">Cerrar Sesión</span>
                            </a>
                        </button>

                    </div>

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

<script>
    // Burger menus
    document.addEventListener('DOMContentLoaded', function() {
        // open
        const burger = document.querySelectorAll('.navbar-burger');
        const menu = document.querySelectorAll('.navbar-menu');

        if (burger.length && menu.length) {
            for (var i = 0; i < burger.length; i++) {
                burger[i].addEventListener('click', function() {
                    for (var j = 0; j < menu.length; j++) {
                        menu[j].classList.toggle('hidden');
                    }
                });
            }
        }

        // close
        const close = document.querySelectorAll('.navbar-close');
        const backdrop = document.querySelectorAll('.navbar-backdrop');

        if (close.length) {
            for (var i = 0; i < close.length; i++) {
                close[i].addEventListener('click', function() {
                    for (var j = 0; j < menu.length; j++) {
                        menu[j].classList.toggle('hidden');
                    }
                });
            }
        }

        if (backdrop.length) {
            for (var i = 0; i < backdrop.length; i++) {
                backdrop[i].addEventListener('click', function() {
                    for (var j = 0; j < menu.length; j++) {
                        menu[j].classList.toggle('hidden');
                    }
                });
            }
        }
    });
</script>