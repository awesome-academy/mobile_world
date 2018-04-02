$(document).ready(function() {
  remove_compares_item = function(link){
    $.ajax({
      method: 'DELETE',
      url: '/compares/' + link.id
    }).done(function(data){
      $('.mobile-compares-'+ data.mobile_id).remove();
    }).error(function(){
      alert(I18n.t("flash.delete_item_error"));
    })
  }
});
