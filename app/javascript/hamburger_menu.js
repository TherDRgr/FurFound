document.addEventListener('DOMContentLoaded', function() {
    var toggler = document.querySelector('.navbar-toggler');
    var collapseMenu = document.querySelector('#navbarNav');
  
    if (toggler && collapseMenu) {
      toggler.addEventListener('click', function() {
        collapseMenu.classList.toggle('show');
      });
    }
  });
  