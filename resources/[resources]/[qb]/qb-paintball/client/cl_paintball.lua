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
        Wait(0)
    end

    NetworkFadeOutEntity(playerPed, true, true)
    SetPedCoordsKeepVehicle(playerPed, teleportCoords)
    SetEntityHeading(entity, heading)
    SetGameplayCamRelativeHeading(0.0)
    Wait(time)
    NetworkFadeInEntity(playerPed, true)
    DoScreenFadeIn(400)
end

CreateThread(function()
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
                    TriggerEvent("qb-paintball:enterStadium")
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
                    TriggerEvent("qb-paintball:leaveStadium")
                end
            end
        end

        if paintballVendor < 10 then
            inRange = true

            DrawMarker(2, 5517.92, 5992.95, 590.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

            if paintballVendor < 1 then
                DrawText3Ds(5517.92, 5992.95, 590.01 , "[E] Paintball Vendor")
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("qb-paintball:getVendor")
                end
            end
        end

        if paintballItems < 10 then
            inRange = true

            DrawMarker(2, 5509.89, 5996.51, 590.01, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.2, 210, 50, 9, 255, false, false, false, true, false, false, false)

            if paintballItems < 1 then
                DrawText3Ds(5509.89, 5996.51, 590.01 , "[E] Paintball Items")
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("qb-paintball:getItems")
                end
            end
        end

        if not inRange then
            Wait(1500)
        end

        Wait(5)
    end
end)

local paintballItems = {
    ['weapon_snspistol_mk2'] = {
        name = 'Paintball Gun',
        txt = "1x",
        event = "qb-paintball:getPaintballGun"
    },
    ['paintball-ammo'] = {
        name = 'Paintball Ammo',
        txt = "5x",
        event = "qb-paintball:getPaintballAmmo"
    },
    ['wasteland'] = {
        name = 'Enabled Wasteland',
        txt = "Map",
        event = "qb-paintball:setArenaType"
    }
}

RegisterNetEvent('qb-paintball:getItems', function()
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

RegisterNetEvent("qb-paintball:getPaintballGun", function()
    QBCore.Functions.Notify('Bought Paintball Gun!', 'success')
    TriggerServerEvent("qb-paintball:getPaintballGuns")
end)

RegisterNetEvent("qb-paintball:getPaintballAmmo", function()
    QBCore.Functions.Notify('Bought Ammo!', 'success')
    TriggerServerEvent("qb-paintball:getPaintballAmmos")
end)

RegisterNetEvent("qb-paintball:getPaintballSmoke", function()
    QBCore.Functions.Notify('Bought Smokes', 'success')
    TriggerServerEvent("qb-paintball:getPaintballSmokes")
end)

AddEventHandler("qb-polyzone:enter", function(zone)
    if zone ~= "paintball_arena" then return end
    inArena = true
end)

AddEventHandler("qb-polyzone:exit", function(zone)
    if zone ~= "paintball_arena" then return end
    inArena = false
    lastHitByPaintball = false
end)

--[[
RegisterNetEvent("qb-paintball:reviveAfterDown", function()
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

AddEventHandler("qb-paintball:setArenaType", function(pArgs)
    QBCore.Functions.TriggerCallback("qb-paintball:setArenaType")
end)
  
RegisterNetEvent("qb-paintball:changeArenaType", function(pType)
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

CreateThread(function()
    Wait(60000)
    TriggerServerEvent("qb-paintball:getArenaType")
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
CreateThread(function()
    Wait(60000)
    for category, iplName in pairs(IPLs) do
        if Enabled[category] then
        for k,v in pairs(iplName) do 
            RequestIpl(v)
        end
        end
    end
end)