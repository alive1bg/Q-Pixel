// [ PLAYER LIST ] \\

MC.AdminMenu.LoadPlayerList = function() {
    DebugMessage('Loading PlayerList.');
    if (MC.AdminMenu.Players != "" && MC.AdminMenu.Players != null) {
        MC.AdminMenu.BuildPlayerList();
    } else {
        DebugMessage('No players found.');
    }
}

MC.AdminMenu.BuildPlayerList = function() {
    DebugMessage('Building PlayerList.');
    $('.admin-menu-players').html('');
    for (let i = 0; i < MC.AdminMenu.Players.length; i++) {
        let Player = MC.AdminMenu.Players[i];
        let PlayerItem = `<div class="admin-menu-player" id="admin-player-${Player['ServerId']}">
                            <div class="admin-menu-player-pintarget ${ MC.AdminMenu.PinnedTargets[Player['License']] ? 'pinned' : ''}">${ MC.AdminMenu.PinnedTargets[Player['License']] ? `<i class="fa-solid fa-map-pin"></i>` :  `<i class="fa-regular fa-map-pin"></i>` }</div>
                            <div class="admin-menu-player-id">(${Player['ServerId']})</div>
                            <div class="admin-menu-player-name">${Player['Name']}</div>
                            <div class="admin-menu-player-steam">[${Player['Steam']}]</div>
                        </div>`;

        MC.AdminMenu.BuildPinnedPlayerList(MC.AdminMenu.PinnedTargets != "" && MC.AdminMenu.PinnedTargets != null ? (MC.AdminMenu.PinnedTargets[Player['License']] != undefined ? MC.AdminMenu.PinnedTargets[Player['License']] : false) : false);
        
        $('.admin-menu-players').append(PlayerItem);
        $(`#admin-player-${Player['ServerId']}`).data('PlayerData', Player);       
    } 
}

MC.AdminMenu.BuildPinnedPlayerList = function(Value) {
    $('.menu-pinned-players-list').html('');
    setTimeout(() => {
        if (Value) {
            DebugMessage('Building Pinned PlayerList.');
            let PinnedPlayer = MC.AdminMenu.PinnedTargets;
            $.post(`https://${GetParentResourceName()}/Admin/GetCharData`, JSON.stringify({ 
                License: PinnedPlayer, 
            }), function(pData) {
                if (pData) {
                    let PlayerPinned = $('.menu-pinned-players-list').find('.menu-pinned-player').attr('data-PinnedPlayer');
                    if (PlayerPinned != pData.Name) {
                        let PinnedPlayerItem = `<div class="menu-pinned-player" data-PinnedPlayer="${pData.Name}">
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
                        $('.menu-pinned-players-list').append(PinnedPlayerItem);
                    }
                }
            });
        }
    }, 200);
}

// [ SEARCH ] \\

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

// [ CLICKS ] \\

$(document).on('click', '.admin-menu-player-pintarget', function(e) {
    e.preventDefault();
    let Data = $(this).parent().data('PlayerData');
    DebugMessage('Pinning Target.');
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