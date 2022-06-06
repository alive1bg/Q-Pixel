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
    TriggerClientEvent("qb-paintball:game:spawnFlag", rndSrc, pCoords)  
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

QBCore.Functions.CreateCallback("qb-paintball:game:action", function(source, cb, pAction, pCtx)
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

    TriggerClientEvent("qb-paintball:game:update", -1, {
        teamPlayersEast = teamPlayersEast,
        teamPlayersWest = teamPlayersWest,
        gameInProgress = gameInProgress,
    })
end)

RegisterServerEvent("qb-paintball:game:spawnedFlag")
AddEventHandler("qb-paintball:game:spawnedFlag", function(pNetId)
    flagObjNetId = pNetId
end)

RegisterServerEvent("qb-paintball:game:pickedUpFlag")
AddEventHandler("qb-paintball:game:pickedUpFlag", function()
    DeleteEntity(NetworkGetEntityFromNetworkId(flagObjNetId))
end)

RegisterServerEvent("qb-paintball:game:diedWithFlag")
AddEventHandler("qb-paintball:game:diedWithFlag", function(pCoords)
    local src = source
    TriggerClientEvent("qb-paintball:game:spawnFlag", src, pCoords)
end)

RegisterServerEvent("qb-paintball:getPaintballGuns")
AddEventHandler("qb-paintball:getPaintballGuns", function()
    local src = source
    local player = QBCore.Functions.GetPlayer(source)

    player.Functions.AddItem('weapon_snspistol_mk2', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['weapon_snspistol_mk2'], "add")

end)

RegisterServerEvent("qb-paintball:getPaintballAmmos")
AddEventHandler("qb-paintball:getPaintballAmmos", function()
    local src = source
    local player = QBCore.Functions.GetPlayer(source)

    player.Functions.AddItem('paintball-ammo', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['paintball-ammo'], "add")

end)