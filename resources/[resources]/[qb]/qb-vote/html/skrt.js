$( document ).ready(function() {

    $(".adaylar").html("")
    $(".arkaplan").css("display", "none");

    closeVoteScreen = function() {
        $(".adaylar").html("")
        $(".arkaplan").addClass("slide-out");
        setTimeout(function() {
            $(".arkaplan").css("display", "none");
            $(".arkaplan").removeClass("slide-out");
        }, 500);
        $.post('http://qb-vote/closeVoteScreen')
    }

    // closeVoteScreen();
    var voted = false;
    var checked;

    var adaylar = [];
    var count = $(".adaylar").children().length;

    var i = 1;

    while (i < count + 1) {
        adaylar[i] = i;
        i++;
    }

    vote = function($id){

        if(!voted){
            $(".yesil").css("display", "block").animate({opacity: "1"}, 200);
        }

        voted = true;
        
        $(".aday" + $id).click(function(e){
            if(e.target.id=="childDiv"){

              var count = $(".adaylar").children().length;  
              var i = 1;
          
              while (i < count + 1) {
                  adaylar[i] = i;
                  i++;
              }

              adaylar.forEach(tiksil);

              function tiksil(item) {
                $(".aday" + item).children('.voteCircle').css("background-image", "none");
              } 

              $(this).children('.voteCircle').css("background-image", "url('images/yes.png')");
              $(this).children('.voteCircle').css("background-repeat", "no-repeat");
              $(this).children('.voteCircle').css("background-size", "60px 60px");
              $(this).children('.voteCircle').css("background-position-x", "center");
              $(this).children('.voteCircle').css("background-position-y", "center");
              
              checked = $id;
            }
        });
    }

    $(".yesil").click(function(){
        submitvote(checked);
    });

    $(document).on('keydown', function(event) {
        switch(event.keyCode) {
            case 27:
               closeVoteScreen();
                break;
        }
    });

    
    
    submitvote = function(index) {

        $.post('http://qb-vote/postVote', JSON.stringify({
            vote: index
        }));
        closeVoteScreen()
    }

    window.addEventListener("message", function(event){
        $(".arkaplan").css("display", "none");
        if(event.data.open == true)
        {
            $(".adaylar").html("")
            var candidates = event.data.candidates
      
             $.each(candidates, function(index, element){
                var index2 = "'" + index + "'"
                html = ""
                html +=    "<div class='aday" + index2.replace(/'/g, "") + "'>"
                html +=    '    <p class="aday2yaz">' + element.name + '</p>'
                html +=    '    <p class="aday3alt">' + element.partyName + '</p>'
                html +=    '    <i id="adayicon" class="fas fa-user"></i>'
                html +=    '    <a onClick="vote(' + index2.replace(/'/g, "") + ')" id="childDiv" class="voteCircle" style="float:right;"></a>'
                html +=    '</div>'
                $(".adaylar").append(html)
            });
            $(".arkaplan").css("display", "block");
        }
        else if(event.data.open == false) 
        {
            $(".adaylar").html("")
            $(".arkaplan").css("display", "none");
        }
    })

});




