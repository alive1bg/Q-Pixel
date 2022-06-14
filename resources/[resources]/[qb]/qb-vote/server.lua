
local vote	 = {}
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback("qb-vote:server:isVoted", function(source, cb)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if vote[GetPlayerIdentifiers(source)[1]] == nil then
        cb(false)
    else
        cb(true)
    end
end)

RegisterServerEvent("qb-vote:server:postedVote")
AddEventHandler("qb-vote:server:postedVote", function(who)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    vote[GetPlayerIdentifiers(source)[1]] = "voted"
    if vote[who] == nil then
        vote[who] = 1 
    else
        vote[who] = vote[who] + 1
    end
    SaveResourceFile(GetCurrentResourceName(), "data.json", json.encode(vote))
    TriggerClientEvent("QBCore:Notify", src, "Your vote has been accepted", 'success', 7500)

    TriggerClientEvent('inventory:client:ItemBox', src,  QBCore.Shared.Items["np_voted_sticker"], 'add')
    xPlayer.Functions.AddItem('np_voted_sticker',  1, false, who) -- set to 1 still pulls the config spawned ammount...
end)
 
CreateThread(function()
    local result = json.decode(LoadResourceFile(GetCurrentResourceName(), "data.json"))

    if result then
        vote = result
    end
end)
