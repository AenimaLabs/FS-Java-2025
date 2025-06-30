// main.js

$(document).ready(function () {
  // Ejemplo de efecto al hacer clic en una tarjeta
  $(".card").click(function () {
    $(this).toggleClass("border-primary");
  });

  // Validación del formulario
  $("#form-contacto").on("submit", function (e) {
    const email = $("#email").val();
    const regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!regexEmail.test(email)) {
      e.preventDefault();
      alert("Por favor, ingresa un correo válido.");
    }
  });
});

function mostrarResultado() {
  const respuesta = document.getElementById("pregunta1").value;
  if (respuesta === "correcta") {
    alert("¡Correcto! Usar un gestor de contraseñas es seguro.");
  } else {
    alert("Incorrecto. Usa siempre un gestor de contraseñas.");
  }
}