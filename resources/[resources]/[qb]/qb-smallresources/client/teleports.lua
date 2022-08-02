JustTeleported = false

CreateThread(function()
    while true do
        local inRange = false
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for loc,_ in pairs(Config.Teleports) do
            for k, v in pairs(Config.Teleports[loc]) do
                local dist = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))
                if dist < 2 then
                    inRange = true
                    DrawMarker(2, v.coords.x, v.coords.y, v.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 255, 255, 255, 255, 0, 0, 0, 1, 0, 0, 0)

                    if dist < 1 then
                        DrawText3Ds(v.coords.x, v.coords.y, v.coords.z, v.drawText)
                        if IsControlJustReleased(0, 51) then
                            if k == 1 then
                                if v["AllowVehicle"] then
                                    SetPedCoordsKeepVehicle(ped, Config.Teleports[loc][2].coords.x, Config.Teleports[loc][2].coords.y, Config.Teleports[loc][2].coords.z)
                                else
                                    SetEntityCoords(ped, Config.Teleports[loc][2].coords.x, Config.Teleports[loc][2].coords.y, Config.Teleports[loc][2].coords.z)
                                end

                                if type(Config.Teleports[loc][2].coords) == "vector4" then
                                    SetEntityHeading(ped, Config.Teleports[loc][2].coords.w)
                                end
                            elseif k == 2 then
                                if v["AllowVehicle"] then
                                    SetPedCoordsKeepVehicle(ped, Config.Teleports[loc][1].coords.x, Config.Teleports[loc][1].coords.y, Config.Teleports[loc][1].coords.z)
                                else
                                    SetEntityCoords(ped, Config.Teleports[loc][1].coords.x, Config.Teleports[loc][1].coords.y, Config.Teleports[loc][1].coords.z)
                                end

                                if type(Config.Teleports[loc][1].coords) == "vector4" then
                                    SetEntityHeading(ped, Config.Teleports[loc][1].coords.w)
                                end
                            end
                            ResetTeleport()
                        end
                    end
                end
            end
        end

        if not inRange then
            Wait(1000)
        end

        Wait(3)
    end
end)

ResetTeleport = function()
    SetTimeout(1000, function()
        JustTeleported = false
    end)
end


-- PILLBOX TELEPORTS
RegisterNetEvent("teleport:pbroof")
AddEventHandler("teleport:pbroof", function()
    local ped = PlayerPedId()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "elevator", 0.2)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_HANG_OUT_STREET", 0, true)
    QBCore.Functions.Progressbar("waiting", "Waiting for Elevator", 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = true,
        disableCombat = true,
    }, {}, {}, {}, function()
    DoScreenFadeOut(1000)
    Wait(1000)
    SetEntityCoords(ped, 339.23767, -584.1412, 74.161712, 0, 0, 0, false)
    SetEntityHeading(ped, 250.95)
    Wait(1000)
    DoScreenFadeIn(1000)
    end, function()
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent("teleport:pbgarage")
AddEventHandler("teleport:pbgarage", function()
    local ped = PlayerPedId()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "elevator", 0.2)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_HANG_OUT_STREET", 0, true)
    QBCore.Functions.Progressbar("waiting", "Waiting for Elevator", 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = true,
        disableCombat = true,
    }, {}, {}, {}, function()
    DoScreenFadeOut(1000)
    Wait(1000)
    SetEntityCoords(ped, 342.12, -585.47, 28.8, 0, 0, 0, false)
    SetEntityHeading(ped, 254.77)
    Wait(1000)
    DoScreenFadeIn(1000)
    end, function()
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent("teleport:pblobby")
AddEventHandler("teleport:pblobby", function()
    local ped = PlayerPedId()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "elevator", 0.2)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_HANG_OUT_STREET", 0, true)
    QBCore.Functions.Progressbar("waiting", "Waiting for Elevator", 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = true,
        disableCombat = true,
    }, {}, {}, {}, function()
    DoScreenFadeOut(1000)
    Wait(1000)
    SetEntityCoords(ped, 327.18, -603.73, 43.28, 0, 0, 0, false)
    SetEntityHeading(ped, 348.08)
    Wait(1000)
    DoScreenFadeIn(1000)
    end, function()
        ClearPedTasks(PlayerPedId())
    end)
end)

RegisterNetEvent('teleport:pillbox1')
AddEventHandler('teleport:pillbox1', function()
    exports['qb-menu']:openMenu({
        {
            header = "Elevator",
            txt = "",
        },
        {
            header = "Rooftop",
            txt = "Use Elevator",
            params = {
                event = "teleport:pbroof"
            }
        },
        {
            header = "Garage",
            txt = "Use Elevator",
            params = {
                event = "teleport:pbgarage"
            }
        },
    })
end)

RegisterNetEvent('teleport:pillbox2')
AddEventHandler('teleport:pillbox2', function()
    exports['qb-menu']:openMenu({
        {
            header = "Elevator",
            txt = "",
        },
        {
            header = "Lobby",
            txt = "Use Elevator",
            params = {
                event = "teleport:pblobby"
            }
        },
        {
            header = "Garage",
            txt = "Use Elevator",
            params = {
                event = "teleport:pbgarage"
            }
        },
    })
end)

RegisterNetEvent('teleport:pillbox3')
AddEventHandler('teleport:pillbox3', function()
    exports['qb-menu']:openMenu({
        {
            header = "Elevator",
            txt = "",
        },
        {
            header = "Lobby",
            txt = "Use Elevator",
            params = {
                event = "teleport:pblobby"
            }
        },
        {
            header = "Rooftop",
            txt = "Use Elevator",
            params = {
                event = "teleport:pbroof"
            }
        },
    })
end)
