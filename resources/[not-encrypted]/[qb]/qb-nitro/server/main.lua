local QBCore = exports['qb-core']:GetCoreObject()
local VehicleNitrous = {}

QBCore.Functions.CreateUseableItem("nitrous", function(source, item)
    TriggerClientEvent('qb-nitro:client:ApplyNitrous', source)
end)

RegisterNetEvent('qb-nitro:server:LoadNitrous', function(Plate)
    VehicleNitrous[Plate] = {
        hasnitro = true,
        level = 100,
    }
    TriggerClientEvent('qb-nitro:client:LoadNitrous', -1, Plate)
    TriggerClientEvent('hud:client:UpdateNitrous', -1, VehicleNitrous[Plate].hasnitro, VehicleNitrous[Plate].level, false)
	TriggerEvent('qb-nitro:database:LoadNitro', Plate, 100)
end)

RegisterNetEvent('qb-nitro:server:SyncFlames', function(netId)
    TriggerClientEvent('qb-nitro:client:SyncFlames', -1, netId, source)
end)

RegisterNetEvent('qb-nitro:server:UnloadNitrous', function(Plate)
    VehicleNitrous[Plate] = nil
    TriggerClientEvent('qb-nitro:client:UnloadNitrous', -1, Plate)
    TriggerEvent('qb-nitro:database:UnloadNitro', Plate)
end)

RegisterNetEvent('qb-nitro:server:UpdateNitroLevel', function(Plate, level)
    VehicleNitrous[Plate].level = level
    TriggerClientEvent('qb-nitro:client:UpdateNitroLevel', -1, Plate, level)
    TriggerEvent('qb-nitro:database:UpdateNitroLevel', Plate, level)
end)

RegisterNetEvent('qb-nitro:server:StopSync', function(plate)
    TriggerClientEvent('qb-nitro:client:StopSync', -1, plate)
end)

QBCore.Functions.CreateCallback('qb-nitro:GetNosLoadedVehs', function(source, cb)
	local result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE hasnitro = ?', {1})
	if result[1] then
		for k, v in pairs(result) do
			if v["hasnitro"] == 1 then
				VehicleNitrous[v["plate"]] = { hasnitro = v["hasnitro"], level = tonumber(v["noslevel"]), }
				TriggerClientEvent('qb-nitro:client:LoadNitrous', -1, tostring(v["plate"]))
				TriggerClientEvent('hud:client:UpdateNitrous', -1, VehicleNitrous[result[k]["plate"]].hasnitro, VehicleNitrous[result[k]["plate"]].level, false)
			end
		end
	end
	cb(VehicleNitrous)
end)

QBCore.Functions.CreateCallback('qb-nitro:GetNosLoaded', function(source, cb, plate)
	local result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE plate = ?', {plate})
	if result[1].hasnitro then
		for k, v in pairs(result) do
			if v["hasnitro"] == 1 then
				VehicleNitrous[result[k]["plate"]] = { hasnitro = true, level = tonumber(result[k]["noslevel"]), }
				TriggerClientEvent('qb-nitro:client:LoadNitrous', -1, tostring(result[k]["plate"]))
				TriggerClientEvent('hud:client:UpdateNitrous', -1, VehicleNitrous[result[k]["plate"]].hasnitro, VehicleNitrous[result[k]["plate"]].level, false)
			end
		end
	end
	cb(VehicleNitrous)
end)

RegisterNetEvent('qb-nitro:database:LoadNitro', function(plate, level)
	MySQL.Async.execute('UPDATE player_vehicles SET noslevel = ? WHERE plate = ?', {100, plate})
	MySQL.Async.execute('UPDATE player_vehicles SET hasnitro = ? WHERE plate = ?', {1, plate})
end)

RegisterNetEvent('qb-nitro:database:UnloadNitro', function(plate)
	MySQL.Async.execute('UPDATE player_vehicles SET noslevel = ? WHERE plate = ?', {0, plate}) 
	MySQL.Async.execute('UPDATE player_vehicles SET hasnitro = ? WHERE plate = ?', {0, plate}) 
end)

RegisterNetEvent('qb-nitro:database:UpdateNitroLevel', function(plate, level)
	MySQL.Async.execute('UPDATE player_vehicles SET noslevel = ? WHERE plate = ?', {level, plate})
end)

RegisterNetEvent('qb-nitro:server:SyncPurge', function(netId, enabled)
	for k, v in pairs(QBCore.Functions.GetPlayers()) do
		local P = QBCore.Functions.GetPlayer(v)
		TriggerClientEvent('qb-nitro:client:SyncPurge', P.PlayerData.source, netId, enabled)
	end
end)

RegisterNetEvent('qb-nitro:server:SyncFlame', function(netId, scale)
	for k, v in pairs(QBCore.Functions.GetPlayers()) do
		local P = QBCore.Functions.GetPlayer(v)
		TriggerClientEvent('qb-nitro:client:SyncFlame', P.PlayerData.source, netId, scale)
	end
end)