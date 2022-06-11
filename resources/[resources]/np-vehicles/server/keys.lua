local VehicleList = {}

local VehicleKeys = {}

QBCore.Functions.CreateCallback('vehiclekeys:CheckHasKey', function(source, cb, plate)
    local Player = QBCore.Functions.GetPlayer(source)
    cb(CheckOwner(plate, Player.PlayerData.citizenid))
end)

RegisterServerEvent('vehiclekeys:server:StoreKeys')
AddEventHandler('vehiclekeys:server:StoreKeys', function(plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not VehicleKeys[Player.PlayerData.citizenid] then
        VehicleKeys[Player.PlayerData.citizenid] = {}
    end
    VehicleKeys[Player.PlayerData.citizenid][plate] = true
end)

RegisterServerEvent('vehiclekeys:server:fetchKeys')
AddEventHandler('vehiclekeys:server:fetchKeys', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if VehicleKeys[Player.PlayerData.citizenid] then
        TriggerClientEvent('vehiclekeys:client:restoreKeys', src, VehicleKeys[Player.PlayerData.citizenid])
    end
end)

RegisterServerEvent('vehiclekeys:server:GiveVehicleKeys')
AddEventHandler('vehiclekeys:server:GiveVehicleKeys', function(target, plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(target)

    if Player ~= nil then
        TriggerClientEvent('QBCore:Notify', src, 'You have given your keys to #'..target)
        TriggerClientEvent('QBCore:Notify', target, 'You have been given keys')
        TriggerClientEvent('vehiclekeys:client:SetOwner', target, plate)
    else
    end
end)

RegisterNetEvent('vehiclekeys:server:LockVehicle', function(vehNID, lockStatus)
    SetVehicleDoorsLocked(NetworkGetEntityFromNetworkId(vehNID), lockStatus)
end)

QBCore.Commands.Add("engine", "Toggle motor on/off", {}, false, function(source, args)
	TriggerClientEvent('vehiclekeys:client:ToggleEngine', source)
end)

QBCore.Commands.Add("givekeys", "Give your vehicle keys", {}, false, function(source, args)
	local src = source
    TriggerClientEvent('vehiclekeys:client:GiveKeys', src)
end)

QBCore.Commands.Add("forcekeys", "Forces Vehicle Keys", {}, false, function(source, args)
	local src = source
    TriggerClientEvent('vehiclekeys:client:SetOwner', src)
end, "god")

QBCore.Functions.CreateUseableItem("lockpick", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, false)
end)

QBCore.Functions.CreateUseableItem("advancedlockpick", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("lockpicks:UseLockpick", source, true)
end)
