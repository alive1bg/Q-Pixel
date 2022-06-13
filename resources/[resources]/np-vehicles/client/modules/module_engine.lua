local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state['isLoggedIn']

local function ToggleEngine()
	if Ped.isPaused then return end
	if not Ped.Vehicle.isInVehicle then return end
	if Ped.Vehicle.vehicleSeat ~= -1 then return end
	if Ped.Vehicle.vehicleHandle == VehicleData.stalledVehicle then return end
	if VehicleData.damagedEngine then return end
	
	local engine = GetIsVehicleEngineRunning(Ped.Vehicle.vehicleHandle)
	SetVehicleEngineOn(Ped.Vehicle.vehicleHandle, not engine, false, true)
end

CreateThread(function()
	while true do
		Wait(500)
		if Ped.Vehicle.isInVehicle then
			if Ped.Vehicle.vehicleSeat == -1 then
				local exitingVehicle = GetIsTaskActive(Ped.handle, 2)
				if exitingVehicle then
					SetVehicleEngineOn(Ped.Vehicle.vehicleHandle, VehicleData.engine, true, true)
				end

				if not exitingVehicle then
					local engine = GetIsVehicleEngineRunning(Ped.Vehicle.vehicleHandle)
					if VehicleData.engine ~= engine then
						VehicleData.engine = engine
					end
				end
			end
		end
	end
end)

CreateThread(function()
    RegisterKeyMapping("+ToggleEngine", "[Vehicle] Engine", "keyboard", "Y") -- Register Key bind in menu
    RegisterCommand('+ToggleEngine', ToggleEngine, false)
    RegisterCommand('-ToggleEngine', function() end, false)
    TriggerEvent('chat:removeSuggestion', "/+ToggleEngine")
    TriggerEvent('chat:removeSuggestion', "/-ToggleEngine")
end)
exports('ToggleEngine', ToggleEngine)