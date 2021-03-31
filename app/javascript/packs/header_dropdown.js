document.addEventListener("turbolinks:load", function () {
  const Mymenu = document.querySelector('.mymenu');
  const Nav = document.querySelector('.my_menu_nav');
  
  Mymenu.addEventListener('click', () =>{
    Nav.classList.toggle('open-menu')
  });
});
