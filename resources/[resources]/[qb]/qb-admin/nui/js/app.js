MC = {}
MC.AdminMenu = {}
MC.AdminMenu.Action = {}
MC.AdminMenu.Category = {}
MC.AdminMenu.Sidebar = {}
MC.AdminMenu.PlayerList = {}

MC.AdminMenu.DebugEnabled = false
MC.AdminMenu.Opened = false;
MC.AdminMenu.IsGeneratingDropdown = false;

MC.AdminMenu.Action.SelectedCat = null;
MC.AdminMenu.Action.Selected = "All";
MC.AdminMenu.Sidebar.Selected = "Actions";
MC.AdminMenu.Sidebar.Size = "Small";

MC.AdminMenu.FavoritedItems = {};
MC.AdminMenu.PinnedTargets = {};
MC.AdminMenu.BanList = {};
MC.AdminMenu.EnabledItems = {};
MC.AdminMenu.Settings = {};

MC.AdminMenu.Players = null;
MC.AdminMenu.Items = null;
MC.AdminMenu.CurrentTarget = null;

MC.AdminMenu.Update = function(Data) {
    DebugMessage(`Menu Updating`);
    MC.AdminMenu.FavoritedItems = Data.Favorited;
    MC.AdminMenu.PinnedTargets = Data.PinnedPlayers;
    MC.AdminMenu.Settings = Data.MenuSettings;
    MC.AdminMenu.Players = Data.AllPlayers
    MC.AdminMenu.Items = Data.AdminItems
    MC.AdminMenu.BanList = Data.Bans
    MC.AdminMenu.LoadItems();
}
 
MC.AdminMenu.Open = function(Data) {
    DebugMessage(`Menu Opening`);
    MC.AdminMenu.DebugEnabled = Data.Debug;
    MC.AdminMenu.FavoritedItems = Data.Favorited;
    MC.AdminMenu.PinnedTargets = Data.PinnedPlayers;
    MC.AdminMenu.Settings = Data.MenuSettings;
    $('.menu-main-container').css('pointer-events', 'auto');
    $('.menu-main-container').fadeIn(450, function() {
        $('.menu-page-actions-search input').focus();
        if (MC.AdminMenu.Items == null && MC.AdminMenu.Players == null) {
            MC.AdminMenu.Players = Data.AllPlayers
            MC.AdminMenu.Items = Data.AdminItems
            if (MC.AdminMenu.Sidebar.Selected == 'Actions') {
                $('.menu-pages').find(`[data-Page="${MC.AdminMenu.Sidebar.Selected}"`).fadeIn(150);
                MC.AdminMenu.LoadItems();
            }
        };
        MC.AdminMenu.BanList = Data.Bans
        MC.AdminMenu.Players = Data.AllPlayers
        MC.AdminMenu.Opened = true;
    });
}


MC.AdminMenu.Close = function() {
    DebugMessage(`Menu Closing`);
    MC.AdminMenu.ClearDropdown();
    $.post(`https://${GetParentResourceName()}/Admin/Close`);
    $('.menu-main-container').css('pointer-events', 'none');
    $('.menu-main-container').fadeOut(150, function() {
        MC.AdminMenu.Opened = false; 
    });
}

MC.AdminMenu.LoadItems = async function() {
    $('.admin-menu-items').html('');
    if (MC.AdminMenu.Action.Selected == 'All') {
        $.each(MC.AdminMenu.Items, function(Key, Value) {
            $.each(Value.Items, function(KeyAdmin, ValueAdmin) {
                MC.AdminMenu.BuildItems(ValueAdmin);
            });
        });
    } else {
        $.each(MC.AdminMenu.Items, function(Key, Value) {
            if (Value.Name == MC.AdminMenu.Action.Selected) {
                $.each(Value.Items, function(KeyAdmin, ValueAdmin) {
                    MC.AdminMenu.BuildItems(ValueAdmin);
                });
            }
        });
    }
}

MC.AdminMenu.SwitchCategory = function(Button, Type) {
    if (MC.AdminMenu.Action.Selected != Type) {
        $('.menu-page-actions-search input').val('');
        $(MC.AdminMenu.Action.SelectedCat).removeClass("active");
        $(Button).addClass("active");
        MC.AdminMenu.Action.SelectedCat = Button
        MC.AdminMenu.Action.Selected = Type
        MC.AdminMenu.LoadItems();
        $('.admin-menu-items').find('.admin-menu-item-arrow').removeClass('dropdown-open');
        $('.admin-menu-items').find('.admin-menu-item-arrow').removeClass('dropdown-closed');
    }
}

MC.AdminMenu.ChangeSize = function() {
    if (MC.AdminMenu.Sidebar.Size == 'Small') {
        $('.menu-size-change').html('<i class="fas fa-chevron-right"></i>');
        MC.AdminMenu.Sidebar.Size = 'Large';
        $('.menu-main-container').css({
            width: 50+"%",
            right: 25+"%",
        });
        // $('.admin-menu-items').animate({
        //     width: 105+"%",
        // }, 450);
        // $('.menu-page-action-header-categories').css({
        //     width: 105.5+"%"
        // }, 450);
        // $('.menu-page-actions-search').css({
        //     width: 105.5+"%"
        // }, 450);
    } else {
        $('.menu-size-change').html('<i class="fas fa-chevron-left"></i>');
        MC.AdminMenu.Sidebar.Size = 'Small';
        $('.menu-main-container').css({
            width: 24.24+"%",
            right: 3+"%",
        });
        // $('.admin-menu-items').animate({
        //     width: 99+"%",
        // }, 200);
        // $('.menu-page-action-header-categories').css({
        //     width: 100+"%"
        // }, 450);
        // $('.menu-page-actions-search').css({
        //     width: 100+"%"
        // }, 450);
    }
}

// Click

$(document).on('click', '.menu-page-action-header-category', function(e) {
    e.preventDefault();
    var Type = $(this).attr('data-Type');
    MC.AdminMenu.SwitchCategory($(this), Type)
});

$(document).on('click', '.admin-menu-item', function(e) {
    e.preventDefault();
    var Data = $(this).data('MenuData');
    if ($(this).find('.admin-menu-item-favorited:hover').length != 0) return;

    if (Data != undefined && !Data.Collapse) {
        $.post(`https://${GetParentResourceName()}/Admin/TriggerAction`, JSON.stringify({Event: Data.Event, EventType: Data.EventType, Result: []}));
    } else if (Data && Data.Collapse) {
        var OptionsDom = $(this).find('.admin-menu-item-options');

        if (OptionsDom.hasClass('extended')) {
            if (!$(e.target).hasClass('admin-menu-item-name')) return;
            OptionsDom.hide();
            OptionsDom.removeClass('extended');
            $(this).find('.admin-menu-item-arrow').removeClass('dropdown-open');
            $(this).find('.admin-menu-item-arrow').addClass('dropdown-closed');
        } else {
            OptionsDom.show();
            OptionsDom.addClass('extended');
            $(this).find('.admin-menu-item-arrow').removeClass('dropdown-closed');
            $(this).find('.admin-menu-item-arrow').addClass('dropdown-open');
            
            if (MC.AdminMenu.CurrentTarget != null) {
                if ($(this).find('.admin-menu-items-option-input').first().find('.ui-input-label').text() == 'Player') {
                    $(this).find('.admin-menu-items-option-input input').first().data("PlayerId", MC.AdminMenu.CurrentTarget.Source)
                    $(this).find('.admin-menu-items-option-input input').first().val(MC.AdminMenu.CurrentTarget.Text);
                }
            }
        }
    }
});

$(document).on('click', '.admin-menu-item-favorited', function(e) {
    e.preventDefault();
    var Data = $(this).parent().data('MenuData');
    if ($(this).hasClass("favorited")) {
        $(this).removeClass('favorited');
        $(this).html('<i class="fa-regular fa-star"></i>')
        $.post(`https://${GetParentResourceName()}/Admin/ToggleFavorite`, JSON.stringify({ Id: Data.Id, Toggle: false }))
    } else {
        $(this).addClass('favorited');
        $(this).html('<i class="fa-solid fa-star"></i>')
        $.post(`https://${GetParentResourceName()}/Admin/ToggleFavorite`, JSON.stringify({ Id: Data.Id, Toggle: true }))
    }
});

$(document).on('click', '.menu-size-change', function(e) {
    e.preventDefault();
    MC.AdminMenu.ChangeSize()
});

MC.AdminMenu.ConvertPlayerList = () => {
    var Options = [];
    for (let i = 0; i < MC.AdminMenu.Players.length; i++) {
        const Player = MC.AdminMenu.Players[i];
        Options.push({
            Icon: false,
            Text: `[${Player.ServerId}] ${Player.Name} (${Player.Steam})`,
            Source: Player.ServerId,
        })
    }
    return Options;
}

MC.AdminMenu.BuildItems = function(Item) {
    var CollapseOptions = ``;

        if (Item.Options != undefined && Item.Options.length > 0) {
            CollapseOptions += `<div class="admin-menu-item-options">`

            for (let i = 0; i < Item.Options.length; i++) {
                const Option = Item.Options[i];

                var DOMElement = `<div id="${Option.Id}" class="ui-styles-input">
                    <input type="text" class="ui-input-field">
                    <div class="ui-input-label">${Option.Name || 'No Label Given?'}</div>
                </div>`;

                if (Option.Type.toLowerCase() == 'input-choice' || Option.Type.toLowerCase() == 'text-choice') {
                    if (Option.PlayerList) Option.Choices = MC.AdminMenu.ConvertPlayerList();
                    if (Item.Id == 'unbanPlayer') Option.Choices = MC.AdminMenu.BanList;


                    AdminOpenInputChoice = function(Element){
                        var Input = $(Element).find("input");
                        var SelectedItem = JSON.parse($(Element).attr("Item"));
                        var Choice = Number($(Element).attr("ChoiceId"));
    
                        if (Option.Choices[0].Callback == undefined) {
                            for (let ChoiceId = 0; ChoiceId < SelectedItem.Options[Choice].Choices.length; ChoiceId++) {
                                SelectedItem.Options[Choice].Choices[ChoiceId].Callback = () => {
                                    Input.val(SelectedItem.Options[Choice].Choices[ChoiceId].Text);
                                    
                                    if (SelectedItem.Options[Choice].Choices[ChoiceId].Source) {
                                        MC.AdminMenu.CurrentTarget = SelectedItem.Options[Choice].Choices[ChoiceId]
                                        Input.data("PlayerId", SelectedItem.Options[Choice].Choices[ChoiceId].Source)

                                        if (MC.AdminMenu.CurrentTarget != null) {
                                            $('.menu-current-target').fadeIn(150);
                                            $('.menu-current-target').html(`Current Target: ${MC.AdminMenu.CurrentTarget.Text}`)
                                        } else {
                                            $('.menu-current-target').fadeOut(150);
                                        }
                                    }
                                };
                            };
                        };
                        
                        if (SelectedItem.Options[Choice].Type.toLowerCase() == 'text-choice') {
                            MC.AdminMenu.BuildDropdown(SelectedItem.Options[Choice].Choices, undefined, false)
                            Input.focus();
                        } else {
                            MC.AdminMenu.BuildDropdown(SelectedItem.Options[Choice].Choices, undefined, true)
                        }
                    };

                    DOMElement = `<div id="${Option.Id}" Item='${JSON.stringify(Item)}' ChoiceId="${i}" onclick="AdminOpenInputChoice(this)" class="ui-styles-input">
                        <input type="text" class="ui-input-field" ${Option.Type.toLowerCase() == 'input-choice' ? 'readonly' : ''}>
                        <div class="ui-input-label">${Option.Name || 'No Label Given?'}</div>
                    </div>`;
            }
            CollapseOptions += `<div class="admin-menu-items-option-input">${DOMElement}</div>`;
        }
        CollapseOptions += `<div class="admin-menu-execute ui-styles-button default">${Item.Name}</div></div>`
    }

    var AdminOption = `<div class="admin-menu-item ${MC.AdminMenu.EnabledItems[Item['Id']] ? 'enabled' : ''}" id="admin-option-${Item['Id']}">
        <div class="admin-menu-item-favorited ${MC.AdminMenu.FavoritedItems[Item['Id']] ? 'favorited' : ''}"><i class="${MC.AdminMenu.FavoritedItems[Item['Id']] ? 'fa-solid' : 'fa-regular'} fa-star"></i></div>
        <div class="admin-menu-item-arrow">${CollapseOptions != "" ? `<i class="fa-solid fa-chevron-down">` : ""}</i></div>
        <div class="admin-menu-item-name">${Item.Name}</div>
        ${CollapseOptions}
    </div>`;

    if (MC.AdminMenu.FavoritedItems[Item['Id']]) {
        $('.admin-menu-items').prepend(AdminOption);
    } else {
        $('.admin-menu-items').append(AdminOption);
    }
    $(`#admin-option-${Item['Id']}`).data('MenuData', Item);
};

$(document).on('click', '.menu-current-target', function(e){

    $(this).parent().find('.ui-styles-input').each(function(Elem, Obj){
        if ($(this).find('input').data("PlayerId")) {
            if (MC.AdminMenu.CurrentTarget != null) {
                if ($('.admin-menu-item').find('.admin-menu-items-option-input').first().find('.ui-input-label').text() == 'Player') {
                    $(this).find('input').data("PlayerId", null)
                    $(this).find('input').val(" ");
                }
            }
        }
    });
    $('.menu-current-target').fadeOut(150);
    MC.AdminMenu.CurrentTarget = null;
});

$(document).on('click', '.admin-menu-execute', function(e){
    var Data = $(this).parent().parent().data('MenuData')
    var Result = {};
    
    $(this).parent().find('.ui-styles-input').each(function(Elem, Obj){
        if ($(this).find('input').data("PlayerId")) {
            Result[$(this).attr("id")] = Number($(this).find('input').data("PlayerId"));
        } else {
            Result[$(this).attr("id")] = $(this).find('input').val();
        }
    });

    $.post(`https://${GetParentResourceName()}/Admin/TriggerAction`, JSON.stringify({
        Event: Data.Event,
        EventType: Data.EventType,
        Result: Result
    }));
});

$(document).on('input', '.menu-page-actions-search input', function(e){
    let SearchText = $(this).val().toLowerCase();

    $('.admin-menu-item').each(function(Elem, Obj){
        if ($(this).find('.admin-menu-item-name').html().toLowerCase().includes(SearchText)) {
            $(this).fadeIn(150);
        } else {
            $(this).fadeOut(150);
        };
    });
});

$(document).on('click', 'body', function(e){
    if (MC.AdminMenu.IsGeneratingDropdown) return;
    if ($('.ui-styles-dropdown').length != 0 && $('.ui-styles-dropdown-search:hover').length == 0) $('.ui-styles-dropdown').remove();
});

$(document).on('click', '.ui-styles-checkbox', function(){
    $(this).removeClass('ripple-effect');
    $(this).addClass('ripple-effect');
    setTimeout(() => {
        $(this).removeClass('ripple-effect');
    }, 500);
});


// Dropdown
MC.AdminMenu.ClearDropdown = function() {
    if ($('.ui-styles-dropdown').length != 0) {
        $('.ui-styles-dropdown').remove();
    }
}

$(document).on('input', '.ui-styles-dropdown-search input', function(e){
    let SearchText = $(this).val().toLowerCase();

    $('.ui-styles-dropdown-item').each(function(Elem, Obj){
        if (!$(this).hasClass("ui-styles-dropdown-search")) {
            if ($(this).html().toLowerCase().includes(SearchText)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        }
    });
});

MC.AdminMenu.BuildDropdown = (Options, CursorPos, HasSearch) => {
    if (Options.length == 0) return;

    MC.AdminMenu.IsGeneratingDropdown = true;

    $('.ui-styles-dropdown').remove();
    var DropdownDOM = ``;

    if (HasSearch) DropdownDOM += `<div class="ui-styles-dropdown-item ui-styles-dropdown-search"><input type="text" placeholder="Search.."></div>`;
    for (let i = 0; i < Options.length; i++) {
        const Elem = Options[i];
        
        OnDropdownButtonClick = (Element) => {
            var DropdownOption = Options[Number(Element.getAttribute("DropdownId"))];
            DropdownOption.Callback(DropdownOption);
            $('.ui-styles-dropdown').remove();
        };

        DropdownDOM += `<div DropdownId=${i} onclick="OnDropdownButtonClick(this)" class="ui-styles-dropdown-item">${Elem.Icon ? `<i class="${Elem.Icon}"></i> ` : ''}${Elem.Text}${Elem.Label != null ? Elem.Label : ""}</div>`;
    };

    $('body').append(`<div class="ui-styles-dropdown">${DropdownDOM}</div>`);

    if (HasSearch) {
        $('.ui-styles-dropdown-search input').focus();
    }

    var top = CursorPos != undefined && CursorPos.y || window.event.clientY;
    var left = CursorPos != undefined && CursorPos.x || window.event.clientX;

    var DropdownHeight = Number($('.ui-styles-dropdown').css('height').replace('px', ''));
    var DropdownWidth = Number($('.ui-styles-dropdown').css('width').replace('px', ''));

    if (top + DropdownHeight >= screen.height) top = screen.height - DropdownHeight;
    if (left + DropdownWidth >= screen.width) left = screen.width - (DropdownWidth + 10);

    $('.ui-styles-dropdown').css({
        top: top,
        left: left,
    })

    setTimeout(() => {
        MC.AdminMenu.IsGeneratingDropdown = false;
    }, 250);
}

// Player List

MC.AdminMenu.LoadPlayerList = function() {
    $('.admin-menu-players').html('');
    MC.AdminMenu.BuildPlayerList();
}

MC.AdminMenu.BuildPlayerList = function() {
    for (let i = 0; i < MC.AdminMenu.Players.length; i++) {
        let Player = MC.AdminMenu.Players[i];
        var PlayerItem = `<div class="admin-menu-player" id="admin-player-${Player['ServerId']}">
                            <div class="admin-menu-player-pintarget ${ MC.AdminMenu.PinnedTargets[Player['License']] ? 'pinned' : ''}">${ MC.AdminMenu.PinnedTargets[Player['License']] ? `<i class="fa-solid fa-map-pin"></i>` :  `<i class="fa-regular fa-map-pin"></i>` }</div>
                            <div class="admin-menu-player-id">(${Player['ServerId']})</div>
                            <div class="admin-menu-player-name">${Player['Name']}</div>
                            <div class="admin-menu-player-steam">[${Player['Steam']}]</div>
                        </div>`;

        MC.AdminMenu.BuildPinnedPlayerList(MC.AdminMenu.PinnedTargets[Player['License']] != undefined ? MC.AdminMenu.PinnedTargets[Player['License']] : false);
        
        $('.admin-menu-players').append(PlayerItem);
        $(`#admin-player-${Player['ServerId']}`).data('PlayerData', Player);       
    } 
}

MC.AdminMenu.BuildPinnedPlayerList = function(Value) {
    $('.menu-pinned-players-list').html('');
    setTimeout(() => {
        if (Value) {
            let PinnedPlayer = MC.AdminMenu.PinnedTargets;
            $.post(`https://${GetParentResourceName()}/Admin/GetCharData`, JSON.stringify({ 
                License: PinnedPlayer, 
            }), function(pData) {
                if (pData) {
                    var PlayerPinned = $('.menu-pinned-players-list').find('.menu-pinned-player').attr('data-PinnedPlayer');
                    if (PlayerPinned != pData.Name) {
                        var PinnedPlayerItem = `<div class="menu-pinned-player" data-PinnedPlayer="${pData.Name}">
                            <div class="menu-pinned-player-header">
                                <div class="menu-pinned-player-header-name">${pData.Name}</div>
                                <div class="menu-pinned-player-header-steam">${pData.Steam}</div>
                            </div>
                            <div class="menu-pinned-player-information-list">
                                <div class="menu-pinned-player-information-item">
                                    <div class="menu-pinned-player-information-item-title"><p>CharName</p></div>
                                    <div class="menu-pinned-player-information-item-desc"><p>${pData.CharName}</p></div>
                                </div>
                                <div class="menu-pinned-player-information-item">
                                    <div class="menu-pinned-player-information-item-title"><p>ServerID</p></div>
                                    <div class="menu-pinned-player-information-item-desc"><p>${pData.Source}</p></div>
                                </div>
                                <div class="menu-pinned-player-information-item">
                                    <div class="menu-pinned-player-information-item-title"><p>CharID</p></div>
                                    <div class="menu-pinned-player-information-item-desc"><p>${pData.CitizenId}</p></div>
                                </div>
                            </div>
                        </div>`
                    }
                $('.menu-pinned-players-list').append(PinnedPlayerItem);
                }
            });
        }
    }, 200);
}

$(document).on('click', '.admin-menu-player-pintarget', function(e) {
    e.preventDefault();
    var Data = $(this).parent().data('PlayerData');
    if ($(this).hasClass("pinned")) {
        $(this).removeClass('pinned');
        $(this).html('<i class="fa-regular fa-map-pin"></i>')
        $.post(`https://${GetParentResourceName()}/Admin/TogglePinnedTarget`, JSON.stringify({ Id: Data.License, Toggle: false }));
        MC.AdminMenu.BuildPinnedPlayerList(false);
    } else {
        $(this).addClass('pinned');
        $(this).html('<i class="fa-solid fa-map-pin"></i>')
        $.post(`https://${GetParentResourceName()}/Admin/TogglePinnedTarget`, JSON.stringify({ Id: Data.License, Toggle: true }));
        if ($('.menu-pinned-players').is(':hidden')) {
            $('.menu-pinned-players').fadeIn(150);
        }
        MC.AdminMenu.BuildPinnedPlayerList(true);
    }
});

$(document).on('input', '#list-serverid', function(e){
    let SearchText = $(this).val().toLowerCase();

    $('.admin-menu-player').each(function(Elem, Obj){
        if ($(this).find('.admin-menu-player-id').html().toLowerCase().includes(SearchText)) {
            $(this).fadeIn(150);
        } else {
            $(this).fadeOut(150);
        };
    });
});

$(document).on('input', '#list-steamsearch', function(e){
    let SearchText = $(this).val().toLowerCase();

    $('.admin-menu-player').each(function(Elem, Obj){
        if ($(this).find('.admin-menu-player-steam').html().toLowerCase().includes(SearchText)) {
            $(this).fadeIn(150);
        } else {
            $(this).fadeOut(150);
        };
    });
});

// Sidebar

MC.AdminMenu.LoadCategory = function(Category) {
    if (Category == 'Actions') {
        // DebugMessage('Loading Actions');
        MC.AdminMenu.LoadItems();
    } else if (Category == 'PlayerList') {
        // DebugMessage('Loading Player List');
        MC.AdminMenu.LoadPlayerList();
    } else if (Category == 'RecentBans') {
        // DebugMessage('Loading Recent Bans');
    } else if (Category == 'PlayerLogs') {
        // DebugMessage('Loading Player Logs');
    } else if (Category == 'Options') {
        // DebugMessage('Loading Options');
    }
}

$(document).on('click', ".menu-sidebar-action", function (e) {
    e.preventDefault();

    let NewSidebarCat = $(this);
    let OldSidebarCat = $(this).attr('data-Action');
    let Timeout = false;
    if (MC.AdminMenu.Sidebar.Selected != OldSidebarCat && !Timeout) {
        Timeout = true;
        setTimeout(() => {
            Timeout = false;
        }, 200);
        if (NewSidebarCat.hasClass('lower')) {
            MC.AdminMenu.SidebarAction(OldSidebarCat, NewSidebarCat)
        } else {
            let PreviousSidebarCat = $(`[data-Action="${MC.AdminMenu.Sidebar.Selected}"]`);

            MC.AdminMenu.LoadCategory(OldSidebarCat);
            // DebugMessage(`Changing Sidebar Category: ${MC.AdminMenu.Sidebar.Selected} -> ${OldSidebarCat}`)
            
            $(PreviousSidebarCat).removeClass('selected');
            $(NewSidebarCat).addClass('selected');
    
            $(`[data-Page="${MC.AdminMenu.Sidebar.Selected}"`).fadeOut(150);
            $(`[data-Page="${OldSidebarCat}"`).fadeIn(150);
    
            setTimeout(function(){ MC.AdminMenu.Sidebar.Selected = OldSidebarCat; }, 300);
        }
    }
});

MC.AdminMenu.SidebarAction = function(Action, Element) {
    if (Action == 'DevMode') {
        if ($(Element).hasClass('enabled')) {
            $(Element).removeClass('enabled')
            $.post(`https://${GetParentResourceName()}/Admin/DevMode`, JSON.stringify({
                Toggle: false,
            }));
        } else {
            $(Element).addClass('enabled')
            $.post(`https://${GetParentResourceName()}/Admin/DevMode`, JSON.stringify({
                Toggle: true,
            }));
        }
    } else if (Action == 'PinnedTargets') {
        if ($('.menu-pinned-players').is(':visible')) {
            $('.menu-pinned-players').fadeOut(150);
        } else {
            $('.menu-pinned-players').fadeIn(150);
        }
    } else if (Action == 'ToggleMenu') {
        MC.AdminMenu.Close();
    }
}

// Functions

DebugMessage = function(Message) {
    if (MC.AdminMenu.DebugEnabled) {
        console.log(`[DEBUG]: ${Message}`);
    }
}

// Listener

document.addEventListener('DOMContentLoaded', (event) => {
    DebugMessage(`Menu Initialised`)
    MC.AdminMenu.Action.SelectedCat = $('.menu-page-action-header-categories').find('.active');
    window.addEventListener('message', function(event){
        let Action = event.data.Action;
        let Data = event.data
        switch(Action) {
            case "Open":
                MC.AdminMenu.Open(Data);
                break;
            case "Close":
                if (!MC.AdminMenu.Opened) return;
                MC.AdminMenu.Close();
                break;
            case "Update":
                if (!MC.AdminMenu.Opened) return;
                MC.AdminMenu.Update(Data);
                break;
            case "SetItemEnabled":
                MC.AdminMenu.EnabledItems[Data.Name] = Data.State;
                Data.State ? $(`#admin-option-${Data.Name}`).addClass('enabled') : $(`#admin-option-${Data.Name}`).removeClass('enabled');
                break;
        }
    });
});

$(document).on({
    keydown: function(e) {
        if (e.keyCode == 27 && MC.AdminMenu.Opened) {
            MC.AdminMenu.Close();
        }
    },
});