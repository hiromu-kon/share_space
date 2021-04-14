
window.onload = function() {
  var curtainElements = document.getElementsByClassName('curtain');
  [].forEach.call(curtainElements, function(elem) {
      elem.classList.add('active');
  })
};
