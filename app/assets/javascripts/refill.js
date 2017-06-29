$(document).on('turbolinks:load', function() {

  $('#overlitersField').hide();
  $("[name='overfill']").change( function() {  
    if (this.checked) {
      $('#overlitersField').show();
    } else {
      $('#overlitersField').hide();
    }
  })

})
