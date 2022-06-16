local QBCore = exports['qb-core']:GetCoreObject()

local teamPlayersEast = 0
local teamPlayersWest = 0
local gameInProgress = false
local inStadium = false
local flagProp = "prop_golfflag"
local flagPropHash = GetHashKey(flagProp)
local flagObjNetId = 0
local isCarryingFlag = false

local function drawStatusHud()
    if not inStadium then return end
    SendNUIMessage({
        app = "status-hud",
        show = false,
        data = {
            show = true,
            title = "Paintball - Match " .. (gameInProgress and "In Progress" or "Pending"),
            values = {
            "East Team: " .. teamPlayersEast .. " player(s)",
            "West Team: " .. teamPlayersWest .. " player(s)",
            },
        },
    })
end


local paintballJobsVendors = {
    ['joinWest'] = {
        name = 'Join West Team',
        txt = "Paintball Teammates",
        event = "qb-paintball:joinWest"
    },
    ['joinEast'] = {
        name = 'Join East Team',
        txt = "Paintball Teammates",
        event = "qb-paintball:joinEast"
    },
    ['leaveTeam'] = {
        name = 'Leave Team',
        txt = "Paintball Teammates",
        event = "qb-paintball:leaveTeam"
    },
    ['startGame'] = {
        name = 'Start Game',
        txt = "Paintball Game",
        event = "qb-paintball:startGame"
    },
    ['endGame'] = {
        name = 'End Game',
        txt = "Paintball Game",
        event = "qb-paintball:endGame"
    },
}

local paintballVendors = {
    ['joinWest'] = {
        name = 'Join West Team',
        txt = "Paintball Teammates",
        event = "qb-paintball:joinWest"
    },
    ['joinEast'] = {
        name = 'Join East Team',
        txt = "Paintball Teammates",
        event = "qb-paintball:joinEast"
    },
    ['leaveTeam'] = {
        name = 'Leave Team',
        txt = "Paintball Teammates",
        event = "qb-paintball:leaveTeam"
    },
}

RegisterNetEvent('qb-paintball:getVendor', function()
    local dataMenu = {}

    if PlayerJob and PlayerJob.name == 'paintball' or myPermissionRank == 'admin' or myPermissionRank == 'god' then
        for _, pData in pairs(paintballJobsVendors) do
            table.insert(dataMenu, {
                header = pData.name,
                txt = pData.txt,
                params = {
                    event = pData.event
                }
            })
        end
    else
        for _, pData in pairs(paintballVendors) do
            table.insert(dataMenu, {
                header = pData.name,
                txt = pData.txt,
                params = {
                    event = pData.event
                }
            })
        end
    end

    exports['qb-menu']:openMenu(dataMenu)
end)

RegisterNetEvent("qb-paintball:joinWest")
AddEventHandler("qb-paintball:joinWest", function()
    QBCore.Functions.TriggerCallback('qb-paintball:game:action', function() end, 'join', 'west')
end)

RegisterNetEvent("qb-paintball:joinEast")
AddEventHandler("qb-paintball:joinEast", function()
    QBCore.Functions.TriggerCallback('qb-paintball:game:action', function() end, 'join', 'east')
end)

RegisterNetEvent("qb-paintball:leaveTeam")
AddEventHandler("qb-paintball:leaveTeam", function()
    QBCore.Functions.TriggerCallback('qb-paintball:game:action', function() end, 'leave')
end)

RegisterNetEvent("qb-paintball:startGame")
AddEventHandler("qb-paintball:startGame", function()
    QBCore.Functions.TriggerCallback('qb-paintball:game:action', function() end, 'start')
end)

RegisterNetEvent("qb-paintball:endGame")
AddEventHandler("qb-paintball:endGame", function()
    QBCore.Functions.TriggerCallback('qb-paintball:game:action', function() end, 'end')
end)

RegisterNetEvent("qb-paintball:game:update")
AddEventHandler("qb-paintball:game:update", function(pCtx)
    if gameInProgress ~= pCtx.gameInProgress then
        removeAttachedProp()
    end
    teamPlayersEast = pCtx.teamPlayersEast
    teamPlayersWest = pCtx.teamPlayersWest
    gameInProgress = pCtx.gameInProgress
    drawStatusHud()
end)


AddEventHandler("qb-paintball:enterStadium", function()
    inStadium = true
    drawStatusHud()
end)
  
AddEventHandler("qb-paintball:leaveStadium", function()
    inStadium = false
    SendNUIMessage({
        app = "status-hud",
        show = false,
        data = { show = false },
    })
end)

RegisterNetEvent("qb-paintball:game:spawnFlag", function(pCoords)
    local flagObj = CreateObject(flagPropHash, pCoords, 1, 1, 0)
    Wait(0)
    TriggerServerEvent("qb-paintball:game:spawnedFlag", NetworkGetNetworkIdFromEntity(flagObj))
end)

AddEventHandler("qb-paintball:game:pickupFlag", function()
    QBCore.Functions.Progressbar("pickup_flag", "Picking up Flag", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@narcotics@trash',
        anim = 'drop_front',
        flags = 49,
    }, {}, {}, function() -- Done
        isCarryingFlag = true
        TriggerEvent("np-weapons:attachProp", flagProp, 24818, -0.25, -0.25, 0.0, 180.0, 90.0, 0.0)
        TriggerServerEvent("qb-paintball:game:pickedUpFlag")
        TriggerEvent("deleteObject")
        StopAnimTask(PlayerPedId(), 'anim@narcotics@trash', "drop_front", 1.0)
    end)
end)

AddEventHandler("deleteObject", function()
    DeleteObject(flagObj)
end)

local isDead = false
AddEventHandler("pd:deathcheck", function()
  isDead = not isDead
  if not isDead then return end
  if gameInProgress and inStadium then
    QBCore.Functions.TriggerCallback("qb-paintball:game:action", function() end, "leave")
  end
  if not isCarryingFlag then return end
  TriggerClientEvent("qb-paintball:client:removeWeapons")
  local coordsC = GetEntityCoords(PlayerPedId())
  local coords = vector3(coordsC.x - 0.25, coordsC.y + 0.25, coordsC.z - 1.0)
  TriggerServerEvent("qb-paintball:game:diedWithFlag", coords)
end)


local dead = false
CreateThread(function()
    while true do
        local sleep = 500

        local ped = PlayerPedId()
        if gameInProgress == true then
            sleep = 1
            if not dead then
                if IsEntityDead(ped) then
                    dead = true
                    TriggerEvent('pd:deathcheck', false)
                end
            else
                dead = false
            end
        end
        Wait(sleep)
    end
end)

