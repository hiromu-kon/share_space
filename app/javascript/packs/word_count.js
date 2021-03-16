// 文字数カウント
window.StringCount = function StringCount(countTarget, resultTarget) {
  var len = document.getElementById(countTarget).value.length;
  document.getElementById(resultTarget).innerText = len + "文字";
}
