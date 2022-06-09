local BlipsEnabled, NamesEnabled, GodmodeEnabled = false, false, false

-- [ Code ] --

IsPlayerAdmin = function() 
    local AdminPromise = promise:new()
    Mercy.Functions.TriggerCallback('qb-admin:server:get-permission', function(IsAdmin)
        AdminPromise:resolve(IsAdmin)
    end, "admin")
    return AdminPromise
end

-- [ Events ] --

RegisterNetEvent("Admin:Godmode", function(Result)
    if IsPlayerAdmin() then
        TriggerServerEvent('qb-admin:server:toggle-godmode', Result['player'])
    end
end)

RegisterNetEvent("qb-admin:client:toggle-godmode", function()
    GodmodeEnabled = not GodmodeEnabled

    local Msg = GodmodeEnabled and 'enabled.' or 'disabled.'
    local MsgType = GodmodeEnabled and 'success' or 'error'
    Mercy.Functions.Notify('Godmode '..Msg, MsgType)

    if GodmodeEnabled then
        while GodmodeEnabled do
            Wait(0)
            SetPlayerInvincible(PlayerId(), true)
        end
        SetPlayerInvincible(PlayerId(), false)
    end
end)

RegisterNetEvent('Admin:Toggle:Noclip', function(Result)
    if IsPlayerAdmin() then
        SendNUIMessage({
            Action = 'Close',
        })
        SendNUIMessage({
            Action = "SetItemEnabled",
            Name = 'noclip',
            State = not noClipEnabled
        })
        if noClipEnabled then
            toggleFreecam(false)
        else
            toggleFreecam(true)
        end
    end
end)

RegisterNetEvent('Admin:Fix:Vehicle', function(Result)
    if IsPlayerAdmin() then
        SendNUIMessage({
            Action = 'Close',
        })
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            SetVehicleFixed(GetVehiclePedIsIn(PlayerPedId(), true))
        else
            local Vehicle, Distance = Mercy.Functions.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
            SetVehicleFixed(Vehicle)
        end 
    end
end)

RegisterNetEvent('Admin:Delete:Vehicle', function(Result)
    if IsPlayerAdmin() then
        SendNUIMessage({
            Action = 'Close',
        })
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), true))
        else
            local Vehicle, Distance = Mercy.Functions.GetClosestVehicle(GetEntityCoords(PlayerPedId()))
            DeleteVehicle(Vehicle)
        end
    end
end)

RegisterNetEvent('Admin:Spawn:Vehicle', function(Result)
    if IsPlayerAdmin() then
        SendNUIMessage({
            Action = 'Close',
        })
        TriggerEvent('QBCore:Command:SpawnVehicle', Result['model'])
    end
end)

RegisterNetEvent('Admin:Teleport:Marker', function(Result)
    if IsPlayerAdmin() then
        SendNUIMessage({
            Action = 'Close',
        })
        TriggerEvent('QBCore:Command:GoToMarker')
    end
end)

RegisterNetEvent('Admin:Teleport:Coords', function(Result)
    if IsPlayerAdmin() then
        if Result['x-coord'] ~= '' and Result['y-coord'] ~= '' and Result['z-coord'] ~= '' then
            SendNUIMessage({
                Action = 'Close',
            })
            SetEntityCoords(PlayerPedId(), tonumber(Result['x-coord']), tonumber(Result['y-coord']), tonumber(Result['z-coord']))
        end
    end
end)

RegisterNetEvent('Admin:Teleport', function(Result)
    if IsPlayerAdmin() then
        SendNUIMessage({
            Action = 'Close',
        })
        TriggerServerEvent('qb-admin:server:teleport-player', Result['player'], Result['type'])
    end
end)

RegisterNetEvent('Admin:Open:Clothing', function(Result)
    if IsPlayerAdmin() then
        SendNUIMessage({
            Action = 'Close',
        })
        TriggerServerEvent('qb-admin:server:open-clothing', Result['player'])
    end
end)

RegisterNetEvent('Admin:Revive', function(Result)
    if IsPlayerAdmin() then
        TriggerServerEvent('qb-admin:server:revive-target', Result['player'])
    end
end)

RegisterNetEvent('Admin:Remove:Stress', function(Result)
    if IsPlayerAdmin() then
        TriggerServerEvent('qb-admin:server:remove-stress', Result['player'])
    end
end)

RegisterNetEvent('Admin:Change:Model', function(Result)
    if IsPlayerAdmin() and Result['model'] ~= '' then
        local Model = GetHashKey(Result['model'])
        if IsModelValid(Model) then
            TriggerServerEvent('qb-admin:server:set-model', Result['player'], Model)
        end
    end
end)

RegisterNetEvent('Admin:Reset:Model', function(Result)
    if IsPlayerAdmin() then
        TriggerServerEvent('qb-admin:server:reset-skin', Result['player'])
    end
end)

RegisterNetEvent('Admin:Armor', function(Result)
    if IsPlayerAdmin() then
        TriggerServerEvent('qb-admin:server:set-armor', Result['player'])
    end
end)

RegisterNetEvent('Admin:Food:Drink', function(Result)
    if IsPlayerAdmin() then
        TriggerServerEvent('qb-admin:server:set-food-drink', Result['player'])
    end
end)

RegisterNetEvent('Admin:Request:Job', function(Result)
    if IsPlayerAdmin() then
        if Result['job'] ~= '' then
            TriggerServerEvent('qb-admin:server:request-job', Result['player'], Result['job'])
        end
    end
end)

RegisterNetEvent('Admin:Fling:Player', function(Result)
    if IsPlayerAdmin() then
        TriggerServerEvent('qb-admin:server:fling-player', Result['player'])
    end
end)

RegisterNetEvent('Admin:GiveItem', function(Result)
    if IsPlayerAdmin() then
        TriggerServerEvent('qb-admin:server:give-item', Result['player'], Result['item'], Result['amount'])
    end
end)

RegisterNetEvent('Admin:Ban', function(Result)
    if IsPlayerAdmin() then
        TriggerServerEvent('qb-admin:server:ban-player', Result['player'], Result['expire'], Result['reason'])
    end
end)

RegisterNetEvent('Admin:Kick', function(Result)
    if IsPlayerAdmin() then
        TriggerServerEvent('qb-admin:server:kick-player', Result['player'], Result['reason'])
    end
end)

RegisterNetEvent('qb-admin:client:teleport-player', function(Coords)
    SetEntityCoords(PlayerPedId(), Coords.x, Coords.y, Coords.z)
end)

RegisterNetEvent('qb-admin:client:set-model', function(Model)
    Mercy.Functions.LoadModel(Model)
    SetPlayerModel(PlayerId(), Model)
    SetPedComponentVariation(PlayerPedId(), 0, 0, 0, 0)
end)

RegisterNetEvent('qb-admin:client:armor-up', function()
    SetPedArmour(PlayerPedId(), 100.0)
end)

RegisterNetEvent("Admin:Fart:Player", function(Result)
    if IsPlayerAdmin() then
        TriggerServerEvent('qb-admin:server:play-sound', Result['player'], Result['fart'])
    end
end)

RegisterNetEvent("qb-admin:client:play-sound", function(Sound)
    local Soundfile = nil
    if Sound == 'Fart' then
        Soundfile = 'FartNoise2'
    elseif Sound == 'Wet Fart' then
        Soundfile = 'FartNoise'
    end
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, Soundfile, 0.3)
end)

RegisterNetEvent('qb-admin:client:fling-player', function()
    local Ped = PlayerPedId()
    if GetVehiclePedIsUsing(Ped) ~= 0 then
        ApplyForceToEntity(GetVehiclePedIsUsing(Ped), 1, 0.0, 0.0, 100000.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
    else
        ApplyForceToEntity(Ped, 1, 9500.0, 3.0, 7100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
    end
end)

RegisterNetEvent('Admin:Toggle:PlayerBlips', function()
    BlipsEnabled = not BlipsEnabled
    if not IsPlayerAdmin() then return end
    TriggerServerEvent('qb-admin:server:toggle-blips')

    SendNUIMessage({
        Action = "SetItemEnabled",
        Name = 'playerblips',
        State = BlipsEnabled
    })

    if not BlipsEnabled then
        DeletePlayerBlips()
    end
end)

RegisterNetEvent('qb-admin:client:DeletePlayerBlips', function()
    if not IsPlayerAdmin() then return end
    DeletePlayerBlips()
end)

RegisterNetEvent('qb-admin:client:UpdatePlayerBlips', function(BlipData)
    if not IsPlayerAdmin() then return end
    
    local ServerId = GetPlayerServerId(PlayerId())
    for k, v in pairs(BlipData) do
        if tonumber(v.ServerId) ~= tonumber(ServerId) then
            local BlipId = 'admin-blip-'..v.ServerId
            if Mercy.Functions.GetBlipById(BlipId) == false then
                Mercy.Functions.CreateBlip(BlipId, v.Coords, v.ServerId..' - '..v.Name, 1, 1, false, 0.75, false, 7)
            else
                Mercy.Functions.SetBlipCoords(BlipId, v.Coords)
            end
        end
    end
end)

RegisterNetEvent('Admin:Toggle:PlayerNames', function()
    NamesEnabled = not NamesEnabled
    if not IsPlayerAdmin() then return end

    SendNUIMessage({
        Action = "SetItemEnabled",
        Name = 'playernames',
        State = NamesEnabled
    })

    if NamesEnabled then
        local Players = GetPlayersInArea(nil, 15.0)

        CreateThread(function()
            while NamesEnabled do
                Wait(2000)
                Players = GetPlayersInArea(nil, 15.0)
            end
        end)

        CreateThread(function()
            while NamesEnabled do
                for k, v in pairs(Players) do
                    local Ped = GetPlayerPed(GetPlayerFromServerId(tonumber(v['ServerId'])))
                    local PedCoords = GetPedBoneCoords(Ped, 0x796e)
                    local PedHealth = GetEntityHealth(Ped) / GetEntityMaxHealth(Ped) * 100
                    local PedArmor = GetPedArmour(Ped)
                    
                    DrawText3D(vector3(PedCoords.x, PedCoords.y, PedCoords.z + 0.5), ('[%s] - %s ~n~Health: %s - Armor: %s'):format(v['ServerId'], v['Name'], math.floor(PedHealth), math.floor(PedArmor)))
                end
                
                Wait(1)
            end
        end)
    end
end)

RegisterNetEvent('Admin:Toggle:Spectate', function(Result)
    if not IsPlayerAdmin() then return end
    if not isSpectateEnabled then
        TriggerServerEvent('qb-admin:server:start-spectate', Result['player'])
    else
        toggleSpectate(storedTargetPed)
        preparePlayerForSpec(false)
        TriggerServerEvent('qb-admin:server:stop-spectate')
    end
end)