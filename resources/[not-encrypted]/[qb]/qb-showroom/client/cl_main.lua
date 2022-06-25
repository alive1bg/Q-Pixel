local QBCore = exports['qb-core']:GetCoreObject()
local model = vehicle

CreateThread(function()
  local Blip = AddBlipForCoord(-38.49, -1101.07, 26.42)
  SetBlipSprite (Blip, 326)
  SetBlipDisplay(Blip, 4)
  SetBlipScale  (Blip, 0.75)
  SetBlipAsShortRange(Blip, true)
  SetBlipColour(Blip, 50)
  SetBlipAlpha(Blip, 0.7)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName("Vehicle Shop")
  EndTextCommandSetBlipName(Blip)
end)

RegisterNUICallback("showroomPurchaseCurrentVehicle", function(data, cb)
  QBCore.Functions.TriggerCallback("qb-showroom:purchaseVehicle", function(success, vehicle, plate)
    print(success, vehicle)
    if success then
      DoScreenFadeOut(0)
      Wait(400)
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
    end;
  end, data.model, data.price, data.zoneName)
end);

RegisterNetEvent('qb-showroom:client:buyShowroomVehicle', function(vehicle, plate)
    coords = vector4(-23.83789, -1094.691, 26.88134, 339.00994)
    local coords = vector4(-23.83789, -1094.691, 26.88134, 339.00994)
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