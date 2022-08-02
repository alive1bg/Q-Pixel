window.addEventListener('message',function(event){
    const listener = event.data;
    var source = listener.source
    var app = listener.app
    var showapp = listener.show
    var appdata = listener.data
    switch (app) {
        case "status-hud":
            if (appdata.show == true) {
                $(".status-title").html("");
                $(".status-values").html("");
                if (appdata.title) {
                    $(".status-title").append("<h3>"+appdata.title+"</h3>");
                }
                var counttime = false;
                var timecount = 0;
                if (appdata.values) {
                    for (const key in appdata.values) {
                        if (appdata.values[key].text) {
                            $(".status-values").append("<span>"+appdata.values[key].text+"</span><br>");
                        }else if(appdata.values[key].seconds){
                            var minute = Math.floor(appdata.values[key].seconds / 60);
                            var seconds = appdata.values[key].seconds - minute * 60;
                            var stringtime = minute+":"+seconds
                            counttime = true
                            timecount = appdata.values[key].seconds
                            $(".status-values").append("<span id='timecounthdown'>"+stringtime+"</span><br>");
                        }else{
                            $(".status-values").append("<span>"+appdata.values[key]+"</span><br>");
                        }
                    }

                    if (counttime && timecount > 0) {
                        clearInterval(countdownstatushud);
                        countdownstatushud = setInterval(function(){
                            if(timecount <= 0){
                                clearInterval(countdownstatushud);
                                $("#timecounthdown").html("59:59");
                            } else {
                                var minute2 = Math.floor(timecount / 60);
                                var seconds2 = timecount - minute2 * 60;
                                var stringtime2 = minute2+":"+seconds2
                                $("#timecounthdown").html(stringtime2)
                            }
                            timecount -= 1;
                        }, 1000);
                    }
                }
                $("#containerStatusHud").show();
            }else{
                $(".status-title").html("");
                $(".status-values").html("");
                $("#containerStatusHud").hide();
            }
            break;
        default:
            break;
    }
})