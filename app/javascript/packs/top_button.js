// トップへ戻るボタンのイベント
document.addEventListener("DOMContentLoaded", function(){
  const PageTopBtn = document.getElementById('js_button');
  PageTopBtn.addEventListener('click', () =>{
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  });
}, false);
