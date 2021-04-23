document.addEventListener('DOMContentLoaded', function() {

  var markerText = document.querySelectorAll('.js-marker, .faderight'); // 監視対象を選択
  var markerTextArr = Array.prototype.slice.call(markerText); // 監視対象をArrayに変換（IE対策）

  /* IntersectionObserverに渡すコールバック関数 */
  var cb = function(entries, observer) {
    entries.forEach((entry) => {

      if(entry.isIntersecting) {
        /* 監視対象が画面内に入ったときのアクション */
        entry.target.classList.add('inview'); // 画面内に入った要素にinviewクラスを付与
      } else {
        entry.target.classList.remove('inview'); // 画面外に出た要素のinviewクラスを外す
      }

    });
  }

  /* IntersectionObserverに渡すコールバック関数 */
  var options = {
    rootMargin: "-50px 0px"
  }

  /* IntersectionObserver初期化 */
  var io = new IntersectionObserver(cb, options);
  io.POLL_INTERVAL = 100; // Polyfillの設定

  markerTextArr.forEach(el => {
    io.observe(el);
  });

});
