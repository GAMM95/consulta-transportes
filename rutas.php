// routes.php
<?php
// Ruta para mostrar el formulario de búsqueda de paraderos
Route::get('/buscar-paraderos', 'ParaderoController@mostrarFormularioBusqueda');

// Ruta para procesar la búsqueda de paraderos
Route::post('/buscar-paraderos', 'ParaderoController@buscarParaderos');
