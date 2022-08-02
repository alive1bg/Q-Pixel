local QBCore = exports['qb-core']:GetCoreObject()

Doors = {
    ["F1"] = {{loc = vector3(312.93, -284.45, 54.16), h = 160.91, txtloc = vector3(312.93, -284.45, 54.16), obj = nil, locked = true}, {loc = vector3(310.93, -284.44, 54.16), txtloc = vector3(310.93, -284.44, 54.16), state = nil, locked = true}},
    ["F2"] = {{loc = vector3(148.76, -1045.89, 29.37), h = 158.54, txtloc = vector3(148.76, -1045.89, 29.37), obj = nil, locked = true}, {loc = vector3(146.61, -1046.02, 29.37), txtloc = vector3(146.61, -1046.02, 29.37), state = nil, locked = true}},
    ["F3"] = {{loc = vector3(-1209.66, -335.15, 37.78), h = 213.67, txtloc = vector3(-1209.66, -335.15, 37.78), obj = nil, locked = true}, {loc = vector3(-1211.07, -336.68, 37.78), txtloc = vector3(-1211.07, -336.68, 37.78), state = nil, locked = true}},
    ["F4"] = {{loc = vector3(-2957.26, 483.53, 15.70), h = 267.73, txtloc = vector3(-2957.26, 483.53, 15.70), obj = nil, locked = true}, {loc = vector3(-2956.68, 481.34, 15.70), txtloc = vector3(-2956.68, 481.34, 15.7), state = nil, locked = true}},
    ["F5"] = {{loc = vector3(-351.97, -55.18, 49.04), h = 159.79, txtloc = vector3(-351.97, -55.18, 49.04), obj = nil, locked = true}, {loc = vector3(-354.15, -55.11, 49.04), txtloc = vector3(-354.15, -55.11, 49.04), state = nil, locked = true}},
    ["F6"] = {{loc = vector3(1174.24, 2712.47, 38.09), h = 160.91, txtloc = vector3(1174.24, 2712.47, 38.09), obj = nil, locked = true}, {loc = vector3(1176.40, 2712.75, 38.09), txtloc = vector3(1176.40, 2712.75, 38.09), state = nil, locked = true}},
}

RegisterServerEvent("fleeca:startcheck")
AddEventHandler("fleeca:startcheck", function(bank)
    local _source = source
    local copcount = 0
    local players = QBCore.Functions.GetPlayers()

    for i = 1, #players do
        local player = QBCore.Functions.GetPlayer(players[i])
        if player.PlayerData.job.name == 'police' then
            copcount = copcount + 1
        end
    end

    local xPlayer = QBCore.Functions.GetPlayer(_source)
    local item = xPlayer.Functions.GetItemByName(Config.laptopItem)

    if copcount >= Config.mincops then
        if item then
            if not Config.Banks[bank].onaction == true then
                if (os.time() - Config.cooldown) > Config.Banks[bank].lastrobbed then
                    Config.Banks[bank].onaction = true

                    local chance = math.random(0,100)
                    if Config.laptopbreak < chance then
                        xPlayer.Functions.RemoveItem(Config.laptopItem, 1)
                    end
                    
                    TriggerClientEvent("fleeca:outcome", _source, true, bank)
                    TriggerClientEvent("fleeca:policenotify", -1, bank)
                else
                    TriggerClientEvent("fleeca:outcome", _source, false, "This bank has been robbed to recently. You need to wait "..math.floor((Config.cooldown - (os.time() - Config.Banks[bank].lastrobbed)) / 60)..":"..math.fmod((Config.cooldown - (os.time() - Config.Banks[bank].lastrobbed)), 60))
                end
            else
                TriggerClientEvent("fleeca:outcome", _source, false, "This bank is already being robbed.")
            end
        end
    else
        TriggerClientEvent("fleeca:outcome", _source, false, "There does not seem to be enough police in the city.")
    end
end)

RegisterServerEvent("fleeca:lootup")
AddEventHandler("fleeca:lootup", function(var, var2)
    TriggerClientEvent("fleeca:lootup_c", -1, var, var2)
end)

RegisterServerEvent("fleeca:toggleDoor")
AddEventHandler("fleeca:toggleDoor", function(key, state)
    Doors[key][1].locked = state
    TriggerClientEvent("fleeca:toggleDoor", -1, key, state)
end)

RegisterServerEvent("fleeca:toggleVault")
AddEventHandler("fleeca:toggleVault", function(key, state)
    Doors[key][2].locked = state
    TriggerClientEvent("fleeca:toggleVault", -1, key, state)
end)

RegisterServerEvent("fleeca:updateVaultState")
AddEventHandler("fleeca:updateVaultState", function(key, state)
    Doors[key][2].state = state
end)

RegisterServerEvent("fleeca:startLoot")
AddEventHandler("fleeca:startLoot", function(data, name, players)
    local _source = source

    for i = 1, #players, 1 do
        TriggerClientEvent("fleeca:startLoot_c", players[i], data, name)
    end
    TriggerClientEvent("fleeca:startLoot_c", _source, data, name)
end)

RegisterServerEvent("fleeca:stopHeist")
AddEventHandler("fleeca:stopHeist", function(name)
    TriggerClientEvent("fleeca:stopHeist_c", -1, name)
end)

RegisterServerEvent("fleeca:rewardBill")
AddEventHandler("fleeca:rewardBill", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local reward = math.random(Config.mincash, Config.maxcash)

    xPlayer.Functions.AddItem("markedbills", reward)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["markedbills"], "add")

    if Config.discardItems then
        TriggerClientEvent('QBCore:Notify', 'You discarded the counterfeit items')
        xPlayer.Functions.AddMoney('cash', math.random(Config.minDiscardCash, Config.maxDiscardCash))
    end
end)

RegisterServerEvent("fleeca:setCooldown")
AddEventHandler("fleeca:setCooldown", function(name)
    Config.Banks[name].lastrobbed = os.time()
    Config.Banks[name].onaction = false
    TriggerClientEvent("fleeca:resetDoorState", -1, name)
end)

RegisterServerEvent("fleeca:server:onaction")
AddEventHandler("fleeca:server:onaction", function(name)
    Config.Banks[name].onaction = false
end)

RegisterServerEvent("fleeca:server:available", function()
    local f1 = "Loading..."
    local f2 = "Loading..."
    local f3 = "Loading..."
    local f4 = "Loading..."
    local f5 = "Loading..."
    local f6 = "Loading..."

    if (os.time() - Config.cooldown) < Config.Banks.F1.lastrobbed then
        f1 = "Unavailable"
    elseif Config.Banks.F1.onaction == true then
        f1 = "Unavailable"
    else
        f1 = "Available"
    end

    if (os.time() - Config.cooldown) < Config.Banks.F2.lastrobbed then
        f2 = "Unavailable"
    elseif Config.Banks.F2.onaction == true then
        f2 = "Unavailable"
    else
        f2 = "Available"
    end

    if (os.time() - Config.cooldown) < Config.Banks.F3.lastrobbed then
        f3 = "Unavailable"
    elseif Config.Banks.F3.onaction == true then
        f3 = "Unavailable"
    else
        f3 = "Available"
    end

    if (os.time() - Config.cooldown) < Config.Banks.F4.lastrobbed then
        f4 = "Unavailable"
    elseif Config.Banks.F4.onaction == true then
        f4 = "Unavailable"
    else
        f4 = "Available"
    end

    if (os.time() - Config.cooldown) < Config.Banks.F5.lastrobbed then
        f5 = "Unavailable"
    elseif Config.Banks.F5.onaction == true then
        f5 = "Unavailable"
    else
        f5 = "Available"
    end

    if (os.time() - Config.cooldown) < Config.Banks.F6.lastrobbed then
        f6 = "Unavailable"
    elseif Config.Banks.F6.onaction == true then
        f6 = "Unavailable"
    else
        f6 = "Available"
    end

    Wait(100)
    TriggerClientEvent('fleeca:client:checkAvailability', -1, f1, f2, f3, f4, f5, f6)
end)

RegisterNetEvent('bennyPed:server:giveLaptop', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem(Config.laptopItem, 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.laptopItem], "add")
end)

QBCore.Functions.CreateCallback("fleeca:getBanks", function(source, cb)
    cb(Config.Banks, Doors)
end)

QBCore.Functions.CreateCallback("fleeca:canAfford", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local balance = Player.PlayerData.money["cash"] 

    if balance >= Config.laptopPrice then
        cb(true)
        Player.Functions.RemoveMoney('cash', Config.laptopPrice)
    else   
        cb(false)
    end
end)

QBCore.Functions.CreateUseableItem(Config.laptopItem, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(Config.laptopItem) then
        TriggerClientEvent("bank:client:useLaptop", src)
    end
end)