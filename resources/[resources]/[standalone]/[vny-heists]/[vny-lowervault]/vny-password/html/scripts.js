window.addEventListener('message', function(event) {
  var data = event.data;

  if (event.data.type == "open") {
    $("#container").fadeIn(100);
    $('#first-secreen').css('display','flex');

      var randomNumber = 1;

      if (event.data.number == 4) {
        randomNumber = Math.floor(Math.random() * 10000);
      } else if (event.data.number == 5) {
        randomNumber = Math.floor(Math.random() * 100000);
      } else if (event.data.number == 6) {
        randomNumber = Math.floor(Math.random() * 1000000);
      } else if (event.data.number == 7) {
        randomNumber = Math.floor(Math.random() * 10000000);
      } else if (event.data.number == 8) {
        randomNumber = Math.floor(Math.random() * 100000000);
      } else if (event.data.number == 9) {
        randomNumber = Math.floor(Math.random() * 1000000000);
      } else if (event.data.number == 10) {
        randomNumber = Math.floor(Math.random() * 10000000000);
      }
      $('#passaword').val(randomNumber);
    
      setTimeout(function(){
        $('#first-secreen').css('display','none');
        $('#second-secreen').css('display','flex');
    
        setTimeout(function(){
          $('#second-secreen').css('display','none');
          $('#third-secreen').css('display','flex');
    
          setTimeout(function(){
            $('#third-secreen').css('display','none');
            var val1 = $('#enter-passaword').val();
            var val2 = $('#passaword').val();
    
            if ( val1 == val2 ) {
              $('#complete-secreen').css('display','flex')

              $.post('http://vny-password/successful', JSON.stringify({}))
      
              setTimeout(function(){
                $('#complete-secreen').css('display','none')
                $('#container').css('display','none')
                $('#enter-passaword').val('');
              }, 2000);
      
            } else {
              $('#failed-secreen').css('display','flex')

              $.post('http://vny-password/failed', JSON.stringify({})) //if you failed
              setTimeout(function(){
                $('#failed-secreen').css('display','none')
                $('#container').css('display','none')
                $('#enter-passaword').val('');
    
              }, 2000);
            }
    
          }, event.data.time1);
    
        }, event.data.time2);
    
      }, 2000);
    
    
  }

  if (event.data.type == "hide") {
    $("#container").fadeOut(100);
  }
});

$(function(){
  $('#enter-passaword').keyup(function(event){
    var val1 = $(this).val();
    var val2 = $('#passaword').val();

    if (event.keyCode === 13) {
      if ( val1 == val2 ) {
        $('#third-secreen').css('display','none')
        $('#complete-secreen').css('display','flex')

        setTimeout(function(){
          $('#complete-secreen').css('display','none')
          $('#container').css('display','none')
          $('#enter-passaword').val('');

          $.post('http://vny-password/alahvarknk', JSON.stringify({})) //if you completed
        }, 3000);

      }
    }
  });
});

$('body').bind('copy paste',function(e) {
  e.preventDefault(); return false; 
});