QBCore = exports['qb-core']:GetCoreObject()

Boom = nil
iSaidso = false

local datastore = {
    car = nil,
    car1 = nil,
    claimt = '[E] Claim Vehicle'
}


Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        --if HasRLloaded then
            if Boom == nil or iSaidso then
                QBCore.Functions.TriggerCallback('dontyoubelookingatme', function(res)
                    Boom = res
                end)
                iSaidso = false
            else
                if not Boom.IsClaimed then    
                    while not HasModelLoaded(Boom.VehicleName) do
                        RequestModel(Boom.VehicleName)
                        Citizen.Wait(10)
                    end
                    if DoesEntityExist(datastore.car) then
                        local mec = GetEntityCoords(PlayerPedId(), false)
                        local dist = GetDistanceBetweenCoords(mec.x, mec.y, mec.z, Boom.VehicleLoc.x, Boom.VehicleLoc.y, Boom.VehicleLoc.z, true)
                        SetVehicleDirtLevel(datastore.car, 15.0)
                        SetVehicleBurnout(datastore.car, true)
                        SetVehicleOnGroundProperly(datastore.car)
                        FreezeEntityPosition(datastore.car, true)
                        SetVehicleDoorsLocked(datastore.car, 2)
                        if not IsVehicleTyreBurst(datastore.car, 0, true) and not IsVehicleTyreBurst(datastore.car, 1, true) and not IsVehicleTyreBurst(datastore.car, 2, true) and not IsVehicleTyreBurst(datastore.car, 3, true) and not IsVehicleTyreBurst(datastore.car, 4, true) and not IsVehicleTyreBurst(datastore.car, 5, true) and not IsVehicleTyreBurst(datastore.car, 6, true) and not IsVehicleTyreBurst(datastore.car, 7, true) then
                            for i = 0, 7 do
                                SetVehicleTyreBurst(datastore.car, i, true, 1000)
                            end
                        end
                        if not IsVehicleDoorDamaged(datastore.car, 0) and not IsVehicleDoorDamaged(datastore.car, 1) and not IsVehicleDoorDamaged(datastore.car, 2) and not IsVehicleDoorDamaged(datastore.car, 3) and not IsVehicleDoorDamaged(datastore.car, 4) and not IsVehicleDoorDamaged(datastore.car, 5) then
                            for i = 0, 5 do
                                SetVehicleDoorBroken(datastore.car, i, true)
                            end
                        end
                        if dist <= 2.5 then
                            local bones = {
                                "door_dside_f",
                                "door_dside_r",
                                "door_pside_f",
                                "door_pside_r",
                                "boot"
                              }
                              exports['qb-target']:AddTargetBone(bones, {
                                options = {
                                  {
                                    type = "server",
                                    event = "oneofone:server:claim",
                                    icon = 'fas fa-car-side',
                                    label = 'Take from Barn',
                                    canInteract = function()
                                        local mec = GetEntityCoords(PlayerPedId(), false)
                                        local dist = GetDistanceBetweenCoords(mec.x, mec.y, mec.z, Boom.VehicleLoc.x, Boom.VehicleLoc.y, Boom.VehicleLoc.z, true)
                                        if dist <= 2.5 then
                                            return true
                                        end
                                        return false
                                    end,
                                  }
                                },
                                distance = 2.5,
                              })
                        end
                    else
                        datastore.car = CreateVehicle(Boom.VehicleName, Boom.VehicleLoc.x, Boom.VehicleLoc.y, Boom.VehicleLoc.z, Boom.VehicleLoc.h, false, false)
                    end
                end
                if Boom.IsClaimed then
                    while not HasModelLoaded(Boom.VehicleName) do
                        RequestModel(Boom.VehicleName)
                        Citizen.Wait(10)
                    end
                    if DoesEntityExist(datastore.car) then
                        DeleteEntity(datastore.car)
                    else
                        if DoesEntityExist(datastore.car1) and not Boom.Bop then
                            SetVehicleOnGroundProperly(datastore.car1)
                            FreezeEntityPosition(datastore.car1, true)
                            SetVehicleDoorsLocked(datastore.car1, 2)
                            if not IsVehicleTyreBurst(datastore.car1, 0, true) and not IsVehicleTyreBurst(datastore.car1, 1, true) and not IsVehicleTyreBurst(datastore.car1, 2, true) and not IsVehicleTyreBurst(datastore.car1, 3, true) and not IsVehicleTyreBurst(datastore.car1, 4, true) and not IsVehicleTyreBurst(datastore.car1, 5, true) and not IsVehicleTyreBurst(datastore.car1, 6, true) and not IsVehicleTyreBurst(datastore.car1, 7, true) then
                                for i = 0, 7 do
                                    SetVehicleTyreBurst(datastore.car1, i, true, 1000)
                                end
                            end
                            if not IsVehicleDoorDamaged(datastore.car1, 0) and not IsVehicleDoorDamaged(datastore.car1, 1) and not IsVehicleDoorDamaged(datastore.car1, 2) and not IsVehicleDoorDamaged(datastore.car1, 3) and not IsVehicleDoorDamaged(datastore.car1, 4) and not IsVehicleDoorDamaged(datastore.car1, 5) then
                                for i = 0, 5 do
                                    SetVehicleDoorBroken(datastore.car1, i, true)
                                end
                            end
                        else
                            if not DoesEntityExist(datastore.car1) then
                                datastore.car1 = CreateVehicle(Boom.VehicleName, Boom.ShopLoc.x, Boom.ShopLoc.y, Boom.ShopLoc.z, Boom.ShopLoc.h, false, false)
                            else
                                FreezeEntityPosition(datastore.car1, true)
                                SetVehicleDoorsLocked(datastore.car1, 1)
                                SetVehicleDirtLevel(datastore.car1, 15.0)
                                for i = 0, 7 do
                                    SetVehicleTyreFixed(datastore.car1, i)
                                end
                                SetVehicleFixed(datastore.car1)
                                SetVehicleLightsMode(datastore.car1, 0)
                                SetVehicleLights(datastore.car1, 0)
                                SetVehicleBurnout(datastore.car1, false)
                                SetVehicleEngineHealth(datastore.car1, 1000.0)
                                SetVehicleFuelLevel(datastore.car1, 100.0)
                                SetVehicleOilLevel(datastore.car1, 100.0)
                                TriggerServerEvent('oneofone:server:complete')
                                return
                            end
                        end
                    end
                end
            end
        --end
        Citizen.Wait(0)
    end
end)



function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x,y,z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 68)
end

RegisterNetEvent('oneofone:client:claim')
AddEventHandler('oneofone:client:claim', function(w, a)
    iSaidso = true
    if w == GetPlayerServerId(PlayerId()) then
        if a then TriggerServerEvent('oneofone:server:winner') end
    end
end)

RegisterNetEvent('oneofone:client:waypoint')
AddEventHandler('oneofone:client:waypoint', function()
    SetNewWaypoint(Boom.ShopLoc.x, Boom.ShopLoc.y)
end)

RegisterNetEvent('vehiclekeys:client:SetOwners')
AddEventHandler('vehiclekeys:client:SetOwners', function()
    SetVehicleNumberPlateText(veh, "BARN"..tostring(math.random(1000, 9999)))
    TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(datastore.car1), datastore.car1)
    local vehProps = QBCore.Functions.GetVehicleProperties(datastore.car1)
    TriggerServerEvent('oneofone:server:complete', vehProps)
end)