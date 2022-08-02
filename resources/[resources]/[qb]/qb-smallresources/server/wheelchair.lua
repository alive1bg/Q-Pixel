QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("wheelchair", function(source)
    TriggerClientEvent('wheelchair', source)
    print('usado')
end)