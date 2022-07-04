local QBCore = exports['qb-core']:GetCoreObject()


local blackout = false
RegisterNetEvent('jd:explotiontype')
AddEventHandler('jd:explotiontype', function()
    if #(vector3(712.9213, 164.0436, 80.754) - GetEntityCoords(PlayerPedId())) <= 35 and not blackout then
        blackout = true
        TriggerServerEvent('jd:server:elektrikkes', true)
        TriggerEvent("chatMessage", "[LS Water & Power]", "warning", "City power is currently out, we're working on restoring it!")
        Wait(1800000) -- 30 minutes
        TriggerServerEvent('jd:server:elektrikkes', false)
    end
end)

RegisterNetEvent('jd:client:elektrikkes')
AddEventHandler('jd:client:elektrikkes', function(durum)
    if durum then
        AddExplosion(712.9213, 164.0436, 80.754, 29, 7.5, 2, 0, 1065353216, 0)
        Wait(500)
        AddExplosion(695.8688, 157.2403, 83.940, 29, 7.5, 2, 0, 1065353216, 0)
        Wait(500)
        AddExplosion(680.5214, 164.1465, 83.940, 29, 7.5, 2, 0, 1065353216, 0)
        AddExplosion(665.3880, 123.9860, 83.940, 29, 7.5, 2, 0, 1065353216, 0)
        AddExplosion(690.4120, 141.7257, 83.940, 29, 7.5, 2, 0, 1065353216, 0)
        Wait(500)
        AddExplosion(680.4738, 115.9748, 83.940, 29, 7.5, 2, 0, 1065353216, 0)
        Wait(500)
        AddExplosion(706.7719, 116.2826, 83.940, 29, 7.5, 2, 0, 1065353216, 0)
        AddExplosion(701.2233, 101.3244, 83.929, 29, 7.5, 2, 0, 1065353216, 0)
        AddExplosion(710.6165, 125.4014, 83.929, 29, 7.5, 2, 0, 1065353216, 0)
        CreateThread(function()
            while true do
                SetArtificialLightsState(true)
                Wait(0)
            end
        end)
    elseif not durum then
        CreateThread(function()
            while true do
                SetArtificialLightsState(false)
                Wait(0)
            end
        end)
    end
end)

RegisterNetEvent('restore:blackout')
AddEventHandler('restore:blackout', function(blackout)
    Wait(750000) -- 12.5 minutes before itll be restored
    SetArtificialLightsStateAffectsVehicles(false)
    SetArtificialLightsState(false)
end)

RegisterNetEvent('restore:blackoutPD')
AddEventHandler('restore:blackoutPD', function(blackout)
    exports["memorygame"]:thermiteminigame(10, 3, 3, 10,
    function() -- success
        QBCore.Functions.Progressbar('washing_hands', 'Restoring Power', 45000, false, false, {
            disableMovement = true, --
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "mp_arresting", 
            anim = "a_uncuff", 
            flags = 8,
        }, {}, {}, function()
            TriggerEvent('QBCore:Notify', "You've restored the power!", 'success')
        end, function() -- Cancel
            TriggerServerEvent('jd:server:elektrikkes', false)
            SetArtificialLightsStateAffectsVehicles(false) 
            SetArtificialLightsState(false)
        end)
    end,
    function() -- failure
        TriggerEvent('QBCore:Notify', "Failed", 'error')
    end)   
end)

exports['qb-target']:AddCircleZone("restorepower", vector3(713.19, 164.7, 80.75), 0.51, {
    name = "restorepower",
    heading = 189.0,
    debugPoly = false,
    minZ = 80.55,
    maxZ = 80.95,
    }, {
        options = {
            {
                type = "client",
                event = "restore:blackoutPD",
                icon = "fas fa-circle",
                label = "Restore Power",
                job = "police",
            },
        },
        distance = 2.5
})


exports('checkblackout', function()
    return blackout
end)
