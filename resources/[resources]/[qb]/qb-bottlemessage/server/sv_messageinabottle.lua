local QBCore = exports['qb-core']:GetCoreObject()

local function currentTime() -- Use for my own logging system. (just ignore this)
    local time = os.date("!*t", os.time())

    return time.year.."-"..time.month.."-"..time.day.." "..time.hour..":"..time.min..":"..time.sec
end

RegisterServerEvent('randol_mib:server:usebottle') 
AddEventHandler("randol_mib:server:usebottle", function ()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem("bottlemessage", 1)
    Player.Functions.AddItem("message", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["message"], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["bottlemessage"], "remove")
end)


QBCore.Functions.CreateUseableItem("bottlemessage", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
	TriggerClientEvent('randol_mib:client:pulloutmessage', source)
    end
end)

QBCore.Functions.CreateUseableItem("message", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) ~= nil then
 	TriggerClientEvent('randol_mib:client:setloc', source)
    end
end)

RegisterServerEvent('randol_mib:server:lootchest', function ()
    local source = source
    local srcped = GetPlayerPed(source)
    local pedcoords = GetEntityCoords(srcped)
    local treasurechest = vector3(3062.01, 2219.07, 2.62)
	local Player = QBCore.Functions.GetPlayer(source)

    if #(pedcoords - treasurechest) > 5.0 then -- To stop cheaters from being able to load in to your server and trigger the reward event.
    -- Insert Anti-Cheat log here yourself.
        return
    end

    Player.Functions.RemoveItem("message", 1)
    Player.Functions.AddMoney('cash', 4500)
    Player.Functions.AddItem('weapon_vintagepistol', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["weapon_vintagepistol"], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['message'], "remove")
    -- Insert Reward log here yourself or don't..

    Wait(500)

    for i, v in ipairs(Config.Items) do
        local amt = math.random(5, 8)
        Player.Functions.AddItem(v, amt)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[v], 'add')
        -- Insert Reward log here yourself or don't..
    end

    TriggerClientEvent('QBCore:Notify', source, "You found lots of loot, check your pockets!", 'success', 6000)
    TriggerClientEvent('randol_mib:client:removeblip', source)
end)
