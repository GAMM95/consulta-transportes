// Espera a que el DOM esté completamente cargado antes de ejecutar el código
document.addEventListener('DOMContentLoaded', function () {
  // Obtén todos los elementos con la clase 'navbar-burger' (botón para abrir el menú)
  const burger = document.querySelectorAll('.navbar-burger');
  // Obtén todos los elementos con la clase 'navbar-menu' (el menú desplegable)
  const menu = document.querySelectorAll('.navbar-menu');

  // Verifica si hay botones de hamburguesa y menús en la página
  if (burger.length && menu.length) {
    // Itera sobre todos los botones de hamburguesa
    for (var i = 0; i < burger.length; i++) {
      // Agrega un event listener para el clic en el botón de hamburguesa
      burger[i].addEventListener('click', function () {
        // Itera sobre todos los menús
        for (var j = 0; j < menu.length; j++) {
          // Alterna la visibilidad de los menús al hacer clic en el botón de hamburguesa
          menu[j].classList.toggle('hidden');
        }
      });
    }
  }

  // Obtén todos los elementos con la clase 'navbar-close' (botón para cerrar el menú)
  const close = document.querySelectorAll('.navbar-close');
  // Obtén todos los elementos con la clase 'navbar-backdrop' (fondo del menú desplegable)
  const backdrop = document.querySelectorAll('.navbar-backdrop');

  // Verifica si hay botones de cierre en la página
  if (close.length) {
    // Itera sobre todos los botones de cierre
    for (var i = 0; i < close.length; i++) {
      // Agrega un event listener para el clic en el botón de cierre
      close[i].addEventListener('click', function () {
        // Itera sobre todos los menús
        for (var j = 0; j < menu.length; j++) {
          // Alterna la visibilidad de los menús al hacer clic en el botón de cierre
          menu[j].classList.toggle('hidden');
        }
      });
    }
  }

  // Verifica si hay elementos de fondo del menú desplegable en la página
  if (backdrop.length) {
    // Itera sobre todos los elementos de fondo del menú desplegable
    for (var i = 0; i < backdrop.length; i++) {
      // Agrega un event listener para el clic en el fondo del menú desplegable
      backdrop[i].addEventListener('click', function () {
        // Itera sobre todos los menús
        for (var j = 0; j < menu.length; j++) {
          // Alterna la visibilidad de los menús al hacer clic en el fondo del menú desplegable
          menu[j].classList.toggle('hidden');
        }
      });
    }
  }
});
