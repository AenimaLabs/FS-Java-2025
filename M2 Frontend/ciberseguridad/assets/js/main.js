// main.js

$(document).ready(function () {


    // Mostrar acordeón al hacer clic en el botón
    // Al hacer clic en el botón, mostrar el acordeón con efecto fade
    $('#mostrarAcordeon').on('click', function (e) {
        e.preventDefault(); // Evitar comportamiento por defecto del enlace
        $('#seccion-acordeon').fadeIn(500); // Mostrar acordeón
        $('html, body').animate({
            scrollTop: $('#seccion-acordeon').offset().top - 60
        }, 1000); // Scroll suave hacia el acordeón
    });

    // Scroll suave al navbar al hacer clic en "Subir"
    //no se desplaza lo suficiente en la versión móvil, no sé por qué
    $('#subiralnav').on('click', function (e) {
        e.preventDefault();
        $('html, body').animate({
            scrollTop: $('#barra-nav').offset().top
        }, 1000);
    });
});

// Validación del formulario usando Bootstrap
(() => {
  'use strict';
  const form = document.getElementById('contactForm');
  form.addEventListener('submit', event => {
    if (!form.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();
    } else {
      alert("Formulario enviado correctamente.");
    }
    form.classList.add('was-validated');
  }, false);
})();

// Función del modal del test
function mostrarResultado() {
  const respuesta = document.getElementById("pregunta1").value;
  if (respuesta === "correcta") {
    alert("¡Correcto! Nunca debes compartir información sensible por correo.");
  } else {
    alert("Incorrecto. No debes responder ni hacer clic en enlaces sospechosos.");
  }
}