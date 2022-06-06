local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("bowlingball", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent('jd-bowling:client:itemused', source)
end)


QBCore.Functions.CreateCallback('jd-bowling:purchaseItem', function(source, cb , key , lane)
    local Player = QBCore.Functions.GetPlayer(source)
    if(lane == true) then
        Player.Functions.RemoveMoney("cash", 25)
        local info = {
            lane = key
        }
        Player.Functions.AddItem('bowlingreceipt', 1, false, info)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["bowlingreceipt"], "add")
        cb(true)
    else
        cb(true)
        Player.Functions.RemoveMoney("cash", 50)
        Player.Functions.AddItem('bowlingball', 1, false, info)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["bowlingball"], "add")
    end

end)
QBCore.Functions.CreateCallback('jd-bowling:getLaneAccess', function(source, cb , currentid)
 local Player = QBCore.Functions.GetPlayer(source)

    local item = Player.Functions.GetItemByName('bowlingreceipt')
    if item ~= nil then
    if(item.amount == 0) then
        cb(false)
    else
    if(item.info.lane == currentid) then
            cb(true)
        end
    end
else
    TriggerClientEvent('QBCore:Notify', source, "You need a ticket", 'error')
end
end)

RegisterServerEvent("jd-bowling:RemoveItem")
AddEventHandler("jd-bowling:RemoveItem" , function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('bowlingball', 1)
    Player.Functions.RemoveItem('bowlingreceipt', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["bowlingball"], "remove")
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["bowlingreceipt"], "remove")
end)


RegisterServerEvent("jd-bowling:Removerecepit")
AddEventHandler("jd-bowling:Removerecepit" , function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('bowlingreceipt', 1)
    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["bowlingreceipt"], "remove")
end)