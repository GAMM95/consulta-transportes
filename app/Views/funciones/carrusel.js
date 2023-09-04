document.addEventListener("DOMContentLoaded", function () {
  // Obtén referencias a los elementos HTML
  const carousel = document.querySelector('.carousel');
  // Array con las rutas de las imágenes
  const images = ['./public/assets/fondo.png', './public/assets/home.jpg'];
  let currentIndex = 0;

  // Función para mostrar la imagen actual
  function showImage() {
    carousel.innerHTML = `<img src="${images[currentIndex]}" alt="Imagen ${currentIndex + 1}">`;
  }

  // Función para mostrar la siguiente imagen
  function showNextImage() {
    currentIndex = (currentIndex + 1) % images.length;
    showImage();
  }

  // Intervalo para cambiar automáticamente la imagen cada 5 segundos (ajusta según tus necesidades)
  const interval = setInterval(showNextImage, 5000);

  // Mostrar la primera imagen al cargar la página
  showImage();
});
