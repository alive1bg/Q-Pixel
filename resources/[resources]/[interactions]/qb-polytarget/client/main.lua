QBCore = exports['qb-core']:GetCoreObject()
local doctorCount = 0
local PlayerData = {}
local PlayerJob = {}
local onDuty = false

AddEventHandler('onResourceStart', function(resource)
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = PlayerData.job
    onDuty = PlayerJob.onduty
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = PlayerData.job
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

CreateThread(function()
    exports["qb-polyzone"]:AddBoxZone("votecabinui", vector3(-542.11, -180.91, 38.23), 4.7, 1.6, {
        name="votecabinui",
        heading=30,
        debugPoly = false,
        minZ=37.23,
        maxZ=39.63
    })

    exports["qb-polyzone"]:AddBoxZone("6strtunershopui", vector3(144.94, -3030.44, 7.04), 6.2, 3.6, {
        name="6strtunershopui",
        heading=0,
        debugPoly = true,
        minZ=6.04,
        maxZ=8.04
    })

    exports["qb-polyzone"]:AddBoxZone("pillboxcheckinui", vector3(307.0, -595.09, 43.28), 1.8, 1.8, {
        name="pillboxcheckinui",
        heading=340,
        debugPoly = true,
        minZ=42.28,
        maxZ=44.68
    })

    exports["qb-polyzone"]:AddBoxZone("bennysrepairui", vector3(-39.1, -1053.51, 28.4), 6.8, 4.8, {
        name="bennysrepairui",
        heading=339,
        debugPoly = true,
        minZ=27.4,
        maxZ=31.2
    })

    exports["qb-polyzone"]:AddBoxZone("bennysrepair2ui", vector3(-32.22, -1066.17, 28.4), 9.6, 5.6, {
        name="bennysrepair2ui",
        heading=340,
        debugPoly = true,
        minZ=27.4,
        maxZ=30.4
    })

    exports["qb-polyzone"]:AddBoxZone("tunerrepairui", vector3(124.68, -3047.27, 7.04), 5.8, 7.8, {
        name="tunerrepairui",
        heading=0,
        debugPoly = true,
        minZ=6.04,
        maxZ=8.84
    })

    exports["qb-polyzone"]:AddBoxZone("tunerstashui", vector3(128.61, -3013.53, 7.04), 1.4, 2.8, {
        name="tunerstashui",
        heading=0,
        debugPoly = true,
        minZ=6.04,
        maxZ=9.04
    })

    exports["qb-polyzone"]:AddBoxZone("tunerdutyui", vector3(126.09, -3007.98, 7.04), 1.2, 1, {
        name="tunerdutyui",
        heading=0,
        debugPoly = true,
        minZ=6.04,
        maxZ=8.44
    })

    exports["qb-polyzone"]:AddBoxZone("tunerbossui", vector3(124.81, -3014.03, 7.04), 1.2, 1.4, {
        name="tunerbossui",
        heading=0,
        debugPoly = true,
        minZ=6.04,
        maxZ=8.04
    })

    exports["qb-polyzone"]:AddBoxZone("hayesrepairui", vector3(-1411.4, -442.37, 35.91), 3.0, 7.0, {
        name="hayesrepairui",
        heading=302,
        debugPoly = true,
        minZ=34.91,
        maxZ=37.11
    })

    exports["qb-polyzone"]:AddBoxZone("hayesstashui", vector3(-1410.19, -448.17, 35.91), 1.4, 1.8, {
        name="hayesstashui",
        heading=32,
        debugPoly = true,
        minZ=34.91,
        maxZ=37.11
    })

    exports["qb-polyzone"]:AddBoxZone("hayesdutyui", vector3(-1429.84, -454.46, 35.91), 3.4, 3, {
        name="hayesdutyui",
        heading=32,
        debugPoly = false,
        minZ=34.91,
        maxZ=36.91
    })

    exports["qb-polyzone"]:AddBoxZone("hayesbossui", vector3(-1427.88, -458.42, 35.91), 2.0, 1.2, {
        name="hayesbossui",
        heading=32,
        debugPoly = true,
        minZ=34.91,
        maxZ=37.11
    })

    exports["qb-polyzone"]:AddBoxZone("tunerwheelfitment", vector3(135.97, -3030.48, 7.04), 3.55, 6.2, {
        name="tunerwheelfitment",
        heading=270,
        debugPoly = true,
        minZ=6.04,
        maxZ=8.24
    })

    exports["qb-polyzone"]:AddBoxZone("policerepair", vector3(452.08, -975.89, 25.7), 4.6, 12.4, {
        name="policerepair",
        heading=0,
        debugPoly = true,
        minZ=24.7,
        maxZ=28.1
    })
end)

RegisterNetEvent('qb-polyzone:enter')
AddEventHandler('qb-polyzone:enter', function(name)
    local InVehicle = IsPedInAnyVehicle(PlayerPedId())
    if name == "votecabin" then
        --if not InVehicle then
            inVoteCabin = true
            exports['qb-ui']:showInteraction('Vote Cabin')
        --end
    elseif name == "policerepair" then
        if InVehicle then
            if PlayerJob.name == "police" and onDuty then
                exports['qb-ui']:showInteraction("Bennys")
            end
        end
    elseif name == "6strtunershopui" then
        if InVehicle then
            if PlayerJob.name == "tuner" and onDuty then
                exports['qb-ui']:showInteraction("6STR Tuner Shop")
            end
        end
    elseif name == "tunerwheelfitment" then
        if InVehicle then
            if PlayerJob.name == 'tuner' and PlayerJob.grade.level == 4 and onDuty then
                exports['qb-ui']:showInteraction("[E] Adjust Wheelfitmet")
            end
        end
    elseif name == "pillboxcheckinui" then
        if doctorCount >= Config.MinimalDoctors then
            exports['qb-ui']:showInteraction("Call Doctor")
        else
            exports['qb-ui']:showInteraction('Check In')
        end
    elseif name == "bennysrepairui" then
        if InVehicle then
            exports['qb-ui']:showInteraction("Bennys")
        end
    elseif name == "bennysrepair2ui" then
        if InVehicle then
            exports['qb-ui']:showInteraction("Bennys")
        end
    elseif name == "tunerrepairui" then
        if InVehicle then
            if PlayerJob.name == "tuner" and onDuty then
                exports['qb-ui']:showInteraction("Repair Station")
            end
        end
    elseif name == "tunerstashui" then
        if PlayerJob.name == "tuner" and onDuty then
            exports['qb-ui']:showInteraction("[E] Stash")
        end
    elseif name == "tunerdutyui" then
        if PlayerJob.name == "tuner" then
            exports['qb-ui']:showInteraction("Duty")
        end
    elseif name == "tunerbossui" then
        if PlayerJob.name == 'tuner' and PlayerJob.grade.level == 4 then
            exports['qb-ui']:showInteraction("Boss Office")
        end
    elseif name == "hayesrepairui" then
        if InVehicle then
            if PlayerJob.name == "hayesauto" and onDuty then
                exports['qb-ui']:showInteraction("Repair Station")
            end
        end
    elseif name == "hayesstashui" then
        if PlayerJob.name == "hayesauto" and onDuty then
            exports['qb-ui']:showInteraction("[E] Stash")
        end
    elseif name == "hayesdutyui" then
        if PlayerJob.name == "hayesauto" then
            exports['qb-ui']:showInteraction("Duty")
        end
    elseif name == "hayesbossui" then
        if PlayerJob.name == 'hayesauto' and PlayerJob.grade.level == 4 then
            exports['qb-ui']:showInteraction("Boss Office")
        end
    end
end)

RegisterNetEvent('qb-polyzone:exit')
AddEventHandler('qb-polyzone:exit', function(name)
    local InVehicle = IsPedInAnyVehicle(PlayerPedId())
    if name == "votecabinui" then
        --if InVehicle then
            inVoteCabin = false
            exports['qb-ui']:hideInteraction()
        --end
    elseif name == "policerepair" then
        --if InVehicle then
            if PlayerJob.name == "police" and onDuty then
                exports['qb-ui']:hideInteraction()
            end
        --end
    elseif name == "6strtunershopui" then
        --if not InVehicle then
            if PlayerJob.name == "tuner" and onDuty then
                exports['qb-ui']:hideInteraction()
            end
        --end
    elseif name == "tunerwheelfitment" then
        --if InVehicle then
            if PlayerJob.name == 'tuner' and PlayerJob.grade.level == 4 and onDuty then
                exports['qb-ui']:hideInteraction()
            end
        --end
    elseif name == "pillboxcheckinui" then
        if doctorCount >= Config.MinimalDoctors then
            exports['qb-ui']:hideInteraction()
        else
            exports['qb-ui']:hideInteraction()
        end
    elseif name == "bennysrepairui" then
        exports['qb-ui']:hideInteraction()
    elseif name == "bennysrepair2ui" then
        exports['qb-ui']:hideInteraction()
    elseif name == "tunerrepairui" then
        --if not InVehicle then
            if PlayerJob.name == "tuner" and onDuty then
                exports['qb-ui']:hideInteraction()
            end
        --end
    elseif name == "tunerstashui" then
        if PlayerJob.name == "tuner" and onDuty then
            exports['qb-ui']:hideInteraction()
        end
    elseif name == "tunerdutyui" then
        if PlayerJob.name == "tuner" then
            exports['qb-ui']:hideInteraction()
        end
    elseif name == "tunerbossui" then
        if PlayerJob.name == 'tuner' and PlayerJob.grade.level == 4 then
            exports['qb-ui']:hideInteraction()
        end
    elseif name == "hayesrepairui" then
        --if not InVehicle then
            if PlayerJob.name == "hayesauto" and onDuty then
                exports['qb-ui']:hideInteraction()
            end
        --end
    elseif name == "hayesstashui" then
        if PlayerJob.name == "hayesauto" and onDuty then
            exports['qb-ui']:hideInteraction()
        end
    elseif name == "hayesdutyui" then
        if PlayerJob.name == "hayesauto" then
            exports['qb-ui']:hideInteraction()
        end
    elseif name == "hayesbossui" then
        if PlayerJob.name == 'hayesauto' and PlayerJob.grade.level == 4 then
            exports['qb-ui']:hideInteraction()
        end
    end
end)