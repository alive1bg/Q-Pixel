local First = vector3(0.0, 0.0, 0.0)
local Second = vector3(5.0, 5.0, 5.0)

local Vehicle = {
    Coords = nil,
    Vehicle = nil,
    Dimension = nil,
    IsInFront = false
}

CreateThread(function()
    while true do
        Wait(500)
        local vehicle = QBCore.Functions.GetClosestVehicle()
        if vehicle ~= nil and vehicle ~= 0 then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local vehpos = GetEntityCoords(vehicle)
            local dimension = GetModelDimensions(GetEntityModel(vehicle), First, Second)

            if #(pos - vehpos) < 3.0 and not IsPedInAnyVehicle(ped) then
                Vehicle.Coords = vehpos
                Vehicle.Dimensions = dimension
                Vehicle.Vehicle = vehicle
                if #(vehpos + GetEntityForwardVector(vehicle) - pos) >
                    #(vehpos + GetEntityForwardVector(vehicle) * -1 - pos) then
                    Vehicle.IsInFront = false
                else
                    Vehicle.IsInFront = true
                end
            else
                Vehicle = {
                    Coords = nil,
                    Vehicle = nil,
                    Dimensions = nil,
                    IsInFront = false
                }
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(5)
        if Vehicle.Vehicle ~= nil then
            local ped = PlayerPedId()
            local vehClass = GetVehicleClass(Vehicle.Vehicle)

            if IsVehicleSeatFree(Vehicle.Vehicle, -1) and GetVehicleEngineHealth(Vehicle.Vehicle) <= Config.DamageNeeded and GetVehicleEngineHealth(Vehicle.Vehicle) >= 0 then
                if vehClass ~= 13 or vehClass ~= 14 or vehClass ~= 15 or vehClass ~= 16 then
                    DrawText3Ds(Vehicle.Coords.x, Vehicle.Coords.y, Vehicle.Coords.z, 'Press [~g~SHIFT~w~] and [~g~E~w~] to push the vehicle')
                end
            end

            if IsControlPressed(0, 21) and IsVehicleSeatFree(Vehicle.Vehicle, -1) and
                not IsEntityAttachedToEntity(ped, Vehicle.Vehicle) and IsControlJustPressed(0, 38) and
                GetVehicleEngineHealth(Vehicle.Vehicle) <= Config.DamageNeeded then
                NetworkRequestControlOfEntity(Vehicle.Vehicle)
                if Vehicle.IsInFront then
                    AttachEntityToEntity(ped, Vehicle.Vehicle, GetPedBoneIndex(6286), 0.0,
                        Vehicle.Dimensions.y * -1 + 0.1, Vehicle.Dimensions.z + 1.0, 0.0, 0.0, 180.0, 0.0, false, false,
                        true, false, true)
                else
                    AttachEntityToEntity(ped, Vehicle.Vehicle, GetPedBoneIndex(6286), 0.0,
                        Vehicle.Dimensions.y - 0.3, Vehicle.Dimensions.z + 1.0, 0.0, 0.0, 0.0, 0.0, false, false, true,
                        false, true)
                end

                RequestAnimDict('missfinale_c2ig_11')
                while not HasAnimDictLoaded('missfinale_c2ig_11') do
                    Wait(1)
                end
                TaskPlayAnim(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
                Wait(200)

                local currentVehicle = Vehicle.Vehicle
                while true do
                    Wait(5)
                    if IsDisabledControlPressed(0, 34) then
                        TaskVehicleTempAction(ped, currentVehicle, 11, 1000)
                    end

                    if IsDisabledControlPressed(0, 9) then
                        TaskVehicleTempAction(ped, currentVehicle, 10, 1000)
                    end

                    if Vehicle.IsInFront then
                        SetVehicleForwardSpeed(currentVehicle, -1.0)
                    else
                        SetVehicleForwardSpeed(currentVehicle, 1.0)
                    end

                    if HasEntityCollidedWithAnything(currentVehicle) then
                        SetVehicleOnGroundProperly(currentVehicle)
                    end

                    if not IsDisabledControlPressed(0, 38) then
                        DetachEntity(ped, false, false)
                        StopAnimTask(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0)
                        FreezeEntityPosition(ped, false)
                        break
                    end
                end
            end
        end
    end
end)


-- flip vehicle
RegisterNetEvent("qb:flipvehicle", function()
	local playerPed	= PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local vehicle = nil
	if IsPedSittingInAnyVehicle(playerPed) then
        QBCore.Functions.Notify("Cannot flip while inside vehicle", "error")
		ClearPedTasks(playerPed)
		return
	end
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.5) then
		vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, 71)
		SetVehicleModKit(vehicle, 0)
		if DoesEntityExist(vehicle) then
			QBCore.Functions.Progressbar("accepted_key", "Flipping Vehicle", 12000, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {
				task = "CODE_HUMAN_MEDIC_TEND_TO_DEAD"
			}, {}, {}, function() -- Done
				ClearPedTasks(playerPed)
				FreezeEntityPosition(playerPed, false)
				vehiclecoords = GetEntityCoords(vehicle)
				SetEntityCoords(vehicle, vehiclecoords.x+0.5, vehiclecoords.y+0.5, vehiclecoords.z+1)
				Wait(200)
				SetEntityRotation(vehicle, GetEntityRotation(PlayerPedId(), 2), 2)
				Wait(500)
				SetVehicleOnGroundProperly(vehicle)
                QBCore.Functions.Notify("Success! Vehicle Flipped", "success")
			end, function() -- Cancel

                QBCore.Functions.Notify("Vehicle flip failed!", "error")
				FreezeEntityPosition(playerPed, false)
				ClearPedTasks(playerPed)								
			end)
		else
            QBCore.Functions.Notify("There is no vehicle nearby", "error")
		end
	else
        QBCore.Functions.Notify("There is no vehicle nearby", "error")
	end
end)
