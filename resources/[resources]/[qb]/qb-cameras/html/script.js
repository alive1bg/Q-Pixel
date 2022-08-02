

const CameraApp = new Vue({
    el: "#camcontainer",

    data: {
        camerasOpen: false,
        cameraLabel: ":)",
        connectLabel: "CONNECTED",
        ipLabel: "192.168.0.1",
        dateLabel: "04/09/1999",
        timeLabel: "16:27:49",
    },

    methods: {
        OpenCameras(label, connected, cameraId, time) {
            var today = new Date();
            var date = today.getDate()+'/'+(today.getMonth()+1)+'/'+today.getFullYear();
            var formatTime = "00:" + time

            this.camerasOpen = true;
            this.ipLabel = "20.01.061."+cameraId;
            if (connected) {
                $("#blockscreen").css("display", "none");
                this.cameraLabel = label;
                this.connectLabel = "CONNECTED";
                this.dateLabel = date;
                this.timeLabel = formatTime;

                $("#connectedlabel").removeClass("disconnect");
                $("#connectedlabel").addClass("connect");
            } else {
                $("#blockscreen").css("display", "block");
                this.cameraLabel = "ERROR #400: BAD REQUEST"
                this.connectLabel = "CONNECTION FAILED";
                this.dateLabel = "ERROR";
                this.timeLabel = "ERROR";

                $("#connectedlabel").removeClass("connect");
                $("#connectedlabel").addClass("disconnect");
            }
            
        },

        CloseCameras() {
            this.camerasOpen = false;
            $("#blockscreen").css("display", "none");
        },

        UpdateCameraLabel(label) {
            this.cameraLabel = label;
        },

        UpdateCameraTime(time) {
            var formatTime = "00:" + time
            this.timeLabel = formatTime;
        },
    }
});

document.onreadystatechange = () => {
    if (document.readyState === "complete") {
        window.addEventListener('message', function(event) {

            if (event.data.type == "enablecam") {
                CameraApp.OpenCameras(event.data.label, event.data.connected, event.data.id, event.data.time);
            } else if (event.data.type == "disablecam") {
                CameraApp.CloseCameras();
            } else if (event.data.type == "updatecam") {
                CameraApp.UpdateCameraLabel(event.data.label);
            } else if (event.data.type == "updatecamtime") {
                CameraApp.UpdateCameraTime(event.data.time);
            }

            var data = event.data;
            if (data.type === "ui") {
                if (data.status == true) {
                    var parentChats = $('#maincontent')
                    $(parentChats).html("");
                    $("#list").fadeIn(250);
                    setupCameras(data.cameras);
                } else {
                    $("#list").fadeOut(250);
                }
            }
        });
    };
};

$(document).on('click', 'a', function(evt){
    evt.preventDefault(); //dont do default anchor stuff 
    var camID = parseInt(this.id) + 1
       $.post('https://qb-cameras/OpenCamera', JSON.stringify({
          camid : camID,
       }));
       $("#list").fadeOut(250);
       $.post('https://qb-cameras/UIClosed', JSON.stringify({}));
}); 

function setupCameras(groups) {
    var parentGroups = $('#maincontent')
    $(parentGroups).html("");
 
    $.each(groups, function(index, data){
       $(parentGroups).append("<tr><td data-title='"+data.label+"'>"+data.label+"</td><td data-title='type'>"+data.type+"</td><td class='select'><a class='button' href = '#' id = '"+index+"'>Watch</a></td></tr>")
    });
 
    // $(parentGroups).append('<div class="contact" data-name="newGroup"> <div class="pic" id = "newGroup"></div><div class="name"> <b>NEW GROUP</b> </div> <div class="message"> Create a New Group </div> </div>')
    // $('#newGroup').css('background-image', 'url("plus.png")');
}

{/* <tr>
        <td data-title='Provider Name'>
          Iacob Geaorgescu
        </td>
        <td data-title='E-mail'>
          e-mail@test-email.com
        </td>
        <td class='select'>
          <a class='button' href='#'>
            Select
          </a>
        </td>
      </tr> */}

$(document).on('keydown', function() {
    switch(event.keyCode) {
        case 27: // ESC
        $("#list").fadeOut(250);
        $.post('https://qb-cameras/UIClosed', JSON.stringify({}));
        break;
    }
});
