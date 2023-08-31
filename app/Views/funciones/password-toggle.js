/**
 * Password Toggle Script
 *
 * Este script maneja la funcionalidad de mostrar y ocultar contraseñas en un campo de entrada de contraseña.
 * Cuando se hace clic en un icono, cambia el tipo de entrada entre "password" y "text" para revelar u ocultar la contraseña.
 * El icono también se actualiza para indicar si la contraseña está visible u oculta.
 */

// Obtener referencia al campo de entrada de contraseña y al icono de alternar
const passwordInput = document.getElementById("password");
const togglePassword = document.getElementById("togglePassword");

// Variable para rastrear si la contraseña está visible u oculta
let passwordVisible = false;

// Agregar un event listener para el clic en el icono de alternar
togglePassword.addEventListener("click", () => {
  // Cambiar el tipo de entrada entre "password" y "text"
  if (passwordVisible) {
    passwordInput.type = "password";
    togglePassword.innerHTML = "<i class='bx bx-show icon'></i>";
  } else {
    passwordInput.type = "text";
    togglePassword.innerHTML = "<i class='bx bx-hide icon'></i>";
  }

  // Cambiar el estado de la variable passwordVisible
  passwordVisible = !passwordVisible;
});
