local QBCore = exports['qb-core']:GetCoreObject()

SimpleBanking = false

RegisterServerEvent('kn-burgershot:server:BillPlayer', function(amount, id)
    local src = source
    if not src then return end

    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local playerPed = GetPlayerPed(src)
 
    local Target = QBCore.Functions.GetPlayer(tonumber(id))
    if not Target then return end

    local tSrc = Target.PlayerData.source
    local targetPed = GetPlayerPed(tSrc)
    local dist = #(GetEntityCoords(playerPed) - GetEntityCoords(targetPed))
    local half = math.ceil(tonumber(amount) / 100 * 50) -- gives player half of the money and deposits half of the money to society
    local default = math.ceil(tonumber(amount) / 100 * 75) -- fives player 75% of the total amount

    if tSrc == src then return end

    if dist < 5 then
        if Target.PlayerData["money"]["cash"] >= tonumber(amount) then
            Target.Functions.RemoveMoney('cash', tonumber(amount))
            if SimpleBanking then				
                --TriggerEvent("qb-bossmenu:server:addAccountMoney", "burgershot", half)
				TriggerEvent('qb-banking:society:server:DepositMoney', src, half, "burgershot")
                Player.Functions.AddMoney('cash', half)
            else
                --TriggerEvent("qb-bossmenu:server:addAccountMoney", "burgershot", half)
				TriggerEvent('qb-banking:society:server:DepositMoney', src, half, "burgershot")
                Player.Functions.AddMoney('cash', half)
                --Player.Functions.AddMoney('cash', default)
            end
        else
            TriggerClientEvent('QBCore:Notify', tSrc, "Not enough money.", 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "No player is nearby.", 'error')
    end
end)

RegisterServerEvent('kn-burgershot:giveitem')
AddEventHandler('kn-burgershot:giveitem', function(item, count)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player ~= nil then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1) 
        player.Functions.AddItem(item, count)
    end
end)

RegisterServerEvent('kn-burgershot:getmurder')
AddEventHandler('kn-burgershot:getmurder', function(item, count)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    info.mealid = math.random(11111,99999)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1) 
    Player.Functions.AddItem(item, count, false, info)
end)

RegisterServerEvent('kn-burgershot:deleteitem')
AddEventHandler('kn-burgershot:deleteitem', function(item, count)
    local src = source
    local player = QBCore.Functions.GetPlayer(src)
    if player ~= nil then
        if player.Functions.GetItemByName(item) ~= nil then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove", 1) 
            player.Functions.RemoveItem(item, count)
        else
            TriggerClientEvent("QBCore:Notify", source, "You are missing certain ingredients!", "error")
        end
    end
end)

QBCore.Functions.CreateCallback('kn-burgershot:checkitem', function(source, cb, item)
    local player = QBCore.Functions.GetPlayer(source)
    local GetItem = player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        cb(true)
    else
        activity = 0
        TriggerClientEvent("QBCore:Notify", source, "You are missing certain ingredients!", "error")
    end
end)

QBCore.Functions.CreateCallback('kn-burgershot:checkitem2', function(source, cb, item)
    local player = QBCore.Functions.GetPlayer(source)
    local GetItem = player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        cb(true)
    else
        activity = 0
        TriggerClientEvent("QBCore:Notify", source, "You are missing certain ingredients!", "error")
    end
end)

QBCore.Functions.CreateCallback('kn-burgershot:checkitem3', function(source, cb, item)
    local player = QBCore.Functions.GetPlayer(source)
    local GetItem = player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        cb(true)
    else
        activity = 0
        TriggerClientEvent("QBCore:Notify", source, "You are missing certain ingredients!", "error")
    end
end)

QBCore.Functions.CreateCallback('kn-burgershot:checkitem4', function(source, cb, item)
    local player = QBCore.Functions.GetPlayer(source)
    local GetItem = player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        cb(true)
    else
        activity = 0
        TriggerClientEvent("QBCore:Notify", source, "You are missing certain ingredients!", "error")
    end
end)

QBCore.Functions.CreateCallback('kn-burgershot:checkitem5', function(source, cb, item)
    local player = QBCore.Functions.GetPlayer(source)
    local GetItem = player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        cb(true)
    else
        activity = 0
        TriggerClientEvent("QBCore:Notify", source, "You are missing certain ingredients!", "error")
    end
end)

QBCore.Functions.CreateCallback('kn-burgershot:checkitem6', function(source, cb, item)
    local player = QBCore.Functions.GetPlayer(source)
    local GetItem = player.Functions.GetItemByName(item)
    if GetItem ~= nil then
        cb(true)
    else
        activity = 0
        TriggerClientEvent("QBCore:Notify", source, "You are missing certain ingredients!", "error")
    end
end)

QBCore.Functions.CreateUseableItem("murdermeal", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-items:client:use:murder-meal", source, item.info.mealid)
end)