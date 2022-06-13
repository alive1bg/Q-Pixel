Config = {}

Config['General'] = {
    ["Core"] = "QBCORE", -- This can be ESX , QBCORE , NPBASE
    ["SQLWrapper"] = "oxmysql", -- This can be `| oxmysql or ghmattimysql or mysql-async
}


Config['CoreSettings'] = {
    ["QBCORE"] = {
        ["Version"] = "new", -- new = using export | old = using events
        ["Export"] = exports['qb-core']:GetCoreObject(), -- uncomment this if using new qbcore version
        ["Trigger"] = "QBCore:GetObject",
        ["HasItem"] = "QBCore:HasItem", -- Imporant [ Your trigger for checking has item, default is CORENAME:HasItem ] 
        ["ServerNotificationEvent"] = "QBCore:Notify", 

    }, 
}


Config['Webhooks'] = {
    ['Link'] = '' -- Discord webhoook link when a banned player is trying to connect the server
}


EnterBennys = function()
    TriggerEvent('event:control:bennys1')
end

WeatherEvent = function(weather)
    TriggerEvent("qb-weathersync:server:setWeather", weather)
end

TimeEvent = function(time)
    TriggerEvent("qb-weathersync:server:setTime1", hour)
    --return print('Currently not working')
end

OpenClothing = function()
    TriggerEvent('raid_clothes:hasEnough', 'clothing_shop')
end

RemoveStress = function()
    TriggerServerEvent('hud:server:RelieveStress', 100)
end

AddVehicleKeys = function(vehicle, plate)
    TriggerEvent("vehiclekeys:client:SetOwner", vehicle, plate)
end

Revive = function()
    TriggerEvent("hospital:client:Revive")
end