local QBCore = exports['qb-core']:GetCoreObject()
local inArena = false
local isDead = false
local lastHitByPaintball = false

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function TeleportPlayer(pCoords, pHeading)
    local heading = pHeading * 1.0
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local teleportCoords = vector3(pCoords.x, pCoords.y, pCoords.z)

    local time = math.floor((#(teleportCoords - playerCoords) / 50) * 100)
    local entity = IsPedInAnyVehicle(playerPed) and GetVehiclePedIsIn(playerPed) or playerPed

    DoScreenFadeOut(400)

    while IsScreenFadingOut() do
        Citizen.Wait(0)
    end

    NetworkFadeOutEntity(playerPed, true, true)
    SetPedCoordsKeepVehicle(playerPed, teleportCoords)
    SetEntityHeading(entity, heading)
    SetGameplayCamRelativeHeading(0.0)
    Citizen.Wait(time)
    NetworkFadeInEntity(playerPed, true)
    DoScreenFadeIn(400)
end

Citizen.CreateThread(function()
    while true do
        local inRange = false
        local pos = GetEntityCoords(PlayerPedId())
        local enterArena = GetDistanceBetweenCoords(pos, -282.42, -2031.59, true)
        local exitArena = GetDistanceBetweenCoords(pos, 5504.9, 5979.94, 590.01, true)
        local paintballVendor = GetDistanceBetweenCoords(pos, 5517.92, 5992.95, 590.01, true)
        local paintballItems = GetDistanceBetweenCoords(pos, 5509.89, 5996.51, 590.01, true)

        if enterArena < 10 then
            inRange = true
            DrawMarker(2, -282.42, -2031.59, 30.15, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

            if enterArena < 1 then
                DrawText3Ds(-282.42, -2031.59, 30.15, "[E] Enter Stadium")
                if IsControlJustReleased(0, 38) then
                    TeleportPlayer(vector3(5504.9, 5979.94, 590.01),0)
                    TriggerEvent("qbpaintball:enterStadium")
                end
            end
        end

        if exitArena < 10 then
            inRange = true

            DrawMarker(2, 5504.9, 5979.94, 590.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

            if exitArena < 1 then
                DrawText3Ds(5504.9, 5979.94, 590.01, "[E] Exit Stadium")
                if IsControlJustReleased(0, 38) then
                    TeleportPlayer(vector3(-282.42, -2031.59, 30.15), 292.64)
                    TriggerEvent("qbpaintball:leaveStadium")
                end
            end
        end

        if paintballVendor < 10 then
            inRange = true

            DrawMarker(2, 5517.92, 5992.95, 590.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

            if paintballVendor < 1 then
                DrawText3Ds(5517.92, 5992.95, 590.01 , "[E] Paintball Vendor")
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("qbpaintball:getVendor")
                end
            end
        end

        if paintballItems < 10 then
            inRange = true

            DrawMarker(2, 5509.89, 5996.51, 590.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

            if paintballItems < 1 then
                DrawText3Ds(5509.89, 5996.51, 590.01 , "[E] Paintball Items")
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("qbpaintball:getItems")
                end
            end
        end

        if not inRange then
            Citizen.Wait(1500)
        end

        Citizen.Wait(5)
    end
end)

local paintballItems = {
    ['weapon_snspistol_mk2'] = {
        name = 'Paintball Gun',
        txt = "1x",
        event = "qbpaintball:getPaintballGun"
    },
    ['paintball-ammo'] = {
        name = 'Paintball Ammo',
        txt = "5x",
        event = "qbpaintball:getPaintballAmmo"
    },
    --['weapon_smokegrenade'] = {
        --name = 'Smoke Grenade',
        --txt = "1x",
        --event = "qbpaintball:getPaintballSmoke"
    --},
    ['wasteland'] = {
        name = 'Enabled Wasteland',
        txt = "Map",
        event = "qbpaintball:setArenaType"
    }
}

RegisterNetEvent('qbpaintball:getItems', function()
    local dataMenu = {}
    for _, pData in pairs(paintballItems) do
        table.insert(dataMenu, {
            id = #dataMenu + 1,
            header = pData.name,
            txt = pData.txt,
            params = {
                event = pData.event
            }
        })
    end
    TriggerEvent('nh-context:sendMenu', dataMenu)
end)

RegisterNetEvent("qbpaintball:getPaintballGun", function()
    TriggerServerEvent("qbpaintball:getPaintballGuns")
end)

RegisterNetEvent("qbpaintball:getPaintballAmmo", function()
    TriggerServerEvent("qbpaintball:getPaintballAmmos")
end)

RegisterNetEvent("qbpaintball:getPaintballSmoke", function()
    TriggerServerEvent("qbpaintball:getPaintballSmokes")
end)

AddEventHandler("qbpolyzone:enter", function(zone)
    if zone ~= "paintball_arena" then return end
    inArena = true
end)

AddEventHandler("qbpolyzone:exit", function(zone)
    if zone ~= "paintball_arena" then return end
    inArena = false
    lastHitByPaintball = false
end)


exports['qb-target']:AddBoxZone("GetVendor", vector3(5519.4565, 5993.7612, 589.78747), 3, 3, {
    name = "GetVendor",
    heading = 11.0,
    debugPoly = false,
    minZ = 589.00024,
    maxZ = 591.00024,
}, {
    options = {
        {
            type = "client",
            event = "qb-paintball:getVendor",
            icon = "fas fa-sign-in-alt",
            label = "GetVendor",
            job = "all",
        },

    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("Paintball Items", vector3(5509.8144, 5996.3964, 590.00115), 2, 1, {
    name = "Paintball Items",
    heading = 11.0,
    debugPoly = false,
    minZ = 589.00024,
    maxZ = 591.00024,
}, {
    options = {
        {
            type = "client",
            event = "qb-paintball:getItems",
            icon = "fas fa-sign-in-alt",
            label = "Paintball Items",
            job = "paintball",
        },

    },
    distance = 2.5
})

--[[
RegisterNetEvent("qbpaintball:reviveAfterDown", function()
    if inArena and isDead then
      --TriggerEvent("reviveFunction")
      print("revive")
    end
end)
]]--

AddEventHandler("pd:deathcheck", function()
    isDead = not isDead
end)

local arenaVariations = {
    ["set_arena_dirt"] = {
      ["wasteland"] = true,
    },
    ["set_npa"] = {
      ["wasteland"] = true,
    },
}

AddEventHandler("qbpaintball:setArenaType", function(pArgs)
    QBCore.Functions.TriggerCallback("qbpaintball:setArenaType")
end)
  
RegisterNetEvent("qbpaintball:changeArenaType", function(pType)
    local cInteriorId = GetInteriorAtCoords(5505.03, 5997.68, 590.0)
    for k, v in pairs(arenaVariations) do
        DeactivateInteriorEntitySet(cInteriorId, k)
    end
    for k, v in pairs(arenaVariations) do
        if v[pType] then
        ActivateInteriorEntitySet(cInteriorId, k)
        end
    end
    RefreshInterior(cInteriorId)
end)

Citizen.CreateThread(function()
    Citizen.Wait(60000)
    TriggerServerEvent("qbpaintball:getArenaType")
end)

Enabled = {
    ['Playground_1'] = true,
    ['Terrain_1'] = true,
    ['Vegetation_1'] = true,
}

IPLs = {
    Playground_1 = {
        "gabz_npa_hyperpipe",
    },
    Terrain_1 = {
        "gabz_npa_terrain1",
    },
    Vegetation_1 = {
        "gabz_npa_fern_proc",
        "gabz_npa_grass_mix_proc",
        "gabz_npa_grass_proc",
        "gabz_npa_grass_sm_proc",
        "gabz_npa_grass_xs_proc",
        "gabz_npa_log_proc",
        "gabz_npa_stones_proc",
        "gabz_npa_trees"
    },
}

-- do not touch
Citizen.CreateThread(function()
    Citizen.Wait(60000)
    for category, iplName in pairs(IPLs) do
        if Enabled[category] then
        for k,v in pairs(iplName) do 
            RequestIpl(v)
        end
        end
    end
end)