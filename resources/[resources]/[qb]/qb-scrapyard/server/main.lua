local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
        Wait(1000)
        GenerateVehicleList()
        Wait((1000 * 60) * 60)
    end
end)

RegisterNetEvent('qb-scrapyard:server:LoadVehicleList', function()
    local src = source
    TriggerClientEvent("qb-scapyard:client:setNewVehicles", src, Config.CurrentVehicles)
end)


QBCore.Functions.CreateCallback('qb-scrapyard:checkOwnerVehicle', function(source, cb, plate)
    local result = MySQL.Sync.fetchScalar("SELECT `plate` FROM `player_vehicles` WHERE `plate` = ?",{plate})
    if result then
        cb(false)
    else
        cb(true)
    end
end)


RegisterNetEvent('qb-scrapyard:server:ScrapVehicle', function(listKey)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.CurrentVehicles[listKey] ~= nil then
        for i = 1, math.random(3, 6), 1 do
            local item = Config.Items[math.random(1, #Config.Items)]
            Player.Functions.AddItem(item, math.random(1, 2))
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add')
            Wait(500)
        end
        local Luck = math.random(1, 8)
        local Odd = math.random(1, 8)
        if Luck == Odd then
            local random = math.random(2, 5)
            Player.Functions.AddItem("chop-nos", random)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chop-nos"], 'add')

        end
        Config.CurrentVehicles[listKey] = nil
        TriggerClientEvent("qb-scapyard:client:setNewVehicles", -1, Config.CurrentVehicles)
    end
end)

function GenerateVehicleList()
    Config.CurrentVehicles = {}
    for i = 1, 40, 1 do
        local randVehicle = Config.Vehicles[math.random(1, #Config.Vehicles)]
        if not IsInList(randVehicle) then
            Config.CurrentVehicles[i] = randVehicle
        end
    end
    TriggerClientEvent("qb-scapyard:client:setNewVehicles", -1, Config.CurrentVehicles)
end

function IsInList(name)
    local retval = false
    if Config.CurrentVehicles ~= nil and next(Config.CurrentVehicles) ~= nil then
        for k, v in pairs(Config.CurrentVehicles) do
            if Config.CurrentVehicles[k] == name then
                retval = true
            end
        end
    end
    return retval
end

RegisterNetEvent("qb-scrapyard:server:ExchangeItems", function(itemremove, item, amountremove, amount)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName(itemremove) then
        Player.Functions.RemoveItem(itemremove, amountremove)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemremove], "remove", amountremove)
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add", amount)
    else
        TriggerClientEvent("QBCore:Notify", source, "You do not have enough of that item.", "error")
    end
end)
