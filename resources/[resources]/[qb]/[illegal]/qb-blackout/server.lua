local QBCore = exports['qb-core']:GetCoreObject()

local Cooldown = false

players = {}
entities = {}

-- Syncing Server Side Events

RegisterNetEvent('qb-blackout:server:blackoutsync', function()
    TriggerClientEvent('qb-blackout:client:blackoutsync', -1)
end)

RegisterNetEvent('qb-blackout:server:restoresync', function()
    TriggerClientEvent('qb-blackout:client:restoresync', -1)
end)

RegisterNetEvent('qb-blackout:server:lightsoff', function()
    TriggerClientEvent('qb-blackout:client:lightsoff', -1)
end)

RegisterNetEvent('qb-blackout:server:lightson', function()
    TriggerClientEvent('qb-blackout:client:lightson', -1)
end)


-- Starting Cooldown

RegisterServerEvent('qb-blackout:server:startr', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)

        TriggerEvent('qb-blackout:server:coolout')
	end)

-- Minimum Cop Callback

QBCore.Functions.CreateCallback('qb-blackout:server:getCops', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

-- Cooldown

RegisterServerEvent('qb-blackout:server:coolout', function()
    Cooldown = true
    local timer = Config.Cooldown * 1000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            Cooldown = false
        end
    end
end)

QBCore.Functions.CreateCallback("qb-blackout:server:coolc",function(source, cb)
    if Cooldown then
        cb(true)
    else
        cb(false) 
    end
end)
