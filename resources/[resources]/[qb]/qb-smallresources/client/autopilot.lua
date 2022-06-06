local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
	for i, v in pairs(QBCore.Shared.Vehicles) do
		local text
		if v["brand"] then
			text = v["brand"] .. " " .. v["name"]
		else
			text = v["name"]
		end
		if v['hash'] ~= 0 and v['hash'] ~= nil then
			AddTextEntryByHash(v["hash"],text)
		end
	end
end)

-- autopilot vehicle driving auto driving
local speed = 50.00
local autopilotActive = false
local blipX = 0.0
local blipY = 0.0
local blipZ = 0.0

RegisterNetEvent("autopilot:start", function(source)
  local player = PlayerPedId()
  local vehicle = GetVehiclePedIsIn(player, false)

  local blip = GetFirstBlipInfoId(8)
    if IsPedInAnyVehicle(player, false) then
        if (blip ~= nil and blip ~= 0) then
          local coord = GetBlipCoords(blip)
          blipX = coord.x
          blipY = coord.y
          blipZ = coord.z
          TaskVehicleDriveToCoordLongrange(player, vehicle, blipX, blipY, blipZ, speed, 447, 2.0)
          autopilotActive = true
          if DoesBlipExist(GetFirstBlipInfoId(8)) then
            ClearVehicleTasks(vehicle)
          end
          else
          QBCore.Functions.Notify("No Route Selected", "error", 5000)
        end
    else
       QBCore.Functions.Notify("Not in Vehicle", "error", 5000)
    end
end)

CreateThread(function()
  while true do
      Wait(200) -- no need to check it every frame
      if autopilotActive then
        local coords = GetEntityCoords(PlayerPedId())
        local blip = GetFirstBlipInfoId(8)
        local dist = Vdist(coords.x, coords.y, coords.z, blipX, blipY, coords.z)
          if dist <= 45 then
              local player = PlayerPedId()
              local vehicle = GetVehiclePedIsIn(player, false)
              ClearPedTasks(player)
              SetVehicleForwardSpeed(vehicle, 19.0)
              Wait(200)
              SetVehicleForwardSpeed(vehicle, 15.0)
              Wait(200)
              SetVehicleForwardSpeed(vehicle, 11.0)
              Wait(200)
              SetVehicleForwardSpeed(vehicle, 6.0)
              Wait(200)
              SetVehicleForwardSpeed(vehicle, 0.0)
              QBCore.Functions.Notify("Destination Reached", "primary", 5000)
              autopilotActive = false
           end
        end
    end
end)