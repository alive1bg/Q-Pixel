// MENU
let Buttons = [];
let Button = [];

// INPUT
let RowsData = [];
let Rows = [];
let saved = "";

// Sound
let audioPlayer = null;        

// MENU
const OpenMenu = (data) => {
    DrawMenuButtons(data)
}

const CloseMenu = () => {
    $(".button").remove();
    Buttons = [];
    Button = [];
};

const DrawMenuButtons = (data) => {    
    for (let i = 0; i < data.length; i++) {
        let context = data[i].context ? data[i].context : ""
        let element = $(`
            <div class="button" id=`+ i + `>
              <div class="inputheader" id=`+ i + `>` + data[i].header + `</div>
              <div class="txt" id=`+ i + `>` + context + `</div>
            </div>`
        );
        $('#buttons').append(element);
        Buttons[i] = element
        Button[i] = data[i]
    }
};

const PostMenuData = (id) => {
    $.post(`https://cn-ui/MenuDataPost`, JSON.stringify(Button[id]))
}

const CancelMenu = () => {
    $.post(`https://cn-ui/CancelMenu`)
}

// INPUT
const OpenInput = (data) => {
    $(`.main-input`).fadeIn(0)
    $(`.inputbackground`).fadeIn(0)
    SetInputHeader(data.header)
    AddInputRow(data.rows)
}

const SetInputHeader = (header) => {
    let element = $('<h1>' + header + '<h1>');
    $('.inputheader').append(element);
    saved = element
}

const CloseInput = () => {
    $(`.main-input`).fadeOut(0);
    $(`.inputbackground`).fadeOut(0);
    $(saved).remove();
    RowsData = [];
    Rows = [];
    saved = "";
};

const AddInputRow = (data) => {
    RowsData = data
    for (var i = 0; i < RowsData.length; i++) {
        var message = RowsData[i].txt
        var id = RowsData[i].id
        var element

        element = $('<label for="usr">' + message + '</label> <input type="text" class="form-control" id="' + id + '" />');
        $('.inputbody').append(element);
        Rows[id] = element
    }
    setTimeout(() => {
        document.getElementById(0).focus();
    }, 100);
};

const SubmitInputData = () => {
    const returnData = [];
    for (var i = 0; i < RowsData.length; i++) {
        var id = RowsData[i].id
        var data = document.getElementById(id)
        if (data.value) {
            returnData.push({
                _id: id,
                input: data.value,
            });
        } else {
            returnData.push({
                _id: id,
                input: null,
            });
        }
        $(Rows[id]).remove();
    }
    PostInputData({
        data : returnData
    })
    CloseInput();
}


const PostInputData = (data) => {
    return $.post(`https://cn-ui/InputDataPost`, JSON.stringify(data))
}

const CancelInput = () => {
    for (var i = 0; i < RowsData.length; i++) {
        var id = RowsData[i].id
        $(Rows[id]).remove();
    }
    $.post(`https://cn-ui/CancelInput`)
    return CloseInput();
}

// MENU & INPUT

$(`#submit`).click(() => {
    SubmitInputData();
})

$(document).click(function (event) {
    let $target = $(event.target);
    if ($target.closest('.button').length && $('.button').is(":visible")) {
        let id = event.target.id;
        if (!Button[id].event && !Button[id].returnValue) return;
        PostMenuData(id)
        document.getElementById('onimagehover').style.display = 'none';
    } else if (!$target.closest('.main-input').length && $('.main-input').is(":visible")) {
        CancelInput();
    }
})

window.addEventListener("keyup", (ev) => {
    if (ev.which == 27) {
        CancelMenu();
        document.getElementById('onimagehover').style.display = 'none';             
        CancelInput();   
    } else if (ev.which == 8) {         
        CancelMenu();
        document.getElementById('onimagehover').style.display = 'none';                     
    } else if (ev.which == 13) {
        SubmitInputData()
    }
})

window.addEventListener('mousemove', (event) => {
    let $target = $(event.target);
    if ($target.closest('.button:hover').length && $('.button').is(":visible")) {
        let id = event.target.id;
        if (!Button[id]) return
        if (Button[id].image) {
            document.getElementById('image').src = Button[id].image;
            document.getElementById('onimagehover').style.display = 'block';
        }
    }
    else {
        document.getElementById('onimagehover').style.display = 'none';
    }
})


// TEXT UI / MENU / INPUT / SOUND
window.addEventListener('message', function(event){    
    const value = event.data
    const info = value.data      
    if (value.action == "showtext") {
        document.getElementById("text").innerHTML = value.text;        
        document.getElementById("box").style.background = value.color;
        document.getElementById("container").classList.remove("showUI");         
        document.getElementById("container").classList.add("showUI");                    
        
    } else if (value.action == "hidetext"){
        document.getElementById("container").classList.remove("showUI");        
    } else if (value.action == "menu"){                
        switch (value.case) {            
            case "OPEN_MENU":                         
                return OpenMenu(info);
            case "CLOSE_MENU":
                return CloseMenu();
            case "CANCEL_MENU":
                return CancelMenu();
            default:
                return;
        }
    }  else if (value.action == "input"){                
        switch (value.input) {
            case "OPEN":
                return OpenInput(info);
            case "CLOSE":
                return CloseInput();
            default:
                return;
        }
    } 
})
  
