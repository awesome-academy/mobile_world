// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require bootstrap-sprockets
//= require jquery.raty
//= require ratyrate
//= require rails-ujs
//= require simpleCart.min
//= require memenu
//= require jquery.easydropdown
//= require responsiveslides.min
//= require imagezoom
//= require layout
//= require jquery.flexslider
//= require popper.min
//= require header-search
//= require orders
//= require i18n
//= require i18n.js
//= require i18n/translations
//= require ckeditor/init
//= require comment
//= require jquery.infinite-pages
//= require comment-form
//= require advertisement
//= require shop
//= require jquery.countdown.min
//= require sale_time
//= require back-to-top
//= require rating
//= require social-share-button

function getCookie(cname) {
  var name = cname + '=';
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i <ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ') {
          c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
          return c.substring(name.length, c.length);
      }
  }
  return '';
}
