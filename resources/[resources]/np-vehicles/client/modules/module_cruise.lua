local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state['isLoggedIn']

local Speed = 0.0
local cruiseSpeed = 0.0
local lastVehicle = nil
local maxSpeed = 0
local isCruising = false

local function Cruising()
	if isCruising then return end
	isCruising = true

	local myVeh = Ped.Vehicle.vehicleHandle
	maxSpeed = GetVehicleHandlingFloat(myVeh,"CHandlingData","fInitialDriveMaxFlatVel")
	cruiseSpeed = GetEntitySpeed(myVeh)

	CreateThread(function()
		while isCruising do
			Wait(7)
			if IsControlJustReleased(0, 27) then
				cruiseSpeed = cruiseSpeed + 0.5
				QBCore.Functions.Notify("Limiter set to "..tostring(math.ceil(cruiseSpeed * 2.236936)).."mph")
			elseif IsControlJustReleased(0, 173) then
				cruiseSpeed = cruiseSpeed - 0.5

				QBCore.Functions.Notify("Limiter set to "..tostring(math.ceil(cruiseSpeed * 2.236936)).."mph")
			end

			SetEntityMaxSpeed(myVeh, cruiseSpeed)

			if not Ped.Vehicle.isInVehicle then
				isCruising = false
				VehicleData.cruise = false
				SetEntityMaxSpeed(myVeh, 999.0)
			end
		end
	end)
end

function ToggleCruise()
	if Ped.isPaused then return end
	
	if Ped.Vehicle.isInVehicle then
		if Ped.Vehicle.vehicleSeat ~= -1 then return end

		local veh = Ped.Vehicle.vehicleHandle
		Speed = GetEntitySpeed(veh)
		cruiseSpeed = Speed
		if VehicleData.cruise then
			QBCore.Functions.Notify("Limiter: off!", "error")
			isCruising = false
			Wait(1)
			SetEntityMaxSpeed(veh, 999.0)
			VehicleData.cruise = false
		else
			VehicleData.cruise = true
			Cruising()
			QBCore.Functions.Notify("Limiter: "..tostring(math.ceil(cruiseSpeed * 2.236936)).."mph")
		end
	end
end

CreateThread(function()
	RegisterKeyMapping("+ToggleCruise", "[Vehicle] Cruise Control", "keyboard", "B") -- Register Key bind in menu
	RegisterCommand('+ToggleCruise', ToggleCruise, false)
	RegisterCommand('-ToggleCruise', function() end, false)
	TriggerEvent('chat:removeSuggestion', "/+ToggleCruise")
	TriggerEvent('chat:removeSuggestion', "/-ToggleCruise")
end)