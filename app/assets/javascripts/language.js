$(document).ready(function() {
  $('.locale').on('change', function() {
    var selected = $('.selected')[0].outerText;
    if(selected == "ENGLISH" || selected == "TIẾNG ANH") {
      document.cookie = "locale=en; expires=; path=/";
      location.reload();
    } else {
      document.cookie = "locale=vi; expires=; path=/";
      location.reload();
    }
  })
});
