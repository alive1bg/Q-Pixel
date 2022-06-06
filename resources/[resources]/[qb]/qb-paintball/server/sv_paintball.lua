local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent("qb-paintball:getArenaType")
AddEventHandler("qb-paintball:getArenaType", function()
    TriggerClientEvent("qb-paintball:changeArenaType", source, "wasteland")
end)

QBCore.Functions.CreateCallback("qb-paintball:setArenaType", function(source, cb)
    local pSource = source
    TriggerClientEvent("qb-paintball:changeArenaType", pSource, "wasteland")
end)
