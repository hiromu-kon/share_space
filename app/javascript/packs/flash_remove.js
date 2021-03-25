document.addEventListener('DOMContentLoaded', function() {
  var alert = document.getElementById('alert');
  var notice = document.getElementById('notice');
  alert_remove = function(){
    if(alert != null){
    alert.remove()
    }
  }
  notice_remove = function(){
    if(notice != null){
    notice.remove()
    }
  }
  setTimeout(alert_remove,3000);
  setTimeout(notice_remove,3000);
})
