local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateUseableItem("np_wingsuit",function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-wingsuit-use", source, item.name)
end)

QBCore.Functions.CreateUseableItem("np_pailandshovel",function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-sandcastles", source, item.name)
end)