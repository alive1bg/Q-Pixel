-- QBCore = nil
-- TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("goldlaptop", function(source)
    TriggerClientEvent("lowervault:doors", source)
end)

QBCore.Functions.CreateUseableItem("nightvgoggles", function(source)
    TriggerClientEvent("nightvision", source)
end)

QBCore.Functions.CreateUseableItem("lvaultusbcodes", function(source)
    TriggerClientEvent("notifycodes", source)
end)

RegisterNetEvent("lw:removeitem")
AddEventHandler("lw:removeitem", function(item)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveItem(item, 1)
end)

RegisterNetEvent("lw:giveitem")
AddEventHandler("lw:giveitem", function(item, count)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem(item, count)
end)

QBCore.Functions.CreateCallback('lw:itemcheck', function(source, cb, item)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then return; end
    local items = xPlayer.Functions.GetItemByName(item)
    cb(items.count)
end)

RegisterServerEvent("lw:openvault")
AddEventHandler("lw:openvault", function(method)
    TriggerClientEvent("lw:openvault_c", -1, method)
end)

RegisterServerEvent("lw:openvault2")
AddEventHandler("lw:openvault2", function(method)
    TriggerClientEvent("lw:openvault_c2", -1, method)
end)


-- for config to enable handshoes
---- ADDED FROM QB BANK ROBBERY
QBCore.Functions.CreateCallback('qb-lowervault:server:GetConfig', function(source, cb)
    cb(Config)
end)
