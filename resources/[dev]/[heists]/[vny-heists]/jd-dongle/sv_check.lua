
local QBCore = exports['qb-core']:GetCoreObject()

local data = {
    ['jeweler'] = "Available",
    ['mazebank'] = "Available",
    ['greatocean'] = "Available",
    ['harmony'] = "Available",
    ['paleto'] = "Available",
    ['uppervault'] = "Available",
    ['lowervault'] = "Available",
}

QBCore.Functions.CreateCallback('jd-check:sorguhocam', function(source, cb)
    cb(data)
end)

RegisterServerEvent('server-update', function(gelendata, textdata)
    data[gelendata] = textdata
end)


RegisterServerEvent("itemverserverside", function (itemname)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    print(json.encode(xPlayer.PlayerData.metadata))
    local Parabirimi = xPlayer.PlayerData.metadata.crypto.bitcoin
    local main = xPlayer.PlayerData.metadata.crypto
    if itemname == "greenlaptop" then
        if Parabirimi >= 100 then
            xPlayer.Functions.AddItem(itemname, 1)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[itemname], "add")
            main["bitcoin"] = Parabirimi - 100
            xPlayer.Functions.SetMetaData("crypto", main)
        else
            TriggerClientEvent("QBCore:Notify", source, "You don't have 100 cryptos", "error")
        end
    elseif itemname == "bluelaptop" then
        if Parabirimi >= 250 then
            xPlayer.Functions.AddItem(itemname, 1)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[itemname], "add")
            main["bitcoin"] = Parabirimi - 250
            xPlayer.Functions.SetMetaData("crypto", main)
        else
            TriggerClientEvent("QBCore:Notify", source, "You don't have 250 cryptos", "error")
        end
    elseif itemname == "redlaptop" then
        if Parabirimi >= 500 then
            xPlayer.Functions.AddItem(itemname, 1)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[itemname], "add")
            main["bitcoin"] = Parabirimi - 500
            xPlayer.Functions.SetMetaData("crypto", main)
        else
            TriggerClientEvent("QBCore:Notify", source, "You don't have 500 cryptos", "error")
        end
    elseif itemname == "goldlaptop" then
        if Parabirimi >= 1500 then
            xPlayer.Functions.AddItem(itemname, 1)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[itemname], "add")
            main["bitcoin"] = Parabirimi - 1500
            xPlayer.Functions.SetMetaData("crypto", main)
        else
            TriggerClientEvent("QBCore:Notify", source, "You don't have 1500 cryptos", "error")
        end
    elseif itemname == "golddongle" then
        if Parabirimi >= 100 then
            xPlayer.Functions.AddItem(itemname, 1)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[itemname], "add")
            main["bitcoin"] = Parabirimi - 100
            xPlayer.Functions.SetMetaData("crypto", main)
        else
            TriggerClientEvent("QBCore:Notify", source, "You don't have 100 cryptos", "error")
        end
    end
end)
