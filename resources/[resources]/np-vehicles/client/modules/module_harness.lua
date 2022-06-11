local restrictedClasses = {
	[8] = true,
	[13] = true,
	[14] = true
}

DecorRegister('vehicleHarness', 2)
function vehicleHasHarness(veh)
	return DecorGetBool(veh, 'vehicleHarness')
end

function ToggleHarness()
	if not VehicleData.harness then
		QBCore.Functions.Progressbar("harness_equip", "Clipping Race harness...", 5000, false, false, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			VehicleData.harness = true
			TriggerServerEvent("InteractSound_SV:PlayOnSource", "carbuckle", 0.25)
			TriggerEvent('seatbelt:client:ToggleHarness')
		end)
	else
		QBCore.Functions.Progressbar("harness_equip", "Unclipping Race harness...", 5000, false, false, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Done
			VehicleData.harness = false
			TriggerServerEvent("InteractSound_SV:PlayOnSource", "carunbuckle", 0.25)
			TriggerEvent('seatbelt:client:ToggleHarness')
		end)
	end
end

RegisterNetEvent('np-vehicles:client:useHarness', function(itemData)
	if Ped.isPaused then return end
	if Ped.Vehicle.isInVehicle then
		if Ped.Vehicle.vehicleSeat ~= -1 then return end
		if restrictedClasses[Ped.Vehicle.vehicleClass] then return end

		local itemUses = itemData.info.uses
		local itemSlot = itemData.slot

		local hasHarness = vehicleHasHarness(Ped.Vehicle.vehicleHandle)
		if hasHarness then

			ToggleHarness()
			print("Already has harness in vehicle, clip it in")
			return
		end

		print("install harness, clip in harness and remove 1 use")
		DecorSetBool(Ped.Vehicle.vehicleHandle, 'vehicleHarness', true)
		--Update item
		ToggleHarness()
	end
end)


exports('vehicleHasHarness', vehicleHasHarness)
exports('ToggleHarness', ToggleHarness)