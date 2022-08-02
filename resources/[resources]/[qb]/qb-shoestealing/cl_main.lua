RegisterNetEvent("shoestealing:takeShoes", function(ent)
    SetPedComponentVariation(PlayerPedId(), 6, 34, 0, 0) 
end)

function getClosestPlayer()
    local ped = PlayerPedId()
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    local closestPlayers = getPlyFromCoords(coords)
    local closestDistance = -1
    local closestPlayer = -1
    for i = 1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() and closestPlayers[i] ~= -1 then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

function getPlyFromCoords()
    local players = GetActivePlayers()
    local ped = PlayerPedId()
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    local distance = distance or 5
    local closePlayers = {}
    for _, player in pairs(players) do
        local target = GetPlayerPed(player)
        local targetCoords = GetEntityCoords(target)
        local targetdistance = #(targetCoords - coords)
        if targetdistance <= distance then
            closePlayers[#closePlayers + 1] = player
        end
    end
    return closePlayers
end

function stealShoesEmote()
	local Ped = PlayerPedId()
    local dict = "random@domestic"

    RequestAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do Wait(0) end
	TaskPlayAnim(Ped, dict, "pickup_low", 3.0, 3.0, 1200, 0, 0, false, false, false)
end

RegisterCommand("stealshoes", function()
    local player = getClosestPlayer(GetEntityCoords(PlayerPedId()))
    local id = GetPlayerServerId(player)

    if player ~= -1 then
        if GetPedDrawableVariation(player, 6) ~= config.shoes then
            stealShoesEmote() 
            TriggerServerEvent("shoeting", id)
        end
    end
end, false)


RegisterNetEvent('shoestealing:client:stealshoes')
AddEventHandler('shoestealing:client:stealshoes', function()
    local player = getClosestPlayer(GetEntityCoords(PlayerPedId()))
    local id = GetPlayerServerId(player)

    if player ~= -1 then
        if GetPedDrawableVariation(player, 6) ~= config.shoes then
            stealShoesEmote() 
            TriggerServerEvent("shoeting", id)
            TriggerServerEvent('QBCore:Server:AddItem', 'weapon_shoe', 2)
        end
    end
end)