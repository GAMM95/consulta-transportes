// password-toggle.js
const passwordInput = document.getElementById("password");
const togglePassword = document.getElementById("togglePassword");
let passwordVisible = false;

togglePassword.addEventListener("click", () => {
  if (passwordVisible) {
    passwordInput.type = "password";
    togglePassword.innerHTML = "<i class='bx bx-show'></i>";
  } else {
    passwordInput.type = "text";
    togglePassword.innerHTML = "<i class='bx bx-hide'></i>";
  }
  passwordVisible = !passwordVisible;
});
