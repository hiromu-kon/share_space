document.addEventListener('DOMContentLoaded', function(){
  const Mymenu = document.querySelector('.mymenu');
  const Nav = document.querySelector('.my_menu_nav');

  if(Mymenu != null) {
    Mymenu.addEventListener('click', () =>{
      Nav.classList.toggle('open-menu')
    });
  }

  const Searchmenu = document.querySelector('.post_index_menu');
  const Searchnav = document.querySelector('.search_menu_nav');

  if(Searchmenu != null) {
    Searchmenu.addEventListener('click', () =>{
      Searchnav.classList.toggle('search-menu')
      Searchmenu.classList.toggle('angle_down')
    });
  }
});
