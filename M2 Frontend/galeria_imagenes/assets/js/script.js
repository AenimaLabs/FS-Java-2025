$(document).ready(function () {
  const images = [
    
    "assets/img/Espectro 4.jpg",
    "assets/img/Espectro 5.jpg",
    "assets/img/Espectro 6.jpg",
    "assets/img/Espectro 8.jpg",
    "assets/img/Espectro 10.jpg"];
    


  let currentIndex = 0;


 // Abrir modal con la imagen correcta
  $('.gallery-img').on('click', function () {
    currentIndex = parseInt($(this).attr('data-index'), 10); // Usamos data-index
    $('#modalImage').attr('src', images[currentIndex]);
    $('#imageModal').modal('show');
  });

  // Navegar a siguiente imagen
  $('#nextBtn').on('click', function () {
    currentIndex = (currentIndex + 1) % images.length;
    $('#modalImage').fadeOut(200, function () {
      $(this).attr('src', images[currentIndex]).fadeIn(200);
    });
  });

  // Navegar a imagen anterior
  $('#prevBtn').on('click', function () {
    currentIndex = (currentIndex - 1 + images.length) % images.length;
    $('#modalImage').fadeOut(200, function () {
      $(this).attr('src', images[currentIndex]).fadeIn(200);
    });
  });

  // Limpiar imagen al cerrar el modal
  $('#imageModal').on('hidden.bs.modal', function () {
    $('#modalImage').attr('src', '');
  });
});