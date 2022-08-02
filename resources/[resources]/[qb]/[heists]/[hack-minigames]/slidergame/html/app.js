$(document).ready(function(){
    $(".container").hide()
})

SlderGame = {}

$(document).ready(function(){

    SlderGame.Start = function(){
        $(".container").show()
    }

window.addEventListener('message', function(event){
    var action = event.data.action;
    switch(action) {
        case "openslider":
            SlderGame.Start();
            break;
        case "hide":
            $(".container").hide()
        }
    });
})

$(`#submit`).click(() => {
    const returnData = [];

    for (var i = 1; i <= 3; i++) {
        var data = document.getElementById('slider'+i)
        returnData.push(data.value);
        document.getElementById('slider'+i).value = 1
    }
    PostData(returnData)
    $(".container").hide()
})

const PostData = (data) => {
    return $.post(`https://slidergame/dataPost`, JSON.stringify(data))
}