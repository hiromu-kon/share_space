document.addEventListener("turbolinks:load", function () {
  var mySwiper = new Swiper('.swiper-container', {
    effect: 'coverflow',
    loop: true,
    speed: 2000,
    autoplay: {
      delay: 3000,
      stopOnLastSlide: false,
      disableOnInteraction: false,
      reverseDirection: false
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev'
    },
    pagination: {
      el: '.swiper-pagination',
      type: 'bullets',
      clickable: true
    }
  });
});
