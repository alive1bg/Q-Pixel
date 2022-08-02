RegisterNetEvent('qb-hugs:server:hug', function(coords)
    TriggerClientEvent("qb-hugs:client:hug", -1, coords)
end)

RegisterNetEvent('qb-hugs:server:idle', function(coords)
    TriggerClientEvent("qb-hugs:client:idle", -1, coords)
end)