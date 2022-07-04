const BodyMain = document.getElementById('MainBody');
const CraftBox = document.getElementById('CraftStart');
var selectedItem = null
var selectA = null
var DataItems = []


$(document).ready(function(){
    window.addEventListener('message', function(event) {
        switch(event.data.action) {
            case "show":
                BodyMain.style.display = 'block';
                CraftBox.style.display = 'block';
                CraftBox.classList.add('slide-inA');
                BodyMain.classList.add('slide-in');
                AddItems(event.data.data);
            break;
            case "close":
                BodyMain.classList.add('slide-out');
                CraftBox.classList.add('slide-outA');
                setTimeout(function() {
                    BodyMain.innerHTML = '';
                    BodyMain.style.display = 'none';
                    CraftBox.style.display = 'none';
                    BodyMain.classList.remove('slide-in');
                    BodyMain.classList.remove('slide-out');
                    CraftBox.classList.remove('slide-inA');
                    CraftBox.classList.remove('slide-outA');
                }, 1000)
            break;
        }
    })
});
var maxlevele = 0
function AddItems(data){
    maxlevele = 0
    $(".BodyCraftingStart").css("display", "none");
    $(".MainBody").html("");
    $(".ItemNamesForCraft").html("");
    $(".BodyCraftingInput").val("");
    selectA = null;
    selectedItem = null;
    DataItems = [];

    for (const [ke, ve] of Object.entries(data.items)) {
        maxlevele = maxlevele + ve.level
    }

    var  AddOption3 = '<div class="MainBodyTextUI"><i class="fas fa-th"></i> Crafting</div>'+
                        '<div class="XPShow"><div class="pro"><p class="TextXPUI"><i style="color: black" class="fas fa-pencil-ruler"></i> XP '+data.xp+'/'+maxlevele+'</p></div></div>'       
    $('.MainBody').append(AddOption3);

    

    var per =(data.xp/1000)/(maxlevele/100000)
    $(".pro").css("width",per+"%"); 

    for (const [k, v] of Object.entries(data.items)) {
        if (data.xp >= v.level){
            var AddOption = '<div class="BodyItemForCraft" data-needitem="'+k+'">'+
                                '<div class="Body_mainImage">'+
                                    data.labels[v.itemName]+
                                    '<image class="image_body" src="nui://lj-inventory/html/images/'+data.images[v.itemName]+'" ></image>'+
                                '</div>'+
                                '<div id="'+ k +'" class="ItemNamesForCraft">'+
                                '</div>'+
                            '</div>'       
            $('.MainBody').append(AddOption);
            DataItems[k] = v
            for (const [ke, ve] of Object.entries(v.NeedItems)) {
                var  AddOption2 = '<div class="ItemsUI"><image id="ItemsUI" src="nui://lj-inventory/html/images/'+data.images[ke]+'"></image><p class="TextBoxUi">'+data.labels[ke]+': '+ve+'</p></div>'
                $('#'+k+'').append(AddOption2);
            }
        }
    }
}

$(document).on("keydown", function() {
    if (event.repeat) {
        return;
    }
    switch (event.keyCode) {
        case 27: // ESC
            CloseCrafting();
            break;
    }
});

function CloseCrafting(){
    $.post("https://apix-crafting/CloseCrafting",JSON.stringify({}));
}

$(document).on("click", ".BodyItemForCraft", function(e){
    e.preventDefault();
    selectA = null;

    selectA = $(this).data('needitem');


    if (selectedItem !== null){
        $(selectedItem).removeClass('item-selected');
        selectA = null;
        $('.BodyCraftingStart').fadeOut(350);
    }
    
    if (selectedItem == null) {
        $(this).addClass("item-selected");
        selectedItem = this;
        $('.BodyCraftingStart').fadeIn(200);
        selectA = $(this).data('needitem');
    } else if (selectedItem == this) {
        $(this).removeClass("item-selected");
        selectedItem = null;
        selectA = null;
        $('.BodyCraftingStart').fadeOut(350);
    } else {
        $(selectedItem).removeClass("item-selected");
        $(this).addClass("item-selected");
        $('.BodyCraftingStart').fadeIn(200);
        selectedItem = this;
        selectA = $(this).data('needitem');
    }
});

$(document).on("click", ".BodyCraftingStart", function(e){
    e.preventDefault();
    var AmountCraft = $(".BodyCraftingInput").val();

    if (selectA != null){
        if (AmountCraft > 0 ){
            $(".BodyCraftingInput").val("");
            $.post("https://apix-crafting/CraftStarted",JSON.stringify({mat: DataItems[selectA], amount: AmountCraft}));
        }else{
            var AlertText = "Enter the number !"
            var AlertType = "error"
            $.post("https://apix-crafting/SendAlertcraft",JSON.stringify({text: AlertText, type: AlertType}));
        }
    }else{
        var AlertText = "You have not selected any items !"
        var AlertType = "error"
        $.post("https://apix-crafting/SendAlertcraft",JSON.stringify({text: AlertText, type: AlertType}));
    }
});

$(document).on("click", ".CloseCrafting", function(e){
    e.preventDefault();
    CloseCrafting()
});