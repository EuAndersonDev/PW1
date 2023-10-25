document.addEventListener('DOMContentLoaded', function () {
    const mobileMenuButton = document.getElementById('mobile-menu');
    const navList = document.querySelector('.nav-list');
  
    mobileMenuButton.addEventListener('click', function () {
      navList.classList.toggle('show');
    });
  
    window.addEventListener('resize', function () {
      if (window.innerWidth > 768) {
        navList.
       
  classList.remove('show');
      }
    });
  });
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  document.addEventListener('DOMContentLoaded', function () {
    // Inicializa o carrossel com autoplay
    var myCarousel = new bootstrap.Carousel(document.getElementById('carouselExampleAutoplaying'), {
      interval: 3000, // Tempo em milissegundos entre os slides (ajuste conforme necessário)
      wrap: true, // O carrossel reinicia automaticamente no final
      pause: 'hover' // Pausa a reprodução automática ao passar o mouse
    });
  });





  