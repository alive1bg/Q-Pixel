local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("draggy", function(source,item)
    TriggerClientEvent("draggy:start")
end)