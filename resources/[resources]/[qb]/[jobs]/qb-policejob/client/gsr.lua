local QBCore = exports['qb-core']:GetCoreObject()

local hasShot = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(Player)
    PlayerData = Player
end)

CreateThread(function()
    while true do
        Wait(0)
        ped = PlayerPedId()
        if IsPedShooting(ped) then
            TriggerServerEvent('GSR:SetGSR', timer)
            hasShot = true
            Wait(Config.gsrUpdate)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(2000)
        if Config.waterClean and hasShot then
            ped = PlayerPedId()
            if IsEntityInWater(ped) then
                TriggerEvent('QBCore:Notify', 'You begin cleaning off the Gunshot Residue... stay in the water.')
                Wait(100)
                if IsEntityInWater(ped) then
                    hasShot = false
                    TriggerServerEvent('GSR:Remove')
                    TriggerEvent('QBCore:Notify', 'You washed off all the Gunshot Residue in the water.', 'success')
                    else
                    TriggerEvent('QBCore:Notify', 'You left the water too early and did not wash off the gunshot residue.', 'error')
                    end
                Wait(Config.waterCleanTime)
            end
        end
    end
end)

function status()
    if hasShot then
        QBCore.Functions.TriggerCallback('GSR:Status', function(cb)
            if not cb then
                hasShot = false
            end
        end)
    end
end

function updateStatus()
    status()
    SetTimeout(Config.gsrUpdateStatus, updateStatus)
end

updateStatus()