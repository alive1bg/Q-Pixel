Ped = {}
Ped.Vehicle = {}

AddEventHandler('baseevents:enteredVehicle', function(pVehicle, pSeat, pName, pClass, pModel)
    Ped.Vehicle.isInVehicle = true
    Ped.Vehicle.vehicleHandle = pVehicle
	Ped.Vehicle.vehicleSeat = pSeat
	Ped.Vehicle.vehicleName = pName
	Ped.Vehicle.vehicleClass = pClass
	Ped.Vehicle.vehicleModel = pModel
end)

AddEventHandler('baseevents:vehicleChangedSeat', function(pVehicle, pSeat)
	Ped.vehicleSeat = pSeat
end)

AddEventHandler('baseevents:leftVehicle', function(veh, curSeat)
	Ped.Vehicle = {}
    Ped.Vehicle.isInVehicle = false
	TriggerEvent('police:pursuitmodeReset', veh)
end)

CreateThread(function()
    while true do
        local idle = 1000
        Ped.handle = PlayerPedId()

        Ped.playerId = PlayerId()

		if LocalPlayer.state['isLoggedIn'] then
        	Ped.coords = GetEntityCoords(Ped.handle)

        	Ped.isArmed = IsPedArmed(Ped.handle, 7)

        	Ped.weaponHash = Ped.isArmed and GetSelectedPedWeapon(Ped.handle) or nil

        	Ped.weaponType = Ped.isArmed and GetWeapontypeGroup(GetSelectedPedWeapon(Ped.handle)) or nil

			Ped.isPaused = IsPauseMenuActive()
		end
        Wait(idle)
    end
end)