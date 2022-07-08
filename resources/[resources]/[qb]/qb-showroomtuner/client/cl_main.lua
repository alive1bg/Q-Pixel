local QBCore = exports['qb-core']:GetCoreObject()
local model = vehicle
RegisterNUICallback("showroomPurchaseCurrentVehicle", function(data, cb)
  QBCore.Functions.TriggerCallback("qb-showroomtuner:purchaseVehicle", function(success, vehicle, plate)
    local plate = QBCore.Functions.GetPlate(vehicle)
    print(success, vehicle)
    if success then
        DoScreenFadeOut(0)
        Wait(50)
        DoScreenFadeIn(1000)
        SetNuiFocus(false, false)
        ClearFocus()
        RenderScriptCams(false, false, 0, 1, 0)
        cb({
          data = {},
          meta = {
            ok = true,
          }
        });
    else
      QBCore.Functions.Notify("Not Enough money!")
    end;
  end, data.model, data.price, data.zoneName)
end);

function TakeOutVehicle(vehicle, coords, plate)
    model = vehicle
    coords = vector4(-45.60, -1080.9, 26.706, 70.0)
    local coords = vector4(-45.60, -1080.9, 26.706, 70.0)
    local plate = QBCore.Functions.GetPlate(vehicle)
    SetEntityHeading(veh, coords.w)
    SetVehicleNumberPlateText(veh, plate)
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
    TriggerServerEvent("qb-vehicletuning:server:SaveVehicleProps", QBCore.Functions.GetVehicleProperties(vehicle))
end

RegisterNetEvent('qb-showroomtuner:client:buyShowroomVehicle', function(vehicle, plate)
    coords = vector4(143.79, -3047.9, 7.04, 268.51)
    local coords = vector4(143.79, -3047.9, 7.04, 268.51)
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
      SetEntityHeading(veh, coords.w)
      SetVehicleNumberPlateText(veh, plate)
      SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
      exports['qb-fuel']:SetFuel(veh, 100)
      SetEntityAsMissionEntity(veh, true, true)
      TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
      TriggerServerEvent("qb-vehicletuning:server:SaveVehicleProps", QBCore.Functions.GetVehicleProperties(veh))
    end, coords, true)
end)