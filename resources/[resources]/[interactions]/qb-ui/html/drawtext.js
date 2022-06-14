window.addEventListener('message', function(event) {
    if (event.data.type == "open") {
        
        var color = '#2196f3'
        if(event.data.color == 'error') {
            color = '#f44336'
        } else if(event.data.color == 'info' || event.data.color == null ) {
            color = '#2196f3'
        } else if(event.data.color == 'success') {
            color = '#2c9e4d'
        } else if(event.data.color == 'classic') {
            color = '#30475e'
        }                     

        $("#container").show().removeClass("slide-out").addClass("container")
        $("#text").css('background-color' , color)
        $("#text").html(event.data.text)
    } else if (event.data.type == "close") {
        $("#container").removeClass("container").addClass("slide-out")
    } else {
        $("#container").hide()
    }
});