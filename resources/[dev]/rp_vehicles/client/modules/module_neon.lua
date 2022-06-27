local function ToggleNeons()
	if Ped.isPaused then return end
	if not Ped.Vehicle.isInVehicle then return end
	if Ped.Vehicle.vehicleSeat ~= -1 then return end
	if VehicleData.damagedEngine then return end

	local veh = Ped.Vehicle.vehicleHandle

	local hasNeons = exports.rp_vehicles:hasFlag(veh, 'hasNeons')
	if hasNeons then
		local neonsEnabled = false
		for i = 0, 3 do
			neonsEnabled = IsVehicleNeonLightEnabled(veh, i)
			if neonsEnabled ~= false then
				neonsEnabled = true
				break
			end
		end

		for i = 0, 3 do
			SetVehicleNeonLightEnabled(veh, i, not neonsEnabled)
		end
	end
end

CreateThread(function()
	RegisterKeyMapping("+ToggleNeons", "[Vehicle] Toggle Neons", "keyboard", "NUMPAD1") -- Register Key bind in menu
	RegisterCommand('+ToggleNeons', ToggleNeons, false)
	RegisterCommand('-ToggleNeons', function() end, false)
	TriggerEvent('chat:removeSuggestion', "/+ToggleNeons")
	TriggerEvent('chat:removeSuggestion', "/-ToggleNeons")
end)

exports('HasNeons', HasNeons)