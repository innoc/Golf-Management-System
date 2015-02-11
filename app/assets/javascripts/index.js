$(document).ready(function() {
  $('.main-container__index-menu--signin').click(function(){ 
     $('#hidden__field--register').hide();
     $('#hidden__field--signin').show();
  });
  $('.main-container__index-menu--register').click(function(){ 
     $('#hidden__field--register').show();
     $('#hidden__field--signin').hide();
  });
});