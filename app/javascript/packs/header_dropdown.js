document.addEventListener("DOMContentLoaded", function(){
  const Mymenu = document.querySelector('.mymenu');
  const Nav = document.querySelector('.my_menu_nav');

  if(Mymenu != null) {
    Mymenu.addEventListener('click', () =>{
      Nav.classList.toggle('open-menu')
    });
  }
}, false);
