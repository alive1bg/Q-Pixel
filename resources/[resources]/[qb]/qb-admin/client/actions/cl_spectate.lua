local lastSpectateLocation = {}
isSpectateEnabled = false
storedTargetPed = nil
local storedTargetPlayerId = -1
local storedGameTag = ""

-- [ Code ] --

-- [ Threads ] --

CreateThread(function()
    while true do
        if isSpectateEnabled then
            createGamerTagInfo()
        else
            clearGamerTagInfo()
        end
        Wait(50)
    end
end)

-- [ Functions ] --

function InstructionalButton(controlButton, text)
    ScaleformMovieMethodAddParamPlayerNameString(controlButton)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

function calculateSpectatorCoords(coords)
    return vec3(coords[1], coords[2], coords[3] - 15.0)
end

function createGamerTagInfo()
    if storedGameTag and IsMpGamerTagActive(storedGameTag) then return end
    local nameTag = ('[%d] %s'):format(GetPlayerServerId(storedTargetPlayerId), GetPlayerName(storedTargetPlayerId))
    storedGameTag = CreateFakeMpGamerTag(storedTargetPed, nameTag, false, false, '', 0, 0, 0, 0)
    SetMpGamerTagVisibility(storedGameTag, 2, 1)  --set the visibility of component 2(healthArmour) to true
    SetMpGamerTagAlpha(storedGameTag, 2, 255) --set the alpha of component 2(healthArmour) to 255
    SetMpGamerTagHealthBarColor(storedGameTag, 129) --set component 2(healthArmour) color to 129(HUD_COLOUR_YOGA)
    SetMpGamerTagVisibility(storedGameTag, 4, NetworkIsPlayerTalking(i))
end

function clearGamerTagInfo()
    if not storedGameTag then return end
    RemoveMpGamerTag(storedGameTag)
    storedGameTag = nil
end

function preparePlayerForSpec(bool)
    local playerPed = PlayerPedId()
    FreezeEntityPosition(playerPed, bool)
    SetEntityVisible(playerPed, not bool, 0)
end

function createSpectatorTeleportThread()
    CreateThread(function()
        while isSpectateEnabled do
            Wait(500)
            -- Check if ped still exists
            if not DoesEntityExist(storedTargetPed) then
                local _ped = GetPlayerPed(storedTargetPlayerId)
                if _ped > 0 then
                    if _ped ~= storedTargetPed then
                        -- print('Spectated Player ('..storedTargetPlayerId..') changed ped to '.._ped)
                        storedTargetPed = _ped
                    end
                    storedTargetPed = _ped
                else
                    -- print(('Spectated Player ('..storedTargetPlayerId..') does not exist anymore, ending spectate...'))
                    toggleSpectate(storedTargetPed, storedTargetPlayerId)
                    break
                end
            end

            -- Update Teleport
            local newSpectateCoords = calculateSpectatorCoords(GetEntityCoords(storedTargetPed))
            SetEntityCoords(PlayerPedId(), newSpectateCoords.x, newSpectateCoords.y, newSpectateCoords.z, 0, 0, 0, false)
        end
    end)
end

function toggleSpectate(targetPed, targetPlayerId)
    local playerPed = PlayerPedId()

    if isSpectateEnabled then
        isSpectateEnabled = false

        if not lastSpectateLocation then
            error('Last location previous to spectate was not stored properly')
        end

        if not storedTargetPed then
            error('Target ped was not stored to unspectate')
        end

        DoScreenFadeOut(500)
        while not IsScreenFadedOut() do Wait(0) end

        RequestCollisionAtCoord(lastSpectateLocation.x, lastSpectateLocation.y, lastSpectateLocation.z)
        SetEntityCoords(playerPed, lastSpectateLocation.x, lastSpectateLocation.y, lastSpectateLocation.z - 1.0)
        -- The player is still frozen while we wait for collisions to load
        while not HasCollisionLoadedAroundEntity(playerPed) do
            Wait(5)
        end
        -- debugPrint('Collisions loaded around player')

        preparePlayerForSpec(false)
        -- debugPrint('Unfreezing current player')

        NetworkSetInSpectatorMode(false, storedTargetPed)
        -- debugPrint(('Set spectate to false for targetPed (%s)'):format(storedTargetPed))
        clearGamerTagInfo()
        DoScreenFadeIn(500)
        QBCore.Functions.Notify(Lang:t('spectate.stopped', {player = GetPlayerName(storedTargetPlayerId)..' ('..GetPlayerServerId(storedTargetPlayerId)..')'}))
        storedTargetPed = nil
    else
        storedTargetPed = targetPed
        storedTargetPlayerId = targetPlayerId
        local targetCoords = GetEntityCoords(targetPed)
        -- debugPrint(('Targets coords = x: %f, y: %f, z: %f'):format(targetCoords.x, targetCoords.y, targetCoords.z))

        RequestCollisionAtCoord(targetCoords.x, targetCoords.y, targetCoords.z)
        while not HasCollisionLoadedAroundEntity(targetPed) do
            Wait(5)
        end
        -- debugPrint(('Collisions loaded around TargetPed (%s)'):format(targetPed))

        NetworkSetInSpectatorMode(true, targetPed)
        DoScreenFadeIn(500)
        QBCore.Functions.Notify(Lang:t('spectate.started', {player = GetPlayerName(storedTargetPlayerId)..' ('..GetPlayerServerId(storedTargetPlayerId)..')'}))
        -- debugPrint(('Now spectating TargetPed (%s)'):format(targetPed))
        isSpectateEnabled = true
        createSpectatorTeleportThread()
    end
end

RegisterCommand('endSpectate', function()
    if isSpectateEnabled then
        toggleSpectate(storedTargetPed)
        preparePlayerForSpec(false)
        TriggerServerEvent('qb-admin/server/stop-spectate')
    end
end)

function cleanupFailedResolve()
    local playerPed = PlayerPedId()

    RequestCollisionAtCoord(lastSpectateLocation.x, lastSpectateLocation.y, lastSpectateLocation.z)
    SetEntityCoords(playerPed, lastSpectateLocation.x, lastSpectateLocation.y, lastSpectateLocation.z)
    -- The player is still frozen while we wait for collisions to load
    while not HasCollisionLoadedAroundEntity(playerPed) do
        Wait(5)
    end
    preparePlayerForSpec(false)
    DoScreenFadeIn(500)

    QBCore.Functions.Notify(Lang:t('spectate.stopped_not_found'), 'error')
end

-- [ Events ] --

RegisterNetEvent('QBCore/client/specPlayer', function(targetServerId, coords)
    local spectatorPed = PlayerPedId()
    lastSpectateLocation = GetEntityCoords(spectatorPed)

    local targetPlayerId = GetPlayerFromServerId(targetServerId)
    if targetPlayerId == PlayerId() then
        return QBCore.Functions.Notify(Lang:t('spectate.self'), 'error')
    end

    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do Wait(0) end

    local tpCoords = calculateSpectatorCoords(coords)
    SetEntityCoords(spectatorPed, tpCoords.x, tpCoords.y, tpCoords.z, 0, 0, 0, false)
    preparePlayerForSpec(true)


    -- Resolve player check (5s)
    local resolvePlayerAttempts = 0
    local resolvePlayerFailed

    repeat
        if resolvePlayerAttempts > 100 then
            resolvePlayerFailed = true
            break;
        end
        Wait(50)
        -- print('[SPECTATE] Waiting for player...')
        targetPlayerId = GetPlayerFromServerId(targetServerId)
        resolvePlayerAttempts = resolvePlayerAttempts + 1
    until (GetPlayerPed(targetPlayerId) > 0) and targetPlayerId ~= -1

    if resolvePlayerFailed then
        return cleanupFailedResolve()
    end

    -- print('[SPECTATE] Succesfully found player!')
    toggleSpectate(GetPlayerPed(targetPlayerId), targetPlayerId)
end)
