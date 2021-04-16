document.addEventListener('DOMContentLoaded', function(){
function toggleNav() {
    var body = document.body;
    var hamburger = document.getElementById('js-hamburger');
    var blackBg = document.getElementById('js-black-bg');

    if(hamburger != null) {
      hamburger.addEventListener('click', function() {
        body.classList.toggle('nav-open');
      });
    }

    if(blackBg != null) {
      blackBg.addEventListener('click', function() {
        body.classList.remove('nav-open');
      });
    }
  }
  toggleNav();
}, false);