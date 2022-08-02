QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("tunermagazine", function(source, item)
    TriggerClientEvent('libro:libro', source)
end)