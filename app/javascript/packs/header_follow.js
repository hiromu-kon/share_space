// ヘッダー追従イベント
window.addEventListener("scroll", function () {
  var header = document.querySelector("header");
  header.classList.toggle("hidden", window.scrollY > 0);
});
