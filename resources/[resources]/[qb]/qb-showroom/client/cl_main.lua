local QBCore = exports['qb-core']:GetCoreObject()
local model = vehicle
RegisterNUICallback("showroomPurchaseCurrentVehicle", function(data, cb)
  QBCore.Functions.TriggerCallback("qb-showroom:purchaseVehicle", function(success, vehicle, plate)
    local plate = QBCore.Functions.GetPlate(vehicle)
    print(success, vehicle)
    if success then
      DoScreenFadeOut(0)
      Wait(400)
      DoScreenFadeIn(1000)
      SetNuiFocus(false, false)
      ClearFocus()
      RenderScriptCams(false, false, 0, 1, 0)
      TakeOutVehicle(vehicle, plate)
      cb({
        data = {},
        meta = {
          ok = true,
        }
      });
    end;
  end, data.model, data.price, data.zoneName)
end);

function TakeOutVehicle(vehicle, coords, plate)
    model = vehicle
    coords = vector4(-45.60, -1080.9, 26.706, 70.0)
    local coords = vector4(-45.60, -1080.9, 26.706, 70.0)
    local plate = QBCore.Functions.GetPlate(vehicle)
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
      SetEntityHeading(veh, coords.w)
      SetVehicleNumberPlateText(veh, plate)
      SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
      exports['qb-fuel']:SetFuel(veh, 100)
      SetEntityAsMissionEntity(veh, true, true)
      TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
      TriggerServerEvent("qb-vehicletuning:server:SaveVehicleProps", QBCore.Functions.GetVehicleProperties(veh))
    end, coords, true)
end

RegisterNetEvent('qb-showroom:client:buyShowroomVehicle', function(vehicle, plate)
    coords = vector4(-30.19, -1089.48, 26.42, 340.23)
    local coords = vector4(-30.19, -1089.48, 26.42, 340.23)
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