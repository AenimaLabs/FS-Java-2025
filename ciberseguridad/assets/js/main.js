// main.js

$(document).ready(function () {
//   // Ejemplo de efecto al hacer clic en una tarjeta
//   $(".card").click(function () {
//     $(this).toggleClass("border-primary");
//   });

//   // Validación del formulario
//   $("#form-contacto").on("submit", function (e) {
//     const email = $("#email").val();
//     const regexEmail = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

//     if (!regexEmail.test(email)) {
//       e.preventDefault();
//       alert("Por favor, ingresa un correo válido.");
//     }
//   });

//   // Mostrar acordeón al hacer clic en el botón
 // Al hacer clic en el botón, mostrar el acordeón con efecto fade
    $('#mostrarAcordeon').on('click', function (e) {
      e.preventDefault(); // Evitar comportamiento por defecto del enlace
      $('#seccion-acordeon').fadeIn(500); // Mostrar acordeón
      $('html, body').animate({
        scrollTop: $('#seccion-acordeon').offset().top - 60
      }, 1000); // Scroll suave hacia el acordeón
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