document.addEventListener('DOMContentLoaded', function() {
  var alert = document.getElementById('alert');
  var notice = document.getElementById('notice');
  var danger = document.getElementById('danger');
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
  danger_remove = function(){
    if(danger != null){
    danger.remove()
    }
  }
  setTimeout(alert_remove,3000);
  setTimeout(notice_remove,3000);
  setTimeout(danger_remove,3000);
})
