local First = vector3(0.0, 0.0, 0.0)
local Second = vector3(5.0, 5.0, 5.0)

local Vehicle = {Coords = nil, Vehicle = nil, Dimension = nil, IsInFront = false, Distance = nil}
Citizen.CreateThread(function()
    Citizen.Wait(200)
    while true do
        local ped = PlayerPedId()
        local posped = GetEntityCoords(GetPlayerPed(-1))
        local entityWorld = GetOffsetFromEntityInWorldCoords(ped, 0.0, 20.0, 0.0)
        local rayHandle = CastRayPointToPoint(posped.x, posped.y, posped.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, ped, 0)
        local a, b, c, d, closestVehicle = GetRaycastResult(rayHandle)
        local Distance = GetDistanceBetweenCoords(c.x, c.y, c.z, posped.x, posped.y, posped.z, false);

        local vehicleCoords = GetEntityCoords(closestVehicle)
        local dimension = GetModelDimensions(GetEntityModel(closestVehicle), First, Second)

        if Distance < 6.0  and not IsPedInAnyVehicle(ped, false) then
            Vehicle.Coords = vehicleCoords
            Vehicle.Dimensions = dimension
            Vehicle.Vehicle = closestVehicle
            Vehicle.Distance = Distance
            if GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle), GetEntityCoords(ped), true) > GetDistanceBetweenCoords(GetEntityCoords(closestVehicle) + GetEntityForwardVector(closestVehicle) * -1, GetEntityCoords(ped), true) then
                Vehicle.IsInFront = false
            else
                Vehicle.IsInFront = true
            end
        else
            Vehicle = {Coords = nil, Vehicle = nil, Dimensions = nil, IsInFront = false, Distance = nil}
        end
        Citizen.Wait(500)
    end
end)


Citizen.CreateThread(function()
    local lerpCurrentAngle = 0.0

    while true do 
        Citizen.Wait(5)
        local ped = PlayerPedId()
        if Vehicle.Vehicle ~= nil then
            if IsControlPressed(0, Keys["LEFTSHIFT"]) and IsVehicleSeatFree(Vehicle.Vehicle, -1) and not IsEntityAttachedToEntity(ped, Vehicle.Vehicle) and IsControlJustPressed(0, Keys["E"]) then
                if not IsEntityUpsidedown(Vehicle.Vehicle) then
                    
                    NetworkRequestControlOfEntity(Vehicle.Vehicle)
                    local coords = GetEntityCoords(ped)
                    if Vehicle.IsInFront then    
                        AttachEntityToEntity(PlayerPedId(), Vehicle.Vehicle, GetPedBoneIndex(6286), 0.0, Vehicle.Dimensions.y * -1 + 0.1 , Vehicle.Dimensions.z + 1.0, 0.0, 0.0, 180.0, 0.0, false, false, true, false, true)
                    else
                        AttachEntityToEntity(PlayerPedId(), Vehicle.Vehicle, GetPedBoneIndex(6286), 0.0, Vehicle.Dimensions.y - 0.3, Vehicle.Dimensions.z  + 1.0, 0.0, 0.0, 0.0, 0.0, false, false, true, false, true)
                    end

                    RequestAnimDict('missfinale_c2ig_11')
                    TaskPlayAnim(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
                    Citizen.Wait(200)
                    while true do
                        Citizen.Wait(5)

                        local speed = GetFrameTime() * 50
                        if IsDisabledControlPressed(0, Keys["A"]) then
                            SetVehicleSteeringAngle(Vehicle.Vehicle, lerpCurrentAngle)
                            lerpCurrentAngle = lerpCurrentAngle + speed
                        elseif IsDisabledControlPressed(0, Keys["D"]) then
                            SetVehicleSteeringAngle(Vehicle.Vehicle, lerpCurrentAngle)
                            lerpCurrentAngle = lerpCurrentAngle - speed
                        else
                            SetVehicleSteeringAngle(Vehicle.Vehicle, lerpCurrentAngle)
    
                            --Slowly restore to center.
                            if lerpCurrentAngle < -0.02 then    
                                lerpCurrentAngle = lerpCurrentAngle + speed
                            elseif lerpCurrentAngle > 0.02 then
                                lerpCurrentAngle = lerpCurrentAngle - speed
                            else
                                lerpCurrentAngle = 0.0
                            end
                        end

                        -- Clamp the values between -15 and 15.
                        if lerpCurrentAngle > 30.0 then
                            lerpCurrentAngle = 30.0
                        elseif lerpCurrentAngle < -30.0 then
                            lerpCurrentAngle = -30.0
                        end

                        if Vehicle.IsInFront then
                            SetVehicleForwardSpeed(Vehicle.Vehicle, -1.0)
                        else
                            SetVehicleForwardSpeed(Vehicle.Vehicle, 1.0)
                        end

                        if HasEntityCollidedWithAnything(Vehicle.Vehicle) then
                            SetVehicleOnGroundProperly(Vehicle.Vehicle)
                        end

                        if not IsDisabledControlPressed(0, Keys["E"]) then
                            DetachEntity(ped, false, false)
                            StopAnimTask(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0)
                            FreezeEntityPosition(ped, false)
                            break
                        end
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