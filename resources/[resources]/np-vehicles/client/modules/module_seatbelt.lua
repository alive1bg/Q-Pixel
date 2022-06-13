local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state['isLoggedIn']


local restrictedClasses = {
	[8] = true,
	[13] = true,
	[14] = true
}

local function ToggleSeatbelt()
	if Ped.isPaused then return end
	if Ped.Vehicle.isInVehicle then
		if restrictedClasses[Ped.Vehicle.vehicleClass] then return end
		local hasHarness = exports.np_vehicles:vehicleHasHarness(Ped.Vehicle.vehicleHandle)
		if hasHarness then
			if Ped.Vehicle.vehicleSeat ~= -1 then return end
			exports.np_vehicles:ToggleHarness()
			return
		end

		if VehicleData.seatbelt then
			TriggerServerEvent("InteractSound_SV:PlayOnSource", "carunbuckle", 0.25)
		else
			TriggerServerEvent("InteractSound_SV:PlayOnSource", "carbuckle", 0.25)
		end
		VehicleData.seatbelt = not VehicleData.seatbelt
		TriggerEvent("seatbelt:client:ToggleSeatbelt", VehicleData.seatbelt)
	end
end

CreateThread(function()
    RegisterKeyMapping("+ToggleSeatbelt", "[Vehicle] Seatbelt", "keyboard", "K") -- Register Key bind in menu
    RegisterCommand('+ToggleSeatbelt', ToggleSeatbelt, false)
    RegisterCommand('-ToggleSeatbelt', function() end, false)
    TriggerEvent('chat:removeSuggestion', "/+ToggleSeatbelt")
    TriggerEvent('chat:removeSuggestion', "/-ToggleSeatbelt")
end)