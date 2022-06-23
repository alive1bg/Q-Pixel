$(function () {


    window.addEventListener('message', function(event) {
        var data = event.data;
        if (event.data.type == "open") {
            $("#container").fadeIn(250);
            code = event.data.code
        }

        // if (event.data.type == "closeui") {
        //     $("#container").hide(250);
        // }
        
    })



    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://vny-lvaultcodes/exit', JSON.stringify({}));
            $("#container").fadeOut(250);
            return
           
        }
    };
    $("#close").click(function () {
        $.post('http://vny-lvaultcodes/exit', JSON.stringify({}));
        $("#container").fadeOut(250);
        return

        
    })
    $("#submit").click(function () {
        let inputValue = $("#input").val()
        if (inputValue.length > 4) {
            $.post("http://vny-lvaultcodes/error", JSON.stringify({
                error: "Code cannot be greater than 4"
            }))
            $("#container").fadeOut(250);
            return
        } else if (!inputValue) {
            $.post("http://vny-lvaultcodes/error", JSON.stringify({
                error: "You need to type a 4 digit code for submitting."
            }))
            $("#container").fadeOut(250);
            return
        }
        if(inputValue == code){
            $.post('http://vny-lvaultcodes/main', JSON.stringify({text: inputValue,}));
            $("#container").fadeOut(250);
        } else {
            $.post('http://vny-lvaultcodes/failed', JSON.stringify({}));
            $("#container").fadeOut(250);


        }


        

        
        return;
    })
})
