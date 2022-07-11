local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

local vehicleModes = {}
Citizen.CreateThread(function()
    Wait(150)
    vehicleModes = RPC.execute("pursuit:getJSON")
    DecorRegister('pursuitLevel', 1)
    DecorRegister('hasVehicleEditedByPursuit', false)
end)

local currentLevel = 1 

function dump(o)
	if type(o) == 'table' then
	   local s = '{ '
	   for k,v in pairs(o) do
		  if type(k) ~= 'number' then k = '"'..k..'"' end
		  s = s .. '['..k..'] = ' .. dump(v) .. ','
	   end
	   return s .. '} '
	else
	   return tostring(o)
	end
 end

RegisterCommand("pursuit", function(source, args)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local vehicleName = string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
    local vehiclePresetName = nil
    local vehiclePresetMods = {}
    for k, v in pairs(vehicleModes["client"]["global"]["vehicles"]) do
        if v.model == vehicleName then
            vehiclePresetName = v.preset
            for x, y in pairs(vehicleModes["client"]["global"]["presets"]) do
                if y.id == vehiclePresetName then
                    vehiclePresetMods = y.modes
                    print("a:", dump(y.modes))
                    break
                end
            end
            break
        end
    end
    if  PlayerJob.name == 'police' then 
        if not vehiclePresetName then 
            return 
        end

        --[[ if currentLevel == 3 then 
            currentLevel = 1 
        end ]]

        currentLevel = currentLevel + 1
        local modLevel = vehiclePresetMods[currentLevel]
        SetVehicleXenonLightsColour(vehicle, modLevel.appearance.colors.xenon)
        ToggleVehicleMod(vehicle, modLevel.mods.Turbo)
        SetVehicleMod(vehicle, 11, modLevel.mods.Engine, false)
        SetVehicleMod(vehicle, 12, modLevel.mods.Brakes, false)
        SetVehicleMod(vehicle, 13, modLevel.mods.Transmission, false)
        SetVehicleMod(vehicle, 22, modLevel.mods.XenonHeadlights, false)
        for i = 1, #modLevel.handling do
            if not DecorIsRegisteredAsType(modLevel.handling[i].field, 3) then 
                DecorRegister(modLevel.handling[i].field, 3)
            end
            Citizen.Wait(100)
            local defaultValue = DecorGetFloat(vehicle, modLevel.handling[i].field)
            if defaultValue == 0 then
                defaultValue = GetVehicleHandlingFloat(vehicle, 'CHandlingData', modLevel.handling[i].field)
                DecorSetFloat(vehicle, modLevel.handling[i].field, defaultValue)
            end
        end
        for i = 1, #modLevel.handling do 
            print('Before',GetVehicleHandlingFloat(vehicle, 'CHandlingData', modLevel.handling[i].field))
            SetVehicleHandlingFloat(vehicle, 'CHandlingData', modLevel.handling[i].field, DecorGetFloat(vehicle, modLevel.handling[i].field)*modLevel.handling[i].multiplier)
            print('After',GetVehicleHandlingFloat(vehicle, 'CHandlingData', modLevel.handling[i].field))
        end
        if source then 
            QBCore.Functions.Notify("Pursuit Mod: " ..modLevel.name)
            print(modLevel.name)
        end
    else
        QBCore.Functions.Notify("U are not a Police.", "error")
    end
end)


Citizen.CreateThread(function()
    RegisterKeyMapping("pursuit", "Pursuit", "keyboard", "N")
end)
