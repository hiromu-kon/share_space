// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// ヘッダー追従イベント
window.addEventListener("scroll", function () {
  var header = document.querySelector("header");
  header.classList.toggle("hidden", window.scrollY > 0);
});

// トップへ戻るボタンのイベント
document.addEventListener("turbolinks:load", function () {
  const PageTopBtn = document.getElementById('js_button');
  PageTopBtn.addEventListener('click', () =>{
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  });
});

// 下から要素フェードイン
window.addEventListener("scroll", function () {
  let scrollAnimationElm = document.querySelectorAll('.fade_in');
  let scrollAnimationFunc = function(){
    for(let i = 0; i < scrollAnimationElm.length; i++){
      let triggerMargin = 200;
      if(window.innerHeight > scrollAnimationElm[i].getBoundingClientRect().top + triggerMargin){
        scrollAnimationElm[i].classList.add('show'); //getBoundingClientRectは要素の高さを取得
      }
    }
  }
  window.addEventListener('load', scrollAnimationFunc);
  window.addEventListener('scroll', scrollAnimationFunc);
});


// ファイル選択時画像プレビュー
document.addEventListener("turbolinks:load", function () {
  window.imgPreView = function imgPreView(event, targetId){
    var file = event.target.files[0];
    var reader = new FileReader();
    var preview = document.getElementById(targetId);
    var previewImage = document.getElementById("previewImage-"+targetId);

    if(previewImage != null)
    preview.removeChild(previewImage);
    reader.onload = function(event) {
      var img = document.createElement("img");
      img.setAttribute("src", reader.result);
      img.setAttribute("id", "previewImage-"+targetId);
      preview.appendChild(img);
    };
    reader.readAsDataURL(file);
  }
});
