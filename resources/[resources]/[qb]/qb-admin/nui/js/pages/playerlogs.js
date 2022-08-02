// [ PLAYER LOGS ] \\

MC.AdminMenu.LoadPlayerLogs = function() {
    DebugMessage('Loading Logs.');
    if (MC.AdminMenu.Logs != "" && MC.AdminMenu.Logs != null) {
        setTimeout(() => {
            if (MC.AdminMenu.CheckMenuSize('Logs')) {
                MC.AdminMenu.BuildPlayerLogs();
            }
        }, 350);
    } else {
        DebugMessage('No logs found.');
    }
}

MC.AdminMenu.BuildPlayerLogs = function() {
    DebugMessage('Building Logs.');
    $('.admin-menu-logs-col').find('#logs-types').html('');
    $('.admin-menu-logs-col').find('#logs-steam').html('');
    $('.admin-menu-logs-col').find('#logs-desc').html('');
    $('.admin-menu-logs-col').find('#logs-date').html('');
    $('.admin-menu-logs-col').find('#logs-cid').html('');
    $('.admin-menu-logs-col').find('#logs-data').html('');
    for (let i = 0; i < MC.AdminMenu.Logs.length; i++) {
        let Log = MC.AdminMenu.Logs[i];

        let DateNow = new Date(Log['Date'])
        let Secs = DateNow.getSeconds() < 10 ? "0"+DateNow.getSeconds() : DateNow.getSeconds()
        let Mins = DateNow.getMinutes() < 10 ? "0"+DateNow.getMinutes() : DateNow.getMinutes()
        let Hour = DateNow.getHours() < 10 ? "0"+DateNow.getHours() : DateNow.getHours()
        let DateMes = DateNow.getFullYear()+'-'+(DateNow.getMonth()+1)+'-'+DateNow.getDate()+' '+Hour+ ":" +Mins+ ":" +Secs

        let LogTypeItem = `<div class="admin-menu-logs-col-content" id="log-${i}">${Log['Type']}</div>`;
        let LogSteamItem = `<div class="admin-menu-logs-col-content" id="log-${i}">${Log['Steam']}</div>`;
        let LogDescItem = `<div class="admin-menu-logs-col-content" id="log-${i}">${Log['Desc']}</div>`;
        let LogDateItem = `<div class="admin-menu-logs-col-content" id="log-${i}">${DateMes}</div>`;
        let LogCidItem = `<div class="admin-menu-logs-col-content" id="log-${i}">${Log['Cid']}</div>`;
        let LogDataItem = `<div class="admin-menu-logs-col-content" id="log-${i}">${Log['Data']}</div>`;
        $('.admin-menu-logs-col').find('#logs-types').append(LogTypeItem);
        $('.admin-menu-logs-col').find('#logs-steam').append(LogSteamItem);
        $('.admin-menu-logs-col').find('#logs-desc').append(LogDescItem);
        $('.admin-menu-logs-col').find('#logs-date').append(LogDateItem);
        $('.admin-menu-logs-col').find('#logs-cid').append(LogCidItem);
        $('.admin-menu-logs-col').find('#logs-data').append(LogDataItem);
    } 
}

// Search

$(document).on('input', '#log-type', function(e){
    let SearchText = $(this).val().toLowerCase();

    $('#log-cid').val('');
    $('#log-steam').val('');

    $('.admin-menu-logs-col').find('#logs-types').find('.admin-menu-logs-col-content').each(function(Elem, Obj){
    let ElementText = $(this).html().toLowerCase();
    let Element = $(this).attr("id");
    if (ElementText.includes(SearchText)) {
            $('.admin-menu-logs-col').each(function(Elem, Obj) {
                $(this).find(`#${Element}`).show();
            });
        } else {
            $('.admin-menu-logs-col').each(function(Elem, Obj) {
                $(this).find(`#${Element}`).hide();
            });
        };
    });
});

$(document).on('input', '#log-steam', function(e){
    let SearchText = $(this).val().toLowerCase();

    $('#log-type').val('');
    $('#log-cid').val('');

    $('.admin-menu-logs-col').find('#logs-steam').find('.admin-menu-logs-col-content').each(function(Elem, Obj){
        let ElementText = $(this).html().toLowerCase();
        let Element = $(this).attr("id");
        if (ElementText.includes(SearchText)) {
            $('.admin-menu-logs-col').each(function(Elem, Obj) {
                $(this).find(`#${Element}`).show();
            });
        } else {
            $('.admin-menu-logs-col').each(function(Elem, Obj) {
                $(this).find(`#${Element}`).hide();
            });
        };
    });
});

$(document).on('input', '#log-cid', function(e){
    let SearchText = $(this).val().toLowerCase();

    $('#log-type').val('');
    $('#log-steam').val('');

    $('.admin-menu-logs-col').find('#logs-cid').find('.admin-menu-logs-col-content').each(function(Elem, Obj){
        let ElementText = $(this).html().toLowerCase();
        let Element = $(this).attr("id");
        if (ElementText.includes(SearchText)) {
            $('.admin-menu-logs-col').each(function(Elem, Obj) {
                $(this).find(`#${Element}`).show();
            });
        } else {
            $('.admin-menu-logs-col').each(function(Elem, Obj) {
                $(this).find(`#${Element}`).hide();
            });
        };
    });
});
