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
