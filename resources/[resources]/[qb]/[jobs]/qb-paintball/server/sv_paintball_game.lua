local QBCore = exports['qb-core']:GetCoreObject()

local teamPlayersEast = 0
local teamPlayersWest = 0
local playerCache = {}
local gameInProgress = false
local flagObjNetId = 0
local flagCenterCoords = vector3(5500.00, 6084.20, 590.75)

function spawnFlag(pCoords)
    local playerSrcs = {}
    for k, v in pairs(playerCache) do
        playerSrcs[#playerSrcs + 1] = k
    end
    local rndSrc = playerSrcs[math.random(#playerSrcs)]
    TriggerClientEvent("np-paintball:game:spawnFlag", rndSrc, pCoords)  
end

local function startGame()
    DeleteEntity(NetworkGetEntityFromNetworkId(flagObjNetId))
    gameInProgress = true
    spawnFlag(flagCenterCoords)
end

local function endGame()
    DeleteEntity(NetworkGetEntityFromNetworkId(flagObjNetId))
    gameInProgress = false
    teamPlayersEast = 0
    teamPlayersWest = 0
    playerCache = {}
end  

local function joinTeam(pSource, pTeam)
    if playerCache[pSource] then return end
    if pTeam == "east" then
        teamPlayersEast = teamPlayersEast + 1
        playerCache[pSource] = "east"
    else
        teamPlayersWest = teamPlayersWest + 1
        playerCache[pSource] = "west"
    end
end

local function leaveTeam(pSource)
    if not playerCache[pSource] then return end
    if playerCache[pSource] == "east" then
        teamPlayersEast = teamPlayersEast - 1
    else
        teamPlayersWest = teamPlayersWest - 1
    end    
    playerCache[pSource] = nil
    if teamPlayersEast == 0 or teamPlayersWest == 0 then
        endGame()
    end
end    

QBCore.Functions.CreateCallback("np-paintball:game:action", function(source, cb, pAction, pCtx)
    local pSource = source

    if pAction == "start" then
        startGame()
    end
    if pAction == "end" then
        endGame()   
    end
    if pAction == "join" then
        joinTeam(pSource, pCtx)
    end
    if pAction == "leave" then
        leaveTeam(pSource)
    end

    TriggerClientEvent("np-paintball:game:update", -1, {
        teamPlayersEast = teamPlayersEast,
        teamPlayersWest = teamPlayersWest,
        gameInProgress = gameInProgress,
    })
end)

RegisterServerEvent("np-paintball:game:spawnedFlag")
AddEventHandler("np-paintball:game:spawnedFlag", function(pNetId)
    flagObjNetId = pNetId
end)

RegisterServerEvent("np-paintball:game:pickedUpFlag")
AddEventHandler("np-paintball:game:pickedUpFlag", function()
    DeleteEntity(NetworkGetEntityFromNetworkId(flagObjNetId))
end)

RegisterServerEvent("np-paintball:game:diedWithFlag")
AddEventHandler("np-paintball:game:diedWithFlag", function(pCoords)
    local src = source
    TriggerClientEvent("np-paintball:game:spawnFlag", src, pCoords)
end)

RegisterServerEvent("np-paintball:getPaintballGuns")
AddEventHandler("np-paintball:getPaintballGuns", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem('weapon_snspistol_mk2', 1)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['weapon_snspistol_mk2'], "add")
end)

RegisterServerEvent("np-paintball:getPaintballAmmos")
AddEventHandler("np-paintball:getPaintballAmmos", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddItem('paintball_ammo', 5)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['paintball_ammo'], "add")
end)