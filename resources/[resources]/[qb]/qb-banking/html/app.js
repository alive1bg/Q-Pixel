let ValidAccounts = {};
let CurrentTransactions = [];
let curAccount = "";
let folder_name = GetParentResourceName()
let playerName = "";

function UpdateAccount(divId, bal)
{
    $("#" + divId + "_Balance").html("$" + bal.toLocaleString());
}

//let GlobalSteamID = "";

function ResetModals(type)
{
    
    // Amounts
    $("#deposit-amount").val("");
    $("#withdraw-amount").val("");
    $("#transfer-amount").val("");

    // Notes
    $("#deposit-comment").val("");
    $("#withdraw-comment").val("");
    $("#transfer-comment").val("");

    // Ids
    $("#transfer-id").val("");
    $("#transfer-citizenid").val("");

    curAccount = type;

    //if (sSteamID && sSteamID !== "undefined")
       // GlobalSteamID = sSteamID;
}

var lang2 = [];
lang2["personal"] = "Default";
lang2["business"] = "Buisness Account";
lang2["organization"] = "Organization Account";
lang2["deposit"] = "Deposit";
lang2["withdraw"] = "Withdrawal";
lang2["transfer"] = "Transfer";

var lang = [];
lang["personal"] = "Personal Account";
lang["business"] = "Buisness Account";
lang["organization"] = "Organization Account";
lang["deposit"] = "Deposit";
lang["withdraw"] = "Withdrawal";
lang["transfer"] = "Transfer";

var relang = [];
relang["Personal Account"] = "personal";
relang["Buisness Account"] = "business";
relang["Organization Account"] = "organization";

function AddAccount(account_name, account_type, bal, ply_Name, ply_Citizenid)
{
    if (playerName == null || playerName === "")
        playerName = ply_Name;

    let temp_name = account_name.replace(/"|'/g,'');
    let temp_Name = account_name.replace(/\s+/g, '');
    
    let transferAcc = relang[account_type];
    
    if (ValidAccounts[temp_Name])
        return UpdateAccount(temp_Name, bal);

    $("#Player_Accounts").append("<div id='"+temp_Name+"'\
        <div class='bgdark2'>\
            <div class='account'>\
                <p class='title-card-1'>" + account_name +" / "+ply_Citizenid+ "</p>\
                <p class='title-card-2'>" + account_type + "</p>\
\
                <div class='row'>\
                    <div class='col'>\
                        <p class='title-card-3'>" + ply_Name + "</p>\
                    </div>\
\
                    <div class='col mb-2'>\
\
                        <div class='d-flex justify-content-end'>\
                            <h5 id='" + temp_Name + "_Balance' class='title-card-5'>$" + bal.toLocaleString() + ".00</h5>\
                        </div>\
                        <div class='d-flex justify-content-end mt-1 mb-1'>\
                            <p class='title-card-4'>Available Balance</p>\
                            \
                        </div>\
                    </div>\
                </div>\
\
                <div class='d-flex justify-content-between' style='position: relative;bottom: 5vh'>\
                    <button type='button' class='text-muted deposit' id='DepositModal' onClick='ResetModals(\"" + transferAcc + "\", \"" + "\")'>DEPOSIT</button>\
                    <button type='button' class='text-muted withdraw' id='WithdrawModal' onClick='ResetModals(\"" + transferAcc + "\", \"" + "\")'>WITHDRAW</button>\
                    <button type='button' class='text-muted transfer' id='TransferModal' onClick='ResetModals(\"" + transferAcc + "\", \"" + "\")'>TRANSFER</button>\
                </div>\
            </div>\
    </div><br/></div>");

    ValidAccounts[temp_Name] = transferAcc;
}

function timeSince(date) {

    var seconds = Math.floor((new Date() - date) / 1000);
  
    var interval = seconds / 31536000;
  
    if (interval > 1) {
      return Math.floor(interval) + " years";
    }
    interval = seconds / 2592000;
    if (interval > 1) {
      return Math.floor(interval) + " months";
    }
    interval = seconds / 86400;
    if (interval > 1) {
      return Math.floor(interval) + " days";
    }
    interval = seconds / 3600;
    if (interval > 1) {
      return Math.floor(interval) + " hours";
    }
    interval = seconds / 60;
    if (interval > 1) {
      return Math.floor(interval) + (Math.floor(interval) > 1 && " minutes" ||  " minute");
    }
    return Math.floor(seconds) + " seconds";
  }

  function htmlEncode(source) {
    return $("<div>").text(source).html();
  }

function addNote(note)
{
    return "<div>\
            <h6 class='note' style='position: relative;opacity: .2;font-size: .9vh;top: 1vh;'>Message</h6>\
            <p class='note' style='position: relative;opacity: .2;font-size: 1.3vh;top: 1vh;'>" + htmlEncode(note) + "</p>\
            <hr style='border: 1px dashed black;border-radius: 5vh;width: 100%;' />\
    </div>"
}
function AddTransaction(trans_id, account, amount, time, note, why, receiver, plName, citizenid)
{

    let curTime = new Date();
    let newDate = new Date(time);

    let TimeSince = timeSince(newDate);

    if (CurrentTransactions[trans_id])
    {
        $("#" + trans_id + "_time").html(TimeSince + " ago")
        return;
    }

    let ColStr = (amount.toString().charAt(0) === "-" && "expense" || "addition");

    let str = (amount.toString().charAt(0) === "-" && "-$" + parseInt(amount.toString().substring(1, amount.length)).toLocaleString() || "$" + amount.toLocaleString())
    $("#Transaction_Row").prepend("\
        <div class='card bgdark1 mb-2'>\
            <div class='card-body'>\
                <div class='col'>\
                <!-- Header -->\
                <div class='row game-header'>\
                    <div class='col'>\
                        <p class='header-title'> " + lang[account] + " / "+citizenid+" ["+why.toUpperCase()+"]</p>\
                    </div>\
                    <div class='col d-flex justify-content-end'>\
                        <p class='header-title'>"+trans_id+"</p>\
                    </div>\
                    <hr style='position: relative;top: -1vh;border: 1.5px solid white;border-radius: 5px;width: 98%;margin: auto;opacity: .7;'/>\
                    <div class='col'>\
                        <h5 class='" + ColStr + "'> " + str + ".00</h5>\
                    </div>\
                    <div class='col-5' style='font-weight: 500;'>\
                        " + (receiver === "Personal Account" && plName || receiver) + "\
                    </div>\
                        <div class='col d-flex justify-content-end'>\
                            <div style='font-weight: 500;'>\
                                <p class='note' id='"+trans_id+"_time'>" + TimeSince + " ago</p>\
                                <p class='note'> " + plName + "</p>\
                            </div>\
                        </div>\
                    " + (note != "" && addNote(note) || "") + "\
                    </div>\
                </div>\
            </div>\
        </div>\
    ")

    CurrentTransactions[trans_id] = true;
}


function OpenATM(data, transactions, name, citizenid, cash)
{
    if (data && data !== null)
    {
        let tbl = JSON.parse(data);
        for (var i = 0; i < tbl.length; i++)
        {
            let tTbl = tbl[i];
            console.log(tTbl.type);
            AddAccount((tTbl.type === "business" && tTbl.name || tTbl.type === "organization" && tTbl.name || "Personal Account"), (lang[tTbl.type] && lang[tTbl.type] || tTbl.type), tTbl.amount, name, citizenid);
        }
    }


    if (transactions && transactions !== null)
    {
        transactions = JSON.parse(transactions);
        for (var i = 0; i < transactions.length; i++)
        {
            let tTbl = transactions[i];

            AddTransaction(tTbl.trans_id, tTbl.account, tTbl.amount, tTbl.date, tTbl.message, tTbl.trans_type, tTbl.receiver || "Unknown", name, tTbl.citizenid);
        }
    }

    $('.cash').text("Cash: $"+cash.toLocaleString()+".00")
    $('#bankui').fadeTo(10, 1.0)
}

function uuid() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
      var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
      return v.toString(16);
    });
}

// DEPOSIT
$(document).on('click', '#DepositModal', function(e){
    e.preventDefault();
    $('.deposit-container').css({'display':'block'});
    $('.items-view').css({'display':'block'});
    $('.full-white').css({'display':'block'});
});

$(document).on('click', '.deposit-decline', function(e){
    e.preventDefault();
    $('.deposit-container').css({'display':'none'});
    $('.items-view').css({'display':'none'});
    $('.full-white').css({'display':'none'});
});

$(document).on('click', '.deposit-submit', function(e){
    let amount = $("#deposit-amount").val();

    if(!amount || amount <= 0)
        return;
    
    let note = $("#deposit-comment").val();

    $('.items-view').css({'display':'none'});
    $('.lds-spinner').css({'display':'inline-block'});

    setTimeout( () => {
        $.post("https://" + folder_name + "/DepositCash", JSON.stringify({
            account: curAccount,
            amount: amount,
            note: note,
            uuid: uuid(),
        }));

        setTimeout( () => {
            $('.lds-spinner').css({'display':'none'});
            $('.deposit-decline').click()
        },500)
    }, 500)
});

// WITHDRAW
$(document).on('click', '#WithdrawModal', function(e){
    e.preventDefault();
    $('.withdraw-container').css({'display':'block'});
    $('.items-view').css({'display':'block'});
    $('.full-white').css({'display':'block'});
});

$(document).on('click', '.withdraw-decline', function(e){
    e.preventDefault();
    $('.withdraw-container').css({'display':'none'});
    $('.items-view').css({'display':'none'});
    $('.full-white').css({'display':'none'});
});

$(document).on('click', '.withdraw-submit', function(e){
    let amount = $("#withdraw-amount").val();

    if(!amount || amount <= 0)
        return;
    
    let note = $("#withdraw-comment").val(); 

    $('.items-view').css({'display':'none'});
    $('.lds-spinner').css({'display':'inline-block'});

    setTimeout( () => {
        $.post("https://" + folder_name + "/WithdrawCash", JSON.stringify({
            account: curAccount,
            amount: amount,
            note: note,
            uuid: uuid(),
        })); 

        setTimeout( () => {
            $('.lds-spinner').css({'display':'none'});
            $('.withdraw-decline').click()
        },500)
    }, 500)
});

// TRANSFER
$(document).on('click', '#TransferModal', function(e){
    e.preventDefault();
    $('.transfer-container').css({'display':'block'});
    $('.items-view').css({'display':'block'});
    $('.full-white').css({'display':'block'});
});

$(document).on('click', '.transfer-decline', function(e){
    e.preventDefault();
    $('.transfer-container').css({'display':'none'});
    $('.items-view').css({'display':'none'});
    $('.full-white').css({'display':'none'});
});

$(document).on('click', '.transfer-submit', function(e){
    //if (!curAccount)
        //curAccount = "personal";

    let amount = $("#transfer-amount").val();
    let tTarget = $("#transfer-id").val();
    let tTargetCitizen = $("#transfer-citizenid").val();
    if(!amount || amount <= 0)
        return;
    
    let note = $("#transfer-comment").val();

    $('.items-view').css({'display':'none'});
    $('.lds-spinner').css({'display':'inline-block'});

    setTimeout( () => {
        $.post("https://" + folder_name + "/TransferCash", JSON.stringify({
            citizenid: tTargetCitizen,
            account: curAccount,
            amount: amount,
            target: tTarget,
            note: note,
            uuid: uuid(),
        }));
        setTimeout( () => {
            $('.lds-spinner').css({'display':'none'});
            $('.transfer-decline').click()
        },500)
    },500)
});

function confirmRemove(identifier, name)
{
    if ($("#editAccountModal").is(':visible'))
        $("#editAccountModal").modal('toggle');

    $.post("https://" + folder_name + "/RemoveAccess", JSON.stringify({
        target: identifier,
        player: name
    }));
}

function EditAccount(clss)
{
    if (clss != "personal")
        return TropixNotification("Company accounts have no settings yet, sorry!", "error")

    $.post("https://" + folder_name + "/EditAccount", JSON.stringify({}))
}

function TropixNotification(msg, typ)
{
    $("#notifaction_type").text(typ == "error" && "Error!" || "Success!")
    $("#notification_msg").text(msg);
    $("#notificationModal").modal('toggle');
}

let Listeners = [];

Listeners["notification"] = function(data)
{
    $("#notifaction_type").text(data.msg_type && data.msg_type == "error" && "Error!" || "Success!")
    $("#notification_msg").text(data.message);
    $("#notificationModal").modal('toggle');
}

Listeners["OpenUI"] = function(data)
{
    let name = data.name;
    OpenATM(data.accounts, data.transactions, name, data.citizenid, data.cash);
}

Listeners["edit_account"] = function(data)
{

    if (data) {
        let auths = JSON.parse(data.auths);
        $("#who_has_access").html("");
        
        for (var i = 0; i < auths.length; i++)
        {
            let v = auths[i];

            let curTime = new Date();
            let newDate = new Date(v.date_added);
        
            let TimeSince = timeSince(newDate);
            $("#who_has_access").append("<tr>\
            <td>" + v.target_name + "</td>\
            <td>" + TimeSince + "(s) ago</td>\
            <td><button class='btn btn-danger btn-sm' onclick='confirmRemove(\"" + v.target_identifier + "\", \"" + v.target_name + "\")'>Remove</button></td>\
            ");
        }
        $("#editAccountModal").modal('toggle');
    } else {
        TropixNotification("Nobody has access to your bank!", "error");
        return;
    }
}

Listeners["refresh_accounts"] = function() {
    for (var key in ValidAccounts) {

       let data = ValidAccounts[key];

        if (data && data === "business" || data === "organization")
        {
            ValidAccounts[key] = null;
            $("#" + key).remove();
            $('#Player_Accounts').find('br:last-child').remove();
        }
    }
}

Listeners["update_transactions"] = function(data)
{
    let transactions = JSON.parse(data.transactions);

    for (var i = 0; i < transactions.length; i++)
    {
        let tTbl = transactions[i];
        AddTransaction(tTbl.trans_id, tTbl.account, tTbl.amount, tTbl.date, tTbl.message, tTbl.trans_type, tTbl.receiver || "Unknown", playerName, tTbl.citizenid);
    }

    $('.cash').text("Cash: $"+data.cash.toLocaleString()+".00")
}

Listeners["refresh_balances"] = function(data) {
    let tbl = JSON.parse(data.accounts);
    for (var i = 0; i < tbl.length; i++)
    {
        let tTbl = tbl[i];

        let account_name = (tTbl.type === "business" && tTbl.name || tTbl.type === "organization" && tTbl.name || "Personal Account");
        let temp_name = account_name.replace(/"|'/g,'');
        let temp_Name = account_name.replace(/\s+/g, '');

        if (ValidAccounts[temp_Name])
        {
            UpdateAccount(temp_Name, tTbl.amount)
        }

    }
}

function closeNotification(br)
{
    if (br)
        return $("#editAccountModal").modal('toggle');

    $("#notificationModal").modal('toggle');
}

$(function()
{
    window.addEventListener('message', event => {
        let type = event.data.type;

        if (Listeners[type])
            Listeners[type](event.data);
    })

    document.onkeyup = function(data){
        if (data.which == 27){
            if ($(".deposit-container").is(':visible')) {
                $('.deposit-container').css({'display':'none'});
                $('.items-view').css({'display':'none'});
                $('.full-white').css({'display':'none'});
            } else if ($(".transfer-container").is(':visible')) {
                $('.transfer-container').css({'display':'none'});
                $('.items-view').css({'display':'none'});
                $('.full-white').css({'display':'none'});
            } else if ($(".withdraw-container").is(':visible')) {
                $('.withdraw-container').css({'display':'none'});
                $('.items-view').css({'display':'none'});
                $('.full-white').css({'display':'none'});
            } else
                $("#bankui").fadeTo(10, 0, () => $.post("https://" + folder_name + "/CloseATM", JSON.stringify({})));

            $('#bankui').focus();
        }
    }

})

function CloseUIPls()
{
    if ($("#editAccountModal").is(':visible'))
        $("#editAccountModal").modal('toggle');
    if ($("#notificationModal").is(':visible'))
        $("#notificationModal").modal('toggle');

    $("#bankui").fadeTo(10, 0, () => $.post("https://" + folder_name + "/CloseATM", JSON.stringify({})));
}


$(function()
{
    $("bankui").hide();
})
